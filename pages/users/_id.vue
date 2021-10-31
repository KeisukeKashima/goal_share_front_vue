<template>
  <div>
    <a-card
      :title="`${user.display_name} さん`"
      :bordered="true"
      class="card"
    >
      <p>■プロフィール写真</p>
      <a-avatar size="large" icon="user"/>
      <div class="mgt20"></div>
      <p>■年齢</p>{{ user.age }}
      <div class="mgt20"></div>
      <p>■性別</p>{{ user.sex ? '男性' : '女性' }}

      <div class="mgt20"></div>

      <div v-if="user.Goal.length === 0">
        このユーザの設定した目標はありません
      </div>
      <div
        v-for="(goal, key) in user.Goal"
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
        </a-card>
      </div>
    </a-card>
  </div>
</template>

<script>
export default {
  data () {
    return {
      user: {
        id: this.userId,
        mail: '',
        password: '',
        display_name: '',
        age: '',
        sex: false,
        Goal: []
      }
    }
  },

  computed: {
    userId () {
      return Number(this.$route.params.id)
    }
  },

  created () {
    this.fetchUser()
  },

  methods: {
    async fetchUser () {
      await this.$axios.$get(`/api/users/goals/${this.userId}`).then((res) => {
        this.user = res
      })
    }
  }

}
</script>

<style scoped>
.card {
  margin: 10px;
  min-width: 250px;
  width: auto;
}

</style>
