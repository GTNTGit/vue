<script setup>
import OrderBook from '../components/trade/OrderBook.vue'
import TradeForm from '../components/trade/TradeForm.vue'
import { Menu } from 'lucide-vue-next'
</script>

<template>
  <div class="page-container trade-view">
    <div class="trade-header">
      <div class="pair-select">
        <Menu :size="20" />
        <h2>BTC/USDT</h2>
        <span class="percent-change">+2.45%</span>
      </div>
      <div class="icons">
        <!-- Icons -->
      </div>
    </div>

    <div class="trade-content">
      <TradeForm />
      <OrderBook />
    </div>
  </div>
</template>

<style scoped>
.trade-view {
  padding: var(--spacing-md);
  padding-bottom: 80px;
}

.trade-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: var(--spacing-md);
}

.pair-select {
  display: flex;
  align-items: center;
  gap: 8px;
}

.pair-select h2 {
  font-size: 20px;
  margin: 0;
}

.percent-change {
  color: var(--color-success);
  font-size: 12px;
  font-weight: 600;
  background: rgba(0, 180, 42, 0.1);
  padding: 2px 4px;
  border-radius: 2px;
}

.trade-content {
  display: flex;
  gap: var(--spacing-md);
}
</style>

