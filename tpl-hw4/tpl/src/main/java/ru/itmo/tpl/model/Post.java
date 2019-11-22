package ru.itmo.tpl.model;

public class Post {
    private final long id;
    private final String title;
    private final String text;
    private final long userId;
    private final long vote;

    public Post(long id, String title, String text, long userId, long vote) {
        this.id = id;
        this.title = title;
        this.text = text;
        this.userId = userId;
        this.vote = vote;
    }

    public long getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public String getText() {
        return text;
    }

    public long getUserId() { return userId; }

    public long getVote() { return vote; }
}
