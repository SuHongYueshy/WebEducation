package com.ethan.controller.course;

import com.alibaba.fastjson.JSON;
import com.ethan.entity.AllEntity;
import com.ethan.entity.Course;
import com.ethan.entity.Teacher;
import com.ethan.factory.Factory;
import com.ethan.service.CourseService;
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

@WebServlet("/course")
public class CourseServlet extends HttpServlet {
    Course course = Factory.getCourse();
    CourseService courseService = Factory.getCourseServiceInstance();
    Map<String, Object> map = new HashMap<String, Object>();
    String result = null;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        // 接收客户端信息

        String flagText = request.getParameter("flagText");

        if (flagText != null && flagText.equals("allCourse")) {
            String course_num=request.getParameter("course_num");
            String course_name=request.getParameter("course_name");
            String course_type=request.getParameter("course_type");
            String course_exam=request.getParameter("course_exam");
            String page=request.getParameter("page");
            String rows=request.getParameter("rows");

            List<Course> courses = null;
            int total = 0;

            course = new Course(-1,course_num,course_name,course_type,course_exam,0,"");

            try {
                courses = courseService.allCourse(course,Integer.parseInt(page),Integer.parseInt(rows));
                total = courseService.courseCount(course);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            map.put("rows", courses);
            map.put("total", total);


        } else if (flagText != null && flagText.equals("add")) {
            String course_num=request.getParameter("course_num");
            String course_name=request.getParameter("course_name");
            String course_type=request.getParameter("course_type");
            String course_exam=request.getParameter("course_exam");
            String course_credit=request.getParameter("course_credit");
            String course_explain=request.getParameter("course_explain");

            course = new Course(-1,course_num,course_name,course_type,course_exam,Float.valueOf(course_credit),course_explain);
            int code =0;

            try {
                code = courseService.addCourse(course);
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
            String course_id=request.getParameter("course_id");
            String course_num=request.getParameter("course_num");
            String course_name=request.getParameter("course_name");
            String course_type=request.getParameter("course_type");
            String course_exam=request.getParameter("course_exam");
            String course_credit=request.getParameter("course_credit");
            String course_explain=request.getParameter("course_explain");

            course = new Course(Integer.parseInt(course_id),course_num,course_name,course_type,course_exam,Float.valueOf(course_credit),course_explain);
            int code =0;

            try {
                code = courseService.updateCourse(course);
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
                delNums = courseService.deleteCourse(delIds);
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

        } else if (flagText != null && flagText.equals("allCourseList")) {
            List<Course> courses = null;

            try {
                courses = courseService.allCourse(course,0,0);
            } catch (SQLException e) {
                e.printStackTrace();
            }


            result = JSON.toJSONString(courses);
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
