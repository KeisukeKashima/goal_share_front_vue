<template>
  <div>
    <page-title title="目標詳細"/>
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

<script lang="ts">
import { Component, Vue } from 'vue-property-decorator'
import PageTitle from '~/components/atoms/PageTitle.vue'
import Goal from '~/types/Goal'

@Component({
  // 利用する子コンポーネントは@Componentの引数として定義する
  components: {
    PageTitle
  }
})
export default class Goals extends Vue {
  // ライフサイクルフックはクラスにライフサイクルの名前でメソッドを定義
  created () {
    this.fetchGoal()
  }

  // dataはクラスのフィールドとして定義
  goal: Goal = {}

  // computedはクラスのgetterとして定義
  get goalId() {
    return Number(this.$route.params.id)
  }

  // methodsはクラスのメソッドとして定義
  fetchGoal () {
    this.$axios.$get<Goal>(`/api/goals/${this.goalId}`).then((res) => {
      this.goal = res
    })
  }
}
</script>

<style scoped>

</style>
