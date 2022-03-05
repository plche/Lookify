package com.codingdojo.peru.ft2022.lookify.controllers;

import com.codingdojo.peru.ft2022.lookify.models.Song;
import com.codingdojo.peru.ft2022.lookify.services.SongService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import java.util.List;

@Controller
public class SongController {

    @Autowired
    SongService songService;

    private String search;

    @GetMapping("/")
    public String index() {
        return "index.jsp";
    }

    @GetMapping("/dashboard")
    public String dashboard(Model model) {
        List<Song> songs = songService.allSongs();
        model.addAttribute("songs", songs);

        return "dashboard.jsp";
    }

    @GetMapping("/search/{search}")
    public String searchSongsByArtistForm(@PathVariable("search") String search, Model model, RedirectAttributes redirectAttributes) {
        if ((search.length() < 2) || search.equals("  ")) {
            redirectAttributes.addFlashAttribute("error", "Must be at least 2 non-whitespace characters");
            return "redirect:/dashboard" + search;
        } else {
            List<Song> songs = songService.findSongsByArtist(search);
            model.addAttribute("search", search);
            model.addAttribute("songs", songs);
            return "search.jsp";
        }
    }

    @PostMapping("/search")
    public String songsByArtist(@RequestParam("search") String search, RedirectAttributes redirectAttributes) {
        if ((search.length() < 2) || search.equals("  ")) {
            redirectAttributes.addFlashAttribute("error", "Must be at least 2 non-whitespace characters");
            return "redirect:/dashboard";
        } else return "redirect:/search/" + search;
    }

    @GetMapping("/songs/new")
    public String showNewSongForm(Model model, @ModelAttribute("song") Song song) {
        return "new.jsp";
    }

    @PostMapping("/songs/new")
    public String saveNewSong(@Valid @ModelAttribute("song") Song song, BindingResult result) {
        if (result.hasErrors()) return "new.jsp";
        songService.createSong(song);

        return "redirect:/dashboard";
    }

    @GetMapping("/songs/{id}")
    public String songDetail(@PathVariable("id") Long id, Model model) {
        Song song = songService.findSongById(id);
        model.addAttribute("song", song);

        return "show.jsp";
    }

    @DeleteMapping("/songs/{id}")
    public String destroyASong(@PathVariable("id") Long id) {
        songService.deleteSong(id);
        return "redirect:/dashboard";
    }

    @GetMapping("/search/topTen")
    public String songsTopTen(Model model) {
        List<Song> songs = songService.findTop10Songs();
        model.addAttribute("songs", songs);

        return "topten.jsp";
    }
}
