package ru.itmo.tpl.util;

import ru.itmo.tpl.model.Color;
import ru.itmo.tpl.model.Post;
import ru.itmo.tpl.model.User;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

public class DataUtil {
    private static final List<User> USERS = Arrays.asList(
            new User(1, "MikeMirayanov", "Mikhail Mirzayanov", Color.BLUE),
            new User(2, "tourist", "Genady Korotkevich", Color.GREEN),
            new User(3, "emusk", "Elon Musk", Color.RED),
            new User(5, "pashka", "Pavel Mavrin", Color.BLUE),
            new User(7, "geranazavr555", "Georgiy Nazarov", Color.GREEN),
            new User(11, "cannon147", "Erofey Bashunov", Color.RED)
    );

    private static final List<Post> POSTS = Arrays.asList(

            new Post(4, "pashka", "From Pavel Mavrin", 5, 0),
            new Post(5, "geranazavr555", "From Georgiy Nazarov", 7, 0),
            new Post(2, "Second", "From Genady Korotkevich", 2, 0),
            new Post(3, "Update", "Обновление Tesla V10.0 только начала распространяться среди всех владельцев Tesla в США с опцией FSD и «расширенной загрузкой», выбранной в настройках программного обеспечения автомобиля.",
                    3, 0),
            new Post(19, "About Dasha Code Championship and Mirror Round 588", "Hello.\n" +
                    "\n" +
                    "It is not an official announcement of the events. Just information: The contest on воскресенье, 22 сентября 2019 г. в 12:05 will be only for onsite finalists. The mirror round will be the next day on понедельник, 23 сентября 2019 г. в 17:05.\n" +
                    "\n" +
                    "Hope to see many participants. Guess, who are the main writers of the Final?",
                    1, 0),
            new Post(20, "О сорванном раунде 591/Технокубок 2020 — Отборочный Раунд 1", "Привет, Codeforces!\n" +
                    "\n" +
                    "К сожалению, недоброжелатели сорвали проведение раунда, сделав DDOS на нашу инфраструктуру. Ни координатор, ни авторы раунда не виноваты, что у вас не получилось полноценно принять участие в раунде. Пожалуйста, не минусуйте анонс раунда. Я думаю, что такая ситуация — дополнительный повод поддержать авторов. Они подготовили хорошие задачи!\n" +
                    "\n" +
                    "Видимо, подобную атаку надо расценивать как симптом того, что Codeforces перерос фазу юношества и вступил во взрослую серьезную жизнь. Конечно, мы ответим адекватными мерами, чтобы защититься от подобных инцидентов. К счастью, за почти 10 лет работы вокруг сложилось большое сообщество тех, кому небезразличен Codeforces. Мы не переживаем по поводу возможных дополнительных трат или приложенных усилий. У нас всё получится. Раунды должны продолжаться.\n" +
                    "\n" +
                    "— MikeMirzayanov"
                    , 1, 0),
            new Post(21, "PoverWall",
                    "Важное замечание: чистая солнечная энергия гарантированно станет хорошей экономией для домовладельца, иначе Тесла вернёт деньги за панели. " +
                            "\n" +
                            "Добавление Powerwall отрицательно влияет на экономику, но дает домовладельцу защиту от энергопотребления в случае отключения электроэнергии.",
                    3, 0),
            new Post(7, "Нам 11 лет",
                    "11 лет назад, мы запустили нашу первую успешную миссию. " +
                            "\n" +
                            "На сегодняшний день мы завершили 78 запусков и разработали единственные в мире многоразовые ракеты и космические аппараты орбитального класса многоразового использования, способные запускать в космос, возвращаться на Землю и снова летать.",
                    3, 0),

            new Post(6, "Codeforces Round #592", "Привет, Codeforces!\n" +
                    "\n" +
                    "13 октября 2019 года в 12:05 MSK состоится Codeforces Round #592 (Div. 2). Обратите внимание на необычное время начала раунда!\n" +
                    "\n" +
                    "Раунд будет рейтинговым для участников второго дивизиона (с рейтингом менее 2100). Условия будут доступны как на русском, так и на английском языках.\n" +
                    "\n" +
                    "Этот раунд проводится по задачам регионального этапа Всероссийской командной олимпиады школьников по программированию 2019, проходящего в Саратове. Задачи вместе со мной придумывали и готовили Иван BledDest Андросов и Владимир Vovuh Петров.\n" +
                    "\n" +
                    "Хотелось бы сказать большое спасибо Ивану isaf27 Сафонову за помощь в подготовке задач, Михаилу MikeMirzayanov Мирзаянову за замечательные системы Codeforces и Polygon, а также Ивану CaseRuten Худошину, Ивану Ivan19981305 Георгиеву, Леониду Peinot Миронову, Антону anon20016 Лебедеву, Ксении Pavlova Павловой и Дмитрию dmitrii.krasnihin Краснихину за прорешивание задач.\n" +
                    "\n" +
                    "Участникам будет предложено семь задач и два часа на их решение. Разбалловка будет объявлена позднее.", 11, 0),
            new Post(1, "First", "From Mikhail Mirzayanov", 1, 0)

    );

    private String curUri;

    private static List<User> getUsers() {
        return USERS;
    }

    private static List<Post> getPosts() {
        return POSTS;
    }

    public static void putData(Map<String, Object> data) {
        data.put("users", getUsers());
        data.put("posts", getPosts());

        if (data.get("logged_user_id") != null) {
            for (User user : getUsers()) {
                if (Long.toString(user.getId()).equals(data.get("logged_user_id"))) {
                    data.put("user", user);
                }
            }
        }
    }
}
