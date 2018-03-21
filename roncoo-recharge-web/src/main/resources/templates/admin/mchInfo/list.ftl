<#include "/macro/base.ftl" />
<div class="bjui-pageHeader">
	<form id="pagerForm" data-toggle="ajaxsearch" action="${base}/admin/mchInfo/list" method="post">
		<@pageHeadr />
		<div class="bjui-searchBar">
			<label>商户名称：</label>
			<input type="text" name="infoName" value="" class="form-control" size="10">&nbsp;
			
			<button type="submit" class="btn-default" data-icon="search">查询</button>&nbsp;
			<a class="btn btn-orange" href="javascript:;" data-toggle="reloadsearch" data-clear-query="true" data-icon="undo">清空查询</a>
			
			<br />
			<br />
			<a href="${base}/admin/mchInfo/add" class="btn btn-default" data-toggle="dialog" data-icon="plus" data-id="mchInfo-add" data-options="{title:'添加', height:200}">添加 </a>
		</div>
	</form>
</div>
<div class="bjui-pageContent tableContent">
	<table class="table table-bordered table-hover table-top" data-toggle="tablefixed" data-selected-multi="true">
		<thead>
			<tr>
				<th width="30">序号</th>
				<th>商户名称</th>
				<th>商户类型</th>
				<th>ClientId</th>
				<th>状态</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<#if page??>
			<#list page.list as bean>
			<tr>
				<td align="center">${bean_index+1}</td>
				<td>${bean.infoName}</td>
				<td>
				<#list infoTypeEnums as infoType>
                    <#if bean.infoType == infoType.code>${infoType.desc}</#if>
                </#list>
                </td>
				<td>${bean.clientId}</td>
				<td>
				<#list statusIdEnums as statusId>
                    <#if bean.statusId == statusId.code>${statusId.desc}</#if>
                </#list>
                </td>
				<td>
					<a href="${base}/admin/mchInfo/view?id=${bean.id}" class="btn btn-blue" data-toggle="dialog" data-id="mchInfo-view" data-options="{title:'查看', height:300}">查看 </a>
					<a href="${base}/admin/mchInfo/edit?id=${bean.id}" class="btn btn-green" data-toggle="dialog" data-id="mchInfo-edit" data-options="{title:'修改', height:200}">修改 </a>
					<a href="${base}/admin/mchInfo/delete?id=${bean.id}" class="btn btn-red" data-toggle="doajax" data-id="mchInfo-delete" data-confirm-msg="确定要删除吗？">删除</a>
				    <a href="${base}/admin/mchInfoProduct/list?mchInfoId=${bean.id}" class="btn btn-green" data-toggle="navtab" data-id="admin-mchInfoProduct">设置支付产品 </a>
				</td>
			</tr>
			</#list>
			</#if>
		</tbody>
	</table>
</div>
<@pageFooter />
