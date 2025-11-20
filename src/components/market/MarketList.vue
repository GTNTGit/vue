<script setup>
import { ref } from 'vue'
import { Star } from 'lucide-vue-next'

const activeTab = ref('spot')

const markets = [
  { symbol: 'BTC/USDT', price: '64,230.50', change: '+2.45%', vol: '2.4B', isUp: true, fav: true },
  { symbol: 'ETH/USDT', price: '3,450.10', change: '-1.20%', vol: '1.1B', isUp: false, fav: true },
  { symbol: 'SOL/USDT', price: '145.80', change: '+5.60%', vol: '800M', isUp: true, fav: false },
  { symbol: 'BNB/USDT', price: '590.20', change: '+0.80%', vol: '400M', isUp: true, fav: false },
  { symbol: 'XRP/USDT', price: '0.62', change: '-0.50%', vol: '200M', isUp: false, fav: false },
  { symbol: 'DOGE/USDT', price: '0.16', change: '+8.50%', vol: '350M', isUp: true, fav: true },
  { symbol: 'ADA/USDT', price: '0.45', change: '-2.10%', vol: '150M', isUp: false, fav: false },
]
</script>

<template>
  <div class="market-page">
    <div class="market-header">
      <h2>Markets</h2>
      <div class="search-icon">
        <!-- Search icon placeholder -->
      </div>
    </div>

    <div class="tabs">
      <button class="tab" :class="{ active: activeTab === 'fav' }" @click="activeTab = 'fav'">Favorites</button>
      <button class="tab" :class="{ active: activeTab === 'spot' }" @click="activeTab = 'spot'">Spot</button>
      <button class="tab" :class="{ active: activeTab === 'futures' }" @click="activeTab = 'futures'">Futures</button>
    </div>

    <div class="list-header">
      <span>Name / Vol</span>
      <span>Last Price</span>
      <span>24h Chg%</span>
    </div>

    <div class="market-list">
      <div v-for="market in markets" :key="market.symbol" class="market-item">
        <div class="name-col">
          <div class="symbol-row">
            <span class="symbol">{{ market.symbol.split('/')[0] }}</span>
            <span class="pair">/{{ market.symbol.split('/')[1] }}</span>
          </div>
          <span class="vol">Vol {{ market.vol }}</span>
        </div>
        
        <div class="price-col">
          <span class="price">{{ market.price }}</span>
          <span class="fiat">≈ ${{ market.price }}</span>
        </div>

        <div class="change-col">
          <div class="change-box" :class="market.isUp ? 'up' : 'down'">
            {{ market.change }}
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped>
.market-page {
  padding: var(--spacing-md);
}

.market-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: var(--spacing-md);
}

.tabs {
  display: flex;
  gap: var(--spacing-lg);
  margin-bottom: var(--spacing-md);
}

.tab {
  background: var(--color-bg-input);
  color: var(--color-text-secondary);
  padding: 6px 16px;
  border-radius: var(--radius-full);
  font-size: 13px;
  font-weight: 600;
}

.tab.active {
  background: var(--color-bg-card); /* Or generic active state */
  color: var(--color-text-primary);
  border: 1px solid var(--color-border);
}

.list-header {
  display: flex;
  justify-content: space-between;
  color: var(--color-text-secondary);
  font-size: 12px;
  margin-bottom: var(--spacing-sm);
  padding: 0 var(--spacing-xs);
}

.market-item {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: var(--spacing-md) 0;
  border-bottom: 1px solid var(--color-bg-input);
}

.name-col {
  display: flex;
  flex-direction: column;
  width: 35%;
}

.symbol {
  font-weight: 700;
  font-size: 16px;
  color: var(--color-text-primary);
}

.pair {
  font-size: 12px;
  color: var(--color-text-secondary);
}

.vol {
  font-size: 11px;
  color: var(--color-text-secondary);
  margin-top: 4px;
}

.price-col {
  display: flex;
  flex-direction: column;
  align-items: flex-end;
  width: 30%;
}

.price {
  font-weight: 600;
  font-size: 16px;
  color: var(--color-text-primary);
}

.fiat {
  font-size: 11px;
  color: var(--color-text-secondary);
  margin-top: 4px;
}

.change-col {
  width: 25%;
  display: flex;
  justify-content: flex-end;
}

.change-box {
  padding: 8px 0;
  width: 70px;
  border-radius: 4px;
  color: white;
  font-weight: 600;
  text-align: center;
  font-size: 13px;
}

.change-box.up {
  background-color: var(--color-success);
}

.change-box.down {
  background-color: var(--color-danger);
}
</style>
