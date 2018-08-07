<template>
  <div id="app">
    <div class="container">
      <div class="row">
        <div class="col-md-9">
          <b-table striped hover :items="players['players']" :fields="checkedFields"></b-table>
        </div>
        <div class="col-md-3">
          <div v-for="field in fields" class="form-group">
            <input type="checkbox" :value="{key: field.key, sortable: true}" v-model="checkedFields">
            <label class="form-check-label" >{{field.key}}</label>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios';
export default {
  data: function () {
    return {
      players: [],
      checkedFields: [],
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

    this.checkedFields = this.fields
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
