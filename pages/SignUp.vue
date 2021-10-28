<template>
  <div class="top">
    <a-form-model>

      <!--メールアドレス-->
      <a-input
        v-model="signUpRequestBody.mail"
        v-decorator="['userName', { rules: [{ required: true, message: 'Please input your username!' }] }]"
        placeholder="メールアドレス"
      >
        <a-icon slot="prefix" type="user" style="color:rgba(0,0,0,.25)" />
      </a-input>

      <!--パスワード-->
      <a-input-password
        v-model="signUpRequestBody.password"
        v-decorator="['password', { rules: [{ required: true, message: 'Please input your Password!' }] }]"
        type="password"
        placeholder="パスワード"
      >
        <a-icon slot="prefix" type="lock" style="color:rgba(0,0,0,.25)" />
      </a-input-password>

      <!--表示名-->
      <a-input
        v-model="signUpRequestBody.display_name"
        placeholder="表示名"
      />

      <!--年齢-->
      <a-input
        v-model.number="signUpRequestBody.age"
        type="number"
        placeholder="年齢"
      />

      <!--性別-->
      <a-radio-group v-model="signUpRequestBody.sex">
        <a-radio :value="true">男性</a-radio>
        <a-radio :value="false">女性</a-radio>
      </a-radio-group>

      <a-button type="primary" @click="signUp">
        登録
      </a-button>

    </a-form-model>

  </div>
</template>

<script>
export default {
  name: 'SignUp',

  data () {
    return {
      signUpRequestBody: {
        mail: '',
        password: '',
        display_name: '',
        age: '',
        sex: ''
      }
    }
  },

  methods: {
    async signUp () {
      // バリデーション
      if (this.signUpRequestBody.mail === '' ||
        this.signUpRequestBody.password === '' ||
        this.signUpRequestBody.display_name === '' ||
        this.signUpRequestBody.age === '' ||
        this.signUpRequestBody.sex === ''
      ) {
        alert('未入力の項目があります')
        return
      }
      // api登録
      await this.$axios.$post('/api/sign/up', this.signUpRequestBody).then(() => {
        console.log(this.signUpRequestBody)
      })
    }
  }
}
</script>

<style scoped>
.top {
  background-color: #F4F4F4;
  margin-left: auto;
  margin-right: auto;
  max-width: 700px;
  /*だいたいのスマホの横幅*/
  min-width: 375px;
}
</style>
