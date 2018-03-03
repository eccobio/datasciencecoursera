## These two functions make it possible to, once obtained, retrieve solved inverse matrices 
## instead of recalculating them each time they are needed. 

## makeCacheMatrix takes a square matrix as argument with which to initialize a square num matrix
## then returns a list of functions that enable the retrieval and modification of the matrix value
## along with its inverse, if the latter has been solved for.

makeCacheMatrix <- function(x = matrix()) {
  i = NULL
  set <- function(y){
    x <<- y
    i <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) i <<- inverse
  getinverse <- function() i
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## cacheSolve takes a square matrix, solves for its inverse matrix and caches it for later retrieval

cacheSolve <- function(x, ...) {
  i <- x$getinverse()
  if(!is.null(i)) {
    message("getting cached data")
    return(i)
  }
  data <- x$get()
  i <- solve(data, ...)
  x$setinverse(i)
  i
}
