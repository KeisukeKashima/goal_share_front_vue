<template>
  <div>
    <div class="header-wrap mgt10">

      <!--ヘッダーメニュー-->
      <div>
        <a-menu style="width: 200px">
          <a-sub-menu key="sub1">
          <span slot="title">
            <a-icon type="menu"/>
            <span>各種メニュー</span>
          </span>
            <!--ログイン中のヘッダーメニュー-->
            <template v-if="isSignedIn">
              <a-menu-item key="1">
                <NuxtLink to="/mypage">
                  <a-icon type="user"/>
                  マイページ
                </NuxtLink>
              </a-menu-item>
              <a-menu-item key="5">
                <NuxtLink to="/creategoal">
                  <a-icon type="plus-circle"/>
                  新規目標設定
                </NuxtLink>
              </a-menu-item>
              <a-menu-item key="6">
                <NuxtLink :to="{ name: 'users-id', params: { id: userId } }">
                  <a-icon type="tags"/>
                  設定済みの目標と更新
                </NuxtLink>
              </a-menu-item>
              <a-menu-item key="2" @click="signOut">
                <a-icon type="logout"/>
                ログアウト
              </a-menu-item>
            </template>
            <!--未ログイン中のヘッダーメニュー-->
            <template v-else>
              <a-menu-item key="1">
                <NuxtLink to="/signup">
                  <a-icon type="plus-circle"/>
                  新規会員登録
                </NuxtLink>
              </a-menu-item>
              <a-menu-item key="2">
                <NuxtLink to="/signin">
                  <a-icon type="login"/>
                  ログイン
                </NuxtLink>
              </a-menu-item>
            </template>
            <!--ログイン中かどうか関係ない共通のヘッダーメニュー-->
            <a-menu-item key="3">
              <NuxtLink to="/goals">
                <a-icon type="rise"/>
                目標一覧
              </NuxtLink>
            </a-menu-item>
            <a-menu-item key="4">
              <NuxtLink to="/users">
                <a-icon type="team"/>
                ユーザ一覧
              </NuxtLink>
            </a-menu-item>
          </a-sub-menu>
        </a-menu>
      </div>

      <div class="welcome">
        <p v-if="isSignedIn">ようこそ！<br>{{ userName }}さん<br>(会員ID: {{ userId }})</p>
        <p v-else>ログインすると全ての目標が閲覧できます！</p>
      </div>

      <!--サービスロゴ-->
      <div class="logo">
        <h2>目標共有サービス</h2>
        <p>みんなの目標が簡単に見れる！</p>
      </div>

    </div>
  </div>
</template>

<script>
export default {
  name: 'Header',
  computed: {
    isSignedIn () {
      return this.$store.getters['user/getIsSignedIn']
    },
    userId () {
      return this.$store.getters['user/getId']
    },
    userName () {
      return this.$store.getters['user/getDisplayName']
    }
  },
  methods: {
    signOut () {
      // キャンセルなら以降の処理を実行しない
      if (!confirm('本当にログアウトしますか？')) {
        return
      }

      this.$store.dispatch('user/signOut').then(() => {
        alert('ログアウトしました')
        // リロードさせないとstoreのログイン情報が画面に反映されなかったためリロードさせている
        window.location.reload()
        this.$router.push('/goals')
      }).catch((err) => {
        alert('ログアウトに失敗しました')
        console.log(err.message)
      })
    }
  }
}
</script>

<style scoped>
.header-wrap {
  display: flex;
  justify-content: space-between;
}
.welcome {
  width: auto;
  margin-left: 2px;
  margin-right: 2px;
}
.logo {
  min-width: 200px;
}
</style>
