'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "version.json": "957246cbb412ad626f143ef045683780",
"index.html": "2ed99082c25ca0996c2cf711869a0d37",
"/": "2ed99082c25ca0996c2cf711869a0d37",
"main.dart.js": "a6a6b6fffec7ab7ff49a5c1da00997fa",
"favicon.png": "5e91ab2dbf041e47080e52b5578c1a24",
"icons/Icon-192.png": "ad4c6ba373268b163ae988f035f7fa84",
"icons/Icon-maskable-192.png": "ad4c6ba373268b163ae988f035f7fa84",
"icons/Icon-maskable-512.png": "5829d85878cb20f0291f4a0495517ade",
"icons/Icon-512.png": "5829d85878cb20f0291f4a0495517ade",
"manifest.json": "5f23f963ce7ecaac09d645eb64dade88",
"assets/AssetManifest.json": "27015e8f8c0ef71033712e70f80979e6",
"assets/NOTICES": "4b840b49823e7fdf69cbe11dffabf6b4",
"assets/FontManifest.json": "cf20abe5b58a10a69d79ff04d372b7c4",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/fonts/MaterialIcons-Regular.otf": "e7069dfd19b331be16bed984668fe080",
"assets/assets/images/icon.png": "f43539df83452d1b7ee37e27b2e54a75",
"assets/assets/images/rvsp.png": "99f27203a063a76e3a639e758047fe56",
"assets/assets/images/background1.jpg": "371b6c73e6dce371077301352c0b0d2a",
"assets/assets/images/acb.jpg": "0279d182ca0c4fa48f0fdfa303c7725d",
"assets/assets/images/girl.png": "4ea2790264793481ce24e2cc150e29b1",
"assets/assets/images/f1.png": "f15223d1b401fc6dd11ee123b75852ee",
"assets/assets/images/rose_gold.json": "178f31d36ef1fd65393d05f99562fcb4",
"assets/assets/images/circle_flower.json": "0af9c8ce2a102e75daa3aea380869788",
"assets/assets/images/divider3.png": "aa63f12160a803821e1253db2b3958d4",
"assets/assets/images/f2.png": "704f58cb933649dced17e5995ceb959d",
"assets/assets/images/background.jpg": "304c79107eea10fe53030a8c2c9ef5d9",
"assets/assets/images/divider2.png": "312b346e6cc27fd79874a7f183415d1a",
"assets/assets/images/heart.png": "3ea7ff412716d06b835607225b3429f3",
"assets/assets/images/ring.png": "1f93ec7bb0ea36ceb3fda9d20c325ff4",
"assets/assets/images/date_frame.png": "1a8dacdf51e5792b639a09cb6174dbaf",
"assets/assets/images/img3.jpg": "726c7b5f5e6307dd10dd3c8e33c14419",
"assets/assets/images/heart2.png": "f5ce19778d7e030ad94b4e9e4c3ed7a7",
"assets/assets/images/heart3.png": "02663ef9956eb2f601dae9baac0861cb",
"assets/assets/images/img2.jpg": "a9dd9139344ea7837122da5c93a48b53",
"assets/assets/images/vcb.jpg": "489581714874db659ef16f9385ea0109",
"assets/assets/images/bg2.png": "1ceabceb01a66126a32da84a76aa27e7",
"assets/assets/images/img1.jpg": "331942426e75e39827d6ac3292dea193",
"assets/assets/images/heart_feedback.json": "01fdb8427506ea45be4e2ad4ff6eb339",
"assets/assets/images/heart_fly.json": "8a251faf889dcb8b23f1b6a1dbfa74ce",
"assets/assets/images/leaf.png": "66ba7529440f2b1acace57fe53b9d48e",
"assets/assets/images/boy.png": "501c28c3528fe713040d5c7474a33791",
"assets/assets/images/circle_frame.png": "9aab34f83854036021d63be053f78404",
"assets/assets/fonts/wedding.ttf": "add9a64425e5411a280ac0f6ad7c2ab2",
"assets/assets/fonts/OpenSans-Bold.ttf": "8ff9b5735ccb338267f0034d83fe8214",
"assets/assets/fonts/OpenSans-Regular.ttf": "22ab03a6b890f2f142a137a38bf1d4ae"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"index.html",
"assets/AssetManifest.json",
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
