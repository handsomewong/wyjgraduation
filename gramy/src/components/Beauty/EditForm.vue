<template>
  <div>
    <i @click="dialogFormVisible = true">
      <el-button plain>添加</el-button>
    </i>
    <el-dialog
      title="添加/修改"
      :visible.sync="dialogFormVisible"
      @close="clear">
      <el-form v-model="form" style="text-align: left" ref="dataForm">
        <el-form-item label="名字" :label-width="formLabelWidth" prop="title">
          <el-input v-model="form.title" autocomplete="off"></el-input>
        <el-form-item label="颜色" :label-width="formLabelWidth" prop="color">
          <el-input v-model="form.color" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="布料/品牌" :label-width="formLabelWidth" prop="cloth">
          <el-input v-model="form.cloth" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="类型" :label-width="formLabelWidth" prop="typess">
          <el-input v-model="form.typess" autocomplete="off"></el-input>
        </el-form-item>
          <el-form-item label="图片" :label-width="formLabelWidth" prop="cover">
            <el-input v-model="form.cover" autocomplete="off" placeholder="图片 URL"></el-input>
            <img-upload @onUpload="uploadImg" ref="imgUpload"></img-upload>
          </el-form-item>
        <el-form-item label="备注" :label-width="formLabelWidth" prop="abs">
          <el-input type="textarea" v-model="form.abs" autocomplete="off"></el-input>
        </el-form-item>
          <el-form-item label="季节" :label-width="formLabelWidth" prop="sid">
            <el-select v-model="form.season.id" placeholder="请选择分类">
              <el-option label="全季" value="1"></el-option>
              <el-option label="春秋" value="2"></el-option>
              <el-option label="夏" value="3"></el-option>
              <el-option label="冬" value="4"></el-option>
            </el-select>
          </el-form-item>
          <el-form-item prop="id" style="height: 0">
            <el-input type="hidden" v-model="form.id" autocomplete="off"></el-input>
          </el-form-item>
        <el-form-item label="分类" :label-width="formLabelWidth" prop="cid">
          <el-select v-model="form.category.id" placeholder="请选择分类">
            <el-option label="上衣" value="1"></el-option>
            <el-option label="裤子" value="2"></el-option>
            <el-option label="裙装" value="3"></el-option>
            <el-option label="外套" value="4"></el-option>
            <el-option label="鞋子" value="5"></el-option>
            <el-option label="配饰" value="6"></el-option>
            <el-option label="眼妆" value="7"></el-option>
            <el-option label="腮红" value="8"></el-option>
            <el-option label="口红" value="9"></el-option>
          </el-select>
        </el-form-item>
          <el-form-item prop="id" style="height: 0">
            <el-input type="hidden" v-model="form.id" autocomplete="off"></el-input>
          </el-form-item>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取 消</el-button>
        <el-button type="primary" @click="onSubmit">确定</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
  import ImgUpload from "./ImgUpload";
    export default {
        name: "EditForm",
      components: {ImgUpload},
      data () {
        return {
          dialogFormVisible: false,
          form: {
            id: '',
            title: '',
            color: '',
            cloth: '',
            typess: '',
            cover: '',
            abs: '',
            category: {
              id: '',
              name: ''
            },
            season:{
              id:'',
              name:''
            }
          },
          formLabelWidth: '120px'
        }
      },
      methods: {
        uploadImg () {
          this.form.cover = this.$refs.imgUpload.url
        },
        clear () {
          this.form = {
            id: '',
            title: '',
            color: '',
            cloth: '',
            typess: '',
            cover: '',
            abs: '',
            category: {
              id: '',
              name: ''
            },
            season:{
              id:'',
              name:''
            }
          }
        },
        onSubmit(){
          this.$axios
          .post('/wardrobe',{
            id:this.form.id,
            title:this.form.title,
            color:this.form.color,
            cloth:this.form.cloth,
            typess:this.form.typess,
            abs:this.form.abs,
            category:this.form.category,
            season:this.form.season,
            cover:this.form.cover
          }).then(resp=>{
            if (resp&&resp.status===200){
              this.dialogFormVisible=false;
              this.$emit('onSubmit')
            }
          })
        }
      }
    }
</script>

<style scoped>
  .el-icon-circle-plus-outline {
    margin: 50px 0 0 20px;
    font-size: 100px;
    float: left;
    cursor: pointer;
  }
</style>
