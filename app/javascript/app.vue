<template>
  <div id="app">
    <div class="container">
      <div class="row">
        <div class="col-md-9">
          <b-table striped hover :items="filteredData" :fields="checkedFields"></b-table>
        </div>
        <div class="col-md-3">
          <input class="form-control" type="text" v-model="search_term">
          <div v-for="field in fields" class="form-group">
            <input type="checkbox" :value="{key: field.key, sortable: true}" v-model="checkedFields">
            <label class="form-check-label" >{{field.key}}</label>
          </div>
          <button type="button" class="btn btn-primary" v-on:click="saveFilterCurrent">Save Filter</button>
          <h3>Saved Filters</h3>
          <div v-for="filter in savedFilters">
            <b-link href="#" v-on:click="loadSavedFilter(filter.fields)">{{filter.created_at}}</b-link>
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
      search_term: "",
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
    axios.get('/api/players')
    .then(response => {
      this.players = response.data['players']
    })
    .catch(e => {
      this.errors.push(e)
    })

    if (this.search_term != "") {
      // this.players = 
    }

    this.checkedFields = this.fields;
    this.getSavedFilters();
  },

  computed: {
    //do some stuff
    filteredData: function() {
      // let filteredPlayers = this.players;
      // return filteredPlayers;
      // console.log('did this happen?')
      // return filteredColumns('los angeles');
      // return this.players.filter((player) => {
      //   return player.game.includes(this.search_term);
      // })
      var lowSearch = this.search_term.toLowerCase();
      return this.players.filter(function(player){
          return Object.values(player).some( val => 
              String(val).toLowerCase().includes(lowSearch) 
          );
      });
    }
  },

  methods: {
    getSavedFilters: function() {
      axios.get('/api/filters')
      .then(response => {
        this.savedFilters = response.data['filters']
      })
      .catch(e => {
        this.errors.push(e)
      })
    },

    loadSavedFilter: function(fields, search_term) {
      this.checkedFields = fields
    },

    saveFilterCurrent: function() {
      axios.post('/api/filters', {
        filter: {
          fields: this.checkedFields
        }
      })
      .then(response => {
        console.log(response)
        this.getSavedFilters()
      })
      .catch(e => {
        this.errors.push(e)
      })
    },

    filteredColumns: function (search) {
      var lowSearch = search.toLowerCase();
      return this.players.filter(function(player){
          return Object.values(player).some( val => 
              String(val).toLowerCase().includes(lowSearch) 
          );
      });
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
