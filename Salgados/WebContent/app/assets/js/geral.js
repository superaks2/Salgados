/**
 * 
 */
// Deve ficar no topo
const initCartData = inicializaProductsCartData()

// HEADER
let ativado = false
window.onscroll = (e) => {
  const header = document.querySelector('header')
  if(window.scrollY >= 90 && !ativado) {
    ativado = true
    header.classList.toggle('active')
  } else if(window.scrollY < 90 && ativado) {
    ativado = false
    header.classList.toggle('active')
  }
}
// END HEADER

const swiper = new Swiper(".swiper", {
  // Optional parameters
  loop: true,
  autoplay: {
    delay: 5000
  },
  speed: 500,
  spaceBetween: 50,
  // If we need pagination
  pagination: {
    el: ".swiper-custom-pagination",
    clickable: true,
    renderBullet: function (index, className) {
      return `<span class=${className}>${index+1}</span>`;
    },
  },
  // Navigation arrows
  navigation: {
    nextEl: ".swiper-button-custom-next",
    prevEl: ".swiper-button-custom-prev"
  }
});


// ANIMAÇÃO
AOS.init({
  duration: 1000
});
// END ANIMAÇÃO


// CARRINHO
const productsCartData = []

function inicializaProductsCartData() {
	const state = {
			observers: []
	}
	const jsonCart = getJsonCart()
	if(jsonCart.length == 0) {
		initCarrinho([])
		notifyAll([])
	} else {
		$.ajax({
			url: '/Salgados/api/carrinho/produtos',
			data: {
				produtos: jsonCart
			}
		}).done(produtosData => {
			for(let i = 0; i < produtosData.length; i++) {
				for(let b = 0; b < jsonCart.length; b++) {
					if(produtosData[i].id == jsonCart[b].id) {
						productsCartData.push({...produtosData[i], ...jsonCart[b]})
					}
				}
			}
			
			// Carrega conteúdo html do carrinho
			notifyAll(productsCartData)
		})
	}
	
	function subscribe(observerFunction) {
		state.observers.push(observerFunction)
	}
	
	function notifyAll(productData) {
		for(let observerFunction of state.observers) {
			observerFunction(productData)
		}
	}

	return {
		subscribe
	}
	
}

// Inicializa o HTML do carrinho
function initCarrinho(productsData) {
	const carrinhoContainer = document.querySelector('.carrinho-container')
	const carrinhoCount = document.querySelector('.carrinho-count')
	
	carrinhoCount.innerHTML = productsData.length
	
	if(productsData.length > 0) {
		productsData.forEach(productData => {
			const elementCarrinhoProduto = document.createElement('div')
			elementCarrinhoProduto.innerHTML = createCartProductHTML(productData)
			carrinhoContainer.appendChild(elementCarrinhoProduto)
			valorTotalUpdate()
		})	
	} else {
		const elementText = document.createElement('h5')
		elementText.innerText = "Carrinho Vazio."
		elementText.classList.add('text-center')
		carrinhoContainer.appendChild(elementText)
	}
	
}
initCartData.subscribe(initCarrinho)

// Ação chamada quando o usuário clica no produto
function acaoProduto(e, element) {
	const btnAdd = element.querySelector('.btn-add')
	const inputAdd = element.querySelector('.input-add')
	const produtoData = JSON.parse(element.dataset['produto'])
	
	// Ação adicionar ao carrinho
	if(e.target == btnAdd) {
		const elementInput = element.querySelector('input.input-number')
		const quantidade = elementInput.value
		
		elementInput.value = '1'
		
		addCart({...produtoData, quantidade: quantidade})
		
	} else if(inputAdd.contains(e.target)) { // Ação incrementar ou decrementar
		const btnMinus = element.querySelector('.minus')
		const btnPlus = element.querySelector('.plus')
		const input = element.querySelector('input.input-number')
		
		if(e.target == btnMinus || btnMinus.contains(e.target)) {
			input.value = Math.max((Number(input.value) - 1), 1)
		} else if(e.target == btnPlus || btnPlus.contains(e.target)) {
			input.value = (Number(input.value) + 1)
		}
	}
}

