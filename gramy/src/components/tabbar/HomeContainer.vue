<template>
  <el-container>
    <el-aside style="width: 40%;margin-top: 10px">
      <WeatherIndex ref="weatherindex"></WeatherIndex>
    </el-aside>
    <el-main>
      <el-button type="danger" style="width: 100%">保存</el-button>
      <div style="height: 20px"></div>
      <CollIndex ref="collindex" :temperature="temperature"></CollIndex>
    </el-main>
  </el-container>
</template>

<script>
import CollIndex from "./collocation/CollIndex";
import WeatherIndex from "./weather/WeatherIndex";

  export default {
    name: 'HomeContainer',
    components: {WeatherIndex, CollIndex},
    data(){
      return{
        temperature:0
      }
    },
    methods:{
    },
    mounted() {
    },
  }
</script>

<style scoped>

</style>
