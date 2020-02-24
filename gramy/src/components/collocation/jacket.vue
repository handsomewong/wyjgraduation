<template>
  <el-row>
    <el-col :span="18">
      <div>
        <p style="font-size: 15px">{{randomMember.name || '今天穿什么上衣呢'}}</p>
    </div>
    </el-col>
    <el-col :span="6">
      <div>
        <el-button :block=true @click="reset" size="mini"  class="btnsty">重置</el-button>
        <el-button :block=true :loading="isStart" @click="start" size="mini" class="btnsty">开始</el-button>
    </div>
    </el-col>
  </el-row>
</template>

<script>
  var MEMBER = [
    {name: '夏彬'},
    {name: '高进'},
    {name: '王菁菁'},
    {name: '左强'},
    {name: '张涛'},
  ];
    export default {
        name: "jacket",
      data () {
        return {
          isStart: false,
          member : [],
          luckMember : [],
          randomMember: {}
        }
      },
      created () {
        this.member = [...MEMBER];
      },
      methods: {
        random () {
          let _min = 0;
          let _max = this.member.length - 1;
          return _min + Math.round(Math.random() * _max)
        },
        start () {
          this.isStart = true;
          let _count = 100;
          let _interval = setInterval(()=>{
            _count --;
            let _random = this.random();
            let _member = this.member[_random];
            this.randomMember = _member;
            if (_count === 0) {
              clearInterval(_interval);
              this.isStart = false;
              this.member.splice(_random, 1);
              this.luckMember.push(_member);

            }
          }, 100 / 20)
        },
        reset () {
          this.$dialog.confirm({
            title: '提示',
            message: '确定重置，谨慎操作？'
          }).then(() => {
            this.member = [...MEMBER];
            this.luckMember = [];
            this.randomMember = {}
          }).catch(() => {
          })
        }
      }
    }
</script>

<style scoped>
  .start_draw{
    min-height: 520px;
    padding: 30px 10px;
    margin: 50px 60px;
    border-radius: 10px;
    background-image: -webkit-linear-gradient(top, #29D0A2, #2A90DA);
  }
  .wrap{
    margin: 20px auto;
  }
  .numw{
    width: 25%;
    height: 196px;
    line-height: 196px;
    overflow: hidden;
    color: #fff;
    box-sizing: border-box;
    display: inline-block;
    transition: all 0.5s;
    transition-delay: 2s;
  }
  .numw ul{
    padding: 0 16px;
  }
  .numw li{
    float: left;
    width: 100%;
    height: 196px;
    line-height: 196px;
    text-align: center;
    background: #89D8E7;
    font-size:100px;
  }
  .noBindText{
    text-align: center;
  }
  @-webkit-keyframes circle {
    0% {
      transform: translateY(0);
    }
    100% {
      transform: translateY(-980px);
    }
  }
  @-webkit-keyframes circle1 {
    0% {
      transform: translateY(0);
    }
    100% {
      transform: translateY(-980px);
    }
  }
  @-webkit-keyframes circle2 {
    0% {
      transform: translateY(0);
    }
    100% {
      transform: translateY(-1500px);
    }
  }
  @-webkit-keyframes circle3 {
    0% {
      transform: translateY(0);
    }
    100% {
      transform: translateY(-2000px);
    }
  }
  @-webkit-keyframes circle4 {
    0% {
      transform: translateY(0);
    }
    100% {
      transform: translateY(-2500px);
    }
  }

  .btnsty{
    background-color: #f16f76;
    color: white;
  }
</style>
