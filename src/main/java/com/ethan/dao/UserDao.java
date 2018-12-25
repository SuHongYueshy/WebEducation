package com.ethan.dao;

import com.ethan.entity.User;

import java.sql.SQLException;

/**
 * Created by zhangwenyu on 2018/12/14.
 */
public interface UserDao {
    public User login(User user) throws SQLException;
}
