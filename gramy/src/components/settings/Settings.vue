<template>
    <el-container>
      <el-header>
        <userchange ref="userchange" style="margin: 20px auto"></userchange>
      </el-header>
      <el-main>
        <collodata ref="collodata" style="margin-top: 180px"></collodata>
      </el-main>
    </el-container>
</template>

<script>
    import Userchange from "./userchange";
    import Collodata from "./collodata";
    export default {
        name: "Settings",
      components: {Collodata, Userchange},
    }
</script>

<style scoped>

</style>
