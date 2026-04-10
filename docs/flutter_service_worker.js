'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "22eb6fc08e8289bf68a87bb1e652abfe",
"assets/AssetManifest.bin.json": "7aafd293833fdabf50a723db25758ba2",
"assets/AssetManifest.json": "6509b720d06d3c43cc0bf816f0ebdb67",
"assets/assets/files/cv.pdf": "fbd2a92b7f71fb05fbba2cc707582436",
"assets/assets/icons/attention.png": "e973466486b1186dafbed3e5d3a2a036",
"assets/assets/icons/berserk.jpg": "d22b95c00aa8f6de9e9b11150272426e",
"assets/assets/icons/figma.png": "ac00fa7b6768286ad44283e4595dd07e",
"assets/assets/icons/figma_icon.png": "da37926299af06fef729917fe07b94e8",
"assets/assets/icons/gmail.png": "eabc1a70245f1384e30960f25f9b2784",
"assets/assets/icons/google.png": "9d9011cd24016b4c8969a8e1004a3d4f",
"assets/assets/icons/ibmpng.png": "1c6983d2fa1829e8619f7becc1df8d17",
"assets/assets/icons/light-bulb.png": "1eac7d5aef1d994c5792b823f7326ed6",
"assets/assets/icons/linkedin.png": "d492efc706db983e74258dbd348f2208",
"assets/assets/icons/nh01.jpg": "0627b288988fc19bdad306c9419abe13",
"assets/assets/icons/warning.png": "8c562f0b2db0e1133e09c554e09e1d13",
"assets/assets/images/fixme.png": "191ff4660fc24d93f3072456c4679c25",
"assets/assets/images/jobly.png": "0645179887e752719d858e576886e247",
"assets/assets/images/library.png": "fde8f58db867a6730e610dddf86e5201",
"assets/assets/images/me.png": "277da165d4e773461e3bd081d25603fb",
"assets/assets/images/saae.png": "df04e0880e4964ef07d027b7ee5dcd61",
"assets/assets/images/solar.png": "713b6e606f6a81f6b6c475e724cd8e13",
"assets/assets/jobly/1.png": "49752516c782849941e000a1771dae9a",
"assets/assets/jobly/10.png": "e2993e9757581e3aa573870e3d1cd674",
"assets/assets/jobly/11.png": "c02fe5289d3f7116a40516822f2093f4",
"assets/assets/jobly/12.png": "63a4f5e117931df9b792aeecadc72b55",
"assets/assets/jobly/13.png": "2db02bb86bf7422074fead45e32435c9",
"assets/assets/jobly/14.png": "1b13cf720a12f98a0fc75a87c1ba8cb1",
"assets/assets/jobly/15.png": "41a23789e1bc4febf4ec0ad1dce586e4",
"assets/assets/jobly/16.png": "c1e4418a55ad578833cfe21131e9682d",
"assets/assets/jobly/17.png": "bced77d56cb3bb42633c47dfd9e472cd",
"assets/assets/jobly/18.png": "8d714853ed8e3e8e1675c860ed6572f3",
"assets/assets/jobly/19.jpg": "3281a4ffc9796c034f81f9c82cbbd875",
"assets/assets/jobly/2.png": "3eff9bc97e6abb30a478af940326832b",
"assets/assets/jobly/20.jpg": "d7bae1463c602c68299387584a2a09a8",
"assets/assets/jobly/21.jpg": "7711f0e36959c7669dcc96240b0028b1",
"assets/assets/jobly/22.jpg": "16d2451b5f0e2019b65b3583908d21b2",
"assets/assets/jobly/23.jpg": "858cf4f907897d389048269b51d78bf4",
"assets/assets/jobly/24.jpg": "f84a1a5145f9b9fe17137b28b59d714d",
"assets/assets/jobly/25.jpg": "82ffc5faedc1786f42d12c6ab914ebca",
"assets/assets/jobly/3.png": "c2132568e0af08b533378a3711b1bdd7",
"assets/assets/jobly/4.png": "cafdad4894af92d930e681909ac83717",
"assets/assets/jobly/5.png": "fa2bf70780a78039ce8437467bd68f3b",
"assets/assets/jobly/6.png": "cdcddcaa35cb3ac56dbab388dde64352",
"assets/assets/jobly/7.png": "7d4108aea504872f132419048038db04",
"assets/assets/jobly/8.png": "6a978ce3ac2cf71953a7ef1fa8f8fb12",
"assets/assets/jobly/9.png": "b988f949da13f5ed63e0bcc1d0721065",
"assets/assets/tayar/product%2520purchase_compare.mp4": "eba61a5509edad1552c91cb8cc3b621d",
"assets/assets/tayar/recommendation(not%2520final%2520version).mp4": "db7bf4604b008b0ae067c792b75ff46a",
"assets/assets/tayar/workshop%2520request.mp4": "35e50d36c5ce22e394afaf9f2ae31024",
"assets/assets/tecno_library/1.2.jpg": "0dbd9b1bf54e6c6445e9830175304f2a",
"assets/assets/tecno_library/1.jpg": "0ed2509ae8a4597d7f8aafda9c740737",
"assets/assets/tecno_library/10.jpg": "ecc199ffaedd23c44854dcfc39bf325a",
"assets/assets/tecno_library/2.jpg": "d159cef6ddcec85d7080e4ea2bb1f361",
"assets/assets/tecno_library/3.jpg": "7da64515be20d473520bd1beda58f95f",
"assets/assets/tecno_library/4.jpg": "4c4e2f4f7c8f832bcef721bbeec43b98",
"assets/assets/tecno_library/5.2.jpg": "6e28894a8d8dc49d690505dddbafa22c",
"assets/assets/tecno_library/5.jpg": "b1fe18fdbb90c937753ad1a254221b53",
"assets/assets/tecno_library/6.jpg": "a52aeee2896fd928ab1607688ce5f799",
"assets/assets/tecno_library/7.jpg": "c8bd46740b8b1dfff901ec0417d4ddd4",
"assets/assets/tecno_library/8.jpg": "f1c7fd17a5ee407240a31f3f35ce7bb3",
"assets/assets/tecno_library/9.jpg": "fc4ee6b89c447cf532bd4a401d3e5445",
"assets/assets/tecno_library/LinkedIn%2520Video%2520Downloader%2520-%2520Free,%2520No%2520Signup.mp4": "93827a2c999fbe91b1ef7728ad3e470a",
"assets/FontManifest.json": "5f2104555f9dc483e7c1c81985a5b83b",
"assets/fonts/MaterialIcons-Regular.otf": "d86f30d16d6ac218f02bb16e3a23b062",
"assets/NOTICES": "94eeb88e4fe66e638c2744f79734599e",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "2dea6a14df78a2d3afe473b36e523e0a",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "0f58d0443b96d04aa21f38fa7626213f",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "df92ce2c19b43f2cbb62a9c990ac3103",
"assets/packages/syncfusion_flutter_pdfviewer/assets/fonts/RobotoMono-Regular.ttf": "5b04fdfec4c8c36e8ca574e40b7148bb",
"assets/packages/syncfusion_flutter_pdfviewer/assets/icons/dark/highlight.png": "2aecc31aaa39ad43c978f209962a985c",
"assets/packages/syncfusion_flutter_pdfviewer/assets/icons/dark/squiggly.png": "68960bf4e16479abb83841e54e1ae6f4",
"assets/packages/syncfusion_flutter_pdfviewer/assets/icons/dark/strikethrough.png": "72e2d23b4cdd8a9e5e9cadadf0f05a3f",
"assets/packages/syncfusion_flutter_pdfviewer/assets/icons/dark/underline.png": "59886133294dd6587b0beeac054b2ca3",
"assets/packages/syncfusion_flutter_pdfviewer/assets/icons/light/highlight.png": "2fbda47037f7c99871891ca5e57e030b",
"assets/packages/syncfusion_flutter_pdfviewer/assets/icons/light/squiggly.png": "9894ce549037670d25d2c786036b810b",
"assets/packages/syncfusion_flutter_pdfviewer/assets/icons/light/strikethrough.png": "26f6729eee851adb4b598e3470e73983",
"assets/packages/syncfusion_flutter_pdfviewer/assets/icons/light/underline.png": "a98ff6a28215341f764f96d627a5d0f5",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "86e461cf471c1640fd2b461ece4589df",
"canvaskit/canvaskit.js.symbols": "68eb703b9a609baef8ee0e413b442f33",
"canvaskit/canvaskit.wasm": "efeeba7dcc952dae57870d4df3111fad",
"canvaskit/chromium/canvaskit.js": "34beda9f39eb7d992d46125ca868dc61",
"canvaskit/chromium/canvaskit.js.symbols": "5a23598a2a8efd18ec3b60de5d28af8f",
"canvaskit/chromium/canvaskit.wasm": "64a386c87532ae52ae041d18a32a3635",
"canvaskit/skwasm.js": "f2ad9363618c5f62e813740099a80e63",
"canvaskit/skwasm.js.symbols": "80806576fa1056b43dd6d0b445b4b6f7",
"canvaskit/skwasm.wasm": "f0dfd99007f989368db17c9abeed5a49",
"canvaskit/skwasm_st.js": "d1326ceef381ad382ab492ba5d96f04d",
"canvaskit/skwasm_st.js.symbols": "c7e7aac7cd8b612defd62b43e3050bdd",
"canvaskit/skwasm_st.wasm": "56c3973560dfcbf28ce47cebe40f3206",
"favicon.png": "3b716b990c2a3c5a01055577aabd8112",
"files/cv.pdf": "fbd2a92b7f71fb05fbba2cc707582436",
"flutter.js": "76f08d47ff9f5715220992f993002504",
"flutter_bootstrap.js": "41b48ea69ce1b604fbb483b12b539247",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "ee0096af8f4dc06843f09bde69030e89",
"/": "ee0096af8f4dc06843f09bde69030e89",
"main.dart.js": "53fe9b0fb7d1dad79e83951300c2f0a9",
"manifest.json": "256f1a3574b9dc265a068aac017a2cde",
"version.json": "bbc5057d30d59c71278e397fd2c4b4f9"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