function acaoCarrinhoProduto(e, element) {
	const inputAdd = element.querySelector('.input-add')
	const produtoData = JSON.parse(element.dataset['produto'])
	
	// Ação adicionar ao carrinho
	if(inputAdd.contains(e.target)) { // Ação incrementar ou decrementar
		const btnMinus = element.querySelector('.minus')
		const btnPlus = element.querySelector('.plus')
		const elementInput = element.querySelector('input.input-number')
		let quantidade = 0
				
		if(e.target == elementInput) {
			return ;
		}
		else if(e.target == btnMinus || btnMinus.contains(e.target)) {
			elementInput.value = Math.max(Number(elementInput.value - 1), 1)
		} else if(e.target == btnPlus || btnPlus.contains(e.target)) {
			let newValue = Number(elementInput.value) + 1
			elementInput.value = newValue
		}
			
		
		quantidade = elementInput.value
		
		updateProdutoCart({...produtoData, quantidade: quantidade})
		
		// Atualiza o carrinho no menu quando atualizado na página de produto
		if(!element.classList.contains('carrinho-items')) {
			const valorTotalEl = element.querySelector('.valor-total')
			const valorTotal = Math.round(quantidade * produtoData.valor * 100)/100
			
			valorTotalEl.innerText = `R$ ${valorTotal}`
			
			updateCartHTML(produtoData.id, quantidade, produtoData.valor)
		}
		
		
		
		
	} else if(e.target.classList.contains('btn-remove')) {
		removeCart(produtoData)
	}
	
}

// Atualiza o HTML do carrinho no menu
// essa ação é usada somente na página carrinho.jsp
function updateCartHTML(id, quantidade, valor) {
	const carrinhoContainer = document.querySelector('.carrinho-container')
	const produtoElemento = carrinhoContainer.querySelector(`[data-produto-id="${id}"]`)
	const input = produtoElemento.querySelector('input.input-number')

	input.value = quantidade
	
}

function updateTableHTML(id, quantidade, valor) {
	const tabelaCarrinho = document.querySelector('.tabela-carrinho')
	const produtoElemento = tabelaCarrinho.querySelector(`[data-produto-id="${id}"]`)
	const input = produtoElemento.querySelector('input.input-number')
	
	input.value = quantidade
	console.log('updateTable')
}

function removeCart(productData) {
	const carrinhoContainer = document.querySelector('.carrinho-container')
	const carrinhoCount = document.querySelector('.carrinho-count')
	const produtoCarrinhoEl = carrinhoContainer.querySelector(`[data-produto-id="${productData.id}"]`)
	const carrinhoDetalhe = document.querySelector('.carrinho-detalhe')
	const jsonCart = getJsonCart()
	
	if(produtoCarrinhoEl) {
		for(let i = 0; i < jsonCart.length; i++) {
			if(jsonCart[i].id == productData.id) {
				jsonCart.splice(i, 1)
				break;
			}
		}
		produtoCarrinhoEl.remove()
		carrinhoCount.innerText = jsonCart.length
		localStorage.setItem('cart', JSON.stringify(jsonCart))
		
		if(jsonCart.length == 0) {
			const elementText = document.createElement('h5')
			elementText.innerText = "Carrinho Vazio."
			elementText.classList.add('text-center')
			carrinhoContainer.appendChild(elementText)
			valorTotalUpdate()
			
		}
	}
	
	// Evento remove carinho
	const addCartEvent = new CustomEvent('removeCart', {
		detail: {
			produto: productData
		}
	})
	
	document.dispatchEvent(addCartEvent)
	
}

// Função usada para atualizar os dados do localstorage de um produto
function updateProdutoCart(produtoData) {
	const jsonCart = getJsonCart()
	for(let i = 0; i < jsonCart.length; i++) {
		if(jsonCart[i].id == produtoData.id) {
			jsonCart[i] = produtoData
			break;
		}
	}
	
	localStorage.setItem('cart', JSON.stringify(jsonCart))
	
	const updateProductEvent = new CustomEvent('updateCart', {detail: {
		produto: produtoData
	}})
	
	
	document.dispatchEvent(updateProductEvent)
}

