<template>
  <div id="app">
    <p>{{ message }}</p>
    <p v-for="player in players['players']">{{player.name}}</p>
  </div>
</template>

<script>
import axios from 'axios';
export default {
  data: function () {
    return {
      message: "Hello Vue!",
      players: [],
      errors: []
    }
  },

  created: function() {
    axios.get('http://localhost:5000/api/players')
    .then(response => {
      this.players = response.data
    })
    .catch(e => {
      this.errors.push(e)
    })
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
