<template>
  <el-collapse @change="handleChange" style="margin-top: -8px" >
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
              <jacket ref="jacket" :temperature="temperature"></jacket>
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
              <trousers ref="trousers" :temperature="temperature"></trousers>
            </el-col>
          </el-row>
        </div>
      <div>
        <el-row>
          <el-col :span="0.9">
            <svg class="icon" aria-hidden="true">
              <use xlink:href="#icon-icon-test1"></use>
            </svg>
          </el-col>
          <el-col :span="23">
            <skirt ref="skirt" :temperature="temperature"></skirt>
          </el-col>
        </el-row>
      </div>
      <div>
        <el-row>
          <el-col :span="0.9">
            <svg class="icon" aria-hidden="true">
              <use xlink:href="#icon-icon-test"></use>
            </svg>
          </el-col>
          <el-col :span="23">
            <overcoat ref="overcoat" :temperature="temperature"></overcoat>
          </el-col>
        </el-row>
      </div>
      <div>
        <el-row>
          <el-col :span="0.9">
            <svg class="icon" aria-hidden="true">
              <use xlink:href="#icon-icon-test5"></use>
            </svg>
          </el-col>
          <el-col :span="23">
            <shoes ref="shoes" :temperature="temperature"></shoes>
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
              <use xlink:href="#icon-yanying"></use>
            </svg>
          </el-col>
          <el-col :span="23">
            <eyeshadow ref="eyeshadow"></eyeshadow>
          </el-col>
        </el-row>
      </div>
      <div>
      <el-row>
        <el-col :span="0.9">
          <svg class="icon" aria-hidden="true">
            <use xlink:href="#icon-yanzhi"></use>
          </svg>
        </el-col>
        <el-col :span="23">
          <blusher ref="blusher"></blusher>
        </el-col>
      </el-row>
    </div>
      <div>
        <el-row>
          <el-col :span="0.9">
            <svg class="icon" aria-hidden="true">
              <use xlink:href="#icon-chungao"></use>
            </svg>
          </el-col>
          <el-col :span="23">
            <lipstick ref="lipstick"></lipstick>
          </el-col>
        </el-row>
      </div>
    </el-collapse-item>
    <el-collapse-item name="3" >
      <div slot="title" class="collsty">
        今天用什么饰品呢
      </div>
      <div>
        <el-row>
          <el-col :span="0.9">
            <svg class="icon" aria-hidden="true">
              <use xlink:href="#icon-earrings"></use>
            </svg>
          </el-col>
          <el-col :span="23">
            <ornament ref="ornament"></ornament>
          </el-col>
        </el-row>
      </div>
      <div>
        <el-row>
          <el-col :span="0.9">
            <svg class="icon" aria-hidden="true">
              <use xlink:href="#icon-icon-test4"></use>
            </svg>
          </el-col>
          <el-col :span="23">
            <bag ref="bag"></bag>
          </el-col>
        </el-row>
      </div>
    </el-collapse-item>
  </el-collapse>

</template>

<script>
  import jacket from "./jacket";
  import trousers from "./trousers";
  import Skirt from "./skirt";
  import Overcoat from "./overcoat";
  import Shoes from "./shoes";
  import Eyeshadow from "./eyeshadow";
  import Blusher from "./blusher";
  import Lipstick from "./lipstick";
  import Ornament from "./ornament";
  import Bag from "./bag";
    export default {
        name: "CollIndex",
     components:{Bag, Ornament, Lipstick, Blusher, Eyeshadow, Shoes, Overcoat, Skirt, jacket,trousers},
      data() {
        return {
          // activeNames: ['1']
        };
      },
      props:['temperature'],
      methods: {
        handleChange(val) {
          console.log(val);
        }
      },
      mounted() {
      },
    }
</script>

<style scoped>
.collsty{
  margin:0 10% 0 40%;
  font-size: 18px;
  text-align: center;
  color: #f16f76;
  font-family: 幼圆;
  font-weight: bolder;
}
</style>
