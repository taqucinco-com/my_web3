<template>
  <div class="about">
    <h1>このアプリについて</h1>
    <p>これはVue.jsとVue Routerを使用したサンプルアプリケーションです。</p>
    <router-link to="/" class="nav-link">ホームに戻る</router-link>
  </div>
</template>

<script>
export default {
  name: 'AboutView',
};
</script>

<style scoped>
.about {
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
