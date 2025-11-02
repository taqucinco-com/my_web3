<template>
  <div class="my-token">
    <h1>MyToken</h1>
    <p>Your NFT Balance: {{ balance }}</p>
    <button @click="getTokenIds">Show My Token IDs</button>
    <ul v-if="tokenIds.length">
      <li v-for="tokenId in tokenIds" :key="tokenId">{{ tokenId }}</li>
    </ul>
  </div>
</template>

<script>
import { ethers } from "ethers";
import MyToken from "@/blockchain/abi/MyToken.json";

export default {
  name: 'MyTokenView',
  data() {
    return {
      balance: 0,
      tokenIds: [],
    };
  },
  async mounted() {
    const { contract, address } = await this.getContract();
    if (contract) {
      const balance = await contract.balanceOf(address);
      this.balance = balance.toString();
    }
  },
  methods: {
    async getContract() {
      if (window.ethereum) {
        try {
          await window.ethereum.request({ method: 'eth_requestAccounts' });
          const provider = new ethers.BrowserProvider(window.ethereum);
          const signer = await provider.getSigner();
          const contractAddress = process.env.VUE_APP_CONTRACT_ADDRESS;
          const contract = new ethers.Contract(contractAddress, MyToken.abi, signer);
          const address = await signer.getAddress();
          return { contract, address };
        } catch (error) {
          console.error("Error connecting to MetaMask:", error);
          return { contract: null, address: null };
        }
      } else {
        console.error("MetaMask is not installed.");
        return { contract: null, address: null };
      }
    },
    async getTokenIds() {
      const { contract, address } = await this.getContract();
      if (contract) {
        const tokenIds = await contract.getTokensOfOwner(address);
        this.tokenIds = tokenIds.map(id => id.toString());
        const balance = await contract.balanceOf(address);
        this.balance = balance.toString();
      }
    },
  },
};
</script>