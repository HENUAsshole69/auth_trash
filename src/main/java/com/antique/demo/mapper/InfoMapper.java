package com.antique.demo.mapper;





import com.antique.demo.bean.Info;
import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface InfoMapper {
    void insertInfo(Info info);
    void insertNewInfo(String antique_number_in);
}
