<template>
  <el-card class="box-card">
    <div style="width: 100%;text-align: center;margin: 0 auto">
      <div style="height: 15px"></div>
      <el-form :label-position="labelPosition" :model="formLabelAlign">
        <el-form-item>
          用户名：
          <el-input v-model="formLabelAlign.name" style="width: 300px"></el-input>
          <el-button type="danger" plain>确定修改</el-button>
        </el-form-item>
        <el-form-item>
          密&nbsp;&nbsp;&nbsp;&nbsp;码：
          <el-input v-model="formLabelAlign.pass" style="width: 300px"></el-input>
          <el-button type="danger" plain>确定修改</el-button>
        </el-form-item>
      </el-form>
    </div>
  </el-card>
</template>

<script>
    export default {
        name: "userchange",
      data(){
        return {
          labelPosition: 'right',
            formLabelAlign: {
            name: '',
              pass:''
          }
        }
      }
    }
</script>

<style scoped>
  .box-card {
    width: 55%;
    margin: 0 auto;
    border-radius: 8px;
    border: #f16f76 2px dashed;
  }
</style>
