package com.example.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import com.example.model.Users;
public interface repo_users extends JpaRepository<Users,Integer>
{
}
