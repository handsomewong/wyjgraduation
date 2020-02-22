<template>
    <div>
      <div>
      <switch></switch>
      <TopMenu @indexSelect="listByCategory" ref="topMenu"></TopMenu>
      </div>
      <div>
        <areaclothes class="clothes-area" ref="clothesArea"></areaclothes>
      </div>
    </div>
</template>

<script>
    export default {
        name: "IndexWardrobe"
    }
</script>

<style scoped>

</style>
