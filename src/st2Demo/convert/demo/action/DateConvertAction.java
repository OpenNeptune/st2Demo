package st2Demo.convert.demo.action;

import java.util.Date;

import com.opensymphony.xwork2.ActionSupport;
/**
 * 
 * @author admins
 * @summary:
 * 		测试struts默认对date类型数据做如何处理
 */
public class DateConvertAction extends ActionSupport{
	private static final long serialVersionUID = 1L;
	
	
	private Date brith;

	public Date getBrith() {
		return brith;
	}

	public void setBrith(Date brith) {
		this.brith = brith;
	}
	
	
	@Override
	public String toString() {
		return "DateConvertAction [brith=" + brith + "]";
	}

	public String execute(){
		System.out.println(this);
		return "success";
	}
}
