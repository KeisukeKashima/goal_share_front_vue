<template>
  <div>
    <page-title :title="pageTitle"/>

    <a-form-model>
      <a-input
        v-model="goal.title"
        placeholder="目標のタイトル"
      >
      </a-input>
      <a-input
        v-model="goal.detail"
        placeholder="目標の詳細"
      />
      <a-input
        v-model="goal.deadline"
        placeholder="いつまでに達成したいか"
      />

      <a-radio-group v-model="goal.master_progress_status_id">
        <a-radio :value="1">未達成</a-radio>
        <a-radio :value="2">達成済み</a-radio>
      </a-radio-group>

      <a-button type="primary" @click="submit">
        {{ goalId ? '目標を更新' : '目標新規作成' }}
      </a-button>

      <a-button v-if="goalId" type="danger" @click="deleteGoal">
        この目標を削除する
      </a-button>

    </a-form-model>
  </div>
</template>

<script lang="ts">
import { Component, Prop, Vue } from 'vue-property-decorator'
import PageTitle from '~/components/atoms/PageTitle'
import Goal from '~/types/Goal'

@Component({
  components: {
    PageTitle
  }
})
export default class GoalForm extends Vue {
  goal: Goal = {}

  @Prop({type: Number, default: null})
  goalId: Number

  get pageTitle () {
    return this.goalId ? '目標更新' : '目標新規作成'
  }

  created () {
    this.fetchGoal()
  }

  fetchGoal () {
    if (this.goalId) {
      this.$axios.$get<Goal>(`/api/goals/${this.goalId}`).then((res) => {
        this.goal = res
      })
    }
  }

  submit () {
    // 簡易バリデーション
    if (this.goal.title === '' ||
      this.goal.detail === '' ||
      this.goal.deadline === '' ||
      this.goal.master_progress_status_id === ''
    ) {
      alert('未入力の項目があります')
      return
    }
    this.$emit('submit', this.goal)
  }

  deleteGoal () {
    const isExecuteDelete = confirm('本当にこの目標を削除してもよろしいですか？')
    if (isExecuteDelete) {
      this.$axios.delete(`/api/goals/${this.goalId}`).then(() => {
        alert('目標を削除しました！')
        this.$router.push(`/users/${this.goal.user_id}`)
      })
    }
  }
}
</script>

<style scoped>

</style>
