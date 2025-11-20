<script setup>
import { ref } from 'vue'

const side = ref('buy') // 'buy' or 'sell'
const orderType = ref('limit')
</script>

<template>
  <div class="trade-form">
    <div class="side-switch">
      <button 
        class="side-btn buy" 
        :class="{ active: side === 'buy' }"
        @click="side = 'buy'"
      >
        买入
      </button>
      <button 
        class="side-btn sell" 
        :class="{ active: side === 'sell' }"
        @click="side = 'sell'"
      >
        卖出
      </button>
    </div>

    <div class="order-type-select">
      <select v-model="orderType">
        <option value="limit">限价委托</option>
        <option value="market">市价委托</option>
      </select>
    </div>

    <div class="input-group">
      <input type="text" placeholder="价格 (USDT)" />
    </div>

    <div class="input-group">
      <input type="text" placeholder="数量 (BTC)" />
    </div>

    <div class="slider-container">
      <!-- Simple slider visualization -->
      <div class="slider-track">
        <div class="slider-thumb" style="left: 0%"></div>
      </div>
      <div class="slider-marks">
        <span>0%</span>
        <span>25%</span>
        <span>50%</span>
        <span>75%</span>
        <span>100%</span>
      </div>
    </div>

    <div class="avail-balance">
      <span>可用</span>
      <span>1,240.50 USDT</span>
    </div>

    <button class="action-btn" :class="side">
      {{ side === 'buy' ? '买入 BTC' : '卖出 BTC' }}
    </button>
  </div>
</template>

<style scoped>
.trade-form {
  flex: 1;
  display: flex;
  flex-direction: column;
  gap: 16px;
}

.side-switch {
  display: flex;
  background: var(--color-bg-input);
  border-radius: 4px;
  padding: 2px;
}

.side-btn {
  flex: 1;
  padding: 8px;
  font-weight: 600;
  border-radius: 2px;
  color: var(--color-text-secondary);
  background: transparent;
}

.side-btn.buy.active {
  background-color: var(--color-success);
  color: white;
}

.side-btn.sell.active {
  background-color: var(--color-danger);
  color: white;
}

.order-type-select select {
  width: 100%;
  background: var(--color-bg-input);
  color: var(--color-text-primary);
  padding: 10px;
  border-radius: 4px;
  border: none;
}

.input-group input {
  width: 100%;
  background: var(--color-bg-input);
  color: var(--color-text-primary);
  padding: 12px;
  border-radius: 4px;
  border: 1px solid transparent;
}

.input-group input:focus {
  border-color: var(--color-primary);
}

.slider-track {
  height: 2px;
  background: var(--color-bg-input);
  position: relative;
  margin: 10px 0;
}

.slider-thumb {
  width: 12px;
  height: 12px;
  background: white;
  border-radius: 50%;
  position: absolute;
  top: -5px;
}

.slider-marks {
  display: flex;
  justify-content: space-between;
  font-size: 10px;
  color: var(--color-text-secondary);
}

.avail-balance {
  display: flex;
  justify-content: space-between;
  font-size: 12px;
  color: var(--color-text-secondary);
}

.action-btn {
  width: 100%;
  padding: 14px;
  border-radius: 4px;
  font-weight: 700;
  font-size: 16px;
  color: white;
  margin-top: 8px;
}

.action-btn.buy { background-color: var(--color-success); }
.action-btn.sell { background-color: var(--color-danger); }
</style>
