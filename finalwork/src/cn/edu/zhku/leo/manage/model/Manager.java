package cn.edu.zhku.leo.manage.model;

public class Manager {
	private int id;
	private String password;
	private String info;
	
	public int getId(){return id;}
	public String getPassword(){return password;}
	public String getInfo(){return info;}
	
	public int setId(int id){
		this.id=id;
		return 0;
	}
	public int setPassword(String password){
		this.password=password;
		return 0;
	}
	public int setInfo(String info){
		this.info=info;
		return 0;
	}
}
