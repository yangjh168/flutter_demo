let videoList = [];
let video1 = document.getElementsByTagName('video');
console.log("首页video")
videoList.concat(video1)
console.log(videoList)
function getVideo(ifram) {
  console.log(ifram)
  if (ifram.length>0) {
    for (let index = 0; index < ifram.length; index++) {
      const item = ifram[index];
      let docu = item.contentWindow.document
      let video = docu.getElementsByTagName('video');
      if (video.length>0) {
        videoList.concat(video)
      }
      // let subIframe = docu.getElementsByTagName('iframe');
      // if (subIframe) {
      //   getVideo(subIframe)
      // }
    }
  }
}
var item = document.getElementsByTagName('iframe');
getVideo(item)
console.log("结果:")
console.log(videoList)

// http://www.imomoew.com/ 广告移除脚本
var brde = document.getElementsByTagName('brde')
brde[0].style.display = 'none'
let uId = brde[0].id
var fDom = document.querySelectorAll("."+uId+"_f")
for(let index=fDom.length-1;index>=0;index--){
  let items = fDom[index]
  items.remove()
}

// http://m.imomoe.ai/ 广告移除脚本
var h5game = document.querySelectorAll(".h5game")
for(let index=h5game.length-1;index>=0;index--){
  let items = h5game[index]
  items.remove()
}
document.querySelector('#ad_i90l0631428gi3z52v').remove()