<template>
  <el-row>
    <el-col :span="18">
      <div>
        <p style="font-size: 15px">{{randomMember.name || '今天涂什么口红呢'}}</p>
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
        name: "lipstick",
      data () {
        return {
          isStart: false,
          member : [],
          luckMember : [],
          randomMember: {}
        }
      },
      created () {
        this.listByCategory()
      },
      methods: {
        listByCategory () {
          this.$axios.get('categories/9/wardrobe').then(resp => {
            if (resp && resp.status === 200) {
              // _this.$refs.clothesArea.clothes = resp.data
              this.member = [];
              resp.data.forEach(item=>{
                this.member.push({name : item.title})
              })
            }
          })
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
      }
    }
</script>

<style scoped>

</style>
