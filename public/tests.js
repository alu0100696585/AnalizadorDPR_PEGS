var assert = chai.assert; //la variable assert contiene los asertos que se pueden realizar

suite( 'Analizador sintáctico con PEGJS', function(){  //Suite equivale al describle en RAKE
  
  test('Resta asociativa a la izquierda', function(){  
    var result = pl0.parse("A = 3 - 4 - 1.");
    assert.deepEqual(result, "");
  });
});