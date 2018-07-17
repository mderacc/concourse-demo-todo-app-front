<template>
  <div>
    <h1>{{ msg }}</h1>
    <div v-for="todo in todos">
      <task :task="todo" v-on:delete="deleteTask"></task>
    </div>
    <button v-on:click="showPopup()" class="button">+</button>
    <vodal :show="show" animation="rotate" @hide="show = false">
      <div class="form">
        <div class="form-line">
          Titre : <input type="text" v-model="selectedTitle" maxlength="40"><br/>
        </div>
        <div class="form-line">
          Priorité :
          <select v-model="selectedPriority">
            <option value='1'>basse</option>
            <option value='2'>moyenne</option>
            <option value='3'>haute</option>
          </select>
        </div>
      </div>
      <button class="button" @click="addTask()">Ok</button>
      <button class="cancel" @click="show = false">Annuler</button>
    </vodal>
  </div>
</template>

<script>
import Task from './Task.vue';
import axios from 'axios';
import Vodal from 'vodal';
import 'vodal/rotate.css';
import 'vodal/common.css';
export default {
  name: 'TodoList',
  components: {Task, Vodal},
  data () {
    return {
      msg: 'The Todo List',
      show: false,
      todos: [],
      selectedPriority: '1',
      selectedTitle: ''
    }
  },

  methods: {
    showPopup() {
      this.show = true
    },

    addTask() {
      this.show = false,
      axios.post('http://localhost:8086/todos', {
        'title': this.selectedTitle,
        'priority': this.selectedPriority
      }).then(response => {})
        .catch(e => {console.log(e)})
      this.selectedPriority = 1;
      this.selectedTitle = '';
      window.location.href = "http://localhost:8083"
    },

    deleteTask(id) {
      axios.delete('http://localhost:8086/todos/'+id)
      window.location.href = "http://localhost:8083"
    }
  },

  mounted() {
    axios.get('http://localhost:8086/todos')
      .then(response => {
        this.todos = response.data
      })
      .catch(e => { console.log(e)})
  }
}
</script>

<style scoped>
  h1 {
    font-weight: normal;
  }
  .button {
    border-radius: 4px;
    border:none;
    background-color: #318CE7;
    width: 50px;
    height: 25px;
    color: white;
  }
  .cancel {
    border-radius: 4px;
    border-color: #318CE7;
    border-width: 1px;
    background-color: white;
    width: 75px;
    height: 25px;
    color: #318CE7;
  }

  .form {
    margin-top: 50px;
    margin-bottom: 40px;
    text-align:left;
    margin-left: 70px;
  }

  .form-line {
    margin-bottom: 10px;
  }

  vodal {
    width: 350px;
    height: 200px;
  }

</style>
