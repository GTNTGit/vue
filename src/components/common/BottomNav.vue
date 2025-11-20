<script setup>
import { computed } from 'vue'
import { useRoute, RouterLink } from 'vue-router'
import { Home, BarChart2, ArrowLeftRight, Wallet } from 'lucide-vue-next'

const route = useRoute()

const isActive = (path) => route.path === path

const navItems = [
  { name: 'Home', path: '/', icon: Home },
  { name: 'Markets', path: '/market', icon: BarChart2 },
  { name: 'Trade', path: '/trade', icon: ArrowLeftRight },
  { name: 'Assets', path: '/assets', icon: Wallet },
]
</script>

<template>
  <nav class="bottom-nav">
    <RouterLink 
      v-for="item in navItems" 
      :key="item.path" 
      :to="item.path"
      class="nav-item"
      :class="{ 'active': isActive(item.path) }"
    >
      <component :is="item.icon" :size="24" class="nav-icon" />
      <span class="nav-label">{{ item.name }}</span>
    </RouterLink>
  </nav>
</template>

<style scoped>
.bottom-nav {
  position: fixed;
  bottom: 0;
  left: 0;
  right: 0;
  height: 60px; /* Standard mobile nav height */
  background-color: var(--color-bg-card);
  border-top: 1px solid var(--color-border);
  display: flex;
  justify-content: space-around;
  align-items: center;
  z-index: 100;
  padding-bottom: env(safe-area-inset-bottom);
}

.nav-item {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  color: var(--color-text-secondary);
  font-size: 10px;
  gap: 4px;
  width: 100%;
  height: 100%;
  transition: color 0.2s ease;
}

.nav-item.active {
  color: var(--color-text-primary); /* White for active state */
}

.nav-item.active .nav-icon {
  color: var(--color-primary); /* Brand color for icon */
}

.nav-icon {
  transition: transform 0.2s ease;
}

.nav-item:active .nav-icon {
  transform: scale(0.9);
}
</style>
