<script setup>
const banners = [
  { id: 1, title: '新币上线', subtitle: '立即交易 PEPE！', color: '#26A17B' },
  { id: 2, title: '零手续费', subtitle: '首次充值享受', color: '#627EEA' },
  { id: 3, title: '邀请奖励', subtitle: '邀请好友，赚取加密货币', color: '#F7931A' },
]
</script>

<template>
  <div class="banner-carousel">
    <div class="banner-track">
      <div 
        v-for="banner in banners" 
        :key="banner.id" 
        class="banner-item"
        :style="{ backgroundColor: banner.color }"
      >
        <div class="banner-content">
          <h3>{{ banner.title }}</h3>
          <p>{{ banner.subtitle }}</p>
          <button class="banner-btn">立即查看</button>
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped>
.banner-carousel {
  margin-bottom: var(--spacing-lg);
  overflow: hidden;
}

.banner-track {
  display: flex;
  overflow-x: auto;
  scroll-snap-type: x mandatory;
  gap: var(--spacing-md);
  padding: 0 var(--spacing-md);
  -webkit-overflow-scrolling: touch;
  scrollbar-width: none; /* Firefox */
}

.banner-track::-webkit-scrollbar {
  display: none; /* Chrome/Safari */
}

.banner-item {
  flex: 0 0 100%; /* Full width minus padding logic if needed, or just 90% to show next */
  min-width: 300px;
  height: 140px;
  border-radius: var(--radius-lg);
  scroll-snap-align: center;
  position: relative;
  overflow: hidden;
  color: white;
}

.banner-content {
  padding: 20px;
  height: 100%;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: flex-start;
}

.banner-content h3 {
  font-size: 20px;
  font-weight: 700;
  margin-bottom: 4px;
}

.banner-content p {
  font-size: 14px;
  opacity: 0.9;
  margin-bottom: 12px;
}

.banner-btn {
  background: rgba(255, 255, 255, 0.2);
  border: none;
  color: white;
  padding: 6px 12px;
  border-radius: 16px;
  font-size: 12px;
  font-weight: 600;
  backdrop-filter: blur(4px);
}
</style>
