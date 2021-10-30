<template>
  <div class="top">
    <Header />
    <nuxt />
  </div>
</template>

<script>
import Header from '~/components/molecules/Header'

export default {
  name: 'Default',
  components: {
    Header
  }
}
</script>

<style scoped>
.top {
  /*background-color: #F4F4F4;*/
  margin-left: auto;
  margin-right: auto;
  max-width: 700px;
  /*だいたいのスマホの横幅*/
  min-width: 375px;
}
</style>
