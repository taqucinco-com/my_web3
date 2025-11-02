import { createRouter, createWebHistory } from 'vue-router';
import HelloWorld from '@/components/HelloWorld.vue';

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
    component: HelloWorld
  },
];

// ルーターのインスタンスを作成
const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
});

export default router;
