package bean;//������com�����ඨ���ڰ��У��ʾ��������д�
public class Student {
    private String xh;
    private String xm;
    private int n1;
    public static String gj;
    public Student() {}//Ĭ�ϵĹ��췽����������ʽ����
    public Student(String xh,String xm,int n1)
    
    {//���췽���ص㣺�������ֺ�������ȫһ�£�û�з���ֵ����
    //���췽�������ã������������󣬶���ĳ�Ա�������г�ʼ��	
 //ע��㣺���û�û���Զ��幹�췽����ϵͳ���Զ�����һ��   

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
	    st1.setXm("����");
	    st1.setN1(20);
	    System.out.println(st1.getXh()+"  "+st1.getXm()+"  "+st1.getN1());
	}
}
