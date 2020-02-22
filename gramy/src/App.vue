<template>
  <div>
    <nav-menu></nav-menu>
    <router-view/>
  </div>
</template>

<script>
  import NavMenu from "./components/common/NavMenu";
  export default {
    name: 'App',
    components: {NavMenu}
  }
</script>

<style>
  .icon {
    width: 1.5em; height: 1.5em;
    vertical-align: -0.15em;
    fill: currentColor;
    overflow: hidden;
  }
  /*.icon {*/
  /*  width: 1.5em;*/
  /*  height: 1.5em;*/
  /*  vertical-align: -0.15em;*/
  /*  fill: currentColor;*/
  /*  overflow: hidden;*/
  /*}*/
  /*.app-container{*/
  /*  padding-top: 40px;*/
  /*  overflow-x: hidden;*/
  /*}*/

  /*.v-enter{*/
  /*  opacity: 0;*/
  /*  transform: translateX(100%);*/
  /*}*/

  /*.v-leave-to{*/
  /*  opacity: 0;*/
  /*  transform: translateX(-100%);*/
  /*}*/

  /*.v-enter-active,*/
  /*.v-leave-active{*/
  /*  transition: all 0.3s ease;*/
  /*}*/
</style>
