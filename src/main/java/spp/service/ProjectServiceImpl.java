package spp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spp.model.Project;
import spp.repository.ProjectRepository;

@Service
public class ProjectServiceImpl implements ProjectService 
{
	 @Autowired
	    private ProjectRepository projectRepository;

	@Override
	public void saveProject(Project project) 
	{
		projectRepository.save(project);
	}

	@Override
	public List<Project> getAllProjects() 
	{
		return projectRepository.findAll();
	}

	@Override
	public Project getProjectById(int id) 
	{
		return projectRepository.findById(id).orElse(null);
	}

}
