package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import DBPKG.DBConnect;

public class MemberDAO {//데이터베이스 접근 코드
	Connection con;// 연결된 객체 저장
	PreparedStatement ps; //명령어 전송 객체
	ResultSet rs; //결과 저장 객체
	public MemberDAO() {
		try {
			con = DBConnect.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("생성자 실행");
		
	}
	public ArrayList<MemberDTO> getMember() {
		ArrayList<MemberDTO> list = new ArrayList<MemberDTO>();
		System.out.println("getMember");
		String sql = "select * from members";
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				MemberDTO dto = new MemberDTO(); 
				dto.setId(rs.getString("id"));
				dto.setPwd(rs.getString("pwd"));
				dto.setName(rs.getString("name"));
				dto.setAddr(rs.getString("addr"));
				dto.setTel(rs.getString("tel"));
				
				list.add(dto);//가지고온 값 dto변수(배열)에 저장
				
				System.out.println("id : "+rs.getString("id"));
				System.out.println("pwd : "+rs.getString("pwd"));
				System.out.println("name : "+rs.getString("name"));
				System.out.println("addr : "+rs.getString("addr"));
				System.out.println("tel : "+rs.getString("tel"));
				System.out.println("------------------");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list; //호출되면 list를 리턴해줌
	}
	public MemberDTO getInfo(String id) {
		System.out.println("id : "+id);
		String sql = "select * from student where id=?";
		MemberDTO dto = new MemberDTO();
		
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if(rs.next()) {
				dto.setId(rs.getString("id"));
				dto.setPwd(rs.getString("pwd"));
				dto.setName(rs.getString("name"));
				dto.setAddr(rs.getString("addr"));
				dto.setTel(rs.getString("tel"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	public int userChk(String id, String pwd) {
		System.out.println("dao id : "+id);
		System.out.println("dao pwd : "+pwd);
		String sql = "select * from members where id=?";
		int result = 0;
		try {
			ps = con.prepareStatement(sql);
			//select * from members where id='aaa'
			ps.setString(1, id);
			rs = ps.executeQuery();
			if(rs.next()) {
				System.out.println("해당 아이디는 존재합니다");
				if(pwd.equals( rs.getString("pwd")) ) {
					System.out.println("로그인 성공");
					result = 1;
				}else {
					result = 0;
					System.out.println("비밀번호 틀림");
				}
			}else {
				result = -1;
				System.out.println("아이디가 존재하지 않습니다.");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

}





