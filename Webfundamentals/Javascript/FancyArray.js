var arr = ["James", "Jill", "Jane", "Jack"];
var symbol = "->"
function fancyArray(arr){
  for(i = 0; i < arr.length; i++){
     arr[i] = (i) + symbol + arr[i];
  }
  return arr;
}
