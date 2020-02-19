<template>
    <div>
		<!-- 顶部添加按钮 -->
			<div>
				<i @click="dialogFormVisible = true">
          <button type="button" class="mui-btn mui-btn-primary mui-btn-block mui-btn-outlined">添加</button>
        </i>
<!--        点击添加弹出界面-->
        <el-dialog
          title="添加/修改"
          :visible.sync="dialogFormVisible"
          @close="clear">
          <el-form v-model="form" style="text-align: left" ref="dataForm">
            <el-form-item label="季节">
              <el-checkbox-group v-model="form.type">
                <el-checkbox label="春" name="type"></el-checkbox>
                <el-checkbox label="夏" name="type"></el-checkbox>
                <el-checkbox label="秋" name="type"></el-checkbox>
                <el-checkbox label="冬" name="type"></el-checkbox>
              </el-checkbox-group>
            </el-form-item>
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

        <!--滑动条 -->
        <div>
          <mt-navbar v-model="selected">
            <mt-tab-item id="1">选项一</mt-tab-item>
            <mt-tab-item id="2">选项二</mt-tab-item>
            <mt-tab-item id="3">选项三</mt-tab-item>
          </mt-navbar>
        </div>
			<!-- 中间列表 -->
      <div>
        <mt-tab-container v-model="selected">
          <mt-tab-container-item id="1">
            <mt-cell v-for="n in 10" :title="'内容 ' + n" />
          </mt-tab-container-item>
          <mt-tab-container-item id="2">
            <mt-cell v-for="n in 4" :title="'测试 ' + n" />
          </mt-tab-container-item>
          <mt-tab-container-item id="3">
            <mt-cell v-for="n in 6" :title="'选项 ' + n" />
          </mt-tab-container-item>
        </mt-tab-container>
      </div>
<!--			<div>-->
<!--				<ul id="OA_task_1" class="mui-table-view">-->
<!--				<li class="mui-table-view-cell">-->
<!--					<div class="mui-slider-right mui-disabled">-->
<!--						<a class="mui-btn mui-btn-red">删除</a>-->
<!--					</div>-->
<!--					<div class="mui-slider-handle">-->
<!--						左滑显示删除-->
<!--					</div>-->
<!--				</li>-->

<!--			</ul>-->
<!--			</div>-->


    </div>
</template>

<script>
import mui from '../../lib/mui/js/mui.min.js'


export default{
  name: 'WardrobeContainer',
  data () {
    return {
      cid: '',
      activeName: 'second',
      dialogFormVisible: false,
      form: {
        type: [],
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
	mounted() {
    	// 需要在组件的 mounted 事件钩子中，注册 mui 的 scroll 滚动事件
        mui('.mui-scroll-wrapper').scroll({
          deceleration: 0.0005 //flick 减速系数，系数越大，滚动速度越慢，滚动距离越小，默认值0.0006
        });
  	},
    methods: {
      handleSelect (key, keyPath) {
        this.cid = key
        this.$emit('indexSelect')
      },
      handleClick(tab, event) {
        console.log(tab, event);
      },
      clear() {
        this.form = {
          type: [],
          id: '',
          color: '',
          cloth: '',
          typess: '',
          // cover: '',
          abs: '',
          category: ''
        }
      }
    },
  onSubmit () {
    this.$axios
      .post('/wardrobe', {
        type:this.form.type,
        id: this.form.id,
        // cover: this.form.cover,
        color: this.form.color,
        cloth: this.form.cloth,
        typess: this.form.typess,
        abs: this.form.abs,
        category: this.form.category
      }).then(resp => {
      if (resp && resp.status === 200) {
        this.dialogFormVisible = false,
        this.$emit('onSubmit')
      }
    })
  }

};
</script>

<style scoped>

</style>
