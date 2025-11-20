<script setup>
// Mock order book data
const asks = [
  { price: '64,240.50', amount: '0.124' },
  { price: '64,239.00', amount: '0.055' },
  { price: '64,238.50', amount: '1.200' },
  { price: '64,235.00', amount: '0.500' },
  { price: '64,232.10', amount: '0.010' },
]

const bids = [
  { price: '64,230.50', amount: '0.850' },
  { price: '64,229.00', amount: '0.120' },
  { price: '64,225.50', amount: '2.500' },
  { price: '64,220.00', amount: '0.300' },
  { price: '64,218.10', amount: '0.050' },
]
</script>

<template>
  <div class="order-book">
    <div class="header">
      <span>价格 (USDT)</span>
      <span>数量 (BTC)</span>
    </div>
    
    <div class="asks">
      <div v-for="(ask, i) in asks" :key="i" class="row ask-row">
        <span class="price-text down">{{ ask.price }}</span>
        <span class="amount-text">{{ ask.amount }}</span>
        <div class="bg-bar" :style="{ width: (Math.random() * 100) + '%' }"></div>
      </div>
    </div>

    <div class="current-price">
      <span class="price up">64,230.50</span>
      <span class="fiat">≈ $64,230.50</span>
    </div>

    <div class="bids">
      <div v-for="(bid, i) in bids" :key="i" class="row bid-row">
        <span class="price-text up">{{ bid.price }}</span>
        <span class="amount-text">{{ bid.amount }}</span>
        <div class="bg-bar" :style="{ width: (Math.random() * 100) + '%' }"></div>
      </div>
    </div>
  </div>
</template>

<style scoped>
.order-book {
  flex: 1;
  font-size: 12px;
}

.header {
  display: flex;
  justify-content: space-between;
  color: var(--color-text-secondary);
  margin-bottom: 8px;
}

.row {
  display: flex;
  justify-content: space-between;
  margin-bottom: 4px;
  position: relative;
  height: 20px;
  align-items: center;
}

.bg-bar {
  position: absolute;
  right: 0;
  top: 0;
  bottom: 0;
  opacity: 0.15;
  z-index: 0;
}

.ask-row .bg-bar { background-color: var(--color-danger); }
.bid-row .bg-bar { background-color: var(--color-success); }

.price-text, .amount-text {
  z-index: 1;
}

.price-text.down { color: var(--color-danger); }
.price-text.up { color: var(--color-success); }
.amount-text { color: var(--color-text-primary); }

.current-price {
  margin: 12px 0;
  text-align: center;
  display: flex;
  flex-direction: column;
  align-items: center;
}

.current-price .price {
  font-size: 20px;
  font-weight: 700;
  color: var(--color-success); /* Or dynamic */
}

.current-price .fiat {
  font-size: 12px;
  color: var(--color-text-secondary);
}
</style>
