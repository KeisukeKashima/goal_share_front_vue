<template>
  <div>
    <page-title title="ユーザ詳細"/>
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

          <!--本人のみ目標編集画面への遷移を表示-->
          <div v-if="loginUserId === userId">
            <NuxtLink :to="{ name: 'updategoal-id', params: { id: goal.id } }">
              <a-icon type="rise"/>
              目標を更新する
            </NuxtLink>
          </div>
        </a-card>
      </div>
    </a-card>
  </div>
</template>

<script>
import PageTitle from '~/components/atoms/PageTitle'

export default {
  components: { PageTitle },

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
    },
    loginUserId () {
      return this.$store.getters['user/getId']
    }
  },

  created () {
    this.fetchUser()
  },

  methods: {
    fetchUser () {
      this.$axios.$get(`/api/users/goals/${this.userId}`).then((res) => {
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
