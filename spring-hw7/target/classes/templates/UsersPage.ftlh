<#-- @ftlvariable name="users" type="ru.itmo.wp.domain.User[]" -->
<#-- @ftlvariable name="userId" type="java.lang.Long" -->
<#import "commons.ftlh" as c>

<@c.page>
    <div class="users datatable">
        <div class="caption">User</div>
        <table>
            <thead>
            <tr>
                <th>Id</th>
                <th>Login</th>
                <th>Created</th>
                <th>View</th>
                <#if user??>
                    <th>Enabled/Disabled</th>
                </#if>
            </tr>
            </thead>
            <tbody>
            <#if users?size==0>
                <tr class="noData">
                    <td colspan="3">
                        No data
                    </td>
                </tr>
            <#else>
                <#list users as curUser>
                <tr>
                    <td class="id">${curUser.id}</td>
                    <td class="login">${curUser.login}</td>
                    <td class="creationTime">${curUser.creationTime}</td>
                    <td class="userPageLink">
                        <form method="get" action="/user/${curUser.id}">
                            <input type="submit" value="View user">
                        </form>
                    </td>
                    <#if user??>
                    <td class="userEnable">
                        <form method="post" action="/users/${curUser.id}">
                            <#if curUser.enabled>
                                <input type="submit" value="Disable user">
                             <#else>
                                 <input type="submit" value="Enable user">
                            </#if>
                        </form>
                    </td>
                    </#if>
                </tr>
                </#list>
            </#if>
            </tbody>
        </table>
    </div>
</@c.page>
