package ru.itmo.wp.model.domain;

import java.util.Date;

public class Talk {
    private long id;
    private long sourceUserId;
    private long targetUserId;
    private String text;
    private Date creationTime;

    public long getId() {
        return id;
    }
    public long getSourceUserId() {
        return sourceUserId;
    }
    public long getTargetUserId() {
        return targetUserId;
    }

    public void setId(long id) {
        this.id = id;
    }
    public void setSourceUserId(long userId) {
        this.sourceUserId = userId;
    }
    public void setTargetUserId(long userId) {
        this.targetUserId = userId;
    }

    public Date getCreationTime() {
        return creationTime;
    }

    public void setCreationTime(Date creationTime) {
        this.creationTime = creationTime;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getText() {
        return text;
    }

}
