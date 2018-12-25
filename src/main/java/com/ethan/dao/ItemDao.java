package com.ethan.dao;

import com.ethan.entity.Item;

import java.sql.SQLException;
import java.util.List;

/**
 * Created by zhangwenyu on 2018/12/15.
 */
public interface ItemDao {

    public List<Item> allItemList() throws SQLException;
}
