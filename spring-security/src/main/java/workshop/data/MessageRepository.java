package workshop.data;

import org.springframework.data.repository.CrudRepository;
import org.springframework.security.access.prepost.PostAuthorize;

public interface MessageRepository extends CrudRepository<Message, Long> {

    Iterable<Message> findByToId(Long id);

    @PostAuthorize("returnObject?.to?.id == principal?.id")
    Message findOne(Long id);

}
