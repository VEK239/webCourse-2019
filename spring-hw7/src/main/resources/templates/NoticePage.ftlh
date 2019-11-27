<#-- @ftlvariable name="noticeForm" type="ru.itmo.wp.form.NoticeCredentials" -->
<#import "/spring.ftl" as spring>
<#import "commons.ftlh" as c>

<@c.page>
    <div class="notice-form">
        <div class="header">Create a new notice</div>
        <div class="body">
            <form method="post" action="">
                <input type="hidden" name="action" value="notice"/>
                <div class="field">
                    <div class="value">
                        <textarea rows="10" cols="70" maxlength="65535" id="content" name="content">${noticeForm.content!}</textarea>
                    </div>
                    <@c.error "noticeForm.content"/>
                </div>
                <div class="button-field">
                    <input type="submit" value="Publish">
                </div>
            </form>
        </div>
    </div>
</@c.page>
