package app.labs.ex04.aop01;

public class HelloController {
	
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

}
