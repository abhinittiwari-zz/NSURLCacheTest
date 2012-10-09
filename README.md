NSURLCacheTest
==============

Testing for any discrepancies in NSURLConnection and NSURLCache behavior on iOS 5.1 vs iOS 6.0

iOS 6.0 with internet connectivity
---

initWithURL:

```
-[VXTViewController connection:willSendRequest:redirectResponse:]
-[VXTViewController connection:didReceiveResponse:]
-[VXTViewController connectionDidFinishLoading:]
```

NSURLRequestReloadIgnoringCacheData

```
-[VXTViewController connection:willSendRequest:redirectResponse:]
-[VXTViewController connection:didReceiveResponse:]
-[VXTViewController connection:willCacheResponse:]
-[VXTViewController connectionDidFinishLoading:]
```

NSURLRequestReloadIgnoringLocalAndRemoteCacheData

```
-[VXTViewController connection:willSendRequest:redirectResponse:]
-[VXTViewController connection:didReceiveResponse:]
-[VXTViewController connection:willCacheResponse:]
-[VXTViewController connectionDidFinishLoading:]
```

NSURLRequestReloadRevalidatingCacheData

```
-[VXTViewController connection:willSendRequest:redirectResponse:]
-[VXTViewController connection:didReceiveResponse:]
-[VXTViewController connection:willCacheResponse:]
-[VXTViewController connectionDidFinishLoading:]
```

NSURLRequestReturnCacheDataDontLoad

```
-[VXTViewController connection:willSendRequest:redirectResponse:]
-[VXTViewController connection:didReceiveResponse:]
-[VXTViewController connectionDidFinishLoading:]

```
NSURLRequestReturnCacheDataElseLoad

```
-[VXTViewController connection:willSendRequest:redirectResponse:]
-[VXTViewController connection:didReceiveResponse:]
-[VXTViewController connectionDidFinishLoading:]

```


iOS 5.1 with internet connectivity
---

initWithURL:

```
-[VXTViewController connection:willSendRequest:redirectResponse:]
-[VXTViewController connection:didReceiveResponse:]
-[VXTViewController connectionDidFinishLoading:]
```

NSURLRequestReloadIgnoringCacheData
```
-[VXTViewController connection:willSendRequest:redirectResponse:]
-[VXTViewController connection:didReceiveResponse:]
-[VXTViewController connection:willCacheResponse:]
-[VXTViewController connectionDidFinishLoading:]
```

NSURLRequestReloadIgnoringLocalAndRemoteCacheData
```
-[VXTViewController connection:willSendRequest:redirectResponse:]
-[VXTViewController connection:didReceiveResponse:]
-[VXTViewController connection:willCacheResponse:]
-[VXTViewController connectionDidFinishLoading:]
```

NSURLRequestReloadRevalidatingCacheData
```
-[VXTViewController connection:willSendRequest:redirectResponse:]
-[VXTViewController connection:didReceiveResponse:]
-[VXTViewController connection:willCacheResponse:]
-[VXTViewController connectionDidFinishLoading:]
```

NSURLRequestReturnCacheDataDontLoad
```
-[VXTViewController connection:willSendRequest:redirectResponse:]
-[VXTViewController connection:didReceiveResponse:]
-[VXTViewController connectionDidFinishLoading:]
```

NSURLRequestReturnCacheDataElseLoad
```
-[VXTViewController connection:willSendRequest:redirectResponse:]
-[VXTViewController connection:didReceiveResponse:]
-[VXTViewController connectionDidFinishLoading:]
```