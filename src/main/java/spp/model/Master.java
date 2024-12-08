package spp.model;

import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "master_table")
public class Master {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "master_id")
    private int id;

    @Column(name = "master_name", nullable = false, length = 100)
    private String name;

    @Column(name = "master_gender", nullable = false)
    private String gender;

    @Column(name = "master_dateofbirth", nullable = false, length = 20)
    private String dateofbirth; 

    @Column(name = "master_email", nullable = false, unique = true)
    private String email;

    @Column(name = "master_password", nullable = false, length = 100)
    private String password;

    @Column(name = "master_location", nullable = false, length = 100)
    private String location;

    @Column(name = "master_contact", nullable = false, unique = true, length = 20)
    private String contact;

    @Column(name = "master_expertise", nullable = false, length = 100)
    private String expertise;

    @Column(name = "master_role", nullable = false, length = 50)
    private String role; 

    @Column(name = "master_joining_date", nullable = false, length = 20)
    private String joiningDate;

    @Column(name = "master_age", nullable = false)
    private int age; 
    
    @OneToMany(mappedBy = "master")
    private List<Student> students;

    public List<Student> getStudents() {
		return students;
	}

	public void setStudents(List<Student> students) {
		this.students = students;
	}

	public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getDateofbirth() {
        return dateofbirth;
    }

    public void setDateofbirth(String dateofbirth) {
        this.dateofbirth = dateofbirth;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public String getExpertise() {
        return expertise;
    }

    public void setExpertise(String expertise) {
        this.expertise = expertise;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

   
    public String getJoiningDate() {
        return joiningDate;
    }

    public void setJoiningDate(String joiningDate) {
        this.joiningDate = joiningDate;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        if (age < 25) {
            throw new IllegalArgumentException("Age must be 25 or older for a Master.");
        }
        this.age = age;
    }
}
