<template>
  <div>
    <h2 style="text-align: center">目標新規作成</h2>
    <a-form-model>
      <a-input
        v-model="goalRequestBody.title"
        placeholder="目標のタイトル"
      >
      </a-input>
      <a-input
        v-model="goalRequestBody.detail"
        placeholder="目標の詳細"
      />
      <a-input
        v-model="goalRequestBody.deadline"
        placeholder="いつまでに達成したいか"
      />

      <a-button type="primary" @click="createGoal">
        登録
      </a-button>

    </a-form-model>

  </div>
</template>

<script>
export default {
  name: 'CreateGoal',

  data () {
    return {
      goalRequestBody: {
        title: '',
        detail: '',
        deadline: '',
        user_id: this.$store.getters['user/getId'],  // computedで定義してthis.userIdとしても反映されなかったためdataで直で取得
        master_progress_status_id: 1
      }
    }
  },

  methods: {
    async createGoal() {
      await this.$axios.$post(`/api/goals`, this.goalRequestBody).then(() => {
        alert('新しい目標を設定しました！')
        this.$router.push(`/users/${this.goalRequestBody.user_id}`)
      })
    }
  }

}
</script>

<style scoped>

</style>
