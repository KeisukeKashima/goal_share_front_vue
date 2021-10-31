<template>
  <div>
    <div class="header-wrap mgt10">
      <div>
        <a-menu
          style="width: 200px"
          :default-selected-keys="['0']"
          :open-keys.sync="openKeys"
          mode="inline"
          @click="handleClick"
        >
          <a-sub-menu key="sub1" @titleClick="titleClick">
          <span slot="title">
            <a-icon type="menu"/>
            <span>各種メニュー</span>
          </span>
            <a-menu-item key="1">
              <NuxtLink to="/signup">
                新規会員登録
              </NuxtLink>
            </a-menu-item>
            <a-menu-item key="2">
              <NuxtLink to="/signin">
                ログイン
              </NuxtLink>
            </a-menu-item>
            <a-menu-item key="3">
              <NuxtLink to="/goals">
                目標一覧
              </NuxtLink>
            </a-menu-item>
            <a-menu-item key="4">
              <NuxtLink to="/users">
                ユーザ一覧
              </NuxtLink>
            </a-menu-item>
          </a-sub-menu>
        </a-menu>
      </div>
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
  data () {
    return {
      // デフォルトでメニューを開いておきたい場合は'sub1'にする
      openKeys: [''],
    }
  },
  watch: {
    openKeys (val) {
      // メニューの開閉状態変更時に処理したいことがあればここに追記する
      // console.log('openKeys', val)
    },
  },
  methods: {
    handleClick (e) {
      // メニューボタン押された場合に処理したいことがあればここに追記する
      // console.log('click', e)
    },
    titleClick (e) {
      // メニューの各ボタン押された場合に処理したいことがあればここに追記する
      // console.log('titleClick', e)
    },
  },
}
</script>

<style scoped>
.header-wrap {
  display: flex;
  justify-content: space-between;
}
</style>
