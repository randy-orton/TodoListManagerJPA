/**
 * 
 */
package com.myjavablog.springboot.repository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.myjavablog.springboot.pojo.Task;

/**
 * @author anupb
 *
 */
@Repository
public interface TodoRepository extends JpaRepository<Task, Long>{

}
