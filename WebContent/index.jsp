<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="index.css">
<title>Struts2 Demo</title>
</head>
<body>
	<div id="body">
		<div id="helloworld" class="column">
			<div class="tit">
				<h3>Hello World</h3>
			</div>
			<div class="know">
				简要<br>
				Struts2 是一个用来开发 MVC 应用程序的框架. 它提供了 Web 应用程序开发过程中的一些常见问题的解决方案: <br>
					·对来自用户的输入数据进行合法性验证<br>
					·统一的布局<br>
					·可扩展性<br>
					·国际化和本地化<br>
					·支持 Ajax<br>
					·表单的重复提交<br>
					·文件的上传下载<br>
					·……………<br>
			</div>
			<div class="list">
				<ul>
					<li><a href="helloworld/helloworld.action">HelloWorld</a></li>
					<li><a href="helloworld/productAdd.jsp">添加商品</a></li>
				</ul>
			</div>
			<div class="clear"></div>
		</div>
		<div id="action" class="column">
			<div class="tit">
				<h3>Action</h3>
			</div>
			<div class="know">
				<h5>简要</h5>
				action: 应用程序可以完成的每一个操作. 例如: 显示一个登陆表单; 把产品信息保存起来<br>
				Action类: 普通的 Java 类, 可以有属性和方法, 同时必须遵守下面这些规则: <br>
					·属性的名字必须遵守与 JavaBeans 属性名相同的命名规则. 属性的类型可以是任意类型.从字符串到非字符串(基本数据库类型)之间的数据转换可以自动发生<br>
					·必须有一个不带参的构造器<br>
					·至少有一个供 struts 在执行这个 action 时调用的方法<br>
					·同一个 Action 类可以包含多个 action 方法. <br>
					·Struts2 会为每一个 HTTP 请求创建一个新的 Action 实例<br>
				<h5>访问web资源</h5>
					在 Action 中, 可以通过以下方式访问 web 的 HttpSession, HttpServletRequest,HttpServletResponse  等资源<br>
					·与 Servlet API 解耦的访问方式<br>
					&nbsp;&nbsp;为了避免与 Servlet API 耦合在一起, 方便 Action 做单元测试, Struts2 对 HttpServletRequest, HttpSession 和 ServletContext 进行了封装, 构造了 3 个 Map<br>
					&nbsp;&nbsp;对象来替代这 3 个对象, 在 Action 中可以直接使用 HttpServletRequest, HttpServletSession, ServletContext 对应的 Map 对象来保存和读取数据. <br>
					&nbsp;&nbsp;&nbsp;&nbsp;-通过 Action 实现如下接口<br>
					·与 Servlet API 耦合的访问方式<br>
					&nbsp;&nbsp;直接访问 Servlet API 将使 Action 与 Servlet 环境耦合在一起 , 测试时需要有 Servlet 容器 , 不便于对 Action 的单元测试 .<br>
					&nbsp;&nbsp;• 直接获取 HttpServletRequest 对象 :<br>
					&nbsp;&nbsp;&nbsp;&nbsp;– ServletActionContext.getRequest()<br>
					&nbsp;&nbsp;• 直接获取 HttpSession 对象<br>
					&nbsp;&nbsp;&nbsp;&nbsp;– ServletActionContext.getRequest().getSession()<br>
					&nbsp;&nbsp;• 直接获取 ServletContext 对象<br>
					&nbsp;&nbsp;&nbsp;&nbsp;– ServletActionContext.getServletContext()<br>
					&nbsp;&nbsp;• 通过实现对应的 XxxAware 接口<br>
					&nbsp;&nbsp;&nbsp;&nbsp;- 通过实现 ServletRequestAware, ServletContextAware 等接口的方式<br>
			</div>
			<div class="list">
				<ul>
					<li><a href="Action/ActionContextTest.jsp">ActionContextTest</a></li>
					<li><a href="Action/ActionContextForwardTest.jsp">ActionContextForwardTest</a></li>
					<li><a href="Action/ActionAwareTest.jsp">ActionAwareTest</a></li>
					<li><a href="Action/ActionAwareForwardTest.jsp">ActionAwareForwardTest</a></li>
					<li><a href="Action/ServletActionContextTest.jsp">ServetActionContextTest</a></li>
					<li><a href="Action/ServletActionContextForwardTest.jsp">ServetActionContextForwardTest</a></li>
					<li><a href="Action/ServletAwareTest.jsp">ServletAwareTest</a></li>
					<li><a href="Action/ServletAwareForwardTest.jsp">ServletAwareForwardTest</a></li>
				</ul>
			</div>
			<div class="clear"></div>
		</div>
		<div id="result" class="column">
			<div class="tit">
				<h3>Result</h3>
			</div>
			<div class="know">
				<h5>简要</h5>
				在struts2框架中，当action处理完之后，就应该向用户返回结果信息，该任务被分为两部分：结果类型和结果本身<br>
				结果本身：就是Action对应的method方法返回的值，通常是字符串，在struts2的ActionSupport中定义了几个常用的字符串<br>
				&nbsp;&nbsp;·ActionSupport实现了action接口，在该接口中定义常用的几个用于表示处理结果的字符串<br>
				&nbsp;&nbsp;&nbsp;&nbsp;-public static final String SUCCESS = "success";<br>
				&nbsp;&nbsp;&nbsp;&nbsp;-public static final String NONE = "none";<br>
				&nbsp;&nbsp;&nbsp;&nbsp;-public static final String ERROR = "error";<br>
				&nbsp;&nbsp;&nbsp;&nbsp;-public static final String INPUT = "input";<br>
				&nbsp;&nbsp;&nbsp;&nbsp;-public static final String LOGIN = "login";<br>
				结果类型：结果类型提供了返回给用户信息类型的实现细节。<br>
				&nbsp;&nbsp;·常用的结果类型<br>
				&nbsp;&nbsp;&nbsp;&nbsp;dispatcher	 org.apache.struts2.dispatcher.ServletDispatcherResult	 默认结果类型，用来呈现JSP页面<br>
				&nbsp;&nbsp;&nbsp;&nbsp;chain	 	com.opensymphony.xwork2.ActionChainResult	 将action和另外一个action链接起来<br>
				&nbsp;&nbsp;&nbsp;&nbsp;freemarker	 org.apache.struts2.views.freemarker.FreemarkerResult	 呈现Freemarker模板<br>
				&nbsp;&nbsp;&nbsp;&nbsp;httpheader	 org.apache.struts2.dispatcher.HttpHeaderResult	 返回一个已配置好的HTTP头信息响应<br>
				&nbsp;&nbsp;&nbsp;&nbsp;redirect	 org.apache.struts2.dispatcher.ServletRedirectResult	 将用户重定向到一个已配置好的URL<br>
				&nbsp;&nbsp;&nbsp;&nbsp;redirectAction	 org.apache.struts2.dispatcher.ServletActionRedirectResult	 将用户重定向到一个已定义好的action<br>
				&nbsp;&nbsp;&nbsp;&nbsp;stream	 org.apache.struts2.dispatcher.StreamResult	 将原始数据作为流传递回浏览器端，该结果类型对下载的内容和图片非常有用<br>
				&nbsp;&nbsp;&nbsp;&nbsp;velocity	 org.apache.struts2.dispatcher.VelocityResult	 呈现Velocity模板<br>
				&nbsp;&nbsp;&nbsp;&nbsp;xslt	 org.apache.struts2.views.xslt.XSLTResult	 呈现XML到浏览器，该XML可以通过XSL模板进行转换<br>
				&nbsp;&nbsp;&nbsp;&nbsp;plaintext	 org.apache.struts2.dispatcher.PlainTextResult	 返回普通文本类容<br>
				&nbsp;&nbsp;·常用的结果类型补充<br>
				&nbsp;&nbsp;&nbsp;&nbsp;redirect:action处理完后重定向到一个视图资源（如：jsp页面），请求参数全部丢失，action处理结果也全部丢失。<br>
				&nbsp;&nbsp;&nbsp;&nbsp;redirect-action:action处理完后重定向到一个action，请求参数全部丢失，action处理结果也全部丢失。<br>
				&nbsp;&nbsp;&nbsp;&nbsp;chain:action处理完后转发到一个action，请求参数全部丢失，action处理结果不会丢失。<br>
			</div>
			<div class="list">
				<ul>
					<li><a href="#">result</a></li>
				</ul>
			</div>
			<div class="clear"></div>
		</div>
	</div>
</body>
</html>