package workshop.data;

import org.springframework.data.repository.CrudRepository;

public interface MessageRepository extends CrudRepository<Message, Long> {

    Iterable<Message> findByToId(Long id);

    Message findOne(Long id);

}
