package poly.entity;

import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotBlank;

@Entity
@Table(name="Departs")
public class Depart {
	@Id
	@GeneratedValue
	public String id;
	@NotBlank(message="Không được để trống tên phòng ban !")
	public String name;
	@OneToMany(mappedBy="depart", fetch=FetchType.EAGER)
	private Collection<Staff>staff;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Collection<Staff> getStaffs() {
		return staff;
	}
	public void setStaffs(Collection<Staff> staffs) {
		this.staff = staffs;
	}
	public Depart(String id, String name, Collection<Staff> staff) {
		this.id = id;
		this.name = name;
		this.staff = staff;
	}
	public Depart() {
		
	}

}
