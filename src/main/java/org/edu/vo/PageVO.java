package org.edu.vo;

public class PageVO {
	private int startNo;//게시판테이블, 회원테이블의 필드와는 직접관계없음
	private int perPageNum;
	private Integer page; //jsp단에서 null로 값이 올때, 에러가 발생하지 않도록하기위해 Integer 사용 
						  // int형으로 하면 오류가 남!
	private int totalCount;
	private int endPage;
	private int startPage;
	private boolean prev; //boolean형-> 참과 거짓을 나눠주는 것
	private boolean next;
	//검색용 변수 2개 추가
	private String searchType;
	private String searchKeyword;
	
	
	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getSearchKeyword() {
		return searchKeyword;
	}

	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}


	private  void calcPage() {
		//page변수는 현재 jsp에서 클릭한 페이지 번호
		//형변환 여태는 float를 썼으나 이번엔 메모리를 덜 차지하는 double사용
		//클래스 안에서 만든 변수(=멤버변수)를 사용할때는 this를 붙임
		int tempEnd = (int)(Math.ceil(page / (double)this.perPageNum)*this.perPageNum); 
		//ceil함수는 천장 함수로 1.1 = 2, 2.1 = 3으로 출력
		//반대함수로는 바닥함수 floor(), 반올림 함수 round()가 있음
		//jsp에서 클릭한 페이지 번호를 기준으로 끝 페이지를 계산함
		this.startPage = (tempEnd - this.perPageNum)+1; //시작 페이지 계산 , 클릭한 page번호가 10일때 까지는 1임
		
		if(tempEnd * this.perPageNum > this.totalCount) { 
			//클릭한 page번호로 계산된 게시물 수가 실제 게시물 갯수인 totalCount보다 클 때
			this.endPage = (int)Math.ceil(this.totalCount/(double)this.perPageNum);
		} else {
			//클릭한 page번호로 계산된 게시물 수가 실제 게시물 갯수인 totalCount보다 작을 때
			this.endPage = tempEnd; //end 페이지 계산
		}
		this.prev = this.startPage != 1; //시작 페이지가 1보다 크면 무조건 이전 페이지가 있음 -> true
		this.next = this.endPage * this.perPageNum < this.totalCount;
		//클릭한 page번호로 계산된 게시물 수가 실제 게시물 수 totalCount보다 작다면 다음페이지가 있음 -> true
	}
	
	
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcPage(); //totalCount 전체 게시물 수가 있어야 페이지 계산을 할 수 있음
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public int getStartNo() {
		//DB쿼리에서 사용 -> 시작데이터번호 = (jsp클릭한 페이지번호 - 1) *페이지당 보여지는 갯수
		startNo = (this.page - 1) * perPageNum;
		return startNo;
	}
	public void setStartNo(int startNo) {
		this.startNo = startNo;
	}
	public int getPerPageNum() {
		return perPageNum;
	}
	public void setPerPageNum(int perPageNum) {
		this.perPageNum = perPageNum;
	}
	
}
