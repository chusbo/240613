<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList" import="jung.Dessert" import="jung.DessertRepository" %>
    
<%
    String id=request.getParameter("id");
    	if(id==null || id.trim().equals(""))	{
    		response.sendRedirect("cart.jsp");
    		return;
    	}
    	
    	DessertRepository create = DessertRepository.getInstance();
    	
    	Dessert sell=create.getDessertByNumber(id);
    	if(sell==null) {
    		response.sendRedirect("exceptionNoName.jsp");
    	}
    	
    	ArrayList<Dessert> cartList=(ArrayList<Dessert>) session.getAttribute("cartlist");
    	Dessert goodsQnt=new Dessert();
    	for (int i=0; i<cartList.size(); i++){
    	goodsQnt=cartList.get(i);
    	if(goodsQnt.getNumber().equals(id)){
    		cartList.remove(goodsQnt);
    		}
    	}
    	
    	response.sendRedirect("cart.jsp");
    %>