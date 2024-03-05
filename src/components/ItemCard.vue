<script>
export default {
    name: "ItemCard",
    props: {
        product: Object,
        user: String
    },
    data() {
        return {
            count: 1
        };
    },
    methods: {
        increment() {
            this.count++;
        },
        decrement() {
            if (this.count > 1) {
                this.count--;
            }
        },
        async postData() {
            await fetch(
                `http://localhost:8082/user/${this.user}/cart/${this.product.sku_id}`, {
                method: 'POST',
                mode: 'no-cors',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({
                    "count": this.count
                })
            })
                .then(() => { this.$emit('fetch-cart'); console.log('emitted') })
        },
    },
    emits: ['fetch-cart'],
}
</script>

<template>
    <div class="wrapper">
        <div class="card">
            <div class="id" v-if="product.available">id: {{ product.sku_id }}</div>
            <div class="id absent" v-else>нет в наличии</div>
            <div class="name">{{ product.name }}</div>
            <div class="price">{{ product.price }} ₽</div>
        </div>
        <div class="controls">
            <button class="add" @click="postData">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" class="b238-b0">
                    <path fill="currentColor"
                        d="M6.274 2.476a.833.833 0 0 0-1.548-.619L3.27 5.5h-.842c-.897 0-1.345 0-1.594.288S.648 6.52.777 7.407l.226 1.553c.396 2.721.594 4.082 1.533 4.894.94.813 2.314.813 5.064.813h.8c2.75 0 4.125 0 5.064-.813s1.137-2.173 1.533-4.894l.226-1.553c.129-.887.193-1.33-.056-1.619-.25-.288-.697-.288-1.594-.288h-.842l-1.457-3.643a.833.833 0 1 0-1.548.62l1.21 3.023H5.064zm.893 7.19v1.667a.833.833 0 1 1-1.667 0V9.667a.833.833 0 1 1 1.667 0m2.5-.833c.46 0 .833.373.833.834v1.666a.833.833 0 1 1-1.667 0V9.667c0-.46.373-.834.834-.834">
                    </path>
                </svg>
                В корзину
            </button>
            <button class="inc" @click="decrement">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" class="ag18-b1">
                    <path fill="currentColor" d="M5 11a1 1 0 1 0 0 2h14a1 1 0 1 0 0-2z"></path>
                </svg>
            </button>
            <span>{{ count }}</span>
            <button class="inc" @click="increment">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" class="ag18-b1">
                    <path fill="currentColor"
                        d="M12 4a1 1 0 0 0-1 1v6H5a1 1 0 1 0 0 2h6v6a1 1 0 1 0 2 0v-6h6a1 1 0 1 0 0-2h-6V5a1 1 0 0 0-1-1">
                    </path>
                </svg>
                <div></div>
            </button>
        </div>
    </div>
</template>


<style>
.controls {
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 10px;
}

.wrapper {
    padding: 10px;
}

.inc {
    background-color: rgba(0, 150, 255, .078);
    border: none;
    border-radius: 8px;
    box-sizing: border-box;
    display: inline-flex;
    cursor: pointer;
    text-decoration: none;
    width: 32px;
    height: 32px;
    align-items: center;
    justify-content: center;
    padding: 0;
    color: #005bff;
}

.id {
    background-color: rgb(0, 91, 255);
    border-radius: 8px;
    padding: 2px 8px;
    position: absolute;
    top: 10px;
    right: 10px;
    font-size: 12px;
}

.absent {
    background-color: rgb(248, 17, 85);
}

.name {
    color: #070707;
    text-align: center;
}

.price {
    color: #10C44C;
    position: absolute;
    bottom: 5px;
    right: 10px;
}

.add {
    background-color: #005bff;
    color: #fff;
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

.card {
    position: relative;
    border: none;
    border-radius: 12px;
    padding: 5px;
    margin-bottom: 5px;
    width: 200px;
    height: 100px;
    display: flex;
    flex-direction: column;
    justify-content: center;
    gap: 5px;
    font-size: 16px;
    font-weight: bold;
    font-family: Arial, Helvetica, sans-serif;
    color: white;
    background-color: #e1e7f0;
}
</style>
