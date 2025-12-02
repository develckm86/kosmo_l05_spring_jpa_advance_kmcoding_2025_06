const likeForm =document.forms["likeForm"];
const likeBtn=likeForm.likeBtn;
const likeBtnBadge=likeBtn.querySelector(".badge");
likeForm.addEventListener("submit",async function(e){
    e.preventDefault();
    let url=likeForm.action;
    const resp=await fetch(url,{method:"POST"});
    if(resp.ok){
        const json=await resp.json();
        console.log(json)
        if(json.toggle){
            likeBtn.classList.add("active");
        }else{
            likeBtn.classList.remove("active");
        }
        likeBtnBadge.innerText=json.likeCount;
    }else if(resp.status===400){ //session에 로그인 유저가 없는 경우
        alert("로그인 후 이용하세요.");
    }else{
        alert("서버에 문제가 발생했습니다. 다시 시도하세요.");
    }
})