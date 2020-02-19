<template>
  <el-menu :default-active="0" class="el-menu-demo" mode="horizontal" @select="handleSelect">
    <el-menu-item index="0">
      <span slot="title">全部</span>
    </el-menu-item>
    <el-menu-item index="1">
      <span slot="title">上衣</span>
    </el-menu-item>
    <el-menu-item index="2">
      <span slot="title">裤子</span>
    </el-menu-item>
    <el-menu-item index="3">
      <span slot="title">裙装</span>
    </el-menu-item>
    <el-menu-item index="4">
      <span slot="title">外套</span>
    </el-menu-item>
    <el-menu-item index="5">
      <span slot="title">鞋子</span>
    </el-menu-item>
    <el-menu-item index="6">
      <span slot="title">配饰</span>
    </el-menu-item>
  </el-menu>
</template>

<script>
    export default {
      name: "SideMenu",
      data() {
        return {
          cid: ''
        }
      },
      methods: {
        handleSelect(key, keyPath) {
          this.cid = key;
          this.$emit('indexSelect')
        }
      }
    }
</script>

<style scoped>

</style>
