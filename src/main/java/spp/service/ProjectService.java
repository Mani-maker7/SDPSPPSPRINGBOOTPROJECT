package spp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spp.model.Project;
import spp.repository.ProjectRepository;

public interface ProjectService 
{
	
    void saveProject(Project project);
    
    public List<Project> getAllProjects();
    
    Project getProjectById(int id);
    
        
}