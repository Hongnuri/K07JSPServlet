package util;

import java.io.IOException;

import javax.servlet.jsp.JspWriter;

public class FirstFuntion {
	
	public static void srcGuGudan(JspWriter out) {
		try{	
			out.println("<table border='1'>");
			for(int dan=1; dan<=9; dan++){
				out.println("	<tr>");
				for(int su=1; su<=9; su++){
					out.println("		<td>"+dan+"*"+su+"="+(dan*su)+"</td>");
				}
				out.println("	</tr>");
			}
			out.println("</table>");
		}
		catch(IOException e){
		// JSP 에는 오류시 Import 를 안내해주지 않는다. 따라서 컨트롤 + 스페이스로 Import 를 해주어야한다. 
		}
	}
}
