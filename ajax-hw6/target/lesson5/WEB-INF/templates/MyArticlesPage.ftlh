<#-- @ftlvariable name="user" type="ru.itmo.wp.model.domain.User" -->
<#-- @ftlvariable name="articles" type="ru.itmo.wp.model.domain.Article[]" -->
<#-- @ftlvariable name="error" type="java.lang.String" -->
<#import "commons.ftlh" as c>

<@c.page>
    <div class="error">
        ${error!}
    </div>
    <#if user??>
    <div class="datatable">
        <div class="caption">User</div>
        <table>
            <thead>
            <tr>
                <th>Id</th>
                <th>Article name</th>
                <th>Change publicity</th>
            </tr>
            </thead>
            <tbody>
            <#list articles as article>
                <tr>
                    <td>${article.id}</td>
                    <td>${article.title}</td>
                    <td>
                        <form method="post" action="">
                            <input type="submit"
                                    <#if article.shown>
                                        value="Hide"
                                    <#else>
                                        value="Show"
                                    </#if>
                            >
                        </form>
                    </td>
                </tr>
            </#list>
            </tbody>
        </table>
    </div>
    <#else>
        You are not logged in!!!
    </#if>

    <script>
        $(function () {
            $(".datatable form").submit(function () {
                var $error = $(this).find(".error");
                var value = $(this).find("input[type='submit']").val();
                var valueToPut = value === "Hide" ? "Show" : "Hide";
                var articleId = $(this).find("input[type='submit']").closest("tr").find("td")[0].innerHTML;
                myAjax({data: { action: "changePublicity", articleId: articleId, valueToPut: value}}, $error);
                $(this).find("input[type='submit']").val(valueToPut);
                return false;
            });
        })
    </script>
</@c.page>
