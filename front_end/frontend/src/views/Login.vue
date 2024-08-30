<template>
  <div class="container">
    <div class="form-container">
      <h2>Login</h2>
      <form @submit.prevent="login">
        <div v-if="errors.length" class="alert alert-danger" role="alert">
          <ul>
            <li v-for="(error, index) in errors" :key="index">
              <strong>{{ error.field }}</strong>: {{ error.message }}
            </li>
          </ul>
        </div>
        <div class="form-group">
          <label for="username">Username:</label>
          <input type="text" id="username" name="username" v-model="username" required>
        </div>
        <div class="form-group">
          <label for="password">Password:</label>
          <input type="password" id="password" name="password" v-model="password" required>
        </div>
        <button type="submit">Login</button>
      </form>
      <p>Don't have an account? <router-link to="/register">Register here</router-link></p>
    </div>
  </div>

</template>

<script setup>
import {ref} from "vue";
import {useRouter} from "vue-router";
import axios from "axios";

const username = ref('');
const password = ref('')
const errors = ref([]);
const router = useRouter();


const login = () => {
  axios.post('http://127.0.0.1:8000/api/v1/auth/login', {
    username: username.value,
    password: password.value
  }).then((response) => {
    const {token, role} = response.data;
    localStorage.setItem('token', token);
    localStorage.setItem('role', role);

    if(role === 'admin'){
      router.push('/admin')
    }else{
      router.push('/')
    }

  }).catch(err => {
    errorMes(err)
  })
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