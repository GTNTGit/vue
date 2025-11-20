<script setup>
import AssetCard from '../components/assets/AssetCard.vue'
import AssetList from '../components/assets/AssetList.vue'
import { Download, Upload, RefreshCw } from 'lucide-vue-next'
</script>

<template>
  <div class="page-container assets-view">
    <AssetCard 
      total-balance-btc="1.24560000"
      total-balance-usd="80,240.50"
      pnl-amount="1,240.50"
      pnl-percentage="1.5"
      :pnl-positive="true"
    />

    <div class="action-buttons">
      <button class="action-btn">
        <div class="icon-box">
          <Download :size="24" />
        </div>
        <span>充值</span>
      </button>
      <button class="action-btn">
        <div class="icon-box">
          <Upload :size="24" />
        </div>
        <span>提现</span>
      </button>
      <button class="action-btn">
        <div class="icon-box">
          <RefreshCw :size="24" />
        </div>
        <span>划转</span>
      </button>
    </div>

    <AssetList />
  </div>
</template>

<style scoped>
.assets-view {
  padding: var(--spacing-md);
  padding-bottom: 80px;
}

.action-buttons {
  display: flex;
  justify-content: space-between;
  margin-bottom: var(--spacing-xl);
}

.action-btn {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 8px;
  background: none;
  color: var(--color-text-secondary);
  font-size: 12px;
}

.icon-box {
  width: 48px;
  height: 48px;
  border-radius: 50%;
  background: var(--color-bg-input);
  display: flex;
  align-items: center;
  justify-content: center;
  color: var(--color-text-primary);
}
</style>

