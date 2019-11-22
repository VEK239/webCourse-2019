<#import "common.ftl" as c/>

<#--<@c.page>-->
<#--<ul>-->
<#--    <#list users as u>-->
<#--        <li><#if user?? && u.id == user.id>*</#if> <@c.userlink user=u/>-->
<#--    </#list>-->
<#--</ul>-->
<#--</@c.page>-->


<@c.page>
        <#list posts?sort_by("id")?reverse as post>
                <@c.myPost curPost=post>
                        <@c.paragraphMaking text=post.text?truncate(250, "...")/>
                </@c.myPost>
        </#list>
</@c.page>
