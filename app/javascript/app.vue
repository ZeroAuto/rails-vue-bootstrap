<template>
  <div id="app">
    <p>{{ message }}</p>
    <b-table striped hover :items="players['players']" :fields="fields"></b-table>
  </div>
</template>

<script>
import axios from 'axios';
export default {
  data: function () {
    return {
      message: "Hello Vue!",
      players: [],
      fields: [
        {
          key: 'name',
          sortable: true
        },
        {
          key: 'game',
          sortable: true
        },
        {
          key: 'rating',
          sortable: true
        },
        {
          key: 'balance',
          sortable: true
        },
        {
          key: 'winnings',
          sortable: true
        }
      ],
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
