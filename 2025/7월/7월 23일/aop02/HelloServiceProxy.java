package app.labs.ex04.aop02;

public class HelloServiceProxy extends HelloService {
	
	@Override
	public String sayHello(String name) {
		HelloLog.log(); // 공통 관심사
		String result = super.sayHello(name); // 핵심 관심사
		return result;
	}

}
