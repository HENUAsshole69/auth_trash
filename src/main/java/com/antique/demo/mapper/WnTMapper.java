package com.antique.demo.mapper;

import com.antique.demo.bean.WnTInfo;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface WnTMapper {
    void insertWnt(int antique_id,String wnt_info,String wnt_pic);
    WnTInfo getWnt(int antique_id);
}
