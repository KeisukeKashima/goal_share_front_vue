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

<script>
import PageTitle from '~/components/atoms/PageTitle'

export default {
  name: 'Goals',
  components: { PageTitle },

  data () {
    return {
      goals: []
    }
  },

  created () {
    this.fetchGoals()
  },

  methods: {
    async fetchGoals () {
      await this.$axios.$get('/api/goals').then((res) => {
        this.goals = res
      })
    }
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
