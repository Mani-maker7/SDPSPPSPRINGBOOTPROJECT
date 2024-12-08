package spp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spp.model.Master;
import spp.model.Project;
import spp.model.Student;
import spp.repository.MasterRepository;
import spp.repository.ProjectRepository;
import spp.repository.StudentRepository;

@Service
public class MasterServiceImpl implements MasterService
{
	
    @Autowired
	private MasterRepository masterRepository;
    
    @Autowired
    private StudentRepository studentRepository;
    
    @Autowired
    private ProjectRepository projectRepository;

	
	@Override
	public String addnewmaster(Master master) 
	{
		if (master.getAge() < 25) {
            return "Master must be 25 years or older.";
        }

        masterRepository.save(master);
        return "Master added successfully!";
	}

	@Override
	public List<Master> getAllMasters()
	{
		return masterRepository.findAll();
	}

	@Override
	public Master getMasterById(int masterId) 
	{
		 return masterRepository.findById(masterId).orElse(null);
	}

	@Override
	public Master checkMasterLogin(String email, String password)
	{
		return masterRepository.checkMasterLogin(email, password);
	}

	@Override
    public Master findById(Integer masterId) {
        return masterRepository.findById(masterId)
                               .orElseThrow(() -> new RuntimeException("Master not found!"));
    }

    @Override
    public List<Student> getAssignedStudents(Integer masterId) {
        Master master = findById(masterId); // Fetch the master
        return studentRepository.findByMaster(master); // Assuming you have such a method
    }
}
