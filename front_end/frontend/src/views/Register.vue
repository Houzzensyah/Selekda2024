<template>
  <div class="container">
    <div class="form-container">
      <h2>Register</h2>
      <form @submit.prevent="register" enctype="multipart/form-data">
        <div v-if="errors.length" class="alert alert-danger" role="alert">
          <ul>
            <li v-for="(error, index) in errors" :key="index">
              <strong>{{ error.field }}</strong>: {{ error.message }}
            </li>
          </ul>
        </div>
        <div class="form-group">
          <label for="name">Name:</label>
          <input type="text" id="name" v-model="form.name"  required>
        </div>
        <div class="form-group">
          <label for="username">Username:</label>
          <input type="text" id="username" v-model="form.username" name="username" required>
        </div>
        <div class="form-group">
          <label for="email">Email:</label>
          <input type="email" id="email" name="email" v-model="form.email" required>
        </div>
        <div class="form-group">
          <label for="password">Password:</label>
          <input type="password" id="password" name="password" v-model="form.password" required>
        </div>
        <div class="form-group">
          <label for="date_of_birth">Date of Birth:</label>
          <input type="date" id="date_of_birth" name="date_of_birth" v-model="form.date_of_birth" required>
        </div>
        <div class="form-group">
          <label for="phone_number">Phone Number:</label>
          <input type="text" id="phone_number" name="phone_number" v-model="form.phone_number">
        </div>
        <div class="form-group">
          <label for="profile_picture">Profile Picture:</label>
          <input type="file" id="profile_picture" name="profile_picture" @change="handleFileUpload">
        </div>
        <button type="submit">Register</button>
      </form>
      <p>Already have an account? <router-link to="/register">Login here</router-link></p>
    </div>
  </div>
</template>

<script setup>
import { reactive } from 'vue';
import axios from 'axios';
import { useRouter } from 'vue-router';

const form = reactive({
  name: '',
  username: '',
  email: '',
  password: '',
  date_of_birth: '',
  phone_number: '',
  profile_picture: null
});

const router = useRouter();

function handleFileUpload(event) {
  form.profile_picture = event.target.files[0];
}

function register() {
  const formData = new FormData();
  formData.append('name', form.name);
  formData.append('username', form.username);
  formData.append('email', form.email);
  formData.append('password', form.password);
  formData.append('date_of_birth', form.date_of_birth);
  formData.append('phone_number', form.phone_number);

  if (form.profile_picture) {
    formData.append('profile_picture', form.profile_picture);
  }

  axios.post('http://127.0.0.1:8000/api/v1/auth/register', formData, {
  })
      .then(response => {
        console.log('Registration successful:', response.data);
        router.push('/login');  // Navigate to login after successful registration
      })
      .catch(error => {
        console.error('Registration error:', error.response.data);
      });
}

function errorMes(error){
  errors.value = error.response?.data?.violations
      ? Object.entries(error.response.data.violations).map(([field, {message}]) => ({field,message}))
      :[{field : 'errors', message : error.response?.data?.message}]
}
</script>
<style>
body {
  font-family: Arial, sans-serif;
  background-color: #f4f4f4;
  margin: 0;
  padding: 0;
}

.container {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
}

.form-container {
  background-color: #fff;
  padding: 20px;
  border-radius: 8px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
  width: 100%;
  max-width: 400px;
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
input[type="email"],
input[type="password"],
input[type="date"],
input[type="file"] {
  width: 100%;
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

button {
  width: 100%;
  padding: 10px;
  background-color: #007bff;
  color: #fff;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

button:hover {
  background-color: #0056b3;
}

p {
  text-align: center;
  margin-top: 15px;
}

</style>