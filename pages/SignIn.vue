<template>
  <div>
    <page-title title="ログイン"/>
    <a-form-model>

      <!--メールアドレス-->
      <a-input
        v-model="signInRequestBody.mail"
        v-decorator="['userName', { rules: [{ required: true, message: 'Please input your username!' }] }]"
        placeholder="メールアドレス"
      >
        <a-icon slot="prefix" type="user" style="color:rgba(0,0,0,.25)" />
      </a-input>

      <!--パスワード-->
      <a-input-password
        v-model="signInRequestBody.password"
        v-decorator="['password', { rules: [{ required: true, message: 'Please input your Password!' }] }]"
        type="password"
        placeholder="パスワード"
      >
        <a-icon slot="prefix" type="lock" style="color:rgba(0,0,0,.25)" />
      </a-input-password>

      <!--ボタン-->
      <a-button type="primary" @click="signIn">
        ログイン
      </a-button>

    </a-form-model>

  </div>
</template>

<script>
import PageTitle from '~/components/atoms/PageTitle'

export default {
  name: 'SignIn',
  components: { PageTitle },

  data () {
    return {
      signInRequestBody: {
        mail: '',
        password: ''
      }
    }
  },
  methods: {
    async signIn () {
      // 簡易バリデーション
      if (this.signInRequestBody.mail === '' ||
        this.signInRequestBody.password === ''
      ) {
        alert('未入力の項目があります')
        return
      }
      // サインイン処理(storeのactionsでapiを叩き、stateにユーザ情報保存している)
      await this.$store.dispatch('user/signIn', this.signInRequestBody).then(() => {
        alert('ログインに成功しました！')
        // 登録完了後、目標一覧に画面遷移
        this.$router.push('/goals')
      }).catch((err) => {
        alert('ログイン処理に失敗しました。。')
        console.log(err.message)
      })
    }
  }
}
</script>

<style scoped>

</style>
