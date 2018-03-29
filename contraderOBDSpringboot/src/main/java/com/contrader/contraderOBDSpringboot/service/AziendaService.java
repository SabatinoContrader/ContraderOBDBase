package com.contrader.contraderOBDSpringboot.service;

import com.contrader.contraderOBDSpringboot.dao.AziendaRepository;
import com.contrader.contraderOBDSpringboot.model.AziendaEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class AziendaService {

    private AziendaRepository aziendaRepository;

    @Autowired
    public AziendaService(AziendaRepository aziendaRepository) {
        this.aziendaRepository = aziendaRepository;
    }

    public long countAll () {

    return this.aziendaRepository.count();
    }

    public List<AziendaEntity> findAll() {
        return this.aziendaRepository.findAll();
    }

    public List<AziendaEntity> findByCitta(String citta) {
        return this.aziendaRepository.findByCitta(citta);
    }
}

