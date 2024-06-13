<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, java.io.*, java.sql.*" %>
<%@ page import="com.oreilly.servlet.*, com.oreilly.servlet.multipart.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ include file="dbconn.jsp" %>

<% 
	request.setCharacterEncoding("utf-8");

	String number = null;
	String name = null;
	String price = null;
	String category = null;
	String stock = null;
	String allergy = null;
	String origin = null;
	String description = null;
	String filename = null;

	int Price = 0;
	int Stock = 0;

	File fileUploadPath = new File("C:\\web\\junggadang\\src\\main\\webapp\\resources\\images");
	DiskFileItemFactory factory = new DiskFileItemFactory();
	factory.setRepository(fileUploadPath);
	factory.setSizeThreshold(1024 * 1024);

	ServletFileUpload upload = new ServletFileUpload(factory);
	try {
    	List<FileItem> items = upload.parseRequest(request);
    	Iterator<FileItem> params = items.iterator();

        while (params.hasNext()) {
            FileItem fileItem = (FileItem) params.next();

            if (fileItem.isFormField()) {
                switch (fileItem.getFieldName()) {
                    case "number":
                        number = fileItem.getString("utf-8");
                        break;
                    case "name":
                        name = fileItem.getString("utf-8");
                        break;
                    case "price":
                        price = fileItem.getString("utf-8");
                        break;
                    case "category":
                        category = fileItem.getString("utf-8");
                        break;
                    case "stock":
                        stock = fileItem.getString("utf-8");
                        break;
                    case "allergy":
                        allergy = fileItem.getString("utf-8");
                        break;
                    case "origin":
                        origin = fileItem.getString("utf-8");
                        break;
                    case "description":
                        description = fileItem.getString("utf-8");
                        break;
                }
            } else {
                filename = fileItem.getName();
                if (filename != null) {
                    filename = filename.substring(filename.lastIndexOf("\\") + 1);
                    File file = new File(fileUploadPath + "/" + filename);
                    fileItem.write(file);
                }
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
	
	try {
	    if (price != null && !price.isEmpty()) {
            Price = Integer.parseInt(price); // Parsing string to integer
	    }
	
	    if (stock != null && !stock.isEmpty()) {
            Stock = Integer.parseInt(stock); // Parsing string to integer
	    }
	} catch (NumberFormatException e) {
	    e.printStackTrace();
	}

        
    PreparedStatement pstmt=null;
    
    String sql="insert into dessert values(?,?,?,?,?,?,?,?,?)";
    
    pstmt=conn.prepareStatement(sql);
    pstmt.setString(1, number);
    pstmt.setString(2, name);
    pstmt.setInt(3, Price);
    pstmt.setString(4, category);
    pstmt.setLong(5, Stock);
    pstmt.setString(6, allergy);
    pstmt.setString(7, origin);
    pstmt.setString(8, description);
    pstmt.setString(9, filename);
	pstmt.executeUpdate();
	
	if (pstmt!=null)
		pstmt.close();
	if (conn!=null)
		conn.close();
	
	response.sendRedirect("sell.jsp");
%>
