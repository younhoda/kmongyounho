package kmong;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class KmongDAO {
	DBConnectionMgr pool;
	Connection con;

	public KmongDAO() {
		pool = DBConnectionMgr.getInstance();
	}

	public void update(KmongDTO dto) throws Exception {

		con = pool.getConnection();

		// 3. SQL문 객체화
		String sql = "update board set  set email=?,set pw=? , set content=?  where title=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(4,dto.getTitle());
		ps.setString(1, dto.getEmail());
		ps.setString(2, dto.getPw());
		ps.setString(3, dto.getContent());
		
		

		// 4. SQL문 실행 요청
		ps.executeUpdate();
		System.out.println("SQL문 요청완료");
		pool.freeConnection(con, ps);
	}

	public void delete(String title) throws Exception {

		con = pool.getConnection();

		// 3. SQL문 객체화
		String sql = "delete from board where title=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, title);

		// 4. SQL문 실행 요청
		ps.executeUpdate();
		pool.freeConnection(con, ps);
		System.out.println("SQL문 요청완료");

	}

	public void insert(KmongDTO dto) throws Exception {

		con = pool.getConnection();

		// 3. SQL등록쿼리문
		String sql = "insert into board values (null,?,?,?,?,null)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, dto.getEmail());
		ps.setString(2, dto.getTitle());
		ps.setString(3, dto.getPw());
		ps.setString(4, dto.getContent());

		// 4. SQL문 실행 요청
		ps.executeUpdate();
		pool.freeConnection(con, ps);
		System.out.println("SQL문 요청완료");

	}

	public ArrayList<KmongDTO> selectAll() throws Exception {
		// 1. 드라이버(connector) 셋팅
		Class.forName("com.mysql.jdbc.Driver");

		// 2. DB연결(->my서버설정+db명+id+pw)
		String url = "jdbc:mysql://localhost:3306/kmong";
		String user = "root";
		String password = "1234";

		Connection con = DriverManager.getConnection(url, user, password);

		// 3. SQL문 객체화
		String sql = "select * from board";
		PreparedStatement ps = con.prepareStatement(sql);

		// 4. SQL문 실행 요청
		ResultSet rs = ps.executeQuery();
		System.out.println("start " + rs.getRow());

				// 해당 row index의 값이 존재하는가? 체크..
				// System.out.println(rs.first());
				// System.out.println(rs.absolute(1));

				// 해당 ResultSet의 갯수를 구하는 방법..==========
				// rs의 맨 끝으로 이동
				// rs.last();
				// 그 맨 끝의 getRow()를 출력
				// System.out.println("레코드의 갯수는 " + rs.getRow());

		KmongDTO dto = null;
		ArrayList<KmongDTO> list = new ArrayList<>();

		while (rs.next()) { // 커서를 옮겨서 레코드가 있는지 체크
			System.out.println("row: " + rs.getRow());
			dto = new KmongDTO();

			int no = rs.getInt(1);
			String email = rs.getString(2);
			String title = rs.getString(3);
			String pw=rs.getString(4);
			String content = rs.getString(5);
			int timeStamp = rs.getInt(6);

			dto.setNo(no);
			dto.setEmail(email);
			dto.setTitle(title);
			dto.setPw(pw);
			dto.setContent(content);
			dto.setTimeStamp(timeStamp);

			list.add(dto);

		}
		pool.freeConnection(con, ps, rs);
		return list;
	}
	
	public KmongDTO select(String id) throws Exception {

		con = pool.getConnection();

		// 3. SQL문 객체화
		String sql = "select *from board where title=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, id);

		// 4. SQL문 실행 요청
		ResultSet rs = ps.executeQuery();
		KmongDTO dto = null;
		while (rs.next()) { // 커서를 옮겨서 레코드가 있는지 체크
			dto = new KmongDTO();

			String email = rs.getString(2);
			String title = rs.getString(3);
			String pw = rs.getString(4);
			String content = rs.getString(5);

			dto.setEmail(email);
			dto.setTitle(title);
			dto.setPw(pw);
			dto.setContent(content);
		}
		return dto;
	}
	

	
	

}
