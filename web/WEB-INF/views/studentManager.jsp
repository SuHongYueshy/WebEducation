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

        function formatImg(val, row) {
            if (val) {
                return '<img src='+val+' style=width:50px;height:50px;>';
            } else {
                return '<img src='+"${pageContext.request.contextPath}/upload/images/stu.jpg"+'  style=width:50px;height:50px;>';
            }
        }
        function formatStay(val, row) {
            if (val == 1) {
                return '是';
            } else {
                return '否';
            }
        }


        function deleteStudent() {
            var selectedRows = $("#dg").datagrid('getSelections');
            if (selectedRows.length == 0) {
                $.messager.alert("系统提示", "请选择要删除的数据！");
                return;
            }
            var strIds = [];
            for (var i = 0; i < selectedRows.length; i++) {
                strIds.push(selectedRows[i].stu_id);
            }
            var ids = strIds.join(",");
            $.messager.confirm("系统提示", "您确认要删掉这<font color=red>" + selectedRows.length + "</font>条数据吗？", function (r) {
                if (r) {
                    $.post("student", {delIds: ids, flagText: "delete"}, function (result) {
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

        function searchStudent() {
            $('#dg').datagrid('load', {
                stu_num: $('#f_stu_num').val(),
                stu_name: $('#f_stu_name').val(),
                stu_sex:$('#f_stu_sex').combobox("getValue"),
                stu_bbirth:$('#f_stu_bbirth').datebox("getValue"),
                stu_ebirth:$('#f_stu_ebirth').datebox("getValue"),
                stu_deptId:$('#f_stu_deptId').combobox("getValue"),
                stu_address:$('#f_stu_address').combobox("getValue")
            });
        }


        function openAddStudentDialog() {
            $('#stu_deptId').combobox({
                valueField:'dept_id',
                textField:'dept_name',
                url:'dept?flagText=allDeptList'
            });
            $("#dlg").dialog("open").dialog("setTitle", "添加学生");
            resetValue();
            url = "student?flagText=add";
        }

        function saveStudent() {
            $("#fm").form("submit", {
                url: url,
                onSubmit: function () {



                    if($('#stu_sex').combobox("getValue")==""){
                        $.messager.alert("系统提示","请选择性别");
                        return false;
                    }

                    if ($('#stu_birth').datebox("getValue").toString() > (new Date().getFullYear() + "-" + (new Date().getMonth() + 1) + "-" + (new Date().getDate()))) {
                        $.messager.alert("系统提示", "不能使用未来日期");
                        return false;
                    }

                    if($('#stu_address').combobox("getValue") == ""){
                        $.messager.alert("系统提示","请选择生源地");
                        return false;
                    }

                    if($('#stu_type').combobox("getValue")==""){
                        $.messager.alert("系统提示","请选择政治面貌");
                        return false;
                    }

                    if ($('#stu_deptId').combobox("getValue") == -1 || $('#stu_deptId').combobox("getValue") == "") {
                        $.messager.alert("系统提示", "请选择院系");
                        return false;
                    }

                    if($('#stu_stay').combobox("getValue") == ""){
                        $.messager.alert("系统提示","请选择是否住宿");
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
            $("#stu_num").val("");
            $("#stu_name").val("");
            $("#stu_address").val("");
            $("#stu_sex").combobox("setValue", "");
            $("#stu_deptId").combobox("setValue", "");
            $("#stu_stay").combobox("setValue", "");
            $("#stu_type").combobox("setValue", "");
            $("#stu_phone").val("");
            $("#stu_photo").val("");
            $("#stu_address").combobox("setValue", "");
            $("#stu_birth").datebox("setValue", "");

        }

        function closeDialog() {
            $("#dlg").dialog("close");
            resetValue();
        }

        function openUpdateStudentDialog() {
            $('#stu_deptId').combobox({
                valueField:'dept_id',
                textField:'dept_name',
                url:'dept?flagText=allDeptList'
            });
            var selectedRows = $("#dg").datagrid('getSelections');
            if (selectedRows.length != 1) {
                $.messager.alert("系统提示", "请选择一条要编辑的数据！");
                return;
            }
            var row = selectedRows[0];
            $("#dlg").dialog("open").dialog("setTitle", "编辑学生信息");
            $("#fm").form("load", row);

            url = "student?flagText=update&stu_id=" + row.stu_id;
        }
    </script>
</head>
<body>
<table id="dg" title="学生信息" class="easyui-datagrid" fitColumns="true"
       pagination="true" url="student?flagText=allStudent" fit="true"  toolbar="#tb" >
    <thead>
    <tr>
        <th field="cb" checkbox="true"></th>
        <th field="stu_id" width="50" align="center" hidden="true">编号</th>
        <th field="stu_num" width="50" align="center">学号</th>
        <th field="stu_name" width="50" align="center">姓名</th>
        <th field="stu_sex" width="50" align="center">性别</th>
        <th field="stu_birth" width="50" align="center">出生日期</th>
        <th field="stu_address" width="50" align="center">生源地</th>
        <th field="stu_deptId" width="50" align="center" hidden="true">院系编号</th>
        <th field="dept_name" width="50" align="center">院系</th>
        <th field="stu_type" width="50" align="center">政治面貌</th>
        <th field="stu_stay" width="50" align="center" data-options="formatter:formatStay">是否住宿</th>
        <th field="stu_phone" width="50" align="center">电话</th>
        <th field="stu_photo" width="60" align="center" data-options="formatter:formatImg">照片</th>

    </tr>
    </thead>
</table>

<div id="tb" align="center">
    <div>
        <a href="javascript:openAddStudentDialog()" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加学生</a>
        <a href="javascript:openUpdateStudentDialog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改学生</a>
        <a href="javascript:deleteStudent()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除学生</a>
        <a href="javascript:(0)" class="easyui-linkbutton" iconCls="icon-print" plain="true" onclick="CreateFormPage('打印学生',$('#dg'),'学生打印')">统计打印</a>
    </div>
    <div>&nbsp;学号：&nbsp;<input type="text" name="f_stu_num" id="f_stu_num" size="5"/>
        &nbsp;姓名：&nbsp;<input type="text" name="f_stu_name" id="f_stu_name" size="5"/>
        &nbsp;性别：&nbsp;
        <select class="easyui-combobox" id="f_stu_sex" name="f_stu_sex" editable="false" panelHeight="auto" size="10">
            <option value="">请选择...</option>
            <option value="男">男</option>
            <option value="女">女</option>
        </select>
        &nbsp;生源地：&nbsp;
        <td><select id='f_stu_address' name='f_stu_address' size="5" class='easyui-combobox' >
            <option value=''>(无)</option>
            <option value='北京市' >北京市</option>
            <option value='天津市' >天津市</option>
            <option value='上海市' >上海市</option>
            <option value='重庆市' >重庆市</option>
            <option value='河北' >河北</option>
            <option value='山西' >山西</option>
            <option value='台湾' >台湾</option>
            <option value='辽宁' >辽宁</option>
            <option value='吉林' >吉林</option>
            <option value='黑龙江' >黑龙江</option>
            <option value='江苏' >江苏</option>
            <option value='浙江' >浙江</option>
            <option value='安徽' >安徽</option>
            <option value='福建' >福建</option>
            <option value='江西' >江西</option>
            <option value='山东' >山东</option>
            <option value='河南' >河南</option>
            <option value='湖北' >湖北</option>
            <option value='湖南' >湖南</option>
            <option value='广东' >广东</option>
            <option value='甘肃' >甘肃</option>
            <option value='四川' >四川</option>
            <option value='贵州' >贵州</option>
            <option value='海南' >海南</option>
            <option value='云南' >云南</option>
            <option value='青海' >青海</option>
            <option value='陕西' >陕西</option>
            <option value='广西' >广西</option>
            <option value='西藏' >西藏</option>
            <option value='宁夏' >宁夏</option>
            <option value='新疆' >新疆</option>
            <option value='内蒙古' >内蒙古</option>
            <option value='澳门特别行政区' >澳门特别行政区</option>
            <option value='香港特别行政区' >香港特别行政区</option>
        </select></td>
        &nbsp;出生日期：&nbsp;<input class="easyui-datebox" name="f_stu_bbirth" id="f_stu_bbirth"size="10"/>-><input class="easyui-datebox" name="f_stu_ebirth" id="f_stu_ebirth"  size="10"/>
        &nbsp;院系：&nbsp;<input class="easyui-combobox" name="f_stu_deptId" id="f_stu_deptId" size="10"
                              data-options="panelHeight:'auto',editable:false,valueField:'dept_id',textField:'dept_name',url:'dept?flagText=allDeptList'"/>
        <a href="javascript:searchStudent()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a></div>
</div>

<div id="dlg" class="easyui-dialog" style="width: 650px;height: 350px;padding: 10px 20px"
     closed="true" buttons="#dlg-buttons">
    <form id="fm" method="post">
        <table cellspacing="10px;">
            <tr>
                <td>学号：</td>
                <td><input type="text" name="stu_num" id="stu_num" class="easyui-validatebox" required="true"/></td>
                <td>姓名：</td>
                <td><input type="text" name="stu_name" id="stu_name" class="easyui-validatebox" required="true"/></td>
            </tr>
            <tr>
                <td>性别：</td>
                <td><select class="easyui-combobox" id="stu_sex" name="stu_sex" editable="false" panelHeight="auto" style="width: 155px"  required="true">
                    <option value="">请选择...</option>
                    <option value="男">男</option>
                    <option value="女">女</option>
                </select></td>
                <td>出生日期：</td>
                <td><input class="easyui-datebox" name="stu_birth" id="stu_birth" required="true" editable="false" /></td>
            </tr>
            <tr>
                <td>生源地：</td>
                <td><select id='stu_address' name='stu_address' size="5" class='easyui-combobox' required="true" editable="false">
                <option value=''>(无)</option>
                <option value='北京市' >北京市</option>
                <option value='天津市' >天津市</option>
                <option value='上海市' >上海市</option>
                <option value='重庆市' >重庆市</option>
                <option value='河北' >河北</option>
                <option value='山西' >山西</option>
                <option value='台湾' >台湾</option>
                <option value='辽宁' >辽宁</option>
                <option value='吉林' >吉林</option>
                <option value='黑龙江' >黑龙江</option>
                <option value='江苏' >江苏</option>
                <option value='浙江' >浙江</option>
                <option value='安徽' >安徽</option>
                <option value='福建' >福建</option>
                <option value='江西' >江西</option>
                <option value='山东' >山东</option>
                <option value='河南' >河南</option>
                <option value='湖北' >湖北</option>
                <option value='湖南' >湖南</option>
                <option value='广东' >广东</option>
                <option value='甘肃' >甘肃</option>
                <option value='四川' >四川</option>
                <option value='贵州' >贵州</option>
                <option value='海南' >海南</option>
                <option value='云南' >云南</option>
                <option value='青海' >青海</option>
                <option value='陕西' >陕西</option>
                <option value='广西' >广西</option>
                <option value='西藏' >西藏</option>
                <option value='宁夏' >宁夏</option>
                <option value='新疆' >新疆</option>
                <option value='内蒙古' >内蒙古</option>
                <option value='澳门特别行政区' >澳门特别行政区</option>
                <option value='香港特别行政区' >香港特别行政区</option>
            </select></td>
                <td>政治面貌：</td>
                <td><select class="easyui-combobox" id="stu_type" name="stu_type" editable="false" panelHeight="auto" style="width: 155px"  required="true">
                    <option value="">请选择...</option>
                    <option value="群众">群众</option>
                    <option value="团员">团员</option>
                    <option value="预备党员">预备党员</option>
                    <option value="党员">党员</option>
                </select>
                </td>
            </tr>
            <tr>
                <td>院系：</td>
                <td><input class="easyui-combobox" name="stu_deptId" id="stu_deptId" size="15"  required="true"
                           data-options="panelHeight:'auto',editable:false,valueField:'dept_id',textField:'dept_name',url:'dept?flagText=allDeptList'"/>
                </td>
                <td>是否住宿：</td>
                <td><select class="easyui-combobox" id="stu_stay" name="stu_stay" editable="false" panelHeight="auto" style="width: 155px" required="true">
                    <option value="">请选择...</option>
                    <option value="1">是</option>
                    <option value="0">否</option>
                </select></td>
            </tr>
            <tr>
                <td>电话：</td>
                <td><input type="text" name="stu_phone" id="stu_phone" class="easyui-validatebox"/></td>
                <td>照片：</td>
                <td><input type="text" name="stu_photo" id="stu_photo" class="easyui-validatebox"/></td>
            </tr>
        </table>
    </form>
</div>

<div id="dlg-buttons">
    <a href="javascript:saveStudent()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
    <a href="javascript:closeDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
</div>
</body>
</html>
