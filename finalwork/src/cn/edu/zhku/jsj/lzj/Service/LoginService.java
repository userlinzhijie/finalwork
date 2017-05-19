package cn.edu.zhku.jsj.lzj.Service;

import cn.edu.zhku.jsj.lzj.Dao.LoginDao;
import cn.edu.zhku.jsj.lzj.Model.User;

public class LoginService {
public boolean checkUserNameAndPassword(User user) throws Exception{
    	
    	LoginDao ld = new LoginDao();
    	
    	boolean result = false;
    	User newUser = new User();
    	
    	newUser = ld.getUserByName(user);
    	
    	//如果返回值不为空，表示可以得到一个用户名和密码相匹配的值
    	if( newUser.getUserid() != null){
    		result = true;
    	}else{
    		result=false;
    	}
    	
    	return result;
    }

	public static void main(String[] args) {
	
	LoginDao ld = new LoginDao();
	
		try {
			if(ld.judge("root", "zhijie")){
				System.out.println("登录成功！");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
}
}
