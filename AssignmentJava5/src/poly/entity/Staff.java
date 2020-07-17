package poly.entity;


import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;


@Entity
@Table(name = "Staffs")
public class Staff {
	@Id
	@GeneratedValue
	public	 String id;
	@NotBlank(message="Không được để trống tên đăng nhập !")
	public	  String username;
	@NotBlank(message="Không được để trống mật khẩu !")
	public	  String password;
	@NotBlank(message="Không được để trống họ và tên !")
	public	  String fullname;
	public	  Boolean gender;
	@NotBlank(message="Không được để trống ngày sinh !")
	public	  String birthday;
	@NotBlank(message="Không được để trống ảnh đại diện !")
	public	  String photo;
	@Column(name = "Email")
	@NotBlank(message="Không được để trống Email !")
	public	  String email;
	@NotBlank(message="Không được để trống số điện thoại !")
	public	  String phone;
	@NotNull(message="Không được để trống lương nhân viên này !")
	@DecimalMin(value="0", message="Lương không được nhỏ hơn 0 !")
	public	  Double salary;
	public	  String notes;
	public String roles;
	@ManyToOne
	@JoinColumn(name = "departId")
	private  Depart depart;
	@OneToMany(mappedBy = "staff", fetch = FetchType.EAGER)
	private  Collection<Record> record;
	

	public Staff() {

	}

	public Staff(String id, String username, String password, String fullname, Boolean gender, String birthday,
			String photo, String email, String phone, Double salary, String notes, Depart depart,
			Collection<Record> record, String roles) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.fullname = fullname;
		this.gender = gender;
		this.birthday = birthday;
		this.photo = photo;
		this.email = email;
		this.phone = phone;
		this.salary = salary;
		this.notes = notes;
		this.depart = depart;
		this.record = record;
		this.roles = roles;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public Boolean getGender() {
		return gender;
	}

	public void setGender(Boolean gender) {
		this.gender = gender;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Double getSalary() {
		return salary;
	}

	public void setSalary(Double salary) {
		this.salary = salary;
	}

	public String getNotes() {
		return notes;
	}

	public void setNotes(String notes) {
		this.notes = notes;
	}

	public Depart getDepart() {
		return depart;
	}

	public void setDepart(Depart depart) {
		this.depart = depart;
	}

	public Collection<Record> getRecords() {
		return record;
	}

	public void setRecords(Collection<Record> record) {
		this.record = record;
	}

	public String getRoles() {
		return roles;
	}

	public void setRoles(String roles) {
		this.roles = roles;
	}


}
