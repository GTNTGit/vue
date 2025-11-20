<script setup>
import { ref } from 'vue'

const activeTab = ref('hot')
const tabs = [
  { id: 'hot', label: '热门' },
  { id: 'gainers', label: '涨幅榜' },
  { id: 'new', label: '新币' }
]

const markets = [
  { symbol: 'BTC/USDT', price: '34,684.20', change: '+2.45%', isUp: true },
  { symbol: 'ETH/USDT', price: '1,845.10', change: '-0.85%', isUp: false },
  { symbol: 'SOL/USDT', price: '24.50', change: '+5.20%', isUp: true },
  { symbol: 'PEPE/USDT', price: '0.0000012', change: '+15.40%', isUp: true },
  { symbol: 'XRP/USDT', price: '0.5420', change: '-1.20%', isUp: false },
]
</script>

<template>
  <div class="market-ticker">
    <div class="tabs">
      <button 
        v-for="tab in tabs" 
        :key="tab.id"
        class="tab-btn"
        :class="{ active: activeTab === tab.id }"
        @click="activeTab = tab.id"
      >
        {{ tab.label }}
      </button>
    </div>

    <div class="market-list">
      <div class="list-header">
        <span>名称</span>
        <span>最新价</span>
        <span>24h涨跌</span>
      </div>
      
      <div v-for="market in markets" :key="market.symbol" class="market-item">
        <div class="name-col">
          <span class="symbol">{{ market.symbol.split('/')[0] }}</span>
          <span class="pair">/{{ market.symbol.split('/')[1] }}</span>
        </div>
        
        <div class="price-col">
          {{ market.price }}
        </div>

        <div class="change-col">
          <div class="change-btn" :class="{ up: market.isUp, down: !market.isUp }">
            {{ market.change }}
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped>
.market-ticker {
  padding: 0 var(--spacing-md);
}

.tabs {
  display: flex;
  gap: 24px;
  margin-bottom: var(--spacing-md);
  border-bottom: 1px solid var(--color-border);
}

.tab-btn {
  background: none;
  border: none;
  padding: 12px 0;
  color: var(--color-text-secondary);
  font-size: 15px;
  font-weight: 500;
  position: relative;
  transition: color 0.2s ease;
}

.tab-btn.active {
  color: var(--color-text-primary);
  font-weight: 600;
}

.tab-btn.active::after {
  content: '';
  position: absolute;
  bottom: -1px;
  left: 0;
  width: 100%;
  height: 3px;
  background: var(--color-primary);
  border-radius: 3px 3px 0 0;
}

.list-header {
  display: flex;
  justify-content: space-between;
  font-size: 12px;
  color: var(--color-text-tertiary);
  margin-bottom: 16px;
  padding: 0 4px;
}

.list-header span:nth-child(1) { width: 40%; }
.list-header span:nth-child(2) { width: 30%; text-align: right; }
.list-header span:nth-child(3) { width: 30%; text-align: right; }

.market-item {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 16px 4px;
  border-bottom: 1px solid rgba(255, 255, 255, 0.02);
}

.market-item:last-child {
  border-bottom: none;
}

.name-col {
  width: 40%;
}

.symbol {
  font-weight: 600;
  font-size: 16px;
  color: var(--color-text-primary);
}

.pair {
  font-size: 12px;
  color: var(--color-text-tertiary);
  margin-left: 4px;
}

.price-col {
  width: 30%;
  text-align: right;
  font-weight: 600;
  font-size: 16px;
  color: var(--color-text-primary);
  font-variant-numeric: tabular-nums;
}

.change-col {
  width: 30%;
  display: flex;
  justify-content: flex-end;
}

.change-btn {
  padding: 6px 0;
  width: 72px;
  border-radius: 4px;
  color: white;
  font-size: 13px;
  font-weight: 600;
  text-align: center;
  font-variant-numeric: tabular-nums;
}

.change-btn.up {
  background: var(--color-success);
}

.change-btn.down {
  background: var(--color-danger);
}
</style>
