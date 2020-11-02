package com.antique.demo.mapper;



import com.antique.demo.bean.Individual;
import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface IndividualMapper {
    Individual selectIndividualById(int antique_number);
    void insertNewIndividual(Individual individual);
}
