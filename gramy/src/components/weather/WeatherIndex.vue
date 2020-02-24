<template>
  <el-card class="box-card">
    <div slot="header" class="clearfix">
      <svg class="icon" aria-hidden="true">
        <use xlink:href="#icon-cloud"></use>
      </svg>
      <span>今日天气</span>
      <el-button style="float: right; padding: 3px 0;color:#f16f76" type="text" @click="changeCity">
        <svg class="icon" aria-hidden="true">
          <use xlink:href="#icon-chengshixuanze"></use>
        </svg>
        切换城市
      </el-button>
    </div>
    <div>
    <div>
      <dl class="citysty">
        <dt>
          <svg class="icon" aria-hidden="true">
            <use xlink:href="#icon-chengshi"></use>
          </svg>
          {{mapData.city||"北京市"}}
        </dt>
      </dl>
      <dl class="weasty">
        <dt>{{mapData.weather||"晴"}}</dt>
      </dl>
      <dl class="temsty">
        <dt>{{mapData.temperature||"0"}}°c</dt>
      </dl>
      <dl class="datasty">
        <dt>风力:{{mapData.windPower}} | 风向:{{mapData.windDirection}} | 空气湿度:{{mapData.humidity}}%</dt>
      </dl>
    </div>
      <div class="feature">
        <div class="group" v-if="featureMapData&&featureMapData[0]">
          明日：
          <span class="tm">白天:{{featureMapData[0].dayTemp}} {{featureMapData[0].dayWeather}} {{featureMapData[0].dayWindDir}} {{featureMapData[0].dayWindPower}}</span>
          <span class="tm">夜间:{{featureMapData[0].nightTemp}} {{featureMapData[0].nightWeather}} {{featureMapData[0].nightWindDir}} {{featureMapData[0].nightWindPower}}</span>
        </div>
        <div class="group" v-if="featureMapData&&featureMapData[1]">
          后天：
          <span class="tm">白天:{{featureMapData[1].dayTemp}} {{featureMapData[1].dayWeather}} {{featureMapData[1].dayWindDir}} {{featureMapData[1].dayWindPower}}</span>
          <span class="tm">夜间:{{featureMapData[1].dayTemp}} {{featureMapData[1].dayWeather}} {{featureMapData[1].dayWindDir}} {{featureMapData[1].dayWindPower}}</span>
        </div>
      </div>
      <div v-show="citybox">
        <van-area :area-list="areaList" @confirm="complete" @cancel="cancel" :columns-num="2" title="选择城市" />
      </div>
    </div>
  </el-card>

</template>

<script>
  import AreaList from './area';
    export default {
        name: "WeatherIndex",
      data(){
          return{
            citybox:false,
            localTime:"",
            loader:true,
            mapData:{},
            featureMapData:{},
            seriesData:[],
            areaList:AreaList,
            selectedCity:""
          }
        },
      mounted() {
        this.initMap();
      },
      methods:{
        changeCity(){
          this.citybox = true;
        },
        complete(val){
          console.log(val);
          this.seriesData = [];
          this.selectedCity = val[1].name;
          this.cancel();
          this.getCurrentCityData(this.selectedCity);
        },
        cancel(){
          this.citybox = false;
        },
        initMap(){
          let _self =this;
          var map = new AMap.Map(this.$refs.mapContainer, {
            resizeEnable: true
          });
          AMap.plugin('AMap.CitySearch', function () {
            var citySearch = new AMap.CitySearch();
            citySearch.getLocalCity(function (status, result) {
              if (status === 'complete' && result.info === 'OK') {
                // 查询成功，result即为当前所在城市信息
                console.log(result);
                _self.getCurrentCityData(result.city);
              }
            })
          })
        },
        getCurrentCityData(cityName){
          let _self =this;
          AMap.plugin('AMap.Weather', function() {
            //创建天气查询实例
            var weather = new AMap.Weather();
            //执行实时天气信息查询
            weather.getLive(cityName, function(err, data) {
              _self.mapData = data;
              console.log("1",err, data);
            });
            weather.getForecast(cityName, function(err, data) {
              _self.featureMapData = data.forecasts;
              _self.featureMapData.map((item,index)=>{
                _self.seriesData.push(item.dayTemp);
              });
              _self.initEchart();
              _self.loader = false;
              console.log("2",err, data,_self.seriesData);
            });
          });
        }
      }
    }

</script>

<style scoped>
  .clearfix:before,
  .clearfix:after {
    display: table;
    content: "";
  }
  .clearfix:after {
    clear: both
  }

  .box-card {
    width: 480px;
    background-color: #f1d7d8;
  }

  .citysty{
    text-align: center;
    font-size: 25px;
  }

  .weasty{
    text-align: center;
    font-size: 20px;
  }

  .temsty{
    text-align: center;
    font-size: 40px;
  }

  .datasty{
    text-align: center;
  }

  .feature{
    margin-top: 30px;
  }
  .feature .group{
    height: 44px;
    line-height: 44px;
    border-radius: 4px;
    background-color: rgba(237, 171, 175, 0.5);
    color: #ffffff;
    font-size: 16px;
    margin-bottom: 10px;
    padding: 0 10px;
  }
  .feature .group .tm{
    margin-left: 10px;
    color: #ffffff;
    font-size: 15px;
  }
</style>
