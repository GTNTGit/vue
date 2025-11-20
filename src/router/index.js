import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../views/HomeView.vue'
import MarketView from '../views/MarketView.vue'
import TradeView from '../views/TradeView.vue'
import AssetsView from '../views/AssetsView.vue'

const router = createRouter({
    history: createWebHistory(import.meta.env.BASE_URL),
    routes: [
        {
            path: '/',
            name: 'home',
            component: HomeView
        },
        {
            path: '/market',
            name: 'market',
            component: MarketView
        },
        {
            path: '/trade',
            name: 'trade',
            component: TradeView
        },
        {
            path: '/assets',
            name: 'assets',
            component: AssetsView
        }
    ]
})

export default router
