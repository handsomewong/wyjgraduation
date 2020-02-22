<template>
  <el-menu
    :default-active="'/index'"
    router
    mode="horizontal"
    background-color="#edabaf"
    text-color="white"
    active-text-color="#f16f76"
    style="min-width: 1300px">
    <el-menu-item v-for="(item,i) in navList" :key="i" :index="item.name">
      {{ item.navItem }}
    </el-menu-item>
    <span style="position: absolute;padding-top: 20px;right: 43%;font-size: 20px;font-weight: bold;color: white">今天穿什么</span>
  </el-menu>
</template>

<script>
    export default {
        name: "NavMenu",
      data () {
        return {
          navList: [
            {name: '/wardrobe', navItem: '衣橱'},
            {name: '/home',navItem: '搭配'},
            {name: '/settings', navItem: '设置'},
            // {name: '/admin', navItem: '个人中心'}
          ]
        }
      }
    }
</script>

<style scoped>
  a{
    text-decoration: none;
  }

  span {
    pointer-events: none;
  }
</style>
