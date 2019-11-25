package ru.itmo.wp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.itmo.wp.domain.Role;
import ru.itmo.wp.domain.Tag;

import java.util.Optional;

public interface TagRepository extends JpaRepository<Tag, Long> {
//    int countByName(Tag.Name name);
    int countByName(String name);
    Tag findByName(String name);
}
