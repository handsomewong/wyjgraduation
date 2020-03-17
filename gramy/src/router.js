import VueRouter from 'vue-router'
import HomeContainer from "./components/tabbar/HomeContainer"
import Login from "./components/Login";
import MyWardrobe from "./components/Beauty/MyWardrobe";
import Settings from "./components/Settings/Settings";

var router=new VueRouter({
  mode:'history',
  routes: [//配置路由规则
    {path:'/home',name:'HomeContainer',component: HomeContainer,meta:{requireAuth: true}},
    {path: '/login',name: 'Login',component: Login},
    {path:'/wardrobe',name:'MyWardrobe',component:MyWardrobe,meta:{requireAuth: true}},
    {path:'/settings',name:'Settings',component:Settings,meta:{requireAuth: true}}
  ],
  linkActiveClass:'mui-active' //覆盖默认路由高亮的类
})
// 把路由对象暴露出去
export default router
