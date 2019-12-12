<template>
    <article v-if="post !== undefined" >
        <div class="title">{{post.title}}</div>
        <div class="information">By {{users[post.userId].login}}</div>
        <div class="body">{{post.text}}</div>
        <div v-if="viewComments !== undefined">
        <div v-for="comment in viewComments" v-bind:key="comment.id">
            <div class="commentBy">Comment by {{users[comment.userId].login}}</div>
            <div class="body">{{comment.text}}</div>
        </div>
        </div>
    </article>
</template>

<script>
    export default {
        name: "Post",
        props: ['post', 'users', 'comments'],
        computed: {
            viewComments: function () {
                return Object.values(this.comments).filter(comment => comment.postId === this.post.id).sort((a, b) => b.id - a.id);
            }
        }
    }
</script>

<style scoped>

</style>