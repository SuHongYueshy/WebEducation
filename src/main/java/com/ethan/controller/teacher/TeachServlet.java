package com.ethan.controller.teacher;

import com.alibaba.fastjson.JSON;
import com.ethan.entity.AllEntity;
import com.ethan.entity.Teach;
import com.ethan.entity.Teacher;
import com.ethan.factory.Factory;
import com.ethan.service.TeachService;
import com.ethan.service.TeacherService;
import com.ethan.utils.ResponseUtil;
import com.ethan.utils.StringUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/teach")
public class TeachServlet extends HttpServlet {
    Teach teach = Factory.getTeach();
    TeachService teachService = Factory.getTeachServiceInstance();
    Map<String, Object> map = new HashMap<String, Object>();
    String result = null;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        // 接收客户端信息

        String flagText = request.getParameter("flagText");

        if (flagText != null && flagText.equals("allTeach")) {
            String teach_teacherId=request.getParameter("teach_teacherId");
            String teach_courseId=request.getParameter("teach_courseId");
            String teach_itemId=request.getParameter("teach_itemId");

            if(StringUtil.isNotEmpty(teach_teacherId)) {
                teach.setTeach_teacherId(Integer.parseInt(teach_teacherId));
            } else {
                teach.setTeach_teacherId(-1);
            }

            if(StringUtil.isNotEmpty(teach_courseId)) {
                teach.setTeach_courseId(Integer.parseInt(teach_courseId));
            } else {
                teach.setTeach_courseId(-1);
            }

            if(StringUtil.isNotEmpty(teach_itemId)) {
                teach.setTeach_itemId(Integer.parseInt(teach_itemId));
            } else {
                teach.setTeach_itemId(-1);
            }

            String page=request.getParameter("page");
            String rows=request.getParameter("rows");

            List<AllEntity> allEntity = null;
            int total = 0;

            try {
                allEntity = teachService.allTeach(teach,Integer.parseInt(page),Integer.parseInt(rows));
                total = teachService.teachCount(teach);
            } catch (SQLException e) {
                e.printStackTrace();
            }


            map.put("rows", allEntity);
            map.put("total", total);


        } else if (flagText != null && flagText.equals("add")) {
            String teach_teacherId=request.getParameter("teach_teacherId");
            String teach_courseId=request.getParameter("teach_courseId");
            String teach_itemId=request.getParameter("teach_itemId");

            teach = new Teach(-1,Integer.parseInt(teach_teacherId),Integer.parseInt(teach_courseId),Integer.parseInt(teach_itemId));
            int code =0;

            try {
                code = teachService.addTeach(teach);
            } catch (SQLException e) {
                e.printStackTrace();
            }


            if (code > 0) {
                map.put("success", "true");
                map.put("msg", "添加成功！");
            } else {
                map.put("success", "false");
                map.put("msg", "添加失败，请重试！");
            }


        } else if (flagText != null && flagText.equals("update")) {
            String teach_id=request.getParameter("teach_id");
            String teach_teacherId=request.getParameter("teach_teacherId");
            String teach_courseId=request.getParameter("teach_courseId");
            String teach_itemId=request.getParameter("teach_itemId");


            teach = new Teach(Integer.parseInt(teach_id),Integer.parseInt(teach_teacherId),Integer.parseInt(teach_courseId),Integer.parseInt(teach_itemId));


            int code =0;

            try {
                code = teachService.updateTeach(teach);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            if (code > 0) {
                map.put("success", "true");
                map.put("msg", "修改成功！");
            } else {
                map.put("success", "false");
                map.put("msg", "修改失败，请重试！");
            }

        } else if (flagText != null && flagText.equals("delete")) {
            String delIds = request.getParameter("delIds");

            int delNums = 0;

            try {
                delNums = teachService.deleteTeach(delIds);
            } catch (SQLException e) {
                e.printStackTrace();
            }

            if (delNums > 0) {
                map.put("success", "true");
                map.put("msg", "删除成功！");
                map.put("delNums", delNums);
            } else {
                map.put("success", "false");
                map.put("msg", "删除失败，请重试！");
            }

        } else {
            response.sendRedirect("error");
        }

        result = JSON.toJSONString(map);
        map.clear();
        if (result != null) {
            try {
                ResponseUtil.write(response, result);
                result = null;
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return;

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
