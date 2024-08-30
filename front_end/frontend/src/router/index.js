import { createRouter, createWebHistory } from 'vue-router'
import UserDashboard from "@/views/UserDashboard.vue";
import Game from "@/views/Game.vue";
import Design from "@/views/Design.vue";
import UserProfile from "@/views/UserProfile.vue";
import AdminDashboard from "@/views/Admin/AdminDashboard.vue";
import Banner from "@/views/Admin/Banner.vue";
import Blog from "@/views/Admin/Blog.vue";
import Portfolio from "@/views/Admin/Portfolio.vue";
import Users from "@/views/Admin/Users.vue";
import Login from "@/views/Login.vue";
import Register from "@/views/Register.vue";


const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'Dashboard',
      component: UserDashboard,
      meta : {
        reqAuth : true
      }
    },
    {
      path: '/game',
      name: 'Game',
      component: Game,
      meta : {
        reqAuth : true
      }
    },
    {
      path: '/design',
      name: 'Dsgn',
      component: Design,
      meta : {
        reqAuth : true
      }
    },
    {
      path: '/user/profile',
      name: 'Profile',
      component: UserProfile,
      meta : {
        reqAuth : true
      }
    },
    {
      path: '/admin',
      name: 'AdminDashboard',
      component: AdminDashboard,
      meta : {
        reqAuth : true, isAdmin : true
      }
    },
    {
      path: '/banner',
      name: 'Banner',
      component: Banner,
      meta : {
        reqAuth : true, isAdmin : true
      }
    },
    {
      path: '/blog',
      name: 'Blog',
      component: Blog,
      meta : {
        reqAuth : true, isAdmin : true
      }
    },
    {
      path: '/portfolio',
      name: 'Portfolio',
      component: Portfolio,
      meta : {
        reqAuth : true, isAdmin : true
      }
    },
    {
      path: '/users',
      name: 'Users',
      component: Users,
      meta : {
        reqAuth : true, isAdmin : true
      }
    },
    {
      path: '/login',
      name: 'Login',
      component: Login
    },
    {
      path: '/register',
      name: 'Register',
      component: Register
    },

  ]
})

router.beforeEach((to, from, next) => {
  const token = localStorage.getItem("token");
  const role = localStorage.getItem("role");
  const isAuth = !!token;

  // block user to login page if the user has login before
  if (isAuth && (to.name === "Login" || to.name === "Register")) {
    next({ name: role === "admin" ? "AdminDashboard" : "Dashboard" });
    return;
  }
  // block user if not login to another page
  if (to.matched.some((record) => to.meta.reqAuth)) {
    if (!isAuth) {
      next({ name: "Login" });
      return;
    }
    //block user to admin page
    if (to.matched.some((record) => to.meta.isAdmin) && role !== "admin") {
      next({ name: "Dashboard" });
      return;
    }
  }
  next();
});
export default router
