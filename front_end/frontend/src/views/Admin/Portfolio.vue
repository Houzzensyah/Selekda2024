<template>
  <div class="portfolio-management">
    <h2>Portfolio Management</h2>

    <!-- Form to Add/Edit Portfolio -->
    <form @submit.prevent="submitPortfolio">
      <div class="form-group">
        <label for="title">Portfolio Title:</label>
        <input type="text" id="title" v-model="portfolioForm.title" required>
      </div>

      <div class="form-group">
        <label for="image">Portfolio Image:</label>
        <input type="file" id="image" @change="handleFileUpload">
      </div>

      <div class="form-group">
        <label for="description">Description:</label>
        <textarea id="description" v-model="portfolioForm.description" required></textarea>
      </div>

      <div class="form-group">
        <label for="author">Author:</label>
        <input type="text" id="author" v-model="portfolioForm.author" required>
      </div>

      <button type="submit">{{ portfolioForm.id ? 'Update' : 'Add' }} Portfolio</button>
    </form>

    <!-- List of Portfolios -->
    <h3>Existing Portfolios</h3>
    <ul>
      <li v-for="portfolio in portfolios" :key="portfolio.id">
        <img :src="`http://127.0.0.1:8000/storage/${portfolio.image}`" alt="Portfolio Image" />
        <h4>{{ portfolio.title }}</h4>
        <p>{{ portfolio.description }}</p>
        <p>Author: {{ portfolio.author }}</p>
        <button @click="editPortfolio(portfolio)">Edit</button>
        <button @click="deletePortfolio(portfolio.id)">Delete</button>
      </li>
    </ul>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue';
import axios from 'axios';

const portfolios = ref([]);
const portfolioForm = ref({
  id: null,
  title: '',
  image: null,
  description: '',
  author: ''
});

const token = localStorage.getItem('token');

const authHeader = {
  headers: {
    Authorization: 'Bearer ' + localStorage.getItem('token'),
  },
};

const fetchPortfolios = () => {
  axios.get('http://127.0.0.1:8000/api/v1/portfolios', authHeader)
      .then(response => {
        portfolios.value = response.data.portfolio;
      })
      .catch(error => {
        console.error('Error fetching portfolios:', error.response.data);
      });
};

const handleFileUpload = (event) => {
  portfolioForm.value.image = event.target.files[0];
};

const submitPortfolio = () => {
  const formData = new FormData();
  formData.append('title', portfolioForm.value.title);
  formData.append('description', portfolioForm.value.description);
  formData.append('author', portfolioForm.value.author);

  if (portfolioForm.value.image) {
    formData.append('image', portfolioForm.value.image);
  }

  const method = portfolioForm.value.id ? 'put' : 'post';
  const url = portfolioForm.value.id ? `http://127.0.0.1:8000/api/v1/portfolios/${portfolioForm.value.id}` : 'http://127.0.0.1:8000/api/v1/portfolios';

  axios({
    method,
    url,
    data: formData,
    headers: {
      'Content-Type': 'multipart/form-data',
      Authorization: `Bearer ` + localStorage.getItem('token'),
    },
  })
      .then(response => {
        fetchPortfolios();
        portfolioForm.value = {
          id: null,
          title: '',
          image: null,
          description: '',
          author: ''
        };
      })
      .catch(error => {
        console.error('Error submitting portfolio:', error.response.data);
      });
};

const editPortfolio = (portfolio) => {
  portfolioForm.value = { ...portfolio, image: null };
};

const deletePortfolio = (id) => {
  axios.delete(`http://127.0.0.1:8000/api/v1/portfolios/${id}`, authHeader)
      .then(response => {
        fetchPortfolios();
      })
      .catch(error => {
        console.error('Error deleting portfolio:', error.response.data);
      });
};

onMounted(() => {
  fetchPortfolios();
});
</script>
<style scoped>
.portfolio-management {
  margin: 20px;
}

.form-group {

  margin-bottom: 15px;
}

label {

  display: block;
  margin-bottom: 5px;
}

input, textarea, select {

  width: 100%;
  padding: 8px;
  box-sizing: border-box;
}

button {
  padding: 10px 15px;
  background-color: #007bff;
  color: white;
  border: none;
  cursor: pointer;
}

button:hover {
  background-color: #0056b3;
}

ul {
  list-style: none;
  padding: 0;
}

li {
  margin-bottom: 20px;
}

img {
  max-width: 200px;
  height: auto;
}
</style>
