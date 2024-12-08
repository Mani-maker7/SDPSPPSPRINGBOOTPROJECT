package spp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import spp.model.Master;

@Repository
public interface MasterRepository extends JpaRepository<Master, Integer>
{   
	@Query("select c from Master c where c.email=?1 and c.password=?2 ")
	public  Master checkMasterLogin(String email,String password);

}
