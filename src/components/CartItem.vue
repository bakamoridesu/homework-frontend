<script>
export default {
    props: {
        item: Object,
        user: String
    },
    methods: {
        async removeItem() {
            await fetch(
                `http://localhost:8082/user/${this.user}/cart/${this.item.sku_id}`, {
                method: 'DELETE',
                headers: {
                    'Content-Type': 'application/json',
                        'Access-Control-Allow-Origin': '*',
                }
            })
                .then(() => {this.$emit('fetch-cart')})
        },
    },
    emits: ['fetch-cart']
}
</script>

<template>
    <div class="cart-item">
        <button class="remove" @click="removeItem">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" class="ag18-b1">
                <path fill="currentColor"
                    d="m4.888 3.035.275-.826A2.5 2.5 0 0 1 7.535.5h.93a2.5 2.5 0 0 1 2.372 1.71l.275.825c2.267.09 3.555.406 3.555 1.527 0 .938-.417.938-1.25.938H2.583c-.833 0-1.25 0-1.25-.937 0-1.122 1.288-1.438 3.555-1.528m1.856-.299-.088.266Q7.295 3 8 3t1.345.002l-.089-.266a.83.83 0 0 0-.79-.57h-.931a.83.83 0 0 0-.79.57M2.167 7.167c0-.6.416-.834.833-.834h10c.417 0 .833.235.833.834 0 6.666-.416 8.333-5.833 8.333s-5.833-1.667-5.833-8.333m4.166 1.666a.833.833 0 0 0-.833.834v1.666a.833.833 0 1 0 1.667 0V9.667a.833.833 0 0 0-.834-.834m4.167.834a.833.833 0 1 0-1.667 0v1.666a.833.833 0 1 0 1.667 0z">
                </path>
            </svg>
        </button>
        <div>{{ item.count }}</div>
        <div class="price-inline cart-price">{{ item.price }} ₽</div>
        <div>{{ item.name.substring(0, 50) }}</div>
    </div>
</template>

<style>
.cart-item {
margin: 10px 0;
    display: flex;
    align-items: center;
    gap: 10px;
}

.remove{
    color: rgb(248, 17, 85);
    border-radius: 8px;
    cursor: pointer;
    font-family: GTEestiPro, arial, sans-serif;
    padding: 8px;
    border: none;
    display: inline-flex;
    align-items: center;
    justify-content: center;
    gap: 10px;
}

.cart-price {
padding-left: 10px;
    width: 80px;
}
</style>
