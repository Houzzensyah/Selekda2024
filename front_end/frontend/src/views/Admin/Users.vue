<template>
  <div class="user-management">
    <h2>User Management</h2>

    <!-- Form to Add/Edit User -->
    <form @submit.prevent="submitUser">
      <div class="form-group">
        <label for="name">Name:</label>
        <input type="text" id="name" v-model="userForm.name" required>
      </div>

      <div class="form-group">
        <label for="username">Username:</label>
        <input type="text" id="username" v-model="userForm.username" required>
      </div>

      <div class="form-group">
        <label for="email">Email:</label>
        <input type="email" id="email" v-model="userForm.email" required>
      </div>

      <div class="form-group">
        <label for="password">Password:</label>
        <input type="password" id="password" v-model="userForm.password" required>
      </div>

      <div class="form-group">
        <label for="date_of_birth">Date of Birth:</label>
        <input type="date" id="date_of_birth" v-model="userForm.date_of_birth" required>
      </div>

      <div class="form-group">
        <label for="phone_number">Phone Number:</label>
        <input type="text" id="phone_number" v-model="userForm.phone_number">
      </div>

      <div class="form-group">
        <label for="profile_picture">Profile Picture:</label>
        <input type="file" id="profile_picture" @change="handleFileUpload">
      </div>

      <button type="submit">{{ userForm.id ? 'Update' : 'Add' }} User</button>
    </form>

    <!-- List of Users -->
    <h3>Existing Users</h3>
    <ul>
      <li v-for="user in users" :key="user.id">
        <img :src="`http://127.0.0.1:8000/storage/${user.profile_picture}`" alt="Profile Picture" />
        <h4>{{ user.name }}</h4>
        <p>Username: {{ user.username }}</p>
        <p>Email: {{ user.email }}</p>
        <p>Date of Birth: {{ user.date_of_birth }}</p>
        <p>Phone Number: {{ user.phone_number }}</p>
        <button @click="editUser(user)">Edit</button>
        <button @click="deleteUser(user.id)">Delete</button>
      </li>
    </ul>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue';
import axios from 'axios';

const users = ref([]);
const userForm = ref({
  id: null,
  name: '',
  username: '',
  email: '',
  password: '',
  date_of_birth: '',
  phone_number: '',
  profile_picture: null
});

const token = localStorage.getItem('token');

const authHeader = {
  headers: {
    Authorization: `Bearer ` + localStorage.getItem('token'),
  },
};

const fetchUsers = () => {
  axios.get('http://127.0.0.1:8000/api/v1/users/admin', {
    headers: {
      Authorization: `Bearer ` + localStorage.getItem('token'),
    },
  })
      .then(response => {
        users.value = response.data.users;
      })
      .catch(error => {
        console.error('Error fetching users:', error.response.data);
      });
};

const handleFileUpload = (event) => {
  userForm.value.profile_picture = event.target.files[0];
};

const submitUser = () => {
  const formData = new FormData();
  formData.append('name', userForm.value.name);
  formData.append('username', userForm.value.username);
  formData.append('email', userForm.value.email);
  formData.append('password', userForm.value.password);
  formData.append('date_of_birth', userForm.value.date_of_birth);
  formData.append('phone_number', userForm.value.phone_number);

  if (userForm.value.profile_picture) {
    formData.append('profile_picture', userForm.value.profile_picture);
  }

  const method = userForm.value.id ? 'put' : 'post';
  const url = userForm.value.id ? `http://127.0.0.1:8000/api/v1/users/${userForm.value.id}/admin` : 'http://127.0.0.1:8000/api/v1/users';

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
        fetchUsers();
        userForm.value = {
          id: null,
          name: '',
          username: '',
          email: '',
          password: '',
          date_of_birth: '',
          phone_number: '',
          profile_picture: null
        };
      })
      .catch(error => {
        console.error('Error submitting user:', error.response.data);
      });
};

const editUser = (user) => {
  userForm.value = { ...user, profile_picture: null };
};

const deleteUser = (id) => {
  axios.delete(`http://127.0.0.1:8000/api/v1/users/${id}`, authHeader)
      .then(response => {
        fetchUsers();
      })
      .catch(error => {
        console.error('Error deleting user:', error.response.data);
      });
};

onMounted(() => {
  fetchUsers();
});
</script>
<style scoped>
.user-management {
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
  max-width: 100px;
  height: auto;
}
</style>
