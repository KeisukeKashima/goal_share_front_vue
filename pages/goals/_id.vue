<template>
  <div>
    <h2 style="text-align: center">目標詳細</h2>
    <a-card
      :title="goal.title"
      :bordered="true"
      class="card"
    >
      <p>■詳細</p>{{ goal.detail }}
      <div class="mgt20"></div>
      <p>■期限</p>{{ goal.deadline }}
      <div class="mgt20"></div>
<!--      <NuxtLink :to="{ name: 'users-id', params: { id: goal.user_id } }">-->
        <NuxtLink :to="`/users/${goal.user_id}`">
          <a-icon type="user"/>
          この目標を設定したユーザ詳細を見る
        </NuxtLink>
    </a-card>
  </div>
</template>

<script>
export default {
  data () {
    return {
      goal: {}
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
        this.goal = res
      })
    }
  }
}
</script>

<style scoped>

</style>
