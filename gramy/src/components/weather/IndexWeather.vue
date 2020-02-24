<template>
  <div style="width: 50%;background-color: #2A90DA">
    <div>
      <span @click="changeCity">切换城市</span>
      <div>
        <dl>
          <dt>{{mapData.city||"北京市"}}</dt>
        </dl>
        <dl>
          <dt>{{mapData.weather||"晴"}}</dt>
        </dl>
        <dl>
          <dt>{{mapData.temperature||"0"}}°c</dt>
        </dl>
        <dl>
          <dt>风力:{{mapData.windPower}} | 风向:{{mapData.windDirection}} | 空气湿度:{{mapData.humidity}}%</dt>
        </dl>
      </div>
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
    <div class="select-city-box" v-show="citybox">
      <van-area :area-list="areaList" @confirm="complete" @cancel="cancel" :columns-num="2" title="选择城市" />
    </div>
  </div>
</template>

<script>
  import AreaList from './area';
  export default {
    name: "IndexWeather",
    data(){
      return {
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
    created(){
      setInterval(()=>{
        this.localTime = this.getLocalTime();
      },1000)
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
      getLocalTime(){
        return new Date().toLocaleTimeString()
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
            })
            _self.initEchart();
            _self.loader = false;
            console.log("2",err, data,_self.seriesData);
          });
        });
      },
      initEchart(){
        let dom =  this.$refs.echartcontaier;
        var myChart = echarts.init(dom);
        var app = {}, option = null;
        option = {
          xAxis: {
            show:true,
            splitLine:{show:false},
            type: 'category',
            data: ['今天', '明天', '后天', '三天后'],
            axisLine:{
              lineStyle:{
                color:'#fff'
              }
            },
            axisTick: {
              show: false
            }
          },
          yAxis: {
            show:false,
            axisLine: {
              show:false,
              lineStyle:{
                color:'#fff'
              }
            },
            axisTick: {show:true},
            splitLine:{show:false}

          },
          tooltip: {
            trigger: 'axis',
            formatter:function(params){
              var relVal = params[0].name;
              for (var i = 0, l = params.length; i < l; i++) {
                relVal += params[i].value+"°C";
              }
              return relVal;
            }
          },
          legend: {
            data:['气温']
          },
          series: [{
            data: this.seriesData,
            type: 'line',
            label: {
              normal: {
                show: true,
                position: 'top'
              }
            }
          }]
        };

        myChart.setOption(option, true);
      }
    }
  }
</script>

<style scoped>

</style>
