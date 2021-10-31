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
                <NuxtLink :to="{ name: 'users', params: { id: userId } }">
                  <a-icon type="user"/>
                  マイページ
                </NuxtLink>
              </a-menu-item>
              <a-menu-item key="2">
                <NuxtLink to="/signout">
                  <a-icon type="logout"/>
                  ログアウト
                </NuxtLink>
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

      <!--サービスロゴ-->
      <div>
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
    }
  }
}
</script>

<style scoped>
.header-wrap {
  display: flex;
  justify-content: space-between;
}
</style>
