<template>
    <div>
        <article v-for="post in viewPosts" :post="post" :key="post.id">
            <div class="title">
                {{post.id}}# {{post.title}}
            </div>
            <div class="information">
                By {{post.user.login}} on {{post.creationTime}}
            </div>
            <div class="body">
                {{post.text}}
            </div>
        </article>
    </div>
</template>

<script>
    export default {
        name: "Index",
        props: ['posts'],
        computed: {
            viewPosts: function () {
                return Object.values(this.posts).sort((a, b) => b.id - a.id);
            }
        }
    }
</script>

<style scoped>

</style>
