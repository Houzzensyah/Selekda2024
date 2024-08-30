<template>
  <div class="banner-management">
    <h2>Banner Management</h2>

    <!-- Form to Add/Edit Banner -->
    <form @submit.prevent="submitBanner">
      <div class="form-group">
        <label for="title">Banner Title:</label>
        <input type="text" id="title" v-model="bannerForm.title" required>
      </div>

      <div class="form-group">
        <label for="image">Banner Image:</label>
        <input type="file" id="image" @change="handleFileUpload">
      </div>

      <div class="form-group">
        <label for="description">Description:</label>
        <textarea id="description" v-model="bannerForm.description" required></textarea>
      </div>

      <div class="form-group">
        <label for="status">Status:</label>
        <select id="status" v-model="bannerForm.status" required>
          <option value="active">Active</option>
          <option value="inactive">Inactive</option>
        </select>
      </div>

      <button type="submit">{{ bannerForm.id ? 'Update' : 'Add' }} Banner</button>
    </form>

    <!-- List of Banners -->
    <h3>Existing Banners</h3>
    <ul>
      <li v-for="banner in banners" :key="banner.id">
        <img :src="`/storage/${banner.image}`" alt="Banner Image" />
        <h4>{{ banner.title }}</h4>
        <p>{{ banner.description }}</p>
        <p>Status: {{ banner.status }}</p>
        <button @click="editBanner(banner)">Edit</button>
        <button @click="deleteBanner(banner.id)">Delete</button>
      </li>
    </ul>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue';
import axios from 'axios';

const banners = ref([]);
const bannerForm = ref({
  id: null,
  title: '',
  image: null,
  description: '',
  status: 'active',
});

const fetchBanners = () => {
  axios.get('http://127.0.0.1:8000/api/v1/banners')
      .then(response => {
        banners.value = response.data.data;
      })
      .catch(error => {
        console.error('Error fetching banners:', error.response.data);
      });
};

const handleFileUpload = (event) => {
  bannerForm.value.image = event.target.files[0];
};

const submitBanner = () => {
  const formData = new FormData();
  formData.append('title', bannerForm.value.title);
  formData.append('description', bannerForm.value.description);
  formData.append('status', bannerForm.value.status);

  if (bannerForm.value.image) {
    formData.append('image', bannerForm.value.image);
  }

  const method = bannerForm.value.id ? 'put' : 'post';
  const url = bannerForm.value.id ? `http://127.0.0.1:8000/api/v1/banners/${bannerForm.value.id}` : '/v1/banners';

  axios({
    method,
    url,
    data: formData,
    headers: {
      'Content-Type': 'multipart/form-data',
    },
  })
      .then(response => {
        fetchBanners();
        bannerForm.value = {
          id: null,
          title: '',
          image: null,
          description: '',
          status: 'active',
        };
      })
      .catch(error => {
        console.error('Error submitting banner:', error.response.data);
      });
};

const editBanner = (banner) => {
  bannerForm.value = { ...banner, image: null };
};

const deleteBanner = (id) => {
  axios.delete(`http://127.0.0.1:8000/api/v1/banners/${id}`)
      .then(response => {
        fetchBanners();
      })
      .catch(error => {
        console.error('Error deleting banner:', error.response.data);
      });
};

onMounted(() => {
  fetchBanners();
});
</script>

<style scoped>
.banner-management {
  max-width: 600px;
  margin: 0 auto;
  padding: 20px;
  background-color: #fff;
  border-radius: 8px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h2 {
  text-align: center;
  margin-bottom: 20px;
}

.form-group {
  margin-bottom: 15px;
}

label {
  display: block;
  margin-bottom: 5px;
}

input[type="text"],
input[type="file"],
textarea,
select {
  width: 100%;
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

button {
  padding: 10px 20px;
  background-color: #007bff;
  color: white;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

button:hover {
  background-color: #0056b3;
}

ul {
  list-style-type: none;
  padding: 0;
}

li {
  margin-bottom: 15px;
  padding: 10px;
  border: 1px solid #ddd;
  border-radius: 5px;
}

li img {
  max-width: 100%;
  height: auto;
  display: block;
  margin-bottom: 10px;
}

li h4 {
  margin-bottom: 5px;
}

li p {
  margin-bottom: 5px;
}
</style>
