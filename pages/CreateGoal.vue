<template>
  <div>
    <goal-form @submit="createGoal"/>
  </div>
</template>

<script lang="ts">
import { Component, Vue } from 'vue-property-decorator'
import GoalForm from '@/components/organisms/GoalForm'
import GoalRequest from '~/types/GoalRequest'

@Component({
  components: { GoalForm }
})
export default class CreateGoal extends Vue {
  // $emitでの第２引数を受け取ることができる
  createGoal (goal: GoalRequest) {
    goal.user_id = this.$store.getters['user/getId']
    this.$axios.$post(`/api/goals`, goal).then(() => {
      alert('新しい目標を設定しました！')
      this.$router.push(`/users/${goal.user_id}`)
    })
  }
}
</script>

<style scoped>

</style>
