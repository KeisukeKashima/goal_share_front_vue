<template>
  <h2 class="title">{{ title }}</h2>
</template>

<script>
export default {
  name: 'PageTitle',

  props: {
    title: {
      type: String,
      required: true
    }
  }
}
</script>

<style scoped>
.title {
  text-align: center
}
</style>
