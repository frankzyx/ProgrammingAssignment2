## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
	# Creates a list of functions to set/get matrix x,
	# and to set/get the inverse of x.

	inv <- NULL
	set <- function(y) {
		x <<- y
		inv <<- NULL
	}
	get <- function() x
	setinv <- function(v) inv <<- v
	getinv <- function() inv
	list(set=set, get=get, setinv=setinv, getinv=getinv)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
    # Return a matrix that is the inverse of 'x'
    inv <- x$getinv()
    if (!is.null(inv)) {
    	message("Inverse matrix is read from cache...")
    	return(inv)
    }
    mat <- x$get()
    inv <- solve(mat)
    x$setinv(inv)
    inv
}
