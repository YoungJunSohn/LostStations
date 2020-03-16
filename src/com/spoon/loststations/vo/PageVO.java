package com.spoon.loststations.vo;

public class PageVO {
	
	private int start, end, no;
	private Integer[] categories;
	private String[] types;
	private int sort;
	private String searchType, searchContent;
	private int userNo;
	private int qiNo;
	private String searchKeyWord;
	private String selectOption;
	
	public String getSearchKeyWord() {
		return searchKeyWord;
	}

	public void setSearchKeyWord(String searchKeyWord) {
		this.searchKeyWord = searchKeyWord;
	}

	public String getSelectOption() {
		return selectOption;
	}

	public void setSelectOption(String selectOption) {
		this.selectOption = selectOption;
	}

	public int getQiNo() {
		return qiNo;
	}

	public void setQiNo(int qiNo) {
		this.qiNo = qiNo;
	}

	public PageVO(int pageNo, int numPage, int sort, int userNo) {
		end = pageNo*numPage;
		start = end-(numPage-1);
		this.sort = sort;
		this.userNo = userNo;
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getSearchContent() {
		return searchContent;
	}

	public void setSearchContent(String searchContent) {
		this.searchContent = searchContent;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String[] getTypes() {
		return types;
	}

	public void setTypes(String[] types) {
		this.types = types;
	}

	public int getSort() {
		return sort;
	}

	public void setSort(int sort) {
		this.sort = sort;
	}

	public Integer[] getCategories() {
		return categories;
	}

	public void setCategories(Integer[] categories) {
		this.categories = categories;
	}

	public PageVO() {
		// TODO Auto-generated constructor stub
	}
	
	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}
	public PageVO(int pageNo, int numPage) {
		end = pageNo*numPage;
		start = end-(numPage-1);
	}
	
	public PageVO(int pageNo, int numPage, Integer[] categories, String[] types, int sort, String searchType, String searchContent) {
		end = pageNo*numPage;
		start = end-(numPage-1);
		this.categories =  categories;
		this.types =  types;
		this.sort = sort;
		this.searchType = searchType;
		this.searchContent = searchContent;
	}
	
	public PageVO(int pageNo, int numPage, int userNo) {
		end = pageNo*numPage;
		start = end-(numPage-1);
		this.userNo = userNo;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}
	
public PageVO(int pageNo, int numPage, String searchKeyWord, String selectOption ) {
		
		end = pageNo * numPage;
		start = end - numPage + 1;

		this.searchKeyWord = searchKeyWord;
		this.selectOption = selectOption;
		
		System.out.println("searchKeyWord:" + this.searchKeyWord);
		System.out.println("selectOption:" + this.selectOption);
	}

}
