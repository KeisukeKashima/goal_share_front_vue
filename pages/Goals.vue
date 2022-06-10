<template>
  <div>
    <page-title title="目標一覧"/>
    <div class="card-wrap">
      <div
        v-for="(goal, key) in goals"
        :key="key"
      >
        <a-card
          :title="goal.title"
          :bordered="true"
          class="card"
        >
          <p>■詳細</p>{{ goal.detail }}
          <div class="mgt20"></div>
          <p>■期限</p>{{ goal.deadline }}
          <div class="mgt20"></div>
          <NuxtLink :to="{ name: 'goals-id', params: { id: goal.id } }">
            <a-icon type="rise"/>
            この目標の詳細を確認
          </NuxtLink>
        </a-card>
      </div>
    </div>
  </div>
</template>

<script lang="ts">
import { Component, Vue } from 'vue-property-decorator'
import PageTitle from '~/components/atoms/PageTitle'
import Goal from '~/types/Goal'

@Component({
  // 利用する子コンポーネントは@Componentの引数として定義する
  components: {
    PageTitle
  }
})
export default class Goals extends Vue {
  // ライフサイクルフックはクラスにライフサイクルの名前でメソッドを定義する
  created () {
    this.fetchGoals()
  }

  // dataはクラスのメンバーとして定義する
  goals: Goal[] = []

  // methodsはクラスのメソッドとして定義する
  fetchGoals () {
    this.$axios.$get<Goal[]>('/api/goals').then((res) => {
      this.goals = res
    })
  }
}
</script>

<style scoped>
.card-wrap {
  background: #ECECEC;
  padding: 20px;
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
}

.card {
  margin: 10px;
  min-width: 250px;
  max-width: 300px;
}
</style>
