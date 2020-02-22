<template>
  <el-menu default-active="0"
           class="categories"
           @select="handleSelect"
           active-text-color="#f16f76">
<!--    mode="horizontal"-->
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
      <span slot="title">上衣</span>
    </el-menu-item>
    <el-menu-item index="2">
      <svg class="icon" aria-hidden="true">
        <use xlink:href="#icon-icon-test3"></use>
      </svg>
      <span slot="title">裤子</span>
    </el-menu-item>
    <el-menu-item index="3">
      <svg class="icon" aria-hidden="true">
        <use xlink:href="#icon-icon-test1"></use>
      </svg>
      <span slot="title">裙装</span>
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
        <use xlink:href="#icon-icon-test4"></use>
      </svg>
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
  .categories {
    position: fixed;
    margin-left: 50%;
    left: -600px;
    top: 100px;
    width: 150px;
  }
  /*.icon {*/
  /*  width: 1em;*/
  /*  height: 1em;*/
  /*  vertical-align: -0.15em;*/
  /*  fill: currentColor;*/
  /*  overflow: hidden;*/
  /*}*/
</style>
