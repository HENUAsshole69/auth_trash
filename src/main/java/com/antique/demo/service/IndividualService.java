package com.antique.demo.service;



import com.antique.demo.bean.Individual;


public interface IndividualService {
    Individual selectIndividualById(int antique_number);
    void insertNewIndividual(Individual individual);
}
