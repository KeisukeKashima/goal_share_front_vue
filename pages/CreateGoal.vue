<template>
  <div>
    <goal-form @submit="createGoal"/>
  </div>
</template>

<script>
import GoalForm from '@/components/organisms/GoalForm'

export default {
  name: 'CreateGoal',
  components: { GoalForm },

  methods: {
    createGoal (goal) {
      goal.user_id = this.$store.getters['user/getId']  // computedで定義してthis.userIdとしても反映されなかったためdataで直で取得
      this.$axios.$post(`/api/goals`, goal).then(() => {
        alert('新しい目標を設定しました！')
        this.$router.push(`/users/${goal.user_id}`)
      })
    }
  }

}
</script>

<style scoped>

</style>
