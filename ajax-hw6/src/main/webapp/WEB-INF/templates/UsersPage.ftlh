<#-- @ftlvariable name="users" type="ru.itmo.wp.model.domain.User[]" -->
<#-- @ftlvariable name="user" type="ru.itmo.wp.model.domain.User" -->
<#-- @ftlvariable name="error" type="java.lang.String" -->

<#import "commons.ftlh" as c>

<@c.page>
    <div class="error">
        ${error!}
    </div>
    <div class="users datatable">
        <div class="caption">User</div>
        <table>
            <thead>
            <tr>
                <th>Id</th>
                <th>Login</th>
                <th>Admin</th>
            </tr>
            </thead>
            <tbody>
            <template>
                <tr>
                    <td class="user_id"></td>
                    <td class="user_login"></td>
                    <td class="user_admin">
                        <form method="post" action="">
                            <div class="isAdmin"></div>
                            <input type="submit">
                        </form>
                    </td>
                </tr>
            </template>
            <tr class="noData">
                <td colspan="3">
                    No data
                </td>
            </tr>
            </tbody>
        </table>
    </div>

    <script>
        $(function () {
            var $noData = $(".users .noData");
            $noData.find("td").text("Loading...");

            $.ajax({
                dataType: "json",
                data: {
                    action: "findAll"
                },
                success: function(response) {
                    response["users"].forEach(function(user) {
                        $noData.hide();
                        var curUser = response["curUser"];
                        var $tr = $($(".users template").prop("content")).clone();
                        $tr.find(".user_id").text(user["id"]);
                        $tr.find(".user_login").text(user["login"]);
                        if (response["curUser"]) {
                            $tr.find(".isAdmin").text(user["isAdmin"] ? "Is admin" : "Not admin");
                            $tr.find("input[type='submit']").val(user["isAdmin"] ? "Make not admin" : "Make admin")
                        }
                        $tr.find("tr").attr("data-userId", user["id"]);
                        $(".users tbody").append($tr);
                    });
                    if (!response["curUser"]) {
                        $('td:nth-child(3),th:nth-child(3)').hide();
                    }
                    $(".users tr").click(function() {
                        $.ajax({
                            dataType: "json",
                            data: {
                                action: "findUser",
                                userId: $(this).attr("data-userId")
                            },
                            success: function (response) {
                                notify(response["user"].creationTime);
                            },
                            type: "POST"
                        })
                    });
                    $(".datatable form").submit(function () {
                        var $error = $(this).find(".error");
                        var value = $(this).find("input[type='submit']").val();
                        var userId = $(this).find("input[type='submit']").closest("tr").find("td")[0].innerHTML;
                        myAjax({data: { action: "changeAdmin", changingId: userId, valueToPut: value === "Make admin"}}, $error);
                        $(this).find("input[type='submit']").val(value === "Make admin" ? "Make not admin" : "Make admin");
                        $(this).find(".isAdmin").text(value === "Make admin" ? "Is admin" : "Not admin");
                        return false;
                    });
                },
                type: "POST"
            });
        })
    </script>
</@c.page>
