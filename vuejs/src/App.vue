<template>
  <div id="app">
    <nav>
      <router-link to="/" class="nav-link">ホーム</router-link>
      <router-link to="/about" class="nav-link">About</router-link>
      <router-link to="/counter" class="nav-link">カウンター</router-link>
      <router-link to="/my-token" class="nav-link">NFT</router-link>
    </nav>
    <router-view />
  </div>
</template>

<script>
export default {
  name: 'App'
};
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}

nav {
  padding: 1rem 0;
  background-color: #f5f5f5;
  margin-bottom: 2rem;
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  z-index: 1000;
}

.nav-link {
  margin: 0 10px;
  padding: 8px 16px;
  text-decoration: none;
  color: #2c3e50;
  font-weight: bold;
  border-radius: 4px;
  transition: background-color 0.3s;
}

.nav-link:hover {
  background-color: #e0e0e0;
}

.router-link-active {
  color: #42b983;
  border-bottom: 2px solid #42b983;
}
</style>
