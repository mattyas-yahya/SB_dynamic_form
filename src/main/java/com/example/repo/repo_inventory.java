package com.example.repo;

import com.example.model.*;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

public interface repo_inventory extends JpaRepository<inventory,String>
{

}
