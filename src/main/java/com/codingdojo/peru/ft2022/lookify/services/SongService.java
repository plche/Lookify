package com.codingdojo.peru.ft2022.lookify.services;

import com.codingdojo.peru.ft2022.lookify.models.Song;
import com.codingdojo.peru.ft2022.lookify.repositories.SongRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class SongService {
    private final SongRepository songRepository;

    public SongService(SongRepository songRepository) {
        this.songRepository = songRepository;
    }

    public List<Song> allSongs() {
        return songRepository.findAll();
    }

    public List<Song> findSongsByArtist(String search) {
        return songRepository.findByArtistContaining(search);
    }

    public List<Song> findTop10Songs() {
        return songRepository.findTop10ByOrderByRatingDesc();
    }

    public Song createSong(Song song) {
        return songRepository.save(song);
    }

    public Song findSongById(Long id) {
        Optional<Song> optionalSong = songRepository.findById(id);
        if (optionalSong.isPresent()) return optionalSong.get();
        else return null;
    }

    public Song updateSong(Long id, String title, String artist, Integer rating) {
        Song song = new Song(title, artist, rating);
        song.setId(id);
        return  songRepository.save(song);
    }

    public void deleteSong(Long id) {
        songRepository.deleteById(id);
    }
}
