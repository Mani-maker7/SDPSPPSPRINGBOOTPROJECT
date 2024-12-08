package spp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spp.model.Skill;
import spp.repository.SkillRepository;

@Service
public class SkillServiceImpl implements SkillService
{
	 @Autowired
	    private SkillRepository skillRepository;

	    public void addSkill(Skill skill) {
	        skillRepository.save(skill);
	    }

	    // Fetch skills by student
	    public List<Skill> getSkillsByStudentId(int studentId) {
	        return skillRepository.findByStudentId(studentId);
	    }

}
