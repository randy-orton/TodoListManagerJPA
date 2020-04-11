/**
 * 
 */
package com.myjavablog.springboot.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.myjavablog.springboot.exception.ResourceNotFoundException;
import com.myjavablog.springboot.pojo.Task;
import com.myjavablog.springboot.repository.TodoRepository;

/**
 * @author anup
 *
 */

@RestController
public class TodoController {

	@Autowired
	TodoRepository todoRepository;
	
	
	@PostMapping(value = "/todos/addTodo")
	public Task addTodo(@Valid @RequestBody Task task) {
		System.out.println("control here............");
		System.out.println("control here............");
		System.out.println("control here............");
		System.out.println("control here............");
		System.out.println("control here............");
		System.out.println("control here............");
		System.out.println("control here............");
		System.out.println("control here............");
		
		System.out.println("control here............");
		
		
		return todoRepository.save(task);
	}
	

	@PutMapping(value = "/todos/updateTodo")
	public Task updateTodo(@Valid @RequestBody Task task) {
		
		Task todo = todoRepository.findById(task.getId())
	            .orElseThrow(() -> new ResourceNotFoundException("Todo", "id", task.getId()));
		
		todo.setStatus(task.getStatus());
		todo.setTaskDesc(task.getTaskDesc());
		todo.setTaskName(task.getTaskName());
	    

	    Task updatedTask = todoRepository.save(todo);
	    return updatedTask;
	}	
	@GetMapping(value = "/todos/getAllTodos")
	public List<Task> getAllTodos() {
		return todoRepository.findAll();
	}
	
	@DeleteMapping(value="/todos/deleteTodo/{id}")
	public ResponseEntity<?> deleteCust(@PathVariable Long id) {
		todoRepository.deleteById(id);
		
		return ResponseEntity.ok().build();
	}
	
}