// Eventos quando o carrinho é atualizado
['updateCart', 'removeCart', 'addCart'].forEach(event => {
	document.addEventListener(event, function(e) {
		cartChanged(event, e.detail.produto)
	})
})

function updateProductsCartData(produtoData) {
	const jsonCart = getJsonCart()
	let achouProduto = false
	
	// Verifica se o produto já está em productsCartData e seta o valor
	for(let i = 0; i < productsCartData.length; i++) {
		for(let b = 0; b < jsonCart.length; b++) {
			if(productsCartData[i].id == jsonCart[b].id) {
				productsCartData[i].quantidade = jsonCart[b].quantidade
				achouProduto = true
				break
			}
		}
	}
	
	if(!achouProduto) {
		for(let i = 0; i < jsonCart.length; i++) {	
			if(jsonCart[i].id == produtoData.id) {				
				productsCartData.push({...produtoData, quantidade: jsonCart[i].quantidade})
			}
		}
	}
	
	
	
	console.log('update!')
	
}

function removeProductCartData(produtoData) {
	for(let i = 0; i < productsCartData.length; i++) {
		if(productsCartData[i].id == produtoData.id) {
			productsCartData.splice(i, 1)
		}
	}
	console.log('removeproductData!')
}

function cartChanged(event, produto) {
	
	if(event == 'updateCart' || event == 'addCart') {
		updateProductsCartData(produto)
	} else if('removeCart') {
		removeProductCartData(produto)
	}
	
	// Atualiza o valor total no HTML de .valor-total-geral
	valorTotalUpdate()
	
	// Atualiza o prçeo total do carrinho (droplist)
	const carrinhoDetalhe = document.querySelector('.carrinho-detalhe')
	const jsonCart = getJsonCart()
	// const totalCart = jsonCart.reduce()
}

function valorTotalUpdate() {
	console.log('valorTotalUpdate:', productsCartData)
	const valorTotalGeralEl = document.querySelectorAll('.valor-total-geral')
	let valorTotal = 1
	
	if(productsCartData.length > 0) {		
		valorTotal = 0
		for(let i = 0; i < productsCartData.length; i++) {
			valorTotal += Math.round(Number(productsCartData[i].quantidade) * productsCartData[i].valor * 100) / 100
		}
		valorTotal = Math.round(valorTotal * 100)/100
		console.log(valorTotal)
		valorTotalGeralEl.forEach(element => element.innerHTML = 'R$ ' + valorTotal)
		console.log('cartChanged')
	} else {
		valorTotalGeralEl.forEach(element => element.innerHTML = 'R$ 00,00')
	}
	
}

// Ação chamada quando o usuário adiciona um produto ao carrinho
// pela seção, mas não pelo carrinho.
function addCart(produtoData) {
	const jsonCart = getJsonCart()
	const {id, quantidade} = produtoData
	
	let temProduto = false
	
	for(let i = 0; i < jsonCart.length; i++) {
		if(jsonCart[i].id === id) {
			jsonCart[i].quantidade = Number(quantidade) + Number(jsonCart[i].quantidade)
			produtoData.quantidade = jsonCart[i].quantidade
			temProduto = true
			break;
		}
	}
	
	if(!temProduto) {
		jsonCart.push({id: id, quantidade: quantidade})
	}
	
	localStorage.setItem('cart', JSON.stringify(jsonCart))

	
	// Evento add carinho
	const addCartEvent = new CustomEvent('addCart', {
		detail: {
			produto: produtoData
		}
	})
	
	document.dispatchEvent(addCartEvent)
	
}

function getJsonCart() {
	if(localStorage.getItem('cart')) {
		return JSON.parse(localStorage.getItem('cart'))
	} else {
		localStorage.setItem('cart', JSON.stringify([]))
		return [];
	}
}

