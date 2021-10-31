<template>
  <div>
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

      <a-radio-group v-model="goalRequestBody.master_progress_status_id">
        <a-radio :value="1">未達成</a-radio>
        <a-radio :value="2">達成済み</a-radio>
      </a-radio-group>

      <a-button type="primary" @click="updateGoal">
        目標を更新
      </a-button>

    </a-form-model>

  </div>
</template>

<script>
export default {
  name: 'UpdateGoal',

  data () {
    return {
      goalRequestBody: {
        title: '',
        detail: '',
        deadline: '',
        user_id: '',
        master_progress_status_id: ''
      }
    }
  },

  computed: {
    goalId () {
      return Number(this.$route.params.id)
    }
  },

  created () {
    this.fetchGoal()
  },

  methods: {
    async fetchGoal () {
      await this.$axios.$get(`/api/goals/${this.goalId}`).then((res) => {
        this.goalRequestBody = res
      })
    },

    async updateGoal() {
      await this.$axios.put(`/api/goals/${this.goalId}`, this.goalRequestBody).then(() => {
        alert('目標を更新しました！')
        this.$router.push(`/users/${this.goalRequestBody.user_id}`)
      })
    }
  }

}
</script>

<style scoped>

</style>
