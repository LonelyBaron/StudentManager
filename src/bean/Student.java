package bean;//创建包com，将类定义在包中，词句必须放所有代
public class Student {
    private String xh;
    private String xm;
    private int n1;
    public static String gj;
    public Student() {}//默认的构造方法，进行显式定义
    public Student(String xh,String xm,int n1)
    
    {//构造方法特点：方法名字和类名完全一致；没有返回值类型
    //构造方法的作用：用来创建对象，对类的成员变量进行初始化	
 //注意点：若用户没有自定义构造方法，系统会自动创建一个   

    	this.xh=xh;
    	this.xm=xm;
    	this.n1=n1;
    }
    public void setXh(String xh)
    {
       this.xh=xh;	
    }
    public String getXh()
    {
    	  return this.xh;
    }
	public String getXm() {
		return xm;
	}
	public void setXm(String xm) {
		this.xm = xm;
	}
	public int getN1() {
		return n1;
	}
	public void setN1(int n1) {
		this.n1 = n1;
	}
	public String getAll() 
    {
    	return xh+"  "+xm+"   "+n1;
    }

	public static void main(String args[])
	{
		Student st1=new Student();
		st1.setXh("1001");
	    st1.setXm("张三");
	    st1.setN1(20);
	    System.out.println(st1.getXh()+"  "+st1.getXm()+"  "+st1.getN1());
	}
}
