<template>

</template>

<script>
    export default {
        name: "TopMenu",
      data() {
        return {
          cid: ''
        }
      },
      methods: {
        handleSelect(key, keyPath) {
          this.cid = key;
          this.$emit('indexSelect')
        }
      }
    }
</script>

<style scoped>

</style>
