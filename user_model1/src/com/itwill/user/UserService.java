package com.itwill.user;
/*
 * - 회원관리 비즈니스로직(예외처리,트랜젝션,보안,로깅)을 수행하는 클래스
 * - 웹컴퍼넌트(서블릿,JSP)에서 직접접근(메쏘드호출)하는 클래스
 * - Dao를 이용해서 데이타베이스를 조작작업하는 클래스
 */

public class UserService {
	private UserDao userDao;
	
	public UserService() throws Exception{
		userDao=new UserDao();
	}
	/*
	 * 회원가입
	 *   1.아이디존재여부
	 *   2.패쓰워드일치여부
	 *   3.성공
	 */
	
	/*
	 * 회원리스트
	 */
	
	/*
	 * 아이디중복체크
	 * 
	 */
	
	/*
	 * 회원 로그인
	 */
	
	/*
	 * 회원1명보기
	 */
	
	/*
	 * 회원탈퇴
	 */
	
	/*
	 * 회원수정
	 */
	
	
}




