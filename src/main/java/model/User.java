package model;

public class User {
	private String name;
	private String password;
	private int id;
	private String firstName;
	private String lastName;
	private String city;
	private String code;
	private String street;

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getStreet() {
		return street;
	}

	public void setStreet(String street) {
		this.street = street;
	}

	public String getStreetNumber() {
		return streetNumber;
	}

	public void setStreetNumber(String streetNumber) {
		this.streetNumber = streetNumber;
	}

	public User(String name, String password, int id, String firstName, String lastName, String city, String code, String street, String streetNumber) {
		this.name = name;
		this.password = password;
		this.id = id;
		this.firstName = firstName;
		this.lastName = lastName;
		this.city = city;
		this.code = code;
		this.street = street;
		this.streetNumber = streetNumber;
	}

	private String streetNumber;
	public User(String name, String password) {
		id = 0;
	}
	public User() {
		id = 0;
	}
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String makeMD5() {
		//TODO: napisać procedurę zamieniającą password w MD5
		return password;
	}
}
