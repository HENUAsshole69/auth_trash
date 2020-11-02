package com.antique.demo.mapper;





import com.antique.demo.bean.Antique;
import com.antique.demo.bean.User;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;


@Mapper
public interface UserMapper {
    List<User> selectAllUser();
    User selectUserByUsername(String user_username);
    List<User> searchByUsername(String UserOrAntiqueName);
}
