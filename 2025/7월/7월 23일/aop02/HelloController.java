package app.labs.ex04.aop02;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class HelloController {
	
	@Autowired
	// 멤버변수
	private IHelloService helloService ;
	
	// 생성자
	public HelloController() {
		// this.helloService = new HelloService();
	}
	
	public HelloController(IHelloService helloService) {
		this.helloService = helloService;
	}
	
	// setter
	public void setHelloService(IHelloService helloService) {
		this.helloService = helloService;
	}
	
	public void hello(String name) {
		System.out.println("HelloController: " + this.helloService.sayHello(name));
	}
	
	public void goodbye(String name) {
		System.out.println("HelloController: " + this.helloService.sayGoodbye(name));
	}

}
