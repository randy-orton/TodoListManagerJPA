
var app = angular.module("todoManager" , []);

app.controller("todoController" , function($scope, $http){
	
	$scope.todos = [];
	$scope.status = ["PENDING", "COMPLETED"];
	$scope.todoForm = {
			id : -1,
			taskName : "",
			taskDesc : ""			
	};
	
	$scope.getClass = function(todo){
		
		if(todo.status == 'PENDING')
			return 'red';
		else if(todo.status == 'COMPLETED'){
			return 'green';
		}
	}
	
	_refreshTodoData();
	
	function _refreshTodoData(){
		
		 $http({
             method : 'GET',
             url : 'http://localhost:8080/TodoListManagerJPA/todos/getAllTodos'
         }).then(function successCallback(response) {
             $scope.todos = response.data;
             
             //alert($scope.todos);
         }, function errorCallback(response) {
             console.log(response.statusText);
         });
	}
	
	$scope.submitTodo = function() {
        
        var method = "";
        var url = "";
        if ($scope.todoForm.id == -1) {
            //Id is absent in form data, it is create new todo operation
            method = "POST";
            url = 'http://localhost:8080/TodoListManagerJPA/todos/addTodo';
        } else {
            //Id is present in form data, it is edit todo operation
            method = "PUT";
            url = 'http://localhost:8080/TodoListManagerJPA/todos/updateTodo';
        }

        $http({
            method : method,
            url : url,
            data : angular.toJson($scope.todoForm),
            headers : {
                'Content-Type' : 'application/json'
            }
        }).then( _success, _error );
    };
	
    $scope.deleteTodo = function(todo) {
        $http({
            method : 'DELETE',
            url : 'http://localhost:8080/TodoListManagerJPA/todos/deleteTodo/' + todo.id
        }).then(_success, _error);
    };

    $scope.editTodo = function(todo) {
      
        $scope.todoForm.taskName = todo.taskName;
        $scope.todoForm.taskDesc = todo.taskDesc;
        $scope.todoForm.status = todo.status;
        $scope.todoForm.id = todo.id;
    };
    
    function _success(response) {
    	//alert("success");
    	_refreshTodoData();
        _clearFormData();
    }

    function _error(response) {
    	//alert("error");
    	console.log(response.statusText);
    }

    //Clear the form
    function _clearFormData() {
        $scope.todoForm.id = -1;
        $scope.todoForm.taskName = "";
        $scope.todoForm.taskDesc = "";
        $scope.todoForm.status = "";
    
    };
});
