<template>
  <div class="container">
    <aside class="sidebar">
      <div class="logo">

      </div>
      <nav class="nav">
        <button class="nav-button"><router-link to="/admin">Dashboard</router-link></button>
        <button class="nav-button"><router-link to="/users">Users Info</router-link></button>
        <button class="nav-button"><router-link to="/blog">Blog</router-link></button>
        <button class="nav-button"><router-link to="/portfolio">Portfolio</router-link></button>
        <button class="nav-button"><router-link to="/banner">Banner</router-link></button>
      </nav>
    </aside>

    <div class="main-content">

      <div class="charts">
        <div class="chart">Chart 1</div>
        <div class="chart">Chart 2</div>
        <div class="chart">Chart 3</div>
      </div>
    </div>
  </div>
</template>
<script setup lang="ts">
import Portfolio from "@/views/Admin/Portfolio.vue";
</script>

<style>

</style>