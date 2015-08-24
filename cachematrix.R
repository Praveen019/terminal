## makeCacheMatrix intended for the data and mean vaule storing. It also provide a mechanism 
## to check data changes
makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  get <- function() x
  setinverse <- function(inv) i <<- inv
  getinverse <- function() i
  list(
    set = set,
    get = get,
    setinverse = setinverse,
    getinverse = getinverse
  )
}
## Return a matrix that is the inverse of 'x'
## trying to get inverse data from chache 
cacheSolve <- function(x, ...) {
  i <- x$getinverse()
  if(!is.null(i)) {
    message("getting cached data")
    return(i)
  }
  m <- x$get()
  i <- solve(m, ...)
  x$setinverse(i)
  i
}
#use the following code to test the code
#source('~/cachematrix.R')
#my_matrix <- makeCacheMatrix(matrix())#enter a square matrix with non-zero determinant
#cacheSolve(my_matrix)
