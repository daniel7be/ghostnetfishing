package de.iu.ghostnetfishing.repository;

import de.iu.ghostnetfishing.model.Geisternetz;
import de.iu.ghostnetfishing.model.Status;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Collection;
import java.util.List;

public interface GeisternetzRepository extends JpaRepository<Geisternetz, Long> {

    List<Geisternetz> findByStatusIn(Collection<Status> statuses);
}