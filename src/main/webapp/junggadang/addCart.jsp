<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList" import="jung.Dessert" import="jung.DessertRepository" %>
 

<%
 	String number=request.getParameter("number");
   	if(number == null || number.trim().equals("")){
   		response.sendRedirect("sell.jsp");
   		return;
   	}
   	
   	DessertRepository create = DessertRepository.getInstance();
   	
   	Dessert sell = create.getDessertByNumber(number);
   	if(sell==null){
   		response.sendRedirect("exceptionNoName.jsp");
   	}
   	
   	ArrayList<Dessert> goodsList = create.getAllDessert();
   	Dessert goods = new Dessert();
   	for (int i=0; i < goodsList.size(); i++){
   		goods=goodsList.get(i);
   		if(goods.getNumber().equals(number)) {
   			break;
   		}
   	}
   	
   	ArrayList<Dessert> list = (ArrayList<Dessert>) session.getAttribute("cartlist");
   	if (list==null) {
   		list = new ArrayList<Dessert>();
   		session.setAttribute("cartlist", list);
   	}
   	
   	int cnt=0;
   	Dessert goodsQnt=new Dessert();
   	for(int i=0; i < list.size(); i++){
   		goodsQnt=list.get(i);
   		if(goodsQnt.getNumber().equals(number)) {
   	cnt++;
   	int orderQuantity=goodsQnt.getQuantity() + 1;
   	goodsQnt.setQuantity(orderQuantity);
   		}
   	}
   	if(cnt==0){
   		goods.setQuantity(1);
   		list.add(goods);
   	}
   	
   	response.sendRedirect("info.jsp?number=" + number);
 %>


