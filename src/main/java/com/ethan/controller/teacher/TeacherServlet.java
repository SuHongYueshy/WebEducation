package com.ethan.controller.teacher;

import com.alibaba.fastjson.JSON;
import com.ethan.entity.AllEntity;
import com.ethan.entity.Student;
import com.ethan.entity.Teacher;
import com.ethan.factory.Factory;
import com.ethan.service.StudentService;
import com.ethan.service.TeacherService;
import com.ethan.utils.DateUtil;
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

@WebServlet("/teacher")
public class TeacherServlet extends HttpServlet {
    Teacher teacher = Factory.getTeacher();
    TeacherService teacherService = Factory.getTeacherServiceInstance();
    Map<String, Object> map = new HashMap<String, Object>();
    String result = null;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        // 接收客户端信息

        String flagText = request.getParameter("flagText");

        if (flagText != null && flagText.equals("allTeacher")) {
            String teacher_num=request.getParameter("teacher_num");
            String teacher_name=request.getParameter("teacher_name");
            String teacher_sex=request.getParameter("teacher_sex");
            String teacher_deptId=request.getParameter("teacher_deptId");
            String teacher_pro=request.getParameter("teacher_pro");

            String page=request.getParameter("page");
            String rows=request.getParameter("rows");

            List<AllEntity> allEntity = null;
            int total = 0;

            teacher = new Teacher(-1,teacher_num,teacher_name,teacher_sex,teacher_pro,-1);
            if (StringUtil.isNotEmpty(teacher_deptId)) {
                teacher.setTeacher_deptId(Integer.parseInt(teacher_deptId));
            } else {
                teacher.setTeacher_deptId(-1);
            }

            try {
                allEntity = teacherService.allTeacher(teacher,Integer.parseInt(page),Integer.parseInt(rows));
                total = teacherService.teacherCount(teacher);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            map.put("rows", allEntity);
            map.put("total", total);


        } else if (flagText != null && flagText.equals("add")) {
            String teacher_num=request.getParameter("teacher_num");
            String teacher_name=request.getParameter("teacher_name");
            String teacher_sex=request.getParameter("teacher_sex");
            String teacher_pro=request.getParameter("teacher_pro");
            String teacher_deptId=request.getParameter("teacher_deptId");

            teacher = new Teacher(-1,teacher_num,teacher_name,teacher_sex,teacher_pro,Integer.parseInt(teacher_deptId));

            int code =0;

            try {
                code = teacherService.addTea(teacher);
            } catch (Exception e) {
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
            String teacher_id=request.getParameter("teacher_id");
            String teacher_num=request.getParameter("teacher_num");
            String teacher_name=request.getParameter("teacher_name");
            String teacher_sex=request.getParameter("teacher_sex");
            String teacher_pro=request.getParameter("teacher_pro");
            String teacher_deptId=request.getParameter("teacher_deptId");

            teacher = new Teacher(Integer.parseInt(teacher_id),teacher_num,teacher_name,teacher_sex,teacher_pro,Integer.parseInt(teacher_deptId));
            int code =0;

            try {
                code = teacherService.updateTea(teacher);
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
                delNums = teacherService.deleteTea(delIds);
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

        } else if (flagText != null && flagText.equals("allTeacherList")) {
            List<AllEntity> teachers = null;

            teacher = new Teacher();

            try {
                teachers = teacherService.allTeacher(teacher,0,0);
            } catch (SQLException e) {
                e.printStackTrace();
            }


            result = JSON.toJSONString(teachers);
            if (result != null) {
                try {
                    ResponseUtil.write(response, result);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }

            return;

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
