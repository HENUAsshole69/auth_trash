package com.antique.demo.service;



import com.antique.demo.bean.Individual;
import com.antique.demo.mapper.IndividualMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
@Transactional
public class IndividualServiceImpl implements IndividualService {
    @Autowired
    IndividualMapper individualMapper;


    @Override
    public Individual selectIndividualById(int antique_number) {
        return individualMapper.selectIndividualById(antique_number);
    }

    @Override
    public void insertNewIndividual(Individual individual) {
        individualMapper.insertNewIndividual(individual);
    }
}
