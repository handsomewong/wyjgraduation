import Vue from 'vue'
import Router from 'vue-router'

// import HelloWorld from "../components/HelloWorld";
import HomeContainer from "../components/tabbar/HomeContainer"
import WardrobeContainer from "../components/tabbar/WardrobeContainer"
import SettingsContainer from "../components/tabbar/SettingsContainer"
import ClothesAdd from "../components/clothes/ClothesAdd"
import DetailAdd from "../components/clothes/DetailAdd"
import Login from "../components/Login";

Vue.use(Router);

export default new Router({
  mode: 'history',
  routes: [//配置路由规则
    {path:'/home',name:'HomeContainer',component: HomeContainer},
    {path:'/wardrobe',name:'WardrobeContainer',components:WardrobeContainer,
    children:[
      {path:'/wardrobe/detailed',name:'DetailAdd',components:DetailAdd},
      {path:'/wardrobe/clothes',name:'ClothesAdd',components:ClothesAdd},
    ]},
    {path:'/settings',name:'SettingsContainer',component: SettingsContainer,
    children:[
      {path: '/settings/login',name: 'Login',components: Login}
    ]},
  ],
  linkActiveClass:'mui-active' //覆盖默认路由高亮的类
})

