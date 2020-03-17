<template>
  <el-menu
    router
    mode="horizontal"
    background-color="#edabaf"
    text-color="white"
    active-text-color="#f16f76">
        <el-menu-item v-for="(item,i) in navList" :key="i" :index="item.name">
          {{ item.navItem }}
        </el-menu-item>
        <span style="position: absolute;padding-top: 20px;right: 43%;font-size: 20px;font-weight: bold;color: white">今天穿什么</span>
    <svg class="icon" aria-hidden="true" @click="gotolink" style="float:right;font-size: 40px;color: #222;padding: 10px">
      <use xlink:href="#icon-tuichu"></use>
    </svg>
  </el-menu>
</template>

<script>
    export default {
        name: "NavMenu",
      methods:{
          gotolink(){
            this.$router.replace('/login')
          }
      },
      data () {
        return {
          keywords: '',
          clothes: [],
          cardLoading: [],
          navList: [
            {name: '/wardrobe', navItem: '衣橱'},
            {name: '/home',navItem: '搭配'},
            {name:'/settings',navItem: '个人中心'}
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
