<#import "common.ftl" as c/>

<@c.page>

    <div class="datatable">
        <div class="caption">Users table</div>
        <table>
            <thead>
            <tr>
                <th>Id</th>
                <th>Name</th>
                <th>Handle</th>
            </tr>
            </thead>
            <tbody>
            <#list users as u>
                <tr>
                    <td>${u.id}</td>
                    <td>
                        <#if user?? && u.id == user.id>
                            *
                        </#if>
                        <@c.userlink user=u />
                    </td>
                    <td>${u.handle}</td>
                </tr>
            </#list>
            </tbody>
        </table>
    </div>


</@c.page>

