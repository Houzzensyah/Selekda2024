<template>
  <div class="blog-management">
    <h2>Blog Management</h2>

    <!-- Form to Add/Edit Blog -->
    <form @submit.prevent="submitBlog">
      <div class="form-group">
        <label for="title">Blog Title:</label>
        <input type="text" id="title" v-model="blogForm.title" required>
      </div>

      <div class="form-group">
        <label for="image">Blog Image:</label>
        <input type="file" id="image" @change="handleFileUpload">
      </div>

      <div class="form-group">
        <label for="description">Description:</label>
        <textarea id="description" v-model="blogForm.description" required></textarea>
      </div>

      <div class="form-group">
        <label for="author">Author:</label>
        <input type="text" id="author" v-model="blogForm.author" required>
      </div>

      <div class="form-group">
        <label for="tags">Tags:</label>
        <input type="text" id="tags" v-model="blogForm.tags" required>
      </div>

      <div class="form-group">
        <label for="date">Date:</label>
        <input type="date" id="date" v-model="blogForm.date" required>
      </div>

      <button type="submit">{{ blogForm.id ? 'Update' : 'Add' }} Blog</button>
    </form>

    <!-- List of Blogs -->
    <h3>Existing Blogs</h3>
    <ul>
      <li v-for="blog in blogs" :key="blog.id">
        <img :src="`http://127.0.0.1:8000/storage/${blog.image}`" alt="Blog Image" />
        <h4>{{ blog.title }}</h4>
        <p>{{ blog.description }}</p>
        <p>Author: {{ blog.author }}</p>
        <p>Tags: {{ blog.tags }}</p>
        <p>Date: {{ blog.date }}</p>
        <button @click="editBlog(blog)">Edit</button>
        <button @click="deleteBlog(blog.id)">Delete</button>
      </li>
    </ul>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue';
import axios from 'axios';

const blogs = ref([]);
const blogForm = ref({
  id: null,
  title: '',
  image: null,
  description: '',
  author: '',
  tags: '',
  date: ''
});

const token = localStorage.getItem('token');

const authHeader = {
  headers: {
    Authorization: `Bearer ${token}`,
  },
};

const fetchBlogs = () => {
  axios.get('http://127.0.0.1:8000/api/v1/blogs', {
    headers : {
      Authorization : 'Bearer ' + localStorage.getItem('token')
    }
  })
      .then(response => {
        blogs.value = response.data.blog;
      })
      .catch(error => {
        console.error('Error fetching blogs:', error.response.data);
      });
};

const handleFileUpload = (event) => {
  blogForm.value.image = event.target.files[0];
};

const submitBlog = () => {
  const formData = new FormData();
  formData.append('title', blogForm.value.title);
  formData.append('description', blogForm.value.description);
  formData.append('author', blogForm.value.author);
  formData.append('tags', blogForm.value.tags);
  formData.append('date', blogForm.value.date);

  if (blogForm.value.image) {
    formData.append('image', blogForm.value.image);
  }

  const method = blogForm.value.id ? 'put' : 'post';
  const url = blogForm.value.id ? `http://127.0.0.1:8000/api/v1/blogs/${blogForm.value.id}` : 'http://127.0.0.1:8000/api/v1/blogs';

  axios({
    method,
    url,
    data: formData,
    headers: {
      'Content-Type': 'multipart/form-data',
      Authorization: 'Bearer ' + localStorage.getItem('token'),
    },
  })
      .then(response => {
        fetchBlogs();
        blogForm.value = {
          id: null,
          title: '',
          image: null,
          description: '',
          author: '',
          tags: '',
          date: ''
        };
      })
      .catch(error => {
        console.error('Error submitting blog:', error.response.data);
      });
};

const editBlog = (blog) => {
  blogForm.value = { ...blog, image: null };
};

const deleteBlog = (id) => {
  axios.delete(`http://127.0.0.1:8000/api/v1/blogs/${id}`, {
    headers : {
      Authorization : 'Bearer ' +localStorage.getItem('token')
    }
  })
      .then(response => {
        fetchBlogs();
      })
      .catch(error => {
        console.error('Error deleting blog:', error.response.data);
      });
};

onMounted(() => {
  fetchBlogs();
});
</script>

<style scoped>


.blog-management {

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
