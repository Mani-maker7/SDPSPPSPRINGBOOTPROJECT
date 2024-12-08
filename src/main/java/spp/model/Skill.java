package spp.model;

import jakarta.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "skills_table")
public class Skill implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "skill_name", nullable = false, length = 100)
    private String skillName;

    @Column(name = "proficiency", nullable = false, length = 50)
    private String proficiency;

    @ManyToOne
    @JoinColumn(name = "student_id", nullable = false)
    private Student student;

    // Constructors
    public Skill() {
    }

    public Skill(String skillName, String proficiency, Student student) {
        this.skillName = skillName;
        this.proficiency = proficiency;
        this.student = student;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getSkillName() {
        return skillName;
    }

    public void setSkillName(String skillName) {
        this.skillName = skillName;
    }

    public String getProficiency() {
        return proficiency;
    }

    public void setProficiency(String proficiency) {
        this.proficiency = proficiency;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    @Override
    public String toString() {
        return "Skill{" +
                "id=" + id +
                ", skillName='" + skillName + '\'' +
                ", proficiency='" + proficiency + '\'' +
                ", student=" + student +
                '}';
    }
}
