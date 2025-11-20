<script setup>
import BottomNav from '../common/BottomNav.vue'
</script>

<template>
  <div class="app-layout">
    <main class="main-content">
      <slot />
    </main>
    <BottomNav />
  </div>
</template>

<style scoped>
.app-layout {
  min-height: 100vh;
  display: flex;
  flex-direction: column;
}

.main-content {
  flex: 1;
  /* Padding bottom is handled by page-container in global css or individual pages */
}
</style>
