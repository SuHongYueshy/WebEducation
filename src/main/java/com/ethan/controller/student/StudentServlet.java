package com.ethan.controller.student;

import com.alibaba.fastjson.JSON;
import com.ethan.entity.AllEntity;
import com.ethan.entity.Student;
import com.ethan.entity.User;
import com.ethan.factory.Factory;
import com.ethan.service.StudentService;
import com.ethan.service.impl.UserServiceImpl;
import com.ethan.utils.DateUtil;
import com.ethan.utils.ResponseUtil;
import com.ethan.utils.StringUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/student")
public class StudentServlet extends HttpServlet {
    Student student = Factory.getStudent();
    StudentService studentService = Factory.getStudentServiceInstance();
    Map<String, Object> map = new HashMap<String, Object>();
    String result = null;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        // 接收客户端信息

        String flagText = request.getParameter("flagText");

        if (flagText != null && flagText.equals("allStudent")) {
            String stu_num=request.getParameter("stu_num");
            String stu_name=request.getParameter("stu_name");
            String stu_sex=request.getParameter("stu_sex");
            String stu_deptId=request.getParameter("stu_deptId");
            String stu_bbirth=request.getParameter("stu_bbirth");
            String stu_ebirth=request.getParameter("stu_ebirth");
            String stu_address=request.getParameter("stu_address");
            String page=request.getParameter("page");
            String rows=request.getParameter("rows");

            List<AllEntity> allEntity = null;
            int total = 0;

            student.setStu_num(stu_num);
            student.setStu_name(stu_name);
            student.setStu_sex(stu_sex);
            student.setStu_address(stu_address);
            if (StringUtil.isNotEmpty(stu_deptId)) {
                student.setStu_deptId(Integer.parseInt(stu_deptId));
            } else {
                student.setStu_deptId(-1);
            }

            try {
                allEntity = studentService.allStudent(student,stu_bbirth,stu_ebirth,Integer.parseInt(page),Integer.parseInt(rows));
                total = studentService.stuCount(student,stu_bbirth,stu_ebirth);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            map.put("rows", allEntity);
            map.put("total", total);


        } else if (flagText != null && flagText.equals("add")) {
            String stu_num=request.getParameter("stu_num");
            String stu_name=request.getParameter("stu_name");
            String stu_sex=request.getParameter("stu_sex");
            String stu_birth=request.getParameter("stu_birth");
            String stu_address=request.getParameter("stu_address");
            String stu_type=request.getParameter("stu_type");
            String stu_deptId=request.getParameter("stu_deptId");
            String stu_stay=request.getParameter("stu_stay");
            String stu_phone=request.getParameter("stu_phone");
            String stu_photo=request.getParameter("stu_photo");

            int code =0;

            try {
                student = new Student(-1,stu_num,stu_name,stu_sex, DateUtil.formatString(stu_birth,"yyyy-MM-dd"),stu_address,Integer.parseInt(stu_deptId),stu_type,stu_stay,stu_phone,stu_photo);
                code = studentService.addStudent(student);
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
            String stu_id=request.getParameter("stu_id");
            String stu_num=request.getParameter("stu_num");
            String stu_name=request.getParameter("stu_name");
            String stu_sex=request.getParameter("stu_sex");
            String stu_birth=request.getParameter("stu_birth");
            String stu_address=request.getParameter("stu_address");
            String stu_type=request.getParameter("stu_type");
            String stu_deptId=request.getParameter("stu_deptId");
            String stu_stay=request.getParameter("stu_stay");
            String stu_phone=request.getParameter("stu_phone");
            String stu_photo=request.getParameter("stu_photo");

            int code =0;

            try {
                student = new Student(Integer.parseInt(stu_id),stu_num,stu_name,stu_sex, DateUtil.formatString(stu_birth,"yyyy-MM-dd"),stu_address,Integer.parseInt(stu_deptId),stu_type,stu_stay,stu_phone,stu_photo);
                code = studentService.updateStudent(student);
            } catch (Exception e) {
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
                delNums = studentService.deleteStudent(delIds);
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

        } else if (flagText != null && flagText.equals("allStudentList")) {
            List<AllEntity> students = null;

            try {
                students = studentService.allStudent(student,"","",0,0);
            } catch (SQLException e) {
                e.printStackTrace();
            }


            result = JSON.toJSONString(students);
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
