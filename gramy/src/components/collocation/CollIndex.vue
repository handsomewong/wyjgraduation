<template>
  <el-collapse v-model="activeNames" @change="handleChange" >
    <el-collapse-item name="1" >
      <div slot="title" class="collsty">
        今天穿什么衣服呢
      </div>
      <div>
          <el-row>
            <el-col :span="0.9">
              <svg class="icon" aria-hidden="true">
              <use xlink:href="#icon-icon-test2"></use>
            </svg>
            </el-col>
            <el-col :span="23">
              <jacket ref="jacket"></jacket>
            </el-col>
          </el-row>
        </div>
        <div>
          <el-row>
            <el-col :span="0.9">
              <svg class="icon" aria-hidden="true">
                <use xlink:href="#icon-icon-test3"></use>
              </svg>
            </el-col>
            <el-col :span="23">
              <trousers ref="trousers"></trousers>
            </el-col>
          </el-row>
        </div>
    </el-collapse-item>
    <el-collapse-item name="2" >
      <div slot="title" class="collsty">
        今天化什么妆呢
      </div>
      <div>
        <el-row>
          <el-col :span="0.9">
            <svg class="icon" aria-hidden="true">
              <use xlink:href="#icon-icon-test2"></use>
            </svg>
          </el-col>
          <el-col :span="23">
            <jacket ref="jacket"></jacket>
          </el-col>
        </el-row>
      </div>
      <div>
        <el-row>
          <el-col :span="0.9">
            <svg class="icon" aria-hidden="true">
              <use xlink:href="#icon-icon-test3"></use>
            </svg>
          </el-col>
          <el-col :span="23">
            <trousers ref="trousers"></trousers>
          </el-col>
        </el-row>
      </div>
    </el-collapse-item>
    <el-collapse-item name="3" >
      <div slot="title" class="collsty">
        今天戴什么小饰品呢
      </div>
      <div>
        <el-row>
          <el-col :span="0.9">
            <svg class="icon" aria-hidden="true">
              <use xlink:href="#icon-icon-test2"></use>
            </svg>
          </el-col>
          <el-col :span="23">
            <jacket ref="jacket"></jacket>
          </el-col>
        </el-row>
      </div>
      <div>
        <el-row>
          <el-col :span="0.9">
            <svg class="icon" aria-hidden="true">
              <use xlink:href="#icon-icon-test3"></use>
            </svg>
          </el-col>
          <el-col :span="23">
            <trousers ref="trousers"></trousers>
          </el-col>
        </el-row>
      </div>
    </el-collapse-item>
  </el-collapse>

</template>

<script>
  import jacket from "./jacket";
  import trousers from "./trousers";
    export default {
        name: "CollIndex",
     components:{jacket,trousers},
      data() {
        return {
          // activeNames: ['1']
        };
      },
      methods: {
        handleChange(val) {
          console.log(val);
        }
      }
    }
</script>

<style scoped>
.collsty{
  margin:0 10% 0 40%;
  font-size: 18px;
  text-align: center;
  color: #edabaf;
  font-family: 幼圆;
  font-weight: bolder;
}
</style>
