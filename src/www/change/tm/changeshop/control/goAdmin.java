package www.change.tm.changeshop.control;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/change")
public class goAdmin{
	
	@RequestMapping("/goAdmin.action")
	public String go(){
		return "index";
	}
	

	
}
