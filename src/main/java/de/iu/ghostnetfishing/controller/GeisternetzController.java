package de.iu.ghostnetfishing.controller;

import de.iu.ghostnetfishing.model.Geisternetz;
import de.iu.ghostnetfishing.model.Person;
import de.iu.ghostnetfishing.model.Status;
import de.iu.ghostnetfishing.repository.GeisternetzRepository;
import de.iu.ghostnetfishing.repository.PersonRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class GeisternetzController {

    private final GeisternetzRepository geisternetzRepository;
    private final PersonRepository personRepository;

    public GeisternetzController(GeisternetzRepository geisternetzRepository,
                                 PersonRepository personRepository) {
        this.geisternetzRepository = geisternetzRepository;
        this.personRepository = personRepository;
    }

    @GetMapping("/")
    public String startseite() {
        return "redirect:/netze";
    }

    @GetMapping("/netze")
    public String netzeAnzeigen(Model model) {
        model.addAttribute("netze", geisternetzRepository.findAll());
        return "netze";
    }

    @GetMapping("/melden")
    public String meldeFormular(Model model) {
        model.addAttribute("geisternetz", new Geisternetz());
        return "melden";
    }

    @PostMapping("/melden")
    public String netzMelden(@ModelAttribute Geisternetz geisternetz,
                             @RequestParam(defaultValue = "false") boolean anonym,
                             @RequestParam(required = false) String melderName,
                             @RequestParam(required = false) String melderTelefon,
                             Model model) {

        if (!anonym) {
            if (melderName == null || melderName.isBlank()
                    || melderTelefon == null || melderTelefon.isBlank()) {
                model.addAttribute("geisternetz", geisternetz);
                model.addAttribute("fehler",
                        "Bei einer nicht-anonymen Meldung sind Name und Telefonnummer erforderlich.");
                return "melden";
            }
            Person melder = new Person();
            melder.setName(melderName);
            melder.setTelefonnummer(melderTelefon);
            personRepository.save(melder);
            geisternetz.setMelder(melder);
        }

        geisternetzRepository.save(geisternetz);
        return "redirect:/netze";
    }

    @GetMapping("/bergung")
    public String offeneBergungen(Model model) {
        model.addAttribute("netze",
                geisternetzRepository.findByStatusIn(
                        List.of(Status.GEMELDET, Status.BERGUNG_BEVORSTEHEND)));
        return "bergung";
    }

    @PostMapping("/bergung/uebernehmen")
    public String bergungUebernehmen(@RequestParam Long netzId,
                                     @RequestParam String bergerName,
                                     @RequestParam String bergerTelefon) {
        Geisternetz netz = geisternetzRepository.findById(netzId).orElseThrow();

        if (netz.getStatus() == Status.GEMELDET) {
            Person berger = new Person();
            berger.setName(bergerName);
            berger.setTelefonnummer(bergerTelefon);
            personRepository.save(berger);

            netz.setBerger(berger);
            netz.setStatus(Status.BERGUNG_BEVORSTEHEND);
            geisternetzRepository.save(netz);
        }
        return "redirect:/bergung";
    }

    @PostMapping("/bergung/abschliessen")
    public String bergungAbschliessen(@RequestParam Long netzId) {
        Geisternetz netz = geisternetzRepository.findById(netzId).orElseThrow();

        if (netz.getStatus() == Status.BERGUNG_BEVORSTEHEND) {
            netz.setStatus(Status.GEBORGEN);
            geisternetzRepository.save(netz);
        }
        return "redirect:/bergung";
    }

    @PostMapping("/verschollen")
    public String netzVerschollen(@RequestParam Long netzId,
                                  @RequestParam String melderName,
                                  @RequestParam String melderTelefon) {
        Geisternetz netz = geisternetzRepository.findById(netzId).orElseThrow();

        boolean identifiziert = melderName != null && !melderName.isBlank()
                && melderTelefon != null && !melderTelefon.isBlank();

        if (identifiziert
                && (netz.getStatus() == Status.GEMELDET
                || netz.getStatus() == Status.BERGUNG_BEVORSTEHEND)) {
            Person melder = new Person();
            melder.setName(melderName);
            melder.setTelefonnummer(melderTelefon);
            personRepository.save(melder);

            netz.setVerschollenMelder(melder);
            netz.setStatus(Status.VERSCHOLLEN);
            geisternetzRepository.save(netz);
        }
        return "redirect:/bergung";
    }
}