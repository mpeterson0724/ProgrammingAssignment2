## This program is a pair of functions that can cache the inverse of a matrix


## Creates a special matrix object that will cache its inverse

makeCacheMatrix <- function( m = matrix() ) {
   i <- NULL
   set <- function( matrix ) {
    m <<- matrix
    i <<- NULL
  }
  get <- function() m
  setInv <- function(inverse) {
    i <<- inverse
  }
  getInv <- function() i
  
  ## Return a list of the methods
  list(set = set, get = get,
       setInv = setInv,
       getInv = getInv)
}


## This function returns the inverse matrix

cacheSolve <- function(x=matrix(), ...) {
  m <- x$getmatrix()
  if( !is.null(m) ) {
    message("getting cached data")
    return(m)
  }
  
  data <- x$get()
  m <- solve(data) %*% data
  
  ## Set the inverse to the object
  x$setInverse(m)
  
  ## Return the matrix
  m
}