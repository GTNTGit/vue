<script setup>
import { Search, Bell, ScanLine } from 'lucide-vue-next'
</script>

<template>
  <div class="home-header">
    <div class="user-avatar">
      <img src="https://api.dicebear.com/7.x/avataaars/svg?seed=Felix" alt="User" />
    </div>

    <div class="search-bar">
      <Search :size="16" class="search-icon" />
      <span class="placeholder">搜索币种、交易对等</span>
    </div>

    <div class="header-icons">
      <div class="icon-btn">
        <ScanLine :size="20" />
      </div>
      <div class="icon-btn">
        <Bell :size="20" />
        <span class="badge"></span>
      </div>
    </div>
  </div>
</template>

<style scoped>
.home-header {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: var(--spacing-md);
  gap: var(--spacing-md);
  background: rgba(11, 14, 17, 0.85); /* Semi-transparent bg */
  backdrop-filter: blur(12px);
  -webkit-backdrop-filter: blur(12px);
  position: sticky;
  top: 0;
  z-index: 10;
  border-bottom: 1px solid rgba(255, 255, 255, 0.02);
}

.user-avatar {
  width: 32px;
  height: 32px;
  border-radius: 50%;
  overflow: hidden;
  background: var(--color-bg-input);
}

.user-avatar img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.search-bar {
  flex: 1;
  display: flex;
  align-items: center;
  background: var(--color-bg-input);
  padding: 8px 12px;
  border-radius: 20px;
  color: var(--color-text-tertiary);
  font-size: 13px;
}

.search-icon {
  margin-right: 8px;
}

.header-icons {
  display: flex;
  align-items: center;
  gap: 12px;
}

.icon-btn {
  position: relative;
  color: var(--color-text-primary);
  display: flex;
  align-items: center;
  justify-content: center;
}

.badge {
  position: absolute;
  top: -2px;
  right: -2px;
  width: 8px;
  height: 8px;
  background: var(--color-danger);
  border-radius: 50%;
  border: 1px solid var(--color-bg-primary);
}
</style>
