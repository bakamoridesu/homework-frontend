<script>

import ItemCard from './ItemCard.vue'

let products = [
    {
        sku_id: 1625903,
        price: 1423,
        name: 'Сказки звездного неба',
        available: true,
    },
    {
        sku_id: 2618151,
        price: 452,
        name: 'Пора снимать бикини',
        available: true,
    },
    {
        sku_id: 2956315,
        price: 3130,
        name: 'Eloy. Time To Turn',
        available: true,
    },
    {
        sku_id: 4487693,
        price: 4120,
        name: 'Монологи на заданную тему',
        available: true,
    },
    {
        sku_id: 4288068,
        price: 3398,
        name: 'Заклятье',
        available: true,
    },
    {
        sku_id: 3618852,
        price: 4645,
        name: 'Защитный код. Как выжить в нашем городе | Майоров Олег Вячеславович, Степанов Максим Викторович',
        available: true,
    },
    {
        sku_id: 4465995,
        price: 42,
        name: 'Кодекс Российской Федерации об административных правонарушениях',
        available: true,
    },
    {
        sku_id: 3596599,
        price: 3386,
        name: 'Невербальная коммуникация. Психология и право',
        available: true,
    },
    {
        sku_id: 2958025,
        price: 1028,
        name: 'Roxy Music. Stranded. Remastered Edition',
        available: true,
    },
]

let prods = products.slice(0, 5)
prods.push({ sku_id: 123, price: 0, name: 'unknown', available: false })

export default {
    components: {
        ItemCard
    },
    props: {
        user: String
    },
    name: "ItemList",
    data() {
        return {
            prods: prods,
        };
    },
    methods: {
        fetchCart() {
            this.$emit('fetch-cart')
        }
    },
    emits: ['fetch-cart'],
}
</script>

<template>
    <h1>Рекомендуем для вас</h1>
    <div>
        <div class="items">
            <div v-for="product in prods" :key="product.sku_id">
                <ItemCard :product="product" @fetch-cart="fetchCart" :user="user" />
            </div>
        </div>
    </div>
</template>

<style>
.items {
    width: 600px;
    display: grid;
    grid-gap: 2px;
    grid-template-columns: repeat(3, 1fr);
}
</style>
