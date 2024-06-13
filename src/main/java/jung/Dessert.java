package jung;

import java.io.Serializable;

public class Dessert implements Serializable {
	private static final long serialVersionUID = 1L;

	public Dessert() {	
	}
	
	private String number;
	private String name;
	private int price;
	private String category;
	private int stock;
	private String allergy;
	private String origin;
	private String description;
	private String filename;
	private int quantity;
	
	
	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public String getAllergy() {
		return allergy;
	}

	public void setAllergy(String allergy) {
		this.allergy = allergy;
	}

	public String getOrigin() {
		return origin;
	}

	public void setOrigin(String origin) {
		this.origin = origin;
	}
	
	public int getQuantity() {
		return quantity;
	}
	
	public void setQuantity(int quantity) {
		this.quantity=quantity;
	}

	public Dessert(String number, String name, int price, String category, int stock, String allergy, String origin) {
		this.number = number;
		this.name = name;
		this.price = price;
		this.category = category;
		this.stock = stock;
		this.allergy = allergy;
		this.origin = origin;
	}
}