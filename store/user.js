export const state = () => ({
  isSignedIn: false,
  id: '',
  displayName: ''
})

// this.$store.getters['user/isSignedIn']  で取得
export const getters = {
  getIsSignedIn (state) {
    return state.isSignedIn
  },
  getId (state) {
    return state.id
  },
  getDisplayName (state) {
    return state.displayName
  },
}

// this.$store.commit('user/setIsSignedIn', true)  で実行
export const mutations = {
  setIsSignedIn(state, payload) {
    state.isSignedIn = payload
  },
  setId(state, payload) {
    state.id = payload
  },
  setDisplayName(state, payload) {
    state.displayName = payload
  },
}

// this.$store.dispatch('user/signUp', signUpRequestBody)
// .then(() => {正常ログイン後処理}).catch((err) => {ログインエラー時処理})
export const actions = {
  async signUp({ commit }, signUpRequestBody) {
    await this.$axios.$post('/api/sign/up', signUpRequestBody).then((res) => {
      // 登録OKだったらユーザ情報をstateに保存する
      commit('setIsSignedIn', true)
      commit('setId', res.id)
      commit('setDisplayName', res.display_name)
    })
  },
  async signOut({ commit }) {
    await this.$axios.$post('/api/sign/out').then(() => {
      // サインアウトOKだったらユーザ情報をstateから破棄する
      commit('setIsSignedIn', false)
      commit('setId', '')
      commit('setDisplayName', '')
    })
  }
}
