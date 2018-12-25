<%--
  Created by IntelliJ IDEA.
  User: Ethan
  Date: 2018/12/6
  Time: 10:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <%
        // 权限验证
        if (session.getAttribute("currentUser") == null) {
            response.sendRedirect("index.jsp");
            return;
        }
    %>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/resources/jquery-easyui-1.6.10/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/default.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/resources/jquery-easyui-1.6.10/themes/icon.css">
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/resources/jquery-easyui-1.6.10/jquery.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/resources/jquery-easyui-1.6.10/jquery.easyui.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/resources/jquery-easyui-1.6.10/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/resources/js/print.js"></script>
    <%--<script type="text/javascript">--%>
    <%--</script>--%>
    <script type="text/javascript">
        var url;

        function formatTeacher(row) {
            return '<span class="item-text">' + row.teacher_num + "--" + row.teacher_name + '</span>';
        }
        function formatCourse(row) {
            return '<span class="item-text">' + row.course_num + "--" + row.course_name + '</span>';
        }


        function deleteTeach() {
            var selectedRows = $("#dg").datagrid('getSelections');
            if (selectedRows.length == 0) {
                $.messager.alert("系统提示", "请选择要删除的数据！");
                return;
            }
            var strIds = [];
            for (var i = 0; i < selectedRows.length; i++) {
                strIds.push(selectedRows[i].teach_id);
            }
            var ids = strIds.join(",");
            $.messager.confirm("系统提示", "您确认要删掉这<font color=red>" + selectedRows.length + "</font>条数据吗？", function (r) {
                if (r) {
                    $.post("teach", {delIds: ids, flagText: "delete"}, function (result) {
                        // var json = $.parseJSON(result);
                        if (result.success == "true") {
                            $.messager.alert("系统提示", "您已成功删除<font color=red>" + result.delNums + "</font>条数据！");
                            $("#dg").datagrid("reload");
                        } else {
                            $.messager.alert('系统提示', result.msg);
                        }
                    }, "json");
                }
            });
        }

        function searchTeach() {
            $('#dg').datagrid('load', {
                teach_teacherId: $('#f_teach_teacherId').combobox("getValue"),
                teach_courseId: $('#f_teach_courseId').combobox("getValue"),
                teach_itemId:$('#f_teach_itemId').combobox("getValue"),
            });
        }


        function openAddTeachDialog() {
            $('#teach_teacherId').combobox({
                valueField:'teacher_id',
                textField:'teacher_num',
                url:'teacher?flagText=allTeacherList'
            });
            $('#teach_courseId').combobox({
                valueField:'course_id',
                textField:'course_num',
                url:'course?flagText=allCourseList'
            });
            $("#dlg").dialog("open").dialog("setTitle", "添加授课信息");
            resetValue();
            url = "teach?flagText=add";
        }

        function saveTeach() {
            $("#fm").form("submit", {
                url: url,
                onSubmit: function () {
                    if($('#teach_teacherId').combobox("getValue")==""){
                        $.messager.alert("系统提示","请选择教师");
                        return false;
                    }

                    if($('#teach_courseId').combobox("getValue")==""){
                        $.messager.alert("系统提示","请选择课程");
                        return false;
                    }

                    if ($('#teach_itemId').combobox("getValue") == "" || $('#teach_itemId').combobox("getValue") == -1 ) {
                        $.messager.alert("系统提示", "请选择授课时间");
                        return false;
                    }

                    return $(this).form("validate");
                },

                success: function (result) {
                    var json = $.parseJSON(result);
                    console.info(json)
                    if (json.success == "false") {
                        $.messager.alert("系统提示", json.msg);
                        return;
                    } else {
                        $.messager.alert("系统提示", json.msg);
                        resetValue();
                        $("#dlg").dialog("close");
                        $("#dg").datagrid("reload");
                    }
                }
            });
        }

        function resetValue() {
            $("#teach_teacherId").combobox("setValue", "");
            $("#teach_courseId").combobox("setValue", "");
            $("#teach_itemId").combobox("setValue", "");
        }

        function closeDialog() {
            $("#dlg").dialog("close");
            resetValue();
        }

        function openUpdateTeachDialog() {
            $('#teach_teacherId').combobox({
                valueField:'teacher_id',
                textField:'teacher_num',
                url:'teacher?flagText=allTeacherList'
            });
            $('#teach_courseId').combobox({
                valueField:'course_id',
                textField:'course_num',
                url:'course?flagText=allCourseList'
            });
            var selectedRows = $("#dg").datagrid('getSelections');
            if (selectedRows.length != 1) {
                $.messager.alert("系统提示", "请选择一条要编辑的数据！");
                return;
            }
            var row = selectedRows[0];
            $("#dlg").dialog("open").dialog("setTitle", "编辑授课信息");
            $("#fm").form("load", row);

            url = "teach?flagText=update&teach_id=" + row.teach_id;
        }
    </script>
