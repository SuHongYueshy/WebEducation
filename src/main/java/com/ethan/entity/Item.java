package com.ethan.entity;

/**
 * Created by zhangwenyu on 2018/12/14.
 */
public class Item {
    private int item_id =-1;
    private String item_name;

    public Item() {
    }

    public Item(int item_id, String item_name) {
        this.item_id = item_id;
        this.item_name = item_name;
    }

    public int getItem_id() {
        return item_id;
    }

    public void setItem_id(int item_id) {
        this.item_id = item_id;
    }

    public String getItem_name() {
        return item_name;
    }

    public void setItem_name(String item_name) {
        this.item_name = item_name;
    }

    @Override
    public String toString() {
        return "Item{" +
                "item_id=" + item_id +
                ", item_name='" + item_name + '\'' +
                '}';
    }
}
