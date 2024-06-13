package jung;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

@WebServlet("/fileupload55.do")
public class Fileupload_process extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		 request.setCharacterEncoding("utf-8");

	        String number = null;
	        String name = null;
	        String priceStr = null;
	        String category = null;
	        String stockStr = null;
	        String allergy = null;
	        String origin = null;
	        String description = null;
	        String filename = null;

	        int price = 0;
	        int stock = 0;

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
	                            priceStr = fileItem.getString("utf-8");
	                            break;
	                        case "category":
	                            category = fileItem.getString("utf-8");
	                            break;
	                        case "stock":
	                            stockStr = fileItem.getString("utf-8");
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

	        if (priceStr != null && !priceStr.isEmpty()) {
	            price = Integer.parseInt(priceStr);
	        }

	        if (stockStr != null && !stockStr.isEmpty()) {
	            stock = Integer.parseInt(stockStr);
	        }

	        DessertRepository create = DessertRepository.getInstance();

	        Dessert newSell = new Dessert(number, name, price, category, stock, allergy, origin);
	        newSell.setDescription(description);
	        newSell.setFilename(filename);

	        create.addDessert(newSell);

	        response.sendRedirect("./junggadang/editDessert.jsp?edit=update");
	    }
	}