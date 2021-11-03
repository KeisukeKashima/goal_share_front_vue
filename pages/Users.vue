<template>
  <div>
    <page-title title="ユーザ一覧"/>
    <div class="card-wrap">
      <div
        v-for="(user, key) in users"
        :key="key"
      >
        <a-card
          :title="`${user.display_name} さん`"
          :bordered="true"
          class="card"
        >
          <p>■年齢</p>{{ user.age }}
          <div class="mgt20"></div>
          <p>■性別</p>{{ user.sex ? '男性' : '女性' }}

          <div class="mgt20"></div>
          <NuxtLink :to="{ name: 'users-id', params: { id: user.id } }">
            <a-icon type="rise"/>
            このユーザの設定した目標を見る
          </NuxtLink>
        </a-card>
      </div>
    </div>
  </div>
</template>

<script>
import PageTitle from '~/components/atoms/PageTitle'

export default {
  name: 'Users',
  components: { PageTitle },

  data () {
    return {
      users: []
    }
  },

  created () {
    this.fetchUsers()
  },

  methods: {
    fetchUsers () {
      this.$axios.$get('/api/users').then((res) => {
        this.users = res
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
