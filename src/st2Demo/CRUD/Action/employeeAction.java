package st2Demo.CRUD.Action;

/*
 * @summary：
 * 		实现一个完整的Action实例
 * 注意：
 * 		此处使用了ModelDrvien接口技术
 */

import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;

import st2Demo.CRUD.CRM.Employee;
import st2Demo.CRUD.CRM.employeeDao;

@SuppressWarnings("unused")
public class employeeAction implements RequestAware,ModelDriven<Employee>{
	
	private employeeDao dao = new employeeDao();
	
	private Map<String, Object> requestMap;

	private Employee employee;
	
	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	@Override
	public void setRequest(Map<String, Object> arg0) {
		requestMap = arg0;
	}

	/**
	 * action通过实现ModelDriven接口，将请求信息封装成一个Employee对象
	 */
	@Override
	public Employee getModel() {
		/**
		 * 该方法会在调用action的action方法前回将该函数返回的对象压入到值栈中
		 * 
		 * 因此可以通过通过盘的employee对象的id属性来判断当前操作是对现有的对象做修改还是新增
		 * （需要在该action中添加一个id属性，同时需要注意为了在做判断前为id属性赋值，
		 *  此处需要使用paramsPrepareParamsStack拦截器栈
		 *  在package中加入<!-- 修改该包中的默认的拦截器栈 -->
		 *  <default-interceptor-ref name="paramsPrepareParamsStack"></default-interceptor-ref>
		 *  ）
		 *  
		 * 
		 */
		//为action添加employeeId
//		if(employeeId ==  null){
//			//新增操作
//			employee = new Employee();
//		}else{
//			//对现有的做修改
//			employee = dao.getById(employeeId);
//		}
		employee = new Employee();
		return employee;
	}
	
	/**
	 * Action  
	 */
	
	public String listAction() {
		requestMap.put("employeeList", dao.getList());
		return "emp-list";
	}

	public String deleteAction() {
		dao.deleteById(employee.getEmployeeId());
		return "success";
	}

	public String addAction(){
		dao.add(employee);
		return "success";
	}
	
	public String updateAction(){
		dao.edit(employee);
		return "success";
	}
	public String editAction(){
		//下面的方式不能完成表单回显
		//因为employee对象新建后与valuestack栈中的对象就断绝关系，成俩个对立的对象
		//employee = dao.getById(employee.getEmployeeId());
		
		
		//1.首先该action实现了ModelDriven接口，所以edit?employeeId=xx提交的时候employee对象的id被赋值了
		//2.通过dao获取一个employeed对象并将其压入valuestack，中用于回显
		//3.注意此时valuestack中有俩个valuestack对象
		//ActionContext.getContext().getValueStack().push(dao.getById(employee.getEmployeeId()));
		
		
		return "emp-edit";
	}


}
