<template>
  <div>
    <h2 style="text-align: center">マイページ</h2>

    <a-form-model>

      <!--メールアドレス-->
      <a-input
        v-model="user.mail"
        v-decorator="['userName', { rules: [{ required: true, message: 'Please input your username!' }] }]"
        placeholder="メールアドレス"
      >
        <a-icon slot="prefix" type="user" style="color:rgba(0,0,0,.25)" />
      </a-input>

      <!--パスワード-->
      <a-input-password
        v-model="user.password"
        v-decorator="['password', { rules: [{ required: true, message: 'Please input your Password!' }] }]"
        type="password"
        placeholder="パスワード"
      >
        <a-icon slot="prefix" type="lock" style="color:rgba(0,0,0,.25)" />
      </a-input-password>

      <!--表示名-->
      <a-input
        v-model="user.display_name"
        placeholder="表示名"
      />

      <!--年齢-->
      <a-input
        v-model.number="user.age"
        type="number"
        placeholder="年齢"
      />

      <!--性別-->
      <a-radio-group v-model="user.sex">
        <a-radio :value="true">男性</a-radio>
        <a-radio :value="false">女性</a-radio>
      </a-radio-group>

      <a-button type="primary" @click="updateUser">
        プロフィール情報更新
      </a-button>

    </a-form-model>

  </div>
</template>

<script>
export default {
  data () {
    return {
      user: {
        mail: '',
        password: '',
        display_name: '',
        age: '',
        sex: ''
      }
    }
  },

  computed: {
    userId () {
      return this.$store.getters['user/getId']
    }
  },

  created () {
    this.fetchUser()
  },

  methods: {
    async fetchUser () {
      await this.$axios.$get(`/api/users/${this.userId}`).then((res) => {
        this.user = res
      })
    },
    async updateUser () {
      await this.$axios.$put(`/api/users/${this.userId}`, this.user).then(() => {
        alert(`マイページを更新しました！`)
      })
    }
  }


}
</script>

<style scoped>

</style>
