package cn.edu.zhku.jsj.lzj.Service;

import cn.edu.zhku.jsj.lzj.Dao.LoginDao;
import cn.edu.zhku.jsj.lzj.Model.User;

public class LoginService {
public boolean checkUserNameAndPassword(User user) throws Exception{
    	
    	LoginDao ld = new LoginDao();
    	
    	boolean result = false;
    	User newUser = new User();
    	
    	newUser = ld.getUserByName(user);
    	
    	//�������ֵ��Ϊ�գ���ʾ���Եõ�һ���û�����������ƥ���ֵ
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
				System.out.println("��¼�ɹ���");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
}
}
