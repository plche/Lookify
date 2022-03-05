package com.codingdojo.peru.ft2022.lookify.repositories;

import com.codingdojo.peru.ft2022.lookify.models.Song;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SongRepository extends CrudRepository<Song, Long> {
    List<Song> findAll();
    List<Song> findByArtistContaining(String search);
    List<Song> findTop10ByOrderByRatingDesc();
}
