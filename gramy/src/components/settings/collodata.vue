<template>
  <el-table
    :data="tableData"
    style="width: 100%">
    <el-table-column prop="date" label="日期"></el-table-column>
    <el-table-column prop="city" label="城市"></el-table-column>
    <el-table-column prop="tem" label="温度"></el-table-column>
    <el-table-column prop="jacket" label="上衣"></el-table-column>
    <el-table-column prop="trousers" label="下装"></el-table-column>
    <el-table-column prop="skirt" label="连衣裙"></el-table-column>
    <el-table-column prop="overcoat" label="外套"></el-table-column>
    <el-table-column prop="shoes" label="鞋子"></el-table-column>
    <el-table-column prop="eyeshadow" label="眼影"></el-table-column>
    <el-table-column prop="blusher" label="腮红"></el-table-column>
    <el-table-column prop="lipstick" label="口红"></el-table-column>
    <el-table-column prop="ornament" label="饰品"></el-table-column>
    <el-table-column prop="bag" label="包包"></el-table-column>
  </el-table>
</template>

<script>
    export default {
        name: "collodata",
      data() {
        return {
          tableData: [{
            date: '20.3.17',
            city: '北京',
            tem: '6',
            jacket:'',
            trousers:'',
            skirt:'',
            overcoat:'',
            shoes:'',
            eyeshadow:'',
            blusher:'',
            lipstick:'',
            ornament:'',
            bag:''
          }],
        };
      }
    }
</script>

<style scoped>

</style>
