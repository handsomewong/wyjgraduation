import VueRouter from 'vue-router'

// import HelloWorld from "../components/HelloWorld";
import HomeContainer from "./components/tabbar/HomeContainer"
// import WardrobeIndex from "./components/clothes/WardrobeIndex"
// import WardrobeContainer from "./components/tabbar/WardrobeContainer";
import SettingsContainer from "./components/tabbar/SettingsContainer"
// import ClothesAdd from "./components/clothes/ClothesAdd"
// import DetailAdd from "./components/clothes/DetailAdd"
import Login from "./components/Login";
import MyWardrobe from "./components/Beauty/MyWardrobe";

var router=new VueRouter({
  mode:'history',
  routes: [//配置路由规则
    {path:'/home',name:'HomeContainer',component: HomeContainer,meta:{requireAuth: true}},
    // {path:'/wardrobe',name:'WardrobeIndex',component:WardrobeIndex,meta:{requireAuth: true}},
    // {path:'/wardrobe/clothes',name:'ClothesAdd',component:ClothesAdd},
    // {path:'/wardrobe/detailed',name:'DetailAdd',component:DetailAdd},
    {path:'/settings',name:'SettingsContainer',component: SettingsContainer,meta:{requireAuth: true}},
    {path: '/login',name: 'Login',component: Login},
    {path:'/wardrobe',name:'MyWardrobe',component:MyWardrobe,meta:{requireAuth: true}}
  ],
  linkActiveClass:'mui-active' //覆盖默认路由高亮的类
})
// 把路由对象暴露出去
export default router
