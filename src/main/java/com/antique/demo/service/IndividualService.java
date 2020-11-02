package com.antique.demo.service;



import com.antique.demo.bean.Individual;
import com.antique.demo.mapper.IndividualMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
@Transactional
public class IndividualService  {
    @Autowired
    IndividualMapper individualMapper;



    public Individual selectIndividualById(int antique_number) {
        return individualMapper.selectIndividualById(antique_number);
    }


    public void insertNewIndividual(Individual individual) {
        individualMapper.insertNewIndividual(individual);
    }
}
