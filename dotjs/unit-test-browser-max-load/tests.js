//init test and name it
/*
QUnit.test( "hello test", function( assert ) {
  //simple if
  assert.ok( 1 == "1", "Passed!" );
});

//init test and name it

QUnit.test( "deepEqual test", function( assert ) {
  var obj = { foo: "ba8r" };
 
  assert.deepEqual( obj, { foo: "bar" }, "Two objects can be the same in value" );
});


QUnit.test( "equal test", function( assert ) {
  assert.equal( 0, 0, "Zero, Zero; equal succeeds" );
  assert.equal( "", 0, "Empty, Zero; equal succeeds" );
  assert.equal( "", "", "Empty, Empty; equal succeeds" );
 
  assert.equal( "three", 3, "Three, 3; equal fails" );
  assert.equal( null, false, "null, false; equal fails" );
});
*/


//-----------------------------------------///
//reall live test with functions 
/*
function square( x ) {
return x * x;
}

var result = square( 2 );


QUnit.test( "a test", function( assert ) {
	assert.equal( result, 4, "square(2) equals 4" );
});
*/
//-----------------------------------------///
//-----------------------------------------///
//reall live test with functions 

function countLength(max) {
	for(x=0; x < max; x++){
		console.log(x);
		+x;
	}
	return x;
}

var result1 = countLength(117649);

QUnit.test( "a count test with for loop1", function( assert ) {
	assert.equal( result1, 117649, "Counted lenght is equal to 117649" );
});
//-----------------------------------------///
/*
//-----------------------------------------///
//reall live test with functions 
function countLength(max) {
	i=0;
	while(i<max){
		console.log(i);
		+i;
		i++;
	}
	return i;
	
}

var result3 = countLength(5);

QUnit.test( "a count test with while loop3", function( assert ) {
	assert.equal( result3, 5, "Counted lenght is equal to 5" );
});

//-----------------------------------------///

console.log(49 * 49); //2401 2s
console.log(49 * 49 * 49); //117649 45s
console.log(49 * 49 * 49 * 49); //5764801 crashed
console.log(49 * 49 * 49 * 49 * 49); //282475249
console.log(49 * 49 * 49 * 49 * 49 * 49); //13841287201
*/
/*
QUnit.begin(function( details ) {
  console.log( "Test amount:", details.totalTests );
});
*/
