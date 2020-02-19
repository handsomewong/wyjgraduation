<template>
  <el-tabs v-model="activeName" @tab-click="handleClick">
    <el-tab-pane label="上衣" name="first">上衣</el-tab-pane>
    <el-tab-pane label="裤子" name="second">裤子</el-tab-pane>
    <el-tab-pane label="裙装" name="third">裙装</el-tab-pane>
    <el-tab-pane label="外套" name="fourth">外套</el-tab-pane>
    <el-tab-pane label="鞋子" name="fifth">鞋子</el-tab-pane>
    <el-tab-pane label="配饰" name="sixth">配饰</el-tab-pane>
  </el-tabs>
</template>

<script>
    export default {
        name: "TopTabs",
      data() {
        return {
          activeName: 'second'
        };
      },
      methods: {
        handleClick(tab, event) {
          console.log(tab, event);
        }
      }
    }
</script>

<style scoped>

</style>
