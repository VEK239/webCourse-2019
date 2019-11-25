package ru.itmo.wp.service;

import org.springframework.stereotype.Service;
import ru.itmo.wp.domain.Comment;
import ru.itmo.wp.domain.Post;
import ru.itmo.wp.domain.Tag;
import ru.itmo.wp.domain.User;
import ru.itmo.wp.form.PostCredentials;
import ru.itmo.wp.repository.PostRepository;
import ru.itmo.wp.repository.TagRepository;

import java.util.List;
import java.util.Optional;

@Service
public class PostService {
    private final PostRepository postRepository;
    private final TagRepository tagRepository;

    public PostService(PostRepository postRepository, TagRepository tagRepository) {
        this.postRepository = postRepository;
        this.tagRepository = tagRepository;
//        for (String name : Tag.Name.values()) {
//            if (tagRepository.countByName(name) == 0) {
//                tagRepository.save(new Tag(name));
//            }
//        }
    }

    public List<Post> findAll() {
        return postRepository.findAllByOrderByCreationTimeDesc();
    }

    public void writeComment(Comment comment, Post post, User user) {
        post.addComment(comment, user);
        postRepository.save(post);
    }

    public Post findById(long id) {
        return postRepository.findById(id).orElse(null);
    }

    public Post toPost(PostCredentials postCredentials) {
        Post post = new Post();
        post.setTitle(postCredentials.getTitle());
        post.setText(postCredentials.getText());
        for (String tagStr : postCredentials.getTags().split("\\s")) {
            tagStr = tagStr.toUpperCase();
            if (tagRepository.findByName(tagStr) == null) {
                tagRepository.save(new Tag(tagStr));
            }
            post.addTag(tagRepository.findByName(tagStr));
        }
        return post;
    }
}
