package st2Demo.tag;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.ParameterAware;


public class selectAction {
	
	
	private String citys;
	
	private String age;

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getCitys() {
		return citys;
	}

	public void setCitys(String citys) {
		this.citys = citys;
	}

	@Override
	public String toString() {
		return "selectAction [citys=" + citys + ", age=" + age + "]";
	}
	
	public String cityListAction(){
		System.out.println(this.getClass()+":"+this);
		
		return "input";
	}

}
