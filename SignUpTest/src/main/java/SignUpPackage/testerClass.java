package SignUpPackage;

public class testerClass {
	public static void main(String args[]) {
		UserDB u = new UserDB();
		UserModel user = new UserModel("joshEmail", "joshPassword", "a", "3", "Male", "india", "1", "1");
		if(!u.checkIfUserExistsInDB(user.getName1() + user.getName2())) {
			boolean flag;
			flag = u.insertUserIntoDB(user);
			if(flag) {
				System.out.println("Success");
			}
		}
		else {
			System.out.println("User already exists");
		}
		
	}
}