// Ação para atualizar o HTML do carrinho
document.addEventListener('addCart', eventAddCart)
function eventAddCart(e) {
	const carrinhoCount = document.querySelector('.carrinho-count')
	const carrinhoContainer = document.querySelector('.carrinho-container')
	const produtoData = e.detail.produto
	const jsonCart = getJsonCart()
	const msgCarrinhoVazio = carrinhoContainer.querySelector('h5')
	
	carrinhoCount.innerText = jsonCart.length
	
	if(msgCarrinhoVazio) {
		msgCarrinhoVazio.classList.add('d-none')
	}
	
	// Verifica se o produto já está no carrinho
	const elementCartProduct = carrinhoContainer.querySelector(`[data-produto-id="${produtoData.id}"]`)
	if(elementCartProduct) {
		const cartValor = elementCartProduct.querySelector('.carrinho-valor')
		const cartQuantidadeInput = elementCartProduct.querySelector('.carrinho-quantidade')
		
		cartValor.innerText = 'R$ ' + produtoData.valor
		cartQuantidadeInput.value = produtoData.quantidade
		
		return ;
	} else {
	
		const elementCarrinhoProduto = document.createElement('div')
		elementCarrinhoProduto.innerHTML = createCartProductHTML(produtoData)
		carrinhoContainer.appendChild(elementCarrinhoProduto)
	
	}
	
	
}

// Função usada na página do carrinho
function createHTMLCartPag(produtoData) {
	return `<tr data-produto='${JSON.stringify(produtoData)}' data-produto-id="${produtoData.id}" onclick="acaoCarrinhoProduto(event, this)">
		<td>
		<figure class="rounded overflow-hidden mb-0 me-3" style="max-width: 30px; display: inline-table;">
            <img src="${produtoData.foto}">
          </figure>
		<span class="produto-nome">${produtoData.nome}</span>
	</td>
	<td>a calcular</td>
	<td class="produto-valor">R$ ${produtoData.valor}</td>
	<td>
		<div class="input-group input-group-sm input-add w-25">
		  <button class="btn btn-outline-secondary left minus" type="button"><span class="fa fa-minus"></span></button>
		  <input type="text" class="form-control normal input-number text-center" value="${produtoData.quantidade}" min="1" max="10">
	      <button class="btn btn-outline-secondary right plus" type="button"><span class="fa fa-plus"></span></button>
		</div>
	</td>
	<td class="valor-total" data-id="${produtoData.id}">R$ ${Number(produtoData.valor) * produtoData.quantidade}</td>
	<td><a href="#" class="link-dark btn-remove"><i class="fas fa-times"></i></a></td>
</tr>`
}


function createCartProductHTML(produtoData) {
	return `
	<div class="carrinho-items p-2 border-bottom" data-produto='${JSON.stringify(produtoData)}' data-produto-id='${produtoData.id}' onclick="acaoCarrinhoProduto(event, this)">
	<div class="carrinho-top d-flex">
	  <figure class="col-3 rounded overflow-hidden mb-0 d-inline-block">
        <img class="carrinho-imagem" src="${produtoData.foto}">
      </figure>
      <div class="col-9 textos d-flex flex-column ps-2">
      	<small class="carrinho-titulo">${produtoData.nome}</small>
      	<small class="fw-bold carrinho-valor">R$ ${produtoData.valor}</small>
      </div>
	</div>
	<div class="d-flex carrinho-mid mt-2 align-items-baseline">
      <div class="col-3">
      &nbsp;
      </div>
	  <div class="col-5 prato-footer-esquerda">
      	<div class="input-group input-group-sm input-add" style="max-width: 100px; max-height: 25px;">
		  <button class="btn btn-outline-secondary left d-flex align-items-center minus" type="button"><span class="fa fa-minus"></span></button>
		  <input type="text" class="form-control normal input-number text-center carrinho-quantidade" value="${produtoData.quantidade}" min="1" max="10">
		    <button class="btn btn-outline-secondary right d-flex align-items-center plus" type="button"><span class="fa fa-plus"></span></button>
		</div>
      </div>
      <div class="col-3">
      	<small class="ms-2"><a href="#" class="btn-remove">Remover</a></small>
      </div>
	</div>
</div>
`;
}


// Evita fechar o dropdown quando clicado no container do carrinho
let carrinhoContainer = document.querySelector('.carrinho-container')
if(carrinhoContainer) {
	carrinhoContainer.addEventListener('click', function (e) {
		e.stopPropagation()
	})
}

// END CARRINHO
