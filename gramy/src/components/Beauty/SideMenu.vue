<template>
  <el-menu default-active="0"
           class="el-menu-vertical-demo"
           @select="handleSelect"
           active-text-color="#f16f76"
           >
    <el-menu-item index="0">
      <svg class="icon" aria-hidden="true">
        <use xlink:href="#icon-huazhuangdai"></use>
      </svg>
      <span slot="title">全部</span>
    </el-menu-item>
    <el-menu-item index="1">
      <svg class="icon" aria-hidden="true">
        <use xlink:href="#icon-icon-test2"></use>
      </svg>
      <span slot="title">上装</span>
    </el-menu-item>
    <el-menu-item index="2">
      <svg class="icon" aria-hidden="true">
      <use xlink:href="#icon-icon-test3"></use>
    </svg>
      <span slot="title">下装</span>
    </el-menu-item>
    <el-menu-item index="3">
      <svg class="icon" aria-hidden="true">
        <use xlink:href="#icon-icon-test1"></use>
      </svg>
      <span slot="title">连衣裙</span>
    </el-menu-item>
    <el-menu-item index="4">
      <svg class="icon" aria-hidden="true">
        <use xlink:href="#icon-icon-test"></use>
      </svg>
      <span slot="title">外套</span>
    </el-menu-item>
    <el-menu-item index="5">
      <svg class="icon" aria-hidden="true">
        <use xlink:href="#icon-icon-test5"></use>
      </svg>
      <span slot="title">鞋子</span>
    </el-menu-item>
    <el-menu-item index="6">
      <svg class="icon" aria-hidden="true">
        <use xlink:href="#icon-earrings"></use>
      </svg>
      <span slot="title">配饰</span>
    </el-menu-item>
    <el-menu-item index="7">
      <svg class="icon" aria-hidden="true">
        <use xlink:href="#icon-yanying"></use>
      </svg>
      <span slot="title">眼妆</span>
    </el-menu-item>
    <el-menu-item index="8">
      <svg class="icon" aria-hidden="true">
        <use xlink:href="#icon-yanzhi"></use>
      </svg>
      <span slot="title">腮红</span>
    </el-menu-item>
    <el-menu-item index="9">
      <svg class="icon" aria-hidden="true">
        <use xlink:href="#icon-chungao"></use>
      </svg>
      <span slot="title">口红</span>
    </el-menu-item>
    <el-menu-item index="10">
      <svg class="icon" aria-hidden="true">
        <use xlink:href="#icon-icon-test4"></use>
      </svg>
      <span slot="title">包包</span>
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
