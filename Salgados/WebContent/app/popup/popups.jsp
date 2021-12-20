

    
<style>

.cHEach {
  display: flex;
  align-self: center;
  position: fixed;
  max-width: 872px;
  bottom: 68px;
  z-index: 3;
  left: calc(50% - 420px);
}

.dMwpVk {
    grid-template-areas: "emoji text button";
    row-gap: unset;
    margin: 0px;
  
    display: grid;
    gap: 16px 12px;
    margin: 0px 16px;
    padding: 16px;
    border-radius: 8px;
    background-color: rgb(255,255,255);
    box-shadow: 0 0 8px -4px rgba(0,0,0,0.5);
}

.eahtgf {
      display: flex;
    -webkit-box-align: center;
    align-items: center;
      grid-area: emoji / emoji / emoji / emoji;
    width: 32px;
    font-size: 32px;
    height: auto;
}

.kBxBNa {
      grid-area: button / button / button / button;
    display: flex;
    -webkit-box-align: center;
    align-items: center;
}
</style>


<div class="sc-1v2e8bw-0 cHEach d-none">
  <div role="dialog" class="sc-1v2e8bw-1 dMwpVk"><span class="sc-1v2e8bw-2 eahtgf"><img style="max-width: 90px;" src="https://image.flaticon.com/icons/png/512/119/119647.png"></span><p class="sc-1v2e8bw-3 bSoPsW">Usamos cookies para melhorar sua experiência de navegação, segurança, análises de navegação e personalização de conteúdo em nosso site. Saiba mais em nossa <a href="<%= request.getContextPath() %>/app/politica-privacidade.jsp">Política de Privacidade.</a></p><div class="sc-1v2e8bw-4 kBxBNa"><button class="sc-1h0pwez-3 kDLPzU sc-1v2e8bw-5 cRAcmR btn btn-primary btn-sm" type="button">Entendi</button></div></div></div>
    
<script>

	let cookieExists = localStorage.getItem('cookie')
	if(cookieExists == 'false') {
		const cookieContainer = document.querySelector('.cHEach')
		cookieContainer.classList.remove('d-none')
	}
	
	const btnCookie = document.querySelector('.kDLPzU')
	btnCookie.addEventListener('click', function() {
		const cookieContainer = document.querySelector('.cHEach')
		cookieContainer.classList.add('d-none')
		localStorage.setItem('cookie', true)
	})
	
	
</script>    

    