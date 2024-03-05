<script>

export default {
    props: {
        user: String
    },
    data() {
        return {
            users: ['', '123'],
            newUser: '',
        };
    },
    emits: ['change-user'],
    methods: {
        changeUser(event) {
            this.$emit('change-user', event.target.value)
        },
        addUser() {
            this.users.push(this.newUser)
            this.newUser = ''
        }
    },
}
</script>

<template>
    <div class="user-info">
        <div>
            <span>user: </span>
            <select class="user-select" :value="user" @change="changeUser">
                <option v-for="user in users" :key="user" :value="user">{{ user }}</option>
            </select>
        </div>
        <div>
            <span>new user:</span>
            <input type="text" v-model="newUser" />
            <button @click="addUser">Add user</button>
        </div>
    </div>

</template>

<style>
.user-info {
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.user-select {
    width: 100px;
}
</style>
