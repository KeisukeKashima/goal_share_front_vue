<template>
  <div>
    <user-form @submit="signUp"/>
  </div>
</template>

<script>
import UserForm from '@/components/organisms/UserForm'

export default {
  name: 'SignUp',
  components: { UserForm },

  methods: {
    signUp (user) {
      // 新規登録処理(storeのactionsでapiを叩き、stateにユーザ情報保存している)
      this.$store.dispatch('user/signUp', user).then(() => {
        // storeの表示名を利用してみたいだけに入れた処理
        const userDisplayName = this.$store.getters['user/getDisplayName']
        alert(`会員登録完了！${userDisplayName}様、引き続き本サービスをお楽しみください！`)

        // 登録完了後、目標一覧に画面遷移
        this.$router.push('/goals')
      }).catch((err) => {
        alert('新規登録処理に失敗しました。。')
        console.log(err.message)
      })
    }
  }
}
</script>

<style scoped>

</style>
