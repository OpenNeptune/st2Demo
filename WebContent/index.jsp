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
		<div id="ognl" class="column">
			<div class="tit">
				<h3>ValueStack(objectStack/ContextMAP)OGNL</h3>
			</div>
			<div class="know">
				<h5>值栈简要及作用</h5>
				struts2的Action中可以通过属性获取所有相关Web资源值，如请求阐述，Action配置参数等信息。<br>
				在这个过程中我们所做的事情就是在Action类中声明与参数同名的属性，在struts调用Action类的方法的时候，<br>
				就会为这些属性赋值。<br>
				为了完成这个功能，struts2引入了一个核心对象ValueStack，它是一个类似于栈的对象。<br>
				这个对象贯穿整个Action的生命周期，并且Action类的一个实例就用拥有一个ValueStack对象，<br>
				即保证其实显示线程安全的。在ValueStack中保存这当前Action对象和其他相关对象。<br>
				Struts框架把ValueStack对象保存在名为struts.valueStack的请求属性中。<br>
				当struts2接受到一个请求的后，会先建立Action类对象的实例，但并不会调用相应的Action方法，<br>
				而是现将Action类的相关属性放到valueStack对象的顶层，只是所有的值都是默认值，<br>
				里让String类型的默认值是null,int类型的为0,处理完以上的工作后，struts2就会调用拦截器，<br>
				当调用完所有的拦截器，会将Valuestack对象顶层的属性值赋值给Action中相对应的属性，<br>
				最后就会调用Action的Action方法。<br>
				在Struts 2的的Action类可以获得与属性同名的参数值就是通过不同的拦截器来处理的，<br>
				如获得请求参数的拦截器是params，获得Action的配置参数的拦 截器是staticParams等。<br>
				在这些拦截器内部读取相应的值，并更新ValueStack对象顶层节点的相应属性的值。<br>
				而ValueStack对象 就象一个传送带，将属性值从一个拦截器传到了另一个拦截器（当然，在这其间，属性值可能改变），<br>
				最后会传到Action对象，并将ValueStack对 象中的属性的值终值赋给Action类的相应属性 。<br>
			<h5>获取值栈对象</h5>
				在Action中或拦截器中可以通过ActionContext获取值栈对象。<br>
				//1. 获取值栈<br>
				ValueStack valueStack = ActionContext.getContext().getValueStack();<br>
			<h5>值栈的组成</h5>
				值栈分为俩部分组成：Map栈 和 对象栈<br>
			<h5>Map栈</h5>
				map栈是OgnlContext类型，是个Map。struts把各种各样的映射关系压入栈中，实际上就是对ActionContext的一个引用。<br>
			struts会把下面的这些映射压入到ContextMap中<br>
			&nbsp;&nbsp;- paramerters:该Map中包含当前请求的请求参数<br>
			&nbsp;&nbsp;- request:该Map中包含当前request对象中的所有属性<br>
			&nbsp;&nbsp;- session:该map中包含当前session对象中的所有属性<br>
			&nbsp;&nbsp;- application：该map中包含当前application对象中的所有属性<br>
			&nbsp;&nbsp;- attr:该map安顺序request,session,application检索某个属性<br>
			<h5>对象栈</h5>
				objectStack：struts把action和相关对象压入objectstack中。<br>
			<h5>OGNL</h5>
				OGNL是object-graph navigation language的缩写，全称为对象导航语言，是一种功能强大的表达式语言，<br>
				它通过简单一致的语法，可以任意存取对象的属性或者调用对象的方法，能够遍历整个对象的结构，实现对象属性类型的转换等功能。<br>
				OGNL实际上就围绕一个Map对象进行表达式计算,由ognl.OgnlContext类表示，它里面可以存放很多个JavaBean对象。<br>
				在struts中如该希望访问ContextMap中的数据，需要给OGNL表达式加上一个前缀字符#,如果没有前缀字符#，搜索将在ObjectStatck里进行。<br>
			<h5>读取ObjectStack里的对象的属性</h5>
				若想访问ObjectStack里的某个对象的属性，可以使用以下几种形式：<br>
			&nbsp;&nbsp;- object.propertyName   *<br>
			&nbsp;&nbsp;- object['propertyName']<br>
			&nbsp;&nbsp;- object[“propertyName”]<br>
				ObjectStack里的对象可以通过一个从零开始的下标来引用。ObjectStack里的栈顶对象可以用[0]来引用，它下面的那个对象可以用[1]引用。<br>
				若在指定的对象里面没有找到指定的属性，则到指定对象的下一个对象里继续搜索。即[N]的含义是从第n个开始搜索，而不是只搜索第n个对象。<br>
				若从栈顶对象开始搜索，则可以省略下标部分。<br>
			<h5>读取ContextMap里的对象属性</h5>
				若想访问ContextMap里的某个对象的属性，可以使用以下几种形式<br>
			&nbsp;&nbsp;- #object.propertyName *<br>
			&nbsp;&nbsp;- #object['propertyName']<br>
			&nbsp;&nbsp;- #object[“propertyName”]<br>
				例如：<br>
					返回session中的code属性:#session.code<br>
					返回request中的customer属性的name属性:#request.customer.name<br>
					返回域对象(按request，session,application的顺序)的lastAccessDate属性:#attr.lastAccessDate<br>
			<h5>实现原理</h5>
			原理 : Struts2  将包装  HttpServletRequest  对象后的  org.apache.struts2.dispatcher.StrutsRequestWrapper  对象传到页面上 ,  而这个类重写了  getAttribute()  方法 . 
			</div>
			<div class="list">
				<ul>
					<li><a href="ognl/ognlAction.action">测试OGNL表达式</a></li>
					<li><a href="ognl/ogblTestArrayResult.jsp">OGNL 访问arry</a></li>
					<li><a href="ognl/ogblTestListResult.jsp">OGNL 访问list</a></li>
					<li><a href="ognl/ogblTestMapResult.jsp">OGNL 访问Map</a></li>
					<li><a href="ognl/ogblTeststaticFieldResult.jsp">OGNL java类的静态字段</a></li>
				</ul>
			</div>
			<div class="clear"></div>
		</div>
		<div id="tag" class="column">
			<div class="tit">
				<h3>标签</h3>
			</div>
			<div class="know">
			</div>
			<div class="list">
				<ul>
					<li><a href="tag/commonTagUrl.jsp">通用标签URL</a></li>
					<li><a href="tag/commonTagDate.jsp">通用标签DATE</a></li>
					<li><a href="tag/formDemo01.jsp">表单标签</a></li>
					<li><a href="tag/formDemo_checkbox.jsp">表单标签checkbox</a></li>
					<li><a href="form/checkboxlist.action">表单标签checkbox-list</a></li>
<<<<<<< HEAD
					<li><a href="tag/formRaidoSelect.jsp">表单标签radio-select</a></li>
=======
					<li><a href="form/employeeadd.action">标签综合实例</a></li>
>>>>>>> 6211ebba1a126740bc8c725af443c6ef37a9faad
				</ul>
			</div>
			<div class="clear"></div>
		</div>
	</div>
</body>
</html>