<script setup>
import { Search } from 'lucide-vue-next'
import { ref, computed } from 'vue'

const searchQuery = ref('')

const assets = [
  { symbol: 'USDT', name: 'Tether', amount: '1,240.50', value: '1,240.50', color: '#26A17B' },
  { symbol: 'BTC', name: 'Bitcoin', amount: '0.5400', value: '34,684.20', color: '#F7931A' },
  { symbol: 'ETH', name: 'Ethereum', amount: '12.5000', value: '43,125.00', color: '#627EEA' },
  { symbol: 'SOL', name: 'Solana', amount: '145.00', value: '21,141.00', color: '#00FFA3' },
  { symbol: 'XRP', name: 'Ripple', amount: '2,500.00', value: '1,500.00', color: '#23292F' },
  { symbol: 'ADA', name: 'Cardano', amount: '5,000.00', value: '2,500.00', color: '#0033AD' },
]

const filteredAssets = computed(() => {
  return assets.filter(asset => 
    asset.symbol.toLowerCase().includes(searchQuery.value.toLowerCase()) ||
    asset.name.toLowerCase().includes(searchQuery.value.toLowerCase())
  )
})
</script>

<template>
  <div class="asset-list-container">
    <div class="list-header">
      <h3>资产列表</h3>
      <div class="search-box">
        <Search :size="16" class="search-icon" />
        <input 
          type="text" 
          v-model="searchQuery" 
          placeholder="搜索币种"
        >
      </div>
    </div>

    <div class="asset-list">
      <div v-for="asset in filteredAssets" :key="asset.symbol" class="asset-item">
        <div class="left">
          <div class="coin-icon" :style="{ backgroundColor: asset.color }">
            {{ asset.symbol[0] }}
          </div>
          <div class="coin-info">
            <span class="symbol">{{ asset.symbol }}</span>
            <span class="name">{{ asset.name }}</span>
          </div>
        </div>
        <div class="right">
          <span class="amount">{{ asset.amount }}</span>
          <span class="value">≈ ${{ asset.value }}</span>
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped>
.asset-list-container {
  flex: 1;
  background: var(--color-bg-card); /* Assuming card bg variable exists or use fallback */
  border-radius: var(--radius-lg);
}

.list-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: var(--spacing-md);
}

.list-header h3 {
  font-size: 18px;
  font-weight: 600;
}

.search-box {
  display: flex;
  align-items: center;
  background: var(--color-bg-input);
  padding: 6px 12px;
  border-radius: 16px;
  width: 140px;
}

.search-icon {
  color: var(--color-text-secondary);
  margin-right: 6px;
}

.search-box input {
  background: none;
  border: none;
  color: var(--color-text-primary);
  font-size: 12px;
  width: 100%;
  outline: none;
}

.search-box input::placeholder {
  color: var(--color-text-tertiary);
}

.asset-item {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 16px 0;
  border-bottom: 1px solid rgba(255, 255, 255, 0.05);
}

.left {
  display: flex;
  align-items: center;
  gap: 12px;
}

.coin-icon {
  width: 36px;
  height: 36px;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  font-weight: 700;
  font-size: 14px;
  color: white;
}

.coin-info {
  display: flex;
  flex-direction: column;
}

.right {
  display: flex;
  flex-direction: column;
  align-items: flex-end;
}

.symbol {
  font-weight: 600;
  font-size: 16px;
  color: var(--color-text-primary);
}

.name {
  font-size: 12px;
  color: var(--color-text-secondary);
  margin-top: 2px;
}

.amount {
  font-weight: 600;
  font-size: 16px;
  color: var(--color-text-primary);
}

.value {
  font-size: 12px;
  color: var(--color-text-secondary);
  margin-top: 2px;
}
</style>
