## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) { # x input matrix
  m <- NULL			# init m to null
				        # m will be the inverse
  set <- function(y) {   # set function
    x <<- y
    m <<- NULL
  }
  get <- function() x 		# return value of input matrix
  setsolve <- function(solve) m <<- solve # called by cacheSolve the first time
  getsolve <- function() m	# return the cache value
  list(set = set, get = get,	# list of accessed methods of the object
       setsolve = setsolve,
       getsolve = getsolve)

}


## Write a short comment describing this function
## Return a matrix that is the inverse of 'x'
cacheSolve <- function(x, ...) {# x input matrix
  m <- x$getsolve()		# get the solve value of the object x
  if(!is.null(m)) {		# valued is cached
    message("getting cached data") # print msg on screen
    return(m)			# return inverse 
  }
  data <- x$get()		# calculate the inverse
  m <- solve(data, ...)
  x$setsolve(m)			# store te value
  m				# return the inverse
        
}
