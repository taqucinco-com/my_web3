<template>
  <div class="home">
    <h1>ホームページ</h1>
    <p>ようこそ！これはホームページです。</p>
    <router-link to="/about" class="nav-link">Aboutページへ</router-link>
  </div>
</template>

<script>
export default {
  name: 'HomeView',
};
</script>

<style scoped>
.home {
  text-align: center;
  padding: 2rem;
}
.nav-link {
  display: inline-block;
  margin-top: 1rem;
  padding: 0.5rem 1rem;
  background-color: #42b983;
  color: white;
  text-decoration: none;
  border-radius: 4px;
}
.nav-link:hover {
  background-color: #3aa876;
}
</style>
