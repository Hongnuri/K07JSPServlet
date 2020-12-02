package eltag;

/*
	EL 에서 Java 클래스의 메소드 호출 절차 및 방법
	1. 클래스와 메소드를 정의한다. 단 , 메소드 정의시 반드시
	public static 으로 선언해야한다.
*/
public class MyTagLib {
	
	/*
		메소드 설명 : 매개변수로 전달 된 문자열에 숫자가 아닌 문자가 포함되어 있는지 확인한다.
		전체가 숫자일 때는 true를 반환하고 그렇지 않으면 false 를 반환한다.
		ex) 1234 -> true , 백20 -> false
	 
	*/
	public static boolean isNumber(String value) {
		char[] chArr = value.toCharArray();
		for(int i = 0; i < chArr.length ; i++) {
			if(!(chArr[i]>='0' && chArr[i]<='9')) {
				return false;
			}
		}
		return true;
	}
	
	/*
		메소드 설명 : 매개변수로 주민번호를 전달 받아 성별을 판단한다.
			주민번호는 하이픈(-) 을 포함한 형태로 전달 된다고 가정한다.
	*/
	public static String getGender(String jumin) {
		
		String returnStr = "";
		// indexOf() 를 통해 - 의 위치를 찾아 1을 더한다.
		int beginIdx = jumin.indexOf("-") + 1;
		// 위에서 구한 인덱스를 통해 성별에 해당하는 문자를 잘라서 가져온다.
		String genderStr = jumin.substring(beginIdx, beginIdx+1);
		// 쉬운 비교를 위해 정수로 변환한다.
		int genderInt = Integer.parseInt(genderStr);
		// 조건을 통해 남/여를 판단한다.
		if(genderInt==1 || genderInt==3)
			returnStr ="남자";
		else if(genderInt==2 || genderInt==4)
			returnStr= "여자";
		else
			returnStr = "주민번호 오류 ! 너는 누구니 ?";
		
		return returnStr;
	}
	// 메소드 테스트를 위한 main 메소드
	public static void main(String[] args) {
		boolean result1 = isNumber("1234");
		boolean result2 = isNumber("백20");
		System.out.println("결과1:"+result1);
		System.out.println("결과2:"+result2);
	}
}