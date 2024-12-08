package spp.model;


import java.sql.Blob;
import java.util.ArrayList;
import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.Lob;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "student_table")
 public class Student 
 {
	@Id // primary key = unique + not null
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column (name = "student_id")
	private int id;
	@Column (name = "student_name", nullable = false,length = 100)
	private String name;
	@Column (name ="student_gender", nullable = false)
	private String gender;
	@Column (name ="student_dateofbirth", nullable = false, length = 20)
	private String dateofbirth;
	@Column (name = "student_email", nullable = false , unique = true)
	private String email;
	@Column (name ="student_password", nullable = true,length = 100)
	private String password;
	@Column (name = "student_location", nullable = false,length = 100)
	private String location;
	@Column (name = "student_contact", nullable = false, unique = true,length = 20)
	private String contact;
     
	@Column (name = "student_profileimage")
	 private Blob profileimage;
	
	@ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(
        name = "student_project",
        joinColumns = @JoinColumn(name = "student_id"),
        inverseJoinColumns = @JoinColumn(name = "project_id")
    )
    private List<Project> projects = new ArrayList<>();
	
	
	@ManyToOne
	@JoinColumn(name = "master_id")
	private Master master;
	
	 @OneToMany(mappedBy = "student", cascade = CascadeType.ALL, orphanRemoval = true, fetch = FetchType.EAGER)
	    private List<Education> educationList;
	 
	 @OneToMany(mappedBy = "student", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	    private List<Skill> skills;

	public List<Skill> getSkills() {
		return skills;
	}
	public void setSkills(List<Skill> skills) {
		this.skills = skills;
	}
	public List<Education> getEducationList() {
		return educationList;
	}
	public void setEducationList(List<Education> educationList) {
		this.educationList = educationList;
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
	
	public Master getMaster() {
		return master;
	}
	public void setMaster(Master master) {
		this.master = master;
	}
	
	public Blob getProfileImage() {
		return profileimage;
	}
	public void setProfileImage(Blob profileImage) {
		this.profileimage = profileImage;
	}
	
	public List<Project> getProjects() {
		return projects;
	}
	public void setProjects(List<Project> projects) {
		this.projects = projects;
	}
	
}
