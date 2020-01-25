package model;

public class Item {
    private String product;
    private int quantity;

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    private double price;

    public String getProduct() {
        return product;
    }

    public void setProduct(String product) {
        this.product = product;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Item(String product, int quantity, double price) {
        this.product = product;
        this.quantity = quantity;
        this.price = price;
    }
}
