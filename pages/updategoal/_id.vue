<template>
  <div>
    <goal-form
      :goal-id="goalId"
      @submit="updateGoal"
    />
  </div>
</template>

<script>
import GoalForm from '@/components/organisms/GoalForm'

export default {
  name: 'UpdateGoal',
  components: { GoalForm },

  computed: {
    goalId () {
      return Number(this.$route.params.id)
    }
  },

  methods: {
    updateGoal (goal) {
      this.$axios.put(`/api/goals/${this.goalId}`, goal).then(() => {
        alert('目標を更新しました！')
        this.$router.push(`/users/${goal.user_id}`)
      })
    }
  }

}
</script>

<style scoped>

</style>
