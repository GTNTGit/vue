<script setup>
import { Eye, EyeOff } from 'lucide-vue-next'
import { ref } from 'vue'

const props = defineProps({
  totalBalanceBtc: {
    type: String,
    default: '0.00000000'
  },
  totalBalanceUsd: {
    type: String,
    default: '0.00'
  },
  pnlAmount: {
    type: String,
    default: '0.00'
  },
  pnlPercentage: {
    type: String,
    default: '0.00'
  },
  pnlPositive: {
    type: Boolean,
    default: true
  }
})

const showBalance = ref(true)
</script>

<template>
  <div class="asset-card">
    <div class="header">
      <span>总资产 (BTC)</span>
      <button class="toggle-btn" @click="showBalance = !showBalance">
        <Eye v-if="showBalance" :size="16" />
        <EyeOff v-else :size="16" />
      </button>
    </div>

    <div class="balance-row">
      <h1 v-if="showBalance">{{ totalBalanceBtc }}</h1>
      <h1 v-else>******</h1>
    </div>

    <div class="fiat-row">
      <span v-if="showBalance">≈ ${{ totalBalanceUsd }}</span>
      <span v-else>≈ $******</span>
    </div>

    <div class="pnl-row">
      <span class="label">今日盈亏</span>
      <span 
        class="value" 
        :class="{ 'up': pnlPositive, 'down': !pnlPositive }"
      >
        {{ pnlPositive ? '+' : '' }}${{ pnlAmount }} ({{ pnlPositive ? '+' : '' }}{{ pnlPercentage }}%)
      </span>
    </div>
  </div>
</template>

<style scoped>
.asset-card {
  background: linear-gradient(135deg, #1c1c1e 0%, #2c2c2e 100%);
  border-radius: var(--radius-lg);
  padding: var(--spacing-lg);
  margin-bottom: var(--spacing-lg);
  color: white;
}

.header {
  display: flex;
  align-items: center;
  gap: 8px;
  color: var(--color-text-secondary);
  font-size: 12px;
  margin-bottom: 8px;
}

.toggle-btn {
  background: none;
  color: inherit;
  padding: 0;
  display: flex;
}

.balance-row h1 {
  font-size: 32px;
  font-weight: 700;
  margin-bottom: 4px;
}

.fiat-row {
  color: var(--color-text-secondary);
  font-size: 14px;
  margin-bottom: var(--spacing-md);
}

.pnl-row {
  display: flex;
  gap: 8px;
  font-size: 12px;
}

.pnl-row .label {
  color: var(--color-text-secondary);
}

.pnl-row .value.up {
  color: var(--color-success);
}
</style>
