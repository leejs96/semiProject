<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en" data-bs-theme="auto">
<head>
 	<script src="/docs/5.3/assets/js/color-modes.js"></script>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.112.5">
    <title>주문서작성</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

</head>

<body class="bg-body-tertiary">
	<% String user_id = (String)session.getAttribute("id"); %>
	<div class="container">
		<span>
		<button onclick="history.back();" style="border: 0; background-color: transparent; padding-top : 20px;">
			<svg xmlns="http://www.w3.org/2000/svg" width="23px" height="23px" fill="currentColor" class="bi bi-arrow-left" viewBox="0 0 16 16">
	  			<path fill-rule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z"/>
			</svg>
		</button>
		</span>
	<form class="needs-validation" action = "OrderEd.jsp" method="post">
		<% 
		 //shoppingcart.jsp 에서 submit 받아온 정보입니다. 
			String[] itemname = request.getParameterValues("item");  //상품이름
			String[] itemcode = request.getParameterValues("itemcode"); //제품코드
			String[] price = request.getParameterValues("price"); //상품단가
			String[] totalp = request.getParameterValues("totalp"); // 단가*수량
			String[] quantity = request.getParameterValues("quantity");  // 상품수량
			
			// 장바구니에 담긴 상품가격의 총 합을 구하기 위한 변수입니다. 주문페이지 우측 상단 Your cart에 표시됩니다.
			int sum = 0;
			for(int i=0; i < itemcode.length; i++){
				sum += Integer.parseInt(totalp[i]);
			}
		
		%>
	    
	
			<div class="py-5 text-center">
				<h1>주문서 작성</h1>
			</div>
	   
			<hr class="my-4">
			<div class="row g-5">
				<div class="col-md-5 col-lg-4 order-md-last">
					<h4 class="d-flex justify-content-between align-items-center mb-3">
						<span class="text-primary">Your cart</span>
					</h4>
					
					<ul class="list-group mb-3">
		
					<% 
						for(int i=0; i < itemcode.length; i++){  
					%>
						<li class="list-group-item d-flex justify-content-between lh-sm">
							<div>
								<h6 class="my-0"><%=itemname[i]%></h6>
							</div>
							<span class="text-body-secondary">￦ <%=totalp[i]%></span>
							
							<input type = hidden name = itemname value=<%=itemname[i]%>>
							<input type = hidden name = totalp value = <%=totalp[i]%>>
							<input type = hidden name = itemcode value = <%=itemcode[i]%>>
							<input type = hidden name = quantity value = <%=quantity[i] %>>
							<input type = hidden name = price value = <%=price[i] %>>
						</li>
					<%         
						}        
					%>
						<li class="list-group-item d-flex justify-content-between">
							<span>Total (KRW)</span>
							<strong>￦ <%=sum%></strong>
							<input type = "hidden" name= sum value = <%=sum%>>
						</li>
					</ul>
				</div>
				
				<div class="col-md-7 col-lg-8">
					<h4 class="mb-3">Billing address</h4>
	
					<div class="row g-3">
						<div class="col-sm-6">
							<label for="firstName"  class="form-label">ID: </label>
							<input type="hidden" class="form-control" name="ID" value="<%=user_id %>" required><%=user_id %>
						</div>
	
	
						<div class="col-12">
							<label for="address" class="form-label">Address</label>
							<input type="text" class="form-control" id="address" placeholder="1234 Main St" required>
						</div>
	
						<div class="col-12">
							<label for="phone" class="form-label">Phone number <span class="text-body-secondary"></span></label>
							<input type="text" class="form-control" name ="phone_number" placeholder="01012341234">
						</div>
	
						<div class="col-md-5">
							<label for="country" class="form-label">Country</label>
							<select class="form-select" id="country" required>
								<option value="">Choose...</option>
								<option>서울특별시</option>
								<option>경기도</option>
								<option>인천</option>
								<option>대전</option>
								<option>광주</option>
								<option>대구</option>
								<option>울산</option>
								<option>부산</option>               
								<option>제주</option>
								<option></option>
							</select>           
						</div>
	
						<div class="col-md-4">
							<label for="state" class="form-label">State</label>
							<select class="form-select" id="state" required>
								<option value="">Choose...</option>
								<option>California</option>
							</select>
							<div class="invalid-feedback">
								Please provide a valid state.
							</div>
						</div>
	
						<div class="col-md-3">
							<label for="zip" class="form-label">Zip</label>
							<input type="text" class="form-control" id="zip" placeholder="" required>
							<div class="invalid-feedback">
								Zip code required.
							</div>
						</div>
					</div>
				
					<hr class="my-4">
					
					<h4 class="mb-3">Payment</h4>
	
					<div class="my-3">
						<div class="form-check">
							<input id="credit" name="payment" type="radio" value = "credit" class="form-check-input" checked required>
							<label class="form-check-label" for="credit">Credit card</label>
						</div>
						
						<div class="form-check">
							<input id="debit" name="payment" type="radio"  value = "debit" class="form-check-input" required>
							<label class="form-check-label" for="debit">Debit card</label>
						</div>
						
						<div class="form-check">
							<input id="paypal" name="payment" type="radio" value = "paypal" class="form-check-input" required>
							<label class="form-check-label" for="paypal">PayPal</label>
						</div>
					</div>
	
					<div class="row gy-3">
						<div class="col-md-6">
							<label for="cc-name" class="form-label">Name on card</label>
							<input type="text" class="form-control" id="cc-name" placeholder="" required>
							<small class="text-body-secondary">Full name as displayed on card</small>
							<div class="invalid-feedback">
								Name on card is required
							</div>
						</div>
					
						<div class="col-md-6">
							<label for="cc-number" class="form-label">Credit card number</label>
							<input type="text" class="form-control" id="cc-number" placeholder="" required>
							<div class="invalid-feedback">
								Credit card number is required
							</div>
						</div>
	
						<div class="col-md-3">
							<label for="cc-expiration" class="form-label">Expiration</label>
							<input type="text" class="form-control" id="cc-expiration" placeholder="" required>
							<div class="invalid-feedback">
								Expiration date required
							</div>
						</div>
					
						<div class="col-md-3">
							<label for="cc-cvv" class="form-label">CVV</label>
							<input type="text" class="form-control" id="cc-cvv" placeholder="" required>
							<div class="invalid-feedback">
								Security code required
							</div>
						</div>
					</div>
	
					<hr class="my-4">
	
					<button class="w-100 btn btn-primary btn-lg" type="submit">주문완료하기!</button>
				</div>
	
			</div>
		</form>
	</div>

	<footer class="my-5 pt-5 text-body-secondary text-center text-small">
		<p class="mb-1">&copy; 2017–2023 Company Name</p>
		<ul class="list-inline">
			<li class="list-inline-item"><a href="#">Privacy</a></li>
			<li class="list-inline-item"><a href="#">Terms</a></li>
			<li class="list-inline-item"><a href="#">Support</a></li>
		</ul>
	</footer>
	
	<script src="/docs/5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>

</body>
</html>