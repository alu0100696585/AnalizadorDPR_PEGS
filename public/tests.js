var assert = chai.assert; //la variable assert contiene los asertos que se pueden realizar

suite( 'Analizador sintáctico con PEGJS', function(){  //Suite equivale al describle en RAKE
  
  test('Resta asociativa a la izquierda', function(){  
    var result = pl0.parse("A = 3 - 4 - 1.");
    assert.deepEqual(JSON.stringify(result,undefined,2), "");
  });
  
  test('Division asociativa a la izquierda', function(){  
    var result = pl0.parse("A = 3 / 4 / 2.");
    assert.deepEqual(JSON.stringify(result,undefined,2), "");
  });
  
  test('Constructor program', function(){  
    var result = pl0.parse("const A = 5; var A, b; t = 3.");
    assert.deepEqual(JSON.stringify(result,undefined,2), "");
  });
  
  test('Constructor de bloque', function(){  
    var result = pl0.parse("procedure sum ( u ) j = u + 8; sum = u.");
    assert.deepEqual(JSON.stringify(result,undefined,2), "");
  });
  
  test('Constructor de statement', function(){  
    var result = pl0.parse("B = 6 / i.");
    assert.deepEqual(JSON.stringify(result,undefined,2), "");
  });
  
  test('Constructor de condicion', function(){  
    var result = pl0.parse("if a == b then j = a else j = b.");
    assert.deepEqual(JSON.stringify(result,undefined,2), "");
  });
  
  test('Constructores de termino y factor', function(){  
    var result = pl0.parse("A = 3 * 4 + 2.");
    assert.deepEqual(JSON.stringify(result,undefined,2), "");
  });
});