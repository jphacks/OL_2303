<template>
  <div class="hello">
    <h2>Todoアプリ</h2>
    <h3>タスクを登録してください</h3>
    <p>名前</p>
    <input v-model="todo.name" />
    <p>タスク</p>
    <input v-model="todo.task" />
    <p>締切</p>
    <input v-model="todo.deadline" />
    <br /><br />
    <button style="submit" v-on:click="create">作成</button>
    <hr />
    <button style="submit" v-on:click="show">過去のタスク一覧</button>
    <div v-for="todo in todos" v-bind:key="todo.name">
      <ul>
        <li>名前: {{ todo.name }}</li>
        <br />
        <li>タスク: {{ todo.task }}</li>
        <br />
        <li>締切: {{ todo.deadline }}</li>
        <br />
      </ul>
      <button style="submit" v-on:click="deleteTodo(todo)">完了</button>
      <hr />
    </div>
  </div>
</template>

<script>
export default {
  name: "HelloWorld",
  data: () => ({
    todos: [{ name: "", task: "", deadline: "" }],
    todo: {
      name: "",
      task: "",
      deadline: "",
    },
    name: "todos",
  }),
  methods: {
    show() {
      const data = localStorage.getItem(this.name)
      this.todos = JSON.parse(data)
    },
    create() {
      this.todos.push(this.todo)
      localStorage.setItem(this.name, JSON.stringify(this.todos))
      this.todo = {
        name: "",
        task: "",
        deadline: "",
      }
    },
    deleteTodo(todo) {
      this.todos = this.todos.filter((item) => item.name !== todo.name)
      localStorage.setItem(this.name, JSON.stringify(this.todos))
    },
  },
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h3 {
  margin: 40px 0 0;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #42b983;
}
</style>
