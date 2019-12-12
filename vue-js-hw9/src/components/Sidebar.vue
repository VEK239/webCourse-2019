<template>
    <aside>
        <SidebarPost v-for="post in posts" :post="post" :users="users" :key="post.id"/>
    </aside>
</template>

<script>
    import SidebarPost from "./SidebarPost";
    export default {
        props: ['posts', 'users'],
        name: "Sidebar",
        components: {SidebarPost},
    }

</script>

<style scoped>

</style>