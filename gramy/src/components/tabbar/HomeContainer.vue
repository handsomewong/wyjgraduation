<template>
  <el-container>
    <el-aside style="width: 40%;margin-top: 10px">
      <WeatherIndex ref="weatherindex"></WeatherIndex>
    </el-aside>
    <el-main>
      <CollIndex ref="collindex"></CollIndex>
    </el-main>
  </el-container>
<!--    <div>-->
<!--        <div>-->
<!--            <button type="button" class="mui-btn mui-btn-primary mui-btn-block">开始搭配</button>-->
<!--        </div>-->
<!--        <div id="weather-view-he"></div>-->
<!--    </div>-->
</template>

<script>
import CollIndex from "../collocation/CollIndex";
// import IndexWeather from "../weather/IndexWeather";
import WeatherIndex from "../weather/WeatherIndex";

  export default {
    name: 'HomeContainer',
    components: {WeatherIndex, CollIndex},
  }
</script>

<style scoped>

</style>
