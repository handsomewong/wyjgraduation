<template>
  <el-row>
    <el-col :span="18">
      <div>
        <p style="font-size: 15px">{{randomMember.name || '今天穿什么下装呢'}}</p>
      </div>
    </el-col>
    <el-col :span="6">
      <div>
        <el-button :block=true @click="reset" size="mini" type="danger" round>重置</el-button>
        <el-button :block=true :loading="isStart" @click="start" size="mini" type="danger" round>开始</el-button>
      </div>
    </el-col>
  </el-row>
</template>

<script>
    export default {
        name: "trousers",
      data () {
        return {
          isStart: false,
          member : [],
          luckMember : [],
          randomMember: {}
        }
      },
      props:['temperature'],
      methods: {
        listByCategory () {
          console.log(this.temperature);
          if(this.temperature < 10){
            this.$axios.get('seasons/4/wardrobe').then(resp => {
              if (resp && resp.status === 200) {
                this.member = [];
                resp.data.forEach(item=>{
                  if(item.category.id === 2){
                    this.member.push({name : item.title})
                  }
                })
              }
            })
          }else if(this.temperature < 20){
            this.$axios.get('seasons/2/wardrobe').then(resp => {
              if (resp && resp.status === 200) {
                this.member = [];
                resp.data.forEach(item=>{
                  if(item.category.id === 2){
                    this.member.push({name : item.title})
                  }
                })
              }
            })
          }else {
            this.$axios.get('seasons/3/wardrobe').then(resp => {
              if (resp && resp.status === 200) {
                this.member = [];
                resp.data.forEach(item=>{
                  if(item.category.id === 2){
                    this.member.push({name : item.title})
                  }
                })
              }
            })
          }
        },
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
      },
      watch:{
        temperature(newVal,oldVal){
          this.listByCategory()
        }
      }
    }
</script>

<style scoped>

</style>