</head>
<body>
<table id="dg" title="授课信息" class="easyui-datagrid" fitColumns="true"
       pagination="true" url="teach?flagText=allTeach" fit="true"  toolbar="#tb" >
    <thead>
    <tr>
        <th field="cb" checkbox="true"></th>
        <th field="teach_id" width="50" align="center"  hidden="true">编号</th>
        <th field="teach_teacherId" width="50" align="center"  hidden="true">教师编号</th>
        <th field="teacher_num" width="50" align="center" >教师编号</th>
        <th field="teacher_name" width="50" align="center" >教师姓名</th>
        <th field="teach_courseId" width="50" align="center"  hidden="true">课程编号</th>
        <th field="course_num" width="50" align="center">课程编号</th>
        <th field="course_name" width="50" align="center">课程名称</th>
        <th field="teach_itemId" width="50" align="center" hidden="true">学期编号</th>
        <th field="item_name" width="50" align="center">授课时间</th>
    </tr>
    </thead>
</table>

<div id="tb" align="center">
    <div>
        <a href="javascript:openAddTeachDialog()" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加授课信息</a>
        <a href="javascript:openUpdateTeachDialog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改授课信息</a>
        <a href="javascript:deleteTeach()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除授课信息</a>
        <a href="javascript:(0)" class="easyui-linkbutton" iconCls="icon-print" plain="true" onclick="CreateFormPage('打印授课信息',$('#dg'),'授课信息打印')">统计打印</a>
    </div>
    <div>
        &nbsp;教师：&nbsp;
        <input class="easyui-combobox" name="f_teach_teacherId" id="f_teach_teacherId" size="20"
               data-options="panelHeight:'auto',valueField:'teacher_id',textField:'teacher_num',url:'teacher?flagText=allTeacherList',formatter:formatTeacher"/>

        &nbsp;课程：&nbsp;
        <input class="easyui-combobox" name="f_teach_courseId" id="f_teach_courseId" size="20"
               data-options="panelHeight:'auto' , valueField:'course_id',textField:'course_num',url:'course?flagText=allCourseList',formatter:formatCourse"/>
        &nbsp;授课时间：&nbsp;<input class="easyui-combobox" name="f_teach_itemId" id="f_teach_itemId" size="20"
                              data-options="panelHeight:'auto',editable:false,valueField:'item_id',textField:'item_name',url:'item?flagText=allItemList'"/>
        <a href="javascript:searchTeach()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a></div>
</div>

<div id="dlg" class="easyui-dialog" style="width: 450px;height: 350px;padding: 10px 20px"
     closed="true" buttons="#dlg-buttons">
    <form id="fm" method="post">
        <table cellspacing="10px;">
            <tr>
                <td>教师：</td>
                <td><input class="easyui-combobox" name="teach_teacherId" id="teach_teacherId" size="20"
                       data-options="panelHeight:'auto',valueField:'teacher_id',textField:'teacher_num',url:'teacher?flagText=allTeacherList',formatter:formatTeacher"/>
                </td>
            </tr>
            <tr>
                <td>课程：</td>
                <td><input class="easyui-combobox" name="teach_courseId" id="teach_courseId" size="20"
                           data-options="panelHeight:'auto' , valueField:'course_id',textField:'course_num',url:'course?flagText=allCourseList',formatter:formatCourse"/>
                </td>
            </tr>
            <tr>
                <td>授课时间：</td>
                <td><input class="easyui-combobox" name="teach_itemId" id="teach_itemId" size="20"
                           data-options="panelHeight:'auto',editable:false,valueField:'item_id',textField:'item_name',url:'item?flagText=allItemList'"/>
                </td>
            </tr>
        </table>
    </form>
</div>

<div id="dlg-buttons">
    <a href="javascript:saveTeach()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
    <a href="javascript:closeDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
</div>
</body>
</html>
