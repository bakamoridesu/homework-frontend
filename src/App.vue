<script>
import ItemList from './components/ItemList.vue'
import UserCart from './components/UserCart.vue'
import UserInfo from './components/UserInfo.vue'

export default {
    components: {
        ItemList,
        UserCart,
        UserInfo
    },
    name: "App",
    data() {
        return {
            count: 0,
            cart: [],
            totalPrice: 0,
            user: '123',
        };
    },
    methods: {
        changeUser(user) {
            this.user = user
            this.fetchCart()
        },
        clearCart() {
            this.cart = []
            this.totalPrice = 0
            if (this.user !== "") {
                this.fetchCart()
            }
        },
        async fetchCart() {
            await fetch(
                `http://localhost:8082/user/${this.user}/cart`, {
                method: 'GET',
                headers: {
                    'Content-Type': 'application/json',
                    'Access-Control-Allow-Origin': '*',
                }
            })
                .then((res) => res.json())
                .then((json) => { this.cart = json.items; this.totalPrice = json.total_price; })
                .catch(() => { this.cart = []; this.totalPrice = 0; })
        },
    },
    created() {
        this.fetchCart()
    }
}
</script>

<template>
    <UserInfo @change-user="changeUser" :user="user" />
    <ItemList @fetch-cart="fetchCart" :user="user" />
    <UserCart :user="user" :cart="cart" :totalPrice="totalPrice" @fetch-cart="fetchCart" @clear-cart="clearCart" />
</template>


<style>
body {
    padding: 20px 50px;
}
</style>
