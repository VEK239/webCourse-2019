<#-- @ftlvariable name="post" type="ru.itmo.wp.domain.Post" -->
<#-- @ftlvariable name="comment" type="ru.itmo.wp.domain.Comment" -->

<#import "/spring.ftl" as spring>
<#import "commons.ftlh" as c>

<@c.page>
    <#if post??>
    <@c.post post=post/>
    <#if user??>
    <div class="form-box">
        <div class="header">Write Comment</div>
        <div class="body">
            <form method="post" action="">
                <input type="hidden" name="action" value="writePost"/>
                <div class="field">
                    <div class="name">
                        <label for="text">Text</label>
                    </div>
                    <div class="value">
                        <input id="text" name="text" value="${comment.text!}"/>
                    </div>
                    <@c.error "comment.text"/>
                </div>
                <div class="button-field">
                    <input type="submit" value="Comment">
                </div>
            </form>
        </div>
    </div>
    </#if>

    <#list post.comments as comment>
        <div class="comment">
            <div class="body">
                ${comment.text}
            </div>
            <div class="info">
                by ${comment.user.login} on ${comment.creationTime}
            </div>
        </div>
    </#list>
    <#else>
        No such post!
    </#if>
</@c.page>
