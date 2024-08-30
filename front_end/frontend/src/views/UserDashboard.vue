<template>
  <header class="header">
    <div class="logo">
  <img src=""
    </div>
    <nav class="nav-menu">
      <div class="hamburger-menu" id="hamburger">
        <span class="bar"></span>
        <span class="bar"></span>
        <span class="bar"></span>
      </div>
      <ul class="nav-links" id="nav-links">
        <li><a id="portfolio-button">Leaderboard</a></li>
        <li><a id="testimonial-button">User Profile</a></li>
      </ul>
    </nav>
    <div class="search-container">
      <input type="text" placeholder="Search!">
      <button type="submit"><i class="search-icon"></i></button>
    </div>
  </header>
  <div id="landing-page">
    <!-- Banner Section -->
    <section class="banner">
      <p>This Is Website </p>
    </section>
    <!-- News Section -->
    <section class="news-section">
      <div class="news-card">
        <p>Game</p>
        <button @click="playGame">Play</button>
      </div>
      <div class="news-card">
        <p>Design</p>
        <button @click="apps" >Go!</button>
      </div>
    </section>

  </div>
</template>
<script setup>
import { useRouter } from 'vue-router';

const router = useRouter();

const playGame = () => {
  window.location.href = '/game/index.html';
};
const apps = () => {
  window.location.href = '/apps/index.html';
};
</script>