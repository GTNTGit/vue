<script setup>
import HomeHeader from '../components/home/HomeHeader.vue'
import BannerCarousel from '../components/home/BannerCarousel.vue'
import QuickActions from '../components/home/QuickActions.vue'
import MarketTicker from '../components/home/MarketTicker.vue'
</script>

<template>
  <div class="page-container home-view">
    <HomeHeader />
    <BannerCarousel />
    <QuickActions />
    <MarketTicker />
  </div>
</template>

<style scoped>
.home-view {
  padding: 0; /* Override default padding for full width header/banner */
  padding-bottom: 80px;
}
</style>

