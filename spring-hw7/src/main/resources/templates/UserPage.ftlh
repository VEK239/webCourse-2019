<#-- @ftlvariable name="userForPage" type="ru.itmo.wp.domain.User" -->
<#import "commons.ftlh" as c>

<@c.page>
    <#if userForPage??>
        <div class="id">User id: ${userForPage.id}</div>
        <div class="login">Login: ${userForPage.login}</div>
        <div class="creationTime">Creation time: ${userForPage.creationTime}</div>
    <#else>
        No such user!
    </#if>
</@c.page>
