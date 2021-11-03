<template>
  <div>
    <user-form
      :user-id="userId"
      @submit="updateUser"
    />
  </div>
</template>

<script>
import UserForm from '@/components/organisms/UserForm'

export default {
  components: { UserForm },

  computed: {
    userId () {
      return this.$store.getters['user/getId']
    }
  },

  methods: {
    updateUser (user) {
      this.$axios.$put(`/api/users/${this.userId}`, user).then(() => {
        alert(`マイページを更新しました！`)
      })
    }
  }

}
</script>

<style scoped>

</style>
