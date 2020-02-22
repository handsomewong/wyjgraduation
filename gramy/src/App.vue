<template>
  <div class="app-container">
    <!-- header-->
    <mt-header style="background-color: #ec787f" fixed title="今天穿什么">
<!--     <span slot="left" @click="goBack" v-show="flag">-->
<!--    <mt-button class="mui-icon mui-icon-back"></mt-button>-->
<!--      </span>-->
    </mt-header>

    <!-- center-->
    <transition mode="out-in">
      <router-view></router-view>
    </transition>

    <!-- tabbar-->
    <nav class="mui-bar mui-bar-tab">
      <router-link class="mui-tab-item" to="/home">
        <svg class="icon" aria-hidden="true">
          <use xlink:href="#icon-xiangshui"></use>
          <title>首页</title>
        </svg>
<!--        <span class="iconfont icon-shouye"></span>-->
<!--        <span class="mui-tab-label">首页</span>-->
      </router-link>
      <router-link class="mui-tab-item" to="/wardrobe">
        <svg class="icon" aria-hidden="true">
          <use xlink:href="#icon-caizhuang"></use>
          <title>衣橱</title>
        </svg>
<!--        <span class="mui-tab-label">衣橱</span>-->
<!--        <span class="iconfont icon-yifu"></span>-->
<!--        <span class="mui-tab-label">衣橱</span>-->
      </router-link>
      <router-link class="mui-tab-item" to="/settings">
        <svg class="icon" aria-hidden="true">
          <use xlink:href="#icon-huazhuangbao"></use>
          <title>设置</title>
        </svg>
<!--        <span class="mui-tab-label">设置</span>-->
<!--        <span class="iconfont icon-huazhuangbao"></span>-->
<!--        <span class="mui-tab-label">设置</span>-->
      </router-link>
    </nav>
  </div>
</template>

<!--<script></script>-->

<script src="./lib/mui/js/iconfont.js"></script>
<!--<script>-->

<!--  export default{-->
<!--    data(){-->
<!--      return{-->
<!--        flag:false-->
<!--      };-->
<!--    },-->
<!--    created(){-->
<!--      this.flag=this.$route.path !== '/home';-->
<!--    },-->
<!--    methods:{-->
<!--      $route: undefined,-->
<!--      goBack(){-->
<!--        //点击后退-->
<!--        this.$route.go(-1);-->
<!--      }-->
<!--    },-->
<!--    watch:{-->
<!--      '$route.path':function(newVal){-->
<!--        this.flag = newVal !== "/home";-->
<!--      }-->
<!--    },-->
<!--  }-->
<!--</script>-->

<style>
  .icon {
    width: 1.5em;
    height: 1.5em;
    vertical-align: -0.15em;
    fill: currentColor;
    overflow: hidden;
  }
  .app-container{
    padding-top: 40px;
    overflow-x: hidden;
  }

  .v-enter{
    opacity: 0;
    transform: translateX(100%);
  }

  .v-leave-to{
    opacity: 0;
    transform: translateX(-100%);
  }

  .v-enter-active,
  .v-leave-active{
    transition: all 0.3s ease;
  }
</style>
