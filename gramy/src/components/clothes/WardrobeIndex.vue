<template>
      <el-container>
        <el-header>
<!--          顶部导航栏TopMenu-->
          <switch></switch>
          <TopMenu></TopMenu>
        </el-header>
        <el-main>
<!--          衣服信息wardrobe-->
        </el-main>
        <el-footer>
<!--          添加按钮-->
        </el-footer>
      </el-container>
</template>


<script >
  import TopMenu from "./TopMenu";
    export default {
        name: "WardrobeIndex",
      components:{TopMenu}
    }
</script>

<style scoped>

</style>
