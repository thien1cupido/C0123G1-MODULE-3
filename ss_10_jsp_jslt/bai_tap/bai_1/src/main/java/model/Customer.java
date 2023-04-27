package model;

public class Customer {
    private String name;
    private String birthOfDay;
    private String address;
    private String image;

    public Customer() {
    }

    public Customer(String name, String birthOfDay, String address, String image) {
        this.name = name;
        this.birthOfDay = birthOfDay;
        this.address = address;
        this.image = image;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBirthOfDay() {
        return birthOfDay;
    }

    public void setBirthOfDay(String birthOfDay) {
        this.birthOfDay = birthOfDay;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
}
