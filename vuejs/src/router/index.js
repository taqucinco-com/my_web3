import { createRouter, createWebHistory } from 'vue-router';
// ルートの定義
const routes = [
  {
    path: '/',
    name: 'Home',
    component: () => import('@/views/Home.vue')
  },
  {
    path: '/about',
    name: 'About',
    component: () => import('@/views/About.vue')
  },
  {
    path: '/counter',
    name: 'Counter',
    component: () => import('@/views/CounterView.vue')
  },
  {
    path: '/my-token',
    name: 'MyToken',
    component: () => import('@/views/MyTokenView.vue')
  },
];

// ルーターのインスタンスを作成
const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
});

export default router;
