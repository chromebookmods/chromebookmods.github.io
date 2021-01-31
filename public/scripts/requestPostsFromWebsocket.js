const socket = new WebSocket('ws://');

socket.onmessage = ({data}) => {
    const socketRes = JSON.parse(data);
    const res = socketRes['r']
    document.querySelector("ul.mods-post").innerHTML += `
    <li id="post-0">
        <a href="${document.URL}${res[0]['postLink']}">
            <img width="400" height="299" src="${document.URL}${res[0]['postImage']}" title="${res[0]['postTitle']}">
                <b class="title">${res[0]['postTitle']}</b>
        </a>
    </li>
    <hr>
    <li id="post-1">
        <a href="${document.URL}${res[1]['postLink']}">
            <img width="400" height="299" src="${document.URL}${res[1]['postImage']}" title="${res[1]['postTitle']}">
                <b class="title">${res[1]['postTitle']}</b>
        </a>
    </li>
    <hr>
    <li id="post-2">
        <a href="${document.URL}${res[2]['postLink']}">
            <img width="400" height="266" src="${document.URL}${res[2]['postImage']}" title="${res[2]['postTitle']}">
                <b class="title">${res[2]['postTitle']}</b>
        </a>
    </li>`;

};

socket.addEventListener("open", () => {
    socket.send("reqPostsInfo");
})
