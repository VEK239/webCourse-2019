package ru.itmo.wp.model.repository;

import ru.itmo.wp.model.domain.Event;
import ru.itmo.wp.model.domain.EventType;

public interface EventRepository {
    void save(Event event);
}
