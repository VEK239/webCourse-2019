package ru.itmo.wp.model.domain;

import java.util.Date;

public class Event {
    private long id;
    private long userId;
    private Date creationTime;
    private EventType type;

    public long getId() {
        return id;
    }
    public long getUserId() {
        return userId;
    }

    public void setId(long id) {
        this.id = id;
    }
    public void setUserId(long userId) {
        this.userId = userId;
    }

    public String getType() {
        return (type == EventType.ENTER ? "ENTER" : "LOGOUT");
    }

    public void setType(EventType type) {
        this.type = type;
    }

    public Date getCreationTime() {
        return creationTime;
    }

    public void setCreationTime(Date creationTime) {
        this.creationTime = creationTime;
    }

}
