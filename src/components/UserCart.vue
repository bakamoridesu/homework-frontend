<script>
import CartItem from './CartItem.vue'
export default {
    props: {
        cart: Array,
        totalPrice: Number,
        user: String
    },

    components: {
        CartItem
    },
    methods: {
        async clearCart() {
            await fetch(
                `http://localhost:8082/user/${this.user}/cart`, {
                method: 'DELETE',
                headers: {
                    'Content-Type': 'application/json',
                    'Access-Control-Allow-Origin': '*',
                }
            })
                .then(() => { this.$emit('clear-cart') })
        }
    },
    emits: ['fetch-cart', 'clear-cart'],
}
</script>

<template>
    <div v-if="cart.length">
        <div class="cart">
            <h2>Ваша корзина</h2>
            <div class="total">Товаров: <span class="length">{{ cart.length }}</span> на сумму <span
                    class="price-inline">{{
        totalPrice
    }} ₽</span></div>
            <div class="clear" @click="clearCart">
                Очистить корзину
            </div>
        </div>
        <div class="cart-items">
            <div v-for="item in cart" :key="item.sku_id">
                <CartItem :item="item" @fetch-cart="$emit('fetch-cart')" :user="user" />
            </div>
        </div>
    </div>
</template>

<style>
.cart-items {
    margin-top: 10px;
padding-left: 10px;
}

.clear {
    color: rgb(248, 17, 85);
    font-weight: bold;
    cursor: pointer;
}

.cart {
    margin-top: 30px;
    display: flex;
    align-items: baseline;
    justify-content: space-between;
    gap: 30px;
    width: 600px;
    padding: 10px;
}

.total {
    font-size: 18px;
    color: rgba(0, 26, 52, 0.6);
}

h2 {
    padding: 0;
    margin: 0;
}

.price-inline {
    color: #10C44C;
    font-weight: bold;
}

.length {
    font-weight: bold;
    color: #000;
}
</style>
