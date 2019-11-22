<#-- @ftlvariable name="user" type="ru.itmo.wp.model.domain.User" -->
<#-- @ftlvariable name="articles" type="ru.itmo.wp.model.domain.Article[]" -->
<#import "commons.ftlh" as c>

<@c.page>
    <link rel="stylesheet" type="text/css" href="/css/articles.css">
    <ul class="articles">
        <li>
            <template>
                <article>
                    <div class="title"></div>
                    <div class="body">
                        <div class="text"></div>
                    </div>
                    <ul class="attachment">
                        <li>Announcement of <a href="#">Codeforces Round #510 (Div. 1)</a></li>
                        <li>Announcement of <a href="#">Codeforces Round #510 (Div. 2)</a></li>
                    </ul>
                    <div class="footer">
                        <div class="left">
                            <img src="img/voteup.png" title="Vote Up" alt="Vote Up"/>
                            <span class="positive-score">+173</span>
                            <img src="img/votedown.png" title="Vote Down" alt="Vote Down"/>
                        </div>
                        <div class="right">
                            <img src="img/date_16x16.png" title="Publish Time" alt="Publish Time"/>
                            <span class="date"></span>
                            <img src="img/comments_16x16.png" title="Comments" alt="Comments"/>
                            <a href="#">68</a>
                        </div>
                    </div>
                </article>
            </template>
        </li>
    </ul>
<#--<div class="noData">-->

<#--</div>-->
    <script>
        $(function () {
            var $noData = $(".users .noData");
            $noData.find("td").text("Loading...");
            myAjax({
                data: {
                    action: "findAll"
                },
                success: function (response) {
                    response["articles"].forEach(function (article) {
                        if (article["isShown"]) {
                            $noData.hide();
                            var $tr = $($(".articles template").prop("content")).clone();
                            $tr.find(".title").text(article["title"]);
                            $tr.find(".text").text(article["text"]);
                            $tr.find(".date").text(article["creationTime"]);
                            $(".articles").append($tr);
                        }
                    });
                }
            });
        })
    </script>
    <script>
        $(function () {
            $("aside section").click(function () {
                $(this).css("background-color", "red");
            });
        })
    </script>
</@c.page>