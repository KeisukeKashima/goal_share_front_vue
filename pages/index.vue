<template>
  <div class="button-wrap">
    <a-button type="primary" @click="$router.push('/goals')">
      さぁ！まずはここからみんなの目標を覗いてみよう！
    </a-button>
  </div>
</template>

<script lang="ts">
import Vue from 'vue'

export default Vue.extend({})
</script>

<style scoped>
.button-wrap {
  width: auto;
  text-align: center;
}
</style>
