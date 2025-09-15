package iuh.fit.tranvanvinh_tuan04_bai4.model;


public class CartItemBean {
    private Product product;
    private int quantity;

    public CartItemBean(Product product, int quantity) {
        this.product = product;
        this.quantity = quantity;
    }

    public Product getProduct() { return product; }
    public int getQuantity() { return quantity; }
    public void setQuantity(int quantity) { this.quantity = quantity; }

    public double getSubtotal() {
        return product.getPrice() * quantity;
    }
}
