<template>
  <div id="app">
    <div class="container">
      <div class="row">
        <div class="col-md-9">
          <b-table striped hover :items="players" :fields="checkedFields"></b-table>
        </div>
        <div class="col-md-3">
          <div v-for="field in fields" class="form-group">
            <input type="checkbox" :value="{key: field.key, sortable: true}" v-model="checkedFields">
            <label class="form-check-label" >{{field.key}}</label>
          </div>
          <button type="button" class="btn btn-primary">Save Filter</button>
          <div v-for="filter in savedFilters">
            <b-link href="#">{{filter.created_at}}</b-link>
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
      savedFilters: [],
      errors: []
    }
  },

  created: function() {
    axios.get('http://localhost:5000/api/players')
    .then(response => {
      this.players = response.data['players']
    })
    .catch(e => {
      this.errors.push(e)
    })

    axios.get('http://localhost:5000/api/filters')
    .then(response => {
      this.savedFilters = response.data['filters']
    })
    .catch(e => {
      console.log(e);
      this.errors.push(e)
    })

    this.checkedFields = this.fields
  },

  methods: {
    getSavedFilters() {
      axios.get('http://localhost:5000/api/filters')
      .then(response => {
        this.savedFilters = repsonse.data['filters']
      })
      .catch(e => {
        this.errors.push(e)
      })
    }
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
