<template>
  <h2 class="title">{{ title }}</h2>
</template>

<script lang="ts">
import { Component, Prop, Vue } from 'vue-property-decorator';

@Component
export default class PageTitle extends Vue {
  // 以下propsの書き換え
  // props: {
  //   title: {
  //     type: String,
  //     required: true,
  //     default: ''
  //   }
  // }

  // @Propの引数にはpropsで指定可能なオプションがすべて指定できる
  @Prop({ type: String, required: true, default: '' })
  title: string;

  // propsが複数ある場合はpropの分だけ上記の記述を書く
  // @Prop({ type: String, required: false, default: '' })
  // body: string;
}
</script>

<style scoped>
.title {
  text-align: center
}
</style>
