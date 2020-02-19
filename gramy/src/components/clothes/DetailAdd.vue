<template>
  <div>
    <i class="mui-btn mui-btn-primary mui-btn-block mui-btn-outlined"  @click="dialogFormVisible = true"></i>
    <el-dialog
      title="添加/修改"
      :visible.sync="dialogFormVisible"
      @close="clear">
      <el-form v-model="form" style="text-align: left" ref="dataForm">
        <el-form-item label="颜色" :label-width="formLabelWidth" prop="color">
          <el-input v-model="form.color" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="布料" :label-width="formLabelWidth" prop="cloth">
          <el-input v-model="form.cloth" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="类型" :label-width="formLabelWidth" prop="typess">
          <el-input v-model="form.typess" autocomplete="off"></el-input>
        </el-form-item>
<!--        <el-form-item label="封面" :label-width="formLabelWidth" prop="cover">-->
<!--          <el-input v-model="form.cover" autocomplete="off" placeholder="图片 URL"></el-input>-->
<!--        </el-form-item>-->
        <el-form-item label="备注" :label-width="formLabelWidth" prop="abs">
          <el-input type="textarea" v-model="form.abs" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="分类" :label-width="formLabelWidth" prop="cid">
          <el-select v-model="form.category.id" placeholder="请选择分类">
            <el-option label="上衣" value="1"></el-option>
            <el-option label="裤子" value="2"></el-option>
            <el-option label="裙装" value="3"></el-option>
            <el-option label="外套" value="4"></el-option>
            <el-option label="鞋子" value="5"></el-option>
            <el-option label="配饰" value="6"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item prop="id" style="height: 0">
          <el-input type="hidden" v-model="form.id" autocomplete="off"></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取 消</el-button>
        <el-button type="primary" @click="onSubmit">确 定</el-button>
      </div>
    </el-dialog>
  </div>
</template>


<script>
  export default {
    name: 'EditForm',
    data () {
      return {
        dialogFormVisible: false,
        form: {
          id: '',
          color: '',
          cloth: '',
          typess: '',
          // cover: '',
          abs: '',
          category: {
            id: '',
            name: ''
          }
        },
        formLabelWidth: '120px'
      }
    },
    methods: {
      clear () {
        this.form = {
          id: '',
          title: '',
          author: '',
          date: '',
          press: '',
          cover: '',
          abs: '',
          category: ''
        }
      },
      onSubmit () {
        this.$axios
          .post('/books', {
            id: this.form.id,
            cover: this.form.cover,
            title: this.form.title,
            author: this.form.author,
            date: this.form.date,
            press: this.form.press,
            abs: this.form.abs,
            category: this.form.category
          }).then(resp => {
          if (resp && resp.status === 200) {
            this.dialogFormVisible = false
            this.$emit('onSubmit')
          }
        })
      }
    }
  }
</script>

<style scoped>

</style>
