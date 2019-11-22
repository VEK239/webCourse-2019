<#-- @ftlvariable name="logged_user_id" type="long" -->

<#macro paragraphMaking text>
    <#list text?split("\n") as line>
        <p>${line}</p>
    </#list>
</#macro>

<#macro postLink curPost text=curPost.title>
    <a href="/posts?post_id=${curPost.id}">${text}</a>
</#macro>

<#macro postlinkUserId curUser text=curUser.title>
    <a href="/posts?user_id=${curUser.id}">${text}</a>
</#macro>

<#macro header>
<header>
    <a href="/"><img src="/img/logo.png" alt="Codeforces" title="Codeforces"/></a>
    <div class="languages">
        <a href="#"><img src="/img/gb.png" alt="In English" title="In English"/></a>
        <a href="#"><img src="/img/ru.png" alt="In Russian" title="In Russian"/></a>
    </div>
    <div class="enter-or-register-box">
        <#if logged_user_id??>
            <@userlink user=findBy(users, "id", logged_user_id) isNameOnly=true/>
            |
            <a href="#">Logout</a>
        <#else>
            <a href="#">Enter</a>
            |
            <a href="#">Register</a>
        </#if>
    </div>
    <nav>
        <#assign pages={"/index": "Index", "/misc/help": "Help", "/users": "Users"}>
        <ul>
        <#list pages as hr, name>
            <li <#if curUri==hr>class="underlined"</#if>><a href=${hr}>${name}</a></li>
        </#list>
        </ul>
    </nav>
</header>
</#macro>

<#macro sidebar>
<aside>
    <section>
        <#local lastPost=posts?sort_by("id")?last>
        <div class="header">
            Post #${lastPost.id}
        </div>
        <div class="body">
            <@paragraphMaking text=lastPost.text?truncate(250, "...")/>
        </div>
        <div class="footer">
            <@postLink curPost=lastPost text="View all"/>
        </div>
    </section>
</aside>
</#macro>

<#macro footer>
<footer>
    <a href="#">Codeforces</a> &copy; 2010-2019 by Mike Mirzayanov
</footer>
</#macro>

<#macro page>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Codeforces</title>
    <link rel="stylesheet" type="text/css" href="/css/normalize.css">
    <link rel="stylesheet" type="text/css" href="/css/style.css">
    <link rel="icon" href="/favicon.ico" type="image/x-icon"/>
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon"/>
</head>
<body>
    <@header/>
    <div class="middle">
        <@sidebar/>
        <main>
            <#nested/>
        </main>
    </div>
    <@footer/>
</body>
</html>
</#macro>

<#macro myPost curPost >
    <#local user=findBy(users, "id", curPost.userId)>
    <article>
        <div class="title">
            <@postLink curPost=curPost/>
        </div>
        <div class="information">By <@userlink user=user/></div>
        <div class="body">
            <#nested />

        </div>
        <div class="footer">
            <div class="left">
                <img src="img/voteup.png" title="Vote Up" alt="Vote Up"/>
                <span class="positive-score">${curPost.vote}</span>
                <img src="img/votedown.png" title="Vote Down" alt="Vote Down"/>
            </div>
            <div class="right">
                <img src="img/date_16x16.png" title="Publish Time" alt="Publish Time"/>
                2 days ago
                <img src="img/comments_16x16.png" title="Comments" alt="Comments"/>
                <a href="#">68</a>
            </div>
        </div>
    </article>
</#macro>


<#--<#macro userlink user>-->
<#--    <a href="/user?handle=${user.handle}">${user.name}</a>-->
<#--</#macro>-->

<#macro userlink user name=user.name isNameOnly=false>
    <#if isNameOnly == true>
        <a href="/user?handle=${user.handle}">${user.name}</a>
    <#else>
        <a class="${user.color}" href="/user?handle=${user.handle}">${user.name}</a>
    </#if>
</#macro>

<#function findBy items key id>
    <#list items as item>
        <#if item[key]==id>
            <#return item/>
        </#if>
    </#list>
</#function>

<#function findPrev items key id>
    <#assign prev="">
    <#list items as item>
        <#if item[key]==id>
            <#return prev/>
        <#else>
            <#assign prev=item["handle"]>
        </#if>
    </#list>
</#function>

<#function findNext items key id>
    <#assign found=false!/>
    <#list items as item>
        <#if found>
            <#return item["handle"]/>
        </#if>
        <#if item[key]==id>
            <#assign found=true!/>
        </#if>
    </#list>
    <#return "">
</#function>

