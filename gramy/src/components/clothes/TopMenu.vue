<template>
  <el-tabs v-model="activeName" @tab-click="handleClick" @select="handleSelect" default-active="0">
    <el-menu-item index="0">
      <span slot="typess">
      <el-tab-pane label="全部" name="first" index="0"></el-tab-pane>
      </span>
    </el-menu-item>
    <el-menu-item index="1">
      <span slot="typess">
      <el-tab-pane label="上衣" name="second"></el-tab-pane>
      </span>
    </el-menu-item>
    <el-menu-item index="2">
      <span slot="typess">
      <el-tab-pane label="裤子" name="third"></el-tab-pane>
      </span>
    </el-menu-item>
  </el-tabs>
</template>

<script>
    export default {
        name: "TopMenu",
      methods: {
        handleClick(tab, event) {
          console.log(tab, event);
        }
    }}
</script>

<style scoped>

</style>
