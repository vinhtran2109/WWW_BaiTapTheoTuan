package iuh.fit.tranvanvinh_tuan04_bai4.model;

public class Product {
    private int id;
    private String model;
    private String description;
    private int quantity;
    private double price;
    private String imgURL;

    public Product(int id, String model, String description, int quantity, double price, String imgURL) {
        this.id = id;
        this.model = model;
        this.description = description;
        this.quantity = quantity;
        this.price = price;
        this.imgURL = imgURL;
    }

    // getters & setters
    public int getId() { return id; }
    public String getModel() { return model; }
    public String getDescription() { return description; }
    public int getQuantity() { return quantity; }
    public double getPrice() { return price; }
    public String getImgURL() { return imgURL; }

    public void setId(int id) { this.id = id; }
    public void setModel(String model) { this.model = model; }
    public void setDescription(String description) { this.description = description; }
    public void setQuantity(int quantity) { this.quantity = quantity; }
    public void setPrice(double price) { this.price = price; }
    public void setImgURL(String imgURL) { this.imgURL = imgURL; }
}
