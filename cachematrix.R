## This function creats a special "matrix" object that can cache its 
## inverse 

makeCacheMatrix <- function(X = matrix()) {
      # Initialize to NULL
      Xinv <- NULL
      
      # Create the matrix in the working environment
      set <- function(Y){
            X <<-Y
            Xinv <<- NULL
      }
      
      # Get the matrix
      get <- function() X
      
      # Set the inverse of the matrix
      setinverse <- function(inverse) Xinv <<- inverse
      
      # Get the inverse of the matrix
      getinverse <- function() Xinv
      
      # Return the created functions to the working environment 
      list(set=set, get=get, setinverse=setinverse, getinverse=getinverse) 
      
}

## This function computes the inverse of the special "matrix" X returned by 
## makeCacheMatrix (X = matrix())

cacheSolve <- function(X, ...) {
      ## This function computes the inverse of the special "matrix" X returned by 
      ## makeCacheMatrix (X = matrix())
      
      # Attempt to retrieve the inverse matrix stored in cache 
      Xinv <- X$getinverse() #get the inversed matrix from X
      
      # If stored, return the inverse matrix
      if(!is.null(Xinv)) {
            message("getting cached data")
            return(Xinv)
      }
      
      # If not, create the matrix and store in cache
      M <- X$get() 
      
      # Check whether the matrix is invertible
      # If not, handle error; else, compute the inverse matrix
      tryCatch({
            # try to solve for the inverse matrix
            Minv <- solve(M,...)
      },
      error = function(e) {
            message("Error:")
            message(e)
            stop("Try another matrix: ) ")
      }
      ) # END tryCatch
      
      # If inverse matrix exist, solve for Minv
      Minv = solve(M,...)
      # store Minv in cache
      X$setinverse(Minv) 
      # return the inverse matrix
      return(Minv)
}
