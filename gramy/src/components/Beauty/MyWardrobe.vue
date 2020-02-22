<template>
  <el-container>
    <el-aside style="width: 200px;margin-top: 20px">
      <switch></switch>
      <SideMenu @indexSelect="listByCategory" ref="sideMenu"></SideMenu>
    </el-aside>
    <el-main>
      <clothes class="clothes-area" ref="clothesArea"></clothes>
    </el-main>
  </el-container>

</template>

<script>
  import SideMenu from "./SideMenu";
  import Clothes from "./Clothes";
  export default {
    name: "MyWardrobe",
    components:{Clothes, SideMenu},
    methods:{
      listByCategory () {
        var _this = this;
        var cid = this.$refs.sideMenu.cid;
        var url = 'categories/' + cid + '/wardrobe';
        this.$axios.get(url).then(resp => {
          if (resp && resp.status === 200) {
            _this.$refs.clothesArea.clothes = resp.data
          }
        })
      }
    }
  }
</script>

<style scoped>
  .clothes-area{
    width: 990px;
    margin-left: auto;
    margin-right: auto;
  }
</style>
