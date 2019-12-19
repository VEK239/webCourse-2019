<template>
    <section>
        <div class="header">
            By {{post.user.login}}
        </div>
        <div class="body">
            {{post.text}}
        </div>
        <div class="footer">
            <a href="#">View all</a>
        </div>
    </section>

</template>

<script>
    export default {
        props: ['post'],
        name: "SidebarPost"
    }
</script>

<style scoped>

</style>
