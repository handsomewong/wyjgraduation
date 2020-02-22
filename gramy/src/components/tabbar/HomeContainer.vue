<template>
  <div id="box">
    <div>
      <input type="button" value="开始点名" id="btn">
      <input type="button" value="停止点名" id="btn2">
    </div>
    <span id="pp"></span>
    <div id="dv"></div>
  </div>
<!--    <div>-->
<!--        <div>-->
<!--            <button type="button" class="mui-btn mui-btn-primary mui-btn-block">开始搭配</button>-->
<!--        </div>-->
<!--        <div id="weather-view-he"></div>-->
<!--    </div>-->
</template>

<script src="../../lib/mui/js/suiji.js"></script>

<style scoped>
  .cor {
    background-color: #6083cd;
  }
  #box {
    width: 500px;
    border: 2px solid black;
    margin: 0 auto;
    height: 500px;
  }
  ul {
    list-style: none;
  }
  li {
    width: 50px;
    height: 50px;
    margin: 20px;
    float: left;
    line-height: 50px;
    text-align: center;
  }
  .center {
    width: 156px;
    height: 40px;
    line-height: 40px;
    margin: 0 auto;
  }
  #pp {
    display: block;
    text-align: center;
    margin-top: 40px;
    font-size: 35px;

  }
</style>
