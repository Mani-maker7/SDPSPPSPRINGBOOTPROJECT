package spp.service;

import java.util.List;

import spp.model.Skill;

public interface SkillService 
{
	 public void addSkill(Skill skill);
	 
	 public List<Skill> getSkillsByStudentId(int studentId);
	 
	 

}
