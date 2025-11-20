<script setup>
import { Download, Users, Gift, Globe } from 'lucide-vue-next'

const actions = [
  { name: '充值', icon: Download },
  { name: '邀请', icon: Users },
  { name: '策略', icon: Globe },
  { name: '更多', icon: Gift },
  { name: 'C2C', icon: Users },
  { name: '理财', icon: Gift },
  { name: '跟单', icon: Globe },
  { name: '新币', icon: Download },
]
</script>

<template>
  <div class="quick-actions">
    <div v-for="action in actions" :key="action.name" class="action-item">
      <div class="icon-circle">
        <component :is="action.icon" :size="24" />
      </div>
      <span class="label">{{ action.name }}</span>
    </div>
  </div>
</template>

<style scoped>
.quick-actions {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  gap: var(--spacing-md);
  padding: 0 var(--spacing-md);
  margin-bottom: var(--spacing-xl);
}

.action-item {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: var(--spacing-sm);
}

.icon-circle {
  width: 48px;
  height: 48px;
  border-radius: 50%;
  background: var(--color-bg-input); /* Or a slight tint */
  display: flex;
  align-items: center;
  justify-content: center;
  color: var(--color-text-primary);
}

.label {
  font-size: 12px;
  color: var(--color-text-secondary);
}
</style>
