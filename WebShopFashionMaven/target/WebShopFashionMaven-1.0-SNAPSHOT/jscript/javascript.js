/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

function decrease(btn) {
  const input = btn.parentElement.querySelector("input");
  console.log(input.value);
  if (input.value > 1) input.value--;
}

function increase(btn) {
  const input = btn.parentElement.querySelector("input");
  input.value++;
}
