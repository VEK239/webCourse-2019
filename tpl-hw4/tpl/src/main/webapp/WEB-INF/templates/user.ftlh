<#-- @ftlvariable name="handle" type="java.lang.String" -->
<#-- @ftlvariable name="id" type="long" -->
<#import "common.ftl" as c/>

<@c.page>
    <#if id??>
        <#assign viewedUser=c.findBy(users, "id", id)!/>
    <#elseif handle??>
        <#assign viewedUser=c.findBy(users, "handle", handle)!/>
    </#if>
    <#if (handle?? || id??) && viewedUser.id??>
        <div class="UserName">
            <div class="info">
            <div class="name">
                <@c.userlink user=viewedUser/>
            </div>
            <ul>
                <li>
                    id: ${viewedUser.id}
                </li>
                <li>
                    handle: ${viewedUser.handle}
                </li>
                <li>
                    name: ${viewedUser.name}
                </li>
                <li><@c.postlinkUserId curUser=viewedUser text="See all user posts"/></li>
            </ul>
            </div>
            <div class="UserImg">
                <img src="/img/user.jpg" alt="user">
            </div>
        </div>
        <div class="pagination">
            <#assign prevUser=c.findPrev(users, "id", viewedUser.id)!/>
            <#assign nextUser=c.findNext(users, "id", viewedUser.id)!/>
            <#if prevUser=="">
                <span>←</span>
            <#else>
                <a href="user?handle=${prevUser}" class="arrow">←</a>
            </#if>
            <#if nextUser=="">
                <span>→</span>
            <#else>
                <a href="user?handle=${nextUser}" class="arrow">→</a>
            </#if>
        </div>
    <#else>
        <h1>No such user</h1>
    </#if>
</@c.page>
