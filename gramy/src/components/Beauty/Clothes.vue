<template>
    <div>
      <el-row>
        <search-bar @onSearch="searchResult" ref="searchBar"></search-bar>
        <edit-form @onSubmit="loadClothes()" ref="edit"></edit-form>
        <el-tooltip effect="dark" placement="right"
                    v-for="item in clothes.slice((currentPage-1)*pagesize,currentPage*pagesize)"
                    :key="item.id">
          <p slot="content" style="font-size: 14px;margin-bottom: 6px;">{{item.title}}</p>
          <p slot="content" style="font-size: 13px;margin-bottom: 6px">
            <span>{{item.color}}</span> /
            <span>{{item.cloth}}</span> /
            <span>{{item.typess}}</span>/
            <span>{{item.type}}</span>
          </p>
          <p slot="content" class="abstract">{{item.abs}}</p>
          <el-card style="width: 135px;margin-bottom: 20px;height: 233px;float: left;margin-right: 15px" class="clothes"
                   bodyStyle="padding:10px" shadow="hover">
            <div class="cover" @click="editClothes(item)">
              <img :src="item.cover" alt="图片">
            </div>
            <div>
              <div>
                <a class="title">{{item.title}}</a>
              </div>
              <div>
                <!--              刪除按鈕-->
                <i class="el-icon-delete" @click="deleteClothes(item.id)"></i>
              </div>
            </div>
            <div class="typess">{{item.typess}}</div>
          </el-card>
        </el-tooltip>
      </el-row>
      <el-row>
<!--        分頁-->
        <el-pagination
          @current-change="handleCurrentChange"
          :current-page="currentPage"
          :page-size="pagesize"
          :total="clothes.length">
        </el-pagination>
      </el-row>

    </div>
</template>

<script>
    import EditForm from "./EditForm";
    import SearchBar from "./SearchBar";
    export default {
        name: "Clothes",
      components: {EditForm,SearchBar},
      data () {
        return {
          clothes: [],
          currentPage:1,
          pagesize: 11,
          // dialogVisible: false,
        }
      },
      mounted:function() {
          this.loadClothes()
      },
      methods:{
          loadClothes(){
            var _this=this;
            this.$axios.get('./wardrobe').then(resp=>{
              if (resp&&resp.status===200){
                _this.clothes=resp.data
              }
            })
          },
        handleCurrentChange: function (currentPage) {
          this.currentPage = currentPage;
          console.log(this.currentPage)
        },
        searchResult () {
          var _this = this;
          this.$axios
            .post('/search', {
              keywords: this.$refs.searchBar.keywords
            }).then(resp => {
            if (resp && resp.status === 200) {
              _this.clothes = resp.data
            }
          })
        },
        deleteClothes (id) {
          this.$confirm('此操作将永久删除, 是否继续?', '提示', {
            confirmButtonText: '确定',
            cancelButtonText: '取消',
            type: 'warning'
          }).then(() => {
              this.$axios
                .post('/delete', {id: id}).then(resp => {
                if (resp && resp.status === 200) {
                  this.loadClothes()
                }
              })
            }
          ).catch(() => {
            this.$message({
              type: 'info',
              message: '已取消删除'
            })
          })
          // alert(id)
        },
        editClothes (item) {
          this.$refs.edit.dialogFormVisible = true;
          this.$refs.edit.form = {
            id: item.id,
            cover: item.cover,
            title: item.title,
            color: item.color,
            cloth: item.cloth,
            typess: item.typess,
            abs: item.abs,
            category: {
              id: item.category.id.toString(),
              name: item.category.name
            },
            season: {
              id: item.season.id.toString(),
              name: item.season.name
            }
          }
        }
      },

    }
</script>

<style scoped>
  .cover {
    width: 115px;
    height: 172px;
    margin-bottom: 7px;
    overflow: hidden;
    cursor: pointer;
  }

  img {
    width: 110px;
    height: 160px;
    /*margin: 0 auto;*/
  }

  .title {
    font-size: 14px;
    text-align: left;
    color: #f16f76;
    margin: -12px 0;
  }

  .typess {
    color: #333;
    width: 102px;
    font-size: 13px;
    margin-bottom: 6px;
    text-align: left;
  }

  .abstract {
    display: block;
    line-height: 17px;
  }

  a {
    text-decoration: none;
  }

  a:link, a:visited, a:focus {
    color: #3377aa;
  }
</style>
