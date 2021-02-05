const posts = [

    {
        "index": "1",
        "title": "How To Dual Boot on a Chromebook",
        "url": "https://www.chromebookmods.ml/posts/dual-boot/"
    },

    {
        "index": "2",
        "title": "How To Enable Developer Mode on a Chromebook",
        "url": "https://www.chromebookmods.ml/posts/developer-mode/"
    },

    {
        "index": "3",
        "title": "How To Run .AppImage Files",
        "url": "https://www.chromebookmods.ml/posts/run-app-image-files/"
    },

    {
        "index": "4",
        "title": "How To Install ZeroBrane IDE on Linux",
        "url": "https://www.chromebookmods.ml/posts/zerobrane-ide/"
    },
    
    {
        "index": "5",
        "title": "How To Compress a Video with FFMPEG",
        "url": "https://www.chromebookmods.ml/posts/compress-videos/"
    },
    
    {
        "index": "6",
        "title": "How To Install Windows 10 on Chromebook",
        "url": "https://www.chromebookmods.ml/posts/install-windows-10-on-chromebook/"
    }

];

const postsList = document.getElementById('posts');
const searchBar = document.getElementById('searchBar');
let array = [];

searchBar.addEventListener('keyup', (event) => {
    const query = event.target.value.toLowerCase();

    const filteredPosts = array.filter((p_) => {
        return (
            p_.title.toLowerCase().includes(query) ||
            p_.url.toLowerCase().includes(query)
        );
    });
    displayPosts(filteredPosts);
});

const loadPosts = async () => {
    array = posts;
    displayPosts(array);
};

const displayPosts = (_posts_) => {
    const string = _posts_
        .map((_post_) => {
            return `
            <div class="flex co${_post_.index}">
                <div class="post${_post_.index}">
                </div>
                <div class="text">
                    <p>
                        <a href="${_post_.url}">${_post_.title}</a>
                    </p>
                </div>
            </div>
        `;
        })
        .join('');
    postsList.innerHTML = string;
};

loadPosts();
