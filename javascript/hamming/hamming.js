var Hamming = function () {};
var Error = function (message) {
  this.message = message;
};

Hamming.prototype.compute = function (a, b) {
  if(a.length !== b.length){
    throw new Error('DNA strands must be of equal length.');
  }

  let differences = 0;
  for ( var i = 0; i < a.length; i ++ ){
    if(a[i] !== b[i]){
      differences++;
    }
  }

  return differences;
};

module.exports = Hamming;
