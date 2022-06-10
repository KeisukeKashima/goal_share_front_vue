<template>
  <div>
    <goal-form
      :goal-id="goalId"
      @submit="updateGoal"
    />
  </div>
</template>

<script lang="ts">
import { Component, Vue } from 'vue-property-decorator'
import GoalForm from '@/components/organisms/GoalForm'
import GoalRequest from '../../types/GoalRequest'

@Component({
  components: { GoalForm }
})
export default class UpdateGoal extends Vue {

  get goalId () {
    return Number(this.$route.params.id)
  }

  updateGoal (goal: GoalRequest) {
    this.$axios.put(`/api/goals/${this.goalId}`, goal).then(() => {
      alert('目標を更新しました！')
      this.$router.push(`/users/${goal.user_id}`)
    })
  }
}
</script>

<style scoped>

</style>
