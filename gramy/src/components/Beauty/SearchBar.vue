<template>
  <div style="margin-bottom: 20px;display: flex;justify-content: center;align-items: center">
    <el-input
      @keyup.enter.native="searchClick"
      size="small"
      style="width: 300px;margin-right: 10px"
      placeholder="搜索名称和类型"
      v-model="keywords">
    </el-input>
    <el-button size="small" type="danger" plain @click="searchClick" style="margin-top: -15px">搜索</el-button>
  </div>
</template>

<script>
    export default {
        name: "SearchBar",
      data(){
        return {
          keywords: '',
          clothes: [],
          cardLoading: []
        }
      },
      methods:{
        searchClick () {
          this.$emit('onSearch')
        }
      }
    }
</script>

<style scoped>

</style>
