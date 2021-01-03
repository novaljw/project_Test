package com.min.edu.usebean;

public class ReplyPhoto {

	private int depth;
	
	public void setDepth(int depth) {
		this.depth = depth;
	}
	
	public String getPhoto() {
		String result = "";
		String blank = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
		String img = "<img src='./images/reply.png'/>";
		if(depth>0) {
			for (int i = 0; i < depth; i++) {
				result += blank;
			}
			result+= img;
		}
		return result;
	}
	
}





