#SingleInstance,force

Numpad1::
addres = https://csgostash.com/case/
ID += 10

SendInput, ^{l}
Sleep 32
SendInput, %addres%%ID%{Enter}

;Msgbox, % A_Index
return

/*

function sleep(ms) {
  return new Promise(resolve => setTimeout(resolve, ms));
}
async function delayedGreeting() {

a = document.getElementsByClassName("to-cart");
for(i = 0; i < a.length; i++)
{
await sleep(2000);
if(i < 10)
{
a[i].click();
}
}

}



a = document.getElementsByClassName("table-button market-transaction-return");
for(i = 0; i < a.length; i++)
{
if(i < 100)
{
a[i].click();
}
}


x = document.getElementsByClassName("price");
for(i = 0; i < x.length; i++)
{
alert(x);
}

divEl.getElementsByClassName('paragraph')
x = document.getElementsByClassName("cell price-cell");
alert(x);


const a = parentDOM.getElementsByClassName("test")[0]; // the first element, as we wanted
console.log(a); // <p class="test">hello world 2</p>


div.cell.price-cell

div.price
innerText

const parentDOM = document.getElementsByClassName("cell price-cell")[1];
const testTarget = parentDOM.getElementsByClassName("price")[0];
const Text = testTarget.getElementsByClassName("div");
console.log(Text);
console.log(testTarget);

const collection = testTarget.getElementsByTagName("div");
let text = collection.item(0).innerHTML;
document.getElementById("demo").innerHTML = text;
