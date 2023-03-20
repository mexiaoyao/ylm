package com;

import com.mapper.GradeDictMapper;
import com.model.GradeDict;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
class YlmApplicationTests {

    @Test
    void contextLoads() {
    }

    @Autowired
    private GradeDictMapper gradeDictMapper;

    @Test
    public void testSelect() {
        System.out.println("----- selectAll method test ------");
        List<GradeDict> userList = gradeDictMapper.selectList(null);
        userList.forEach(System.out::println);
    }

}
