<template>
  <div>
    <h1>{{ message }}</h1>
    <button @click="getNumber">Get Contract Number</button>
    <button @click="increment">Increment</button>
    <button @click="decrement">Decrement</button>
  </div>
</template>

<script>
import { numberService, incrementService, decrementService} from "@/blockchain/contractService";

export default {
  data() {
    return {
      message: "Fetching data..."
    };
  },
  async mounted() {
    const value = await numberService();
    setTimeout(() => {
      this.message = value;
    }, 1000);
  },
  methods: {
    async getNumber() {
      const value = await numberService();
      if (value) {
        this.message = value;
        alert(value);
      } else {
        this.message = "データの取得に失敗しました．";
      }
    },
    async increment() {
      try {
        const tx = await incrementService();
        if (tx) {
          console.log(tx);
          console.log("increment()実行成功:", tx.hash);
        } else {
          console.error("increment()の呼び出しに失敗しました");
        }
      } catch (error) {
        console.error("Vueコンポーネントでのエラー:", error);
      }
    },
    async decrement() {
      try {
        const tx = await decrementService();
        if (tx) {
          console.log("decrement()実行成功:", tx.hash);
        } else {
          console.error("decrement()の呼び出しに失敗しました");
        }
      } catch (error) {
        console.error("Vueコンポーネントでのエラー:", error);
      }
    }
  }
};
</script>

<style scoped>
/* 必要であればスタイルを記述 */
</style>
