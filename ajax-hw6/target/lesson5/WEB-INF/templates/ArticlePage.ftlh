<#-- @ftlvariable name="error" type="java.lang.String" -->
<#-- @ftlvariable name="title" type="java.lang.String" -->
<#-- @ftlvariable name="text" type="java.lang.String" -->

<#import "commons.ftlh" as c>

<@c.page>
    <#if user??>
    <div class="article form-box">
        <div class="header">Post article</div>
        <div class="body">
            <form method="post" action="">
                <input type="hidden" name="action" value="create"/>
                <div class="field">
                    <div class="name">
                        <label for="title">Title</label>
                    </div>
                    <div class="value">
                        <input id="title" name="title"/>
                    </div>
                </div>
                <div class="field">
                    <div class="name">
                        <label for="text">Text</label>
                    </div>
                    <div class="value">
                        <textarea rows="5" cols="24" maxlength="65535" name="text" id="text"></textarea>
                    </div>
                </div>

                <div class="error">
                    ${error!}
                </div>

                <div class="button-field">
                    <input type="submit" value="Create">
                </div>
            </form>
        </div>
    </div>
    <#else>
        You are not logged in!
    </#if>

    <script>
        $(function () {
            $(".article form").submit(function () {
                var title = $(this).find("input[name='title']").val();
                var text = $(this).find("textarea[name='text']").val();
                var $error = $(this).find(".error");
                if (myAjax({data: {action: "create", title: title, text: text}}, $error)) {
                    // $error.text("Created successfully!");
                    // notify("Created successfully!");
                    // text.val('');
                    // title.val('');
                }
                return false;
            });
        })
    </script>
</@c.page>
