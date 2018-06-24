<template>
  <div class="task">
    <div class="todo">
      <div v-if="task.priority == '3'" class="content-priority-hight">
        {{ task.title }}
      </div>
      <div v-else-if="task.priority == '2'" class="content-priority-medium">
        {{ task.title }}
      </div>
      <div v-else="task.priority == '1'" class="content-priority-low">
        {{ task.title }}
      </div>
    </div>
    <button v-on:click="deleteTask()" class="close">X</button>
  </div>
</template>

<script>
  export default {
    props: ['task'],

    methods : {
      deleteTask() {
        var self = this;
        this.$emit('delete', self.task.id)
      }
    }
  }
</script>

<style>
  .todo {
    width: 250px;
    max-width: 250px;
    height: 40px;
    margin-bottom: 5px;
    display: table;
    margin-left: auto;
    margin-right: auto;
  }

  .close {
    border: none;
    background: none;
    height: 40px;
    font-weight: bold;
  }

  .task {
    display: inline-flex;
  }

  .content-priority-hight {
    display: table-cell;
    vertical-align: middle;
    padding: 5px;
    background-color: red;
    border: solid darkred;
    font-weight: bold;
    color: white;
    opacity: 0.75;
  }

  .content-priority-low {
    display: table-cell;
    vertical-align: middle;
    padding: 5px;
    background-color: green;
    border: solid darkgreen;
    font-weight: bold;
    color: white;
    opacity: 0.75;
  }

  .content-priority-medium {
    display: table-cell;
    vertical-align: middle;
    padding: 5px;
    background-color: orange;
    border: solid darkorange;
    font-weight: bold;
    color: white;
    opacity: 0.75;
  }
</style>
