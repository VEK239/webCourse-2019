<#-- @ftlvariable name="post_id" type="java.lang.Long" -->
<#-- @ftlvariable name="user_id" type="java.lang.Long" -->
<#import "common.ftl" as c/>

<@c.page>
    <#if post_id??>
        <#assign post=c.findBy(posts, "id", post_id)!/>
        <#if post.text??>
            <@c.myPost curPost=post>
<#--            <p>${post?text}</p>-->
            <@c.paragraphMaking text=post.text/>
            </@c.myPost>
        <#else>
            No such post!
        </#if>
    <#elseif user_id??>
        <#list posts?sort_by("id")?reverse?filter(post -> post.userId == user_id) as post>
            <@c.myPost curPost=post>
                <@c.paragraphMaking text=post.text/>
            </@c.myPost>
        </#list>
    </#if>
</@c.page>
