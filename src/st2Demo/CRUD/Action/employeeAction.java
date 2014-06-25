package st2Demo.CRUD.Action;

/*
 * @summary：
 * 		实现一个完整的Action实例
 * 注意：
 * 		此处使用了ModelDrvien接口技术
 */

import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;

import com.opensymphony.xwork2.ModelDriven;

import st2Demo.CRUD.CRM.Employee;
import st2Demo.CRUD.CRM.employeeDao;

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
	


}
