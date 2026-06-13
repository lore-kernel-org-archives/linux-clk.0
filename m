Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D5E03E717B
	for <linux-clk@vger.kernel.org>; Sat, 13 Jun 2026 13:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781356008; cv=none; b=gD6TzBesjTrlFZZwl5kLAACV8B9PHYorxwWfKwO/3t+thqtJ4jcGENAPZ0D/GZvws3tcPy4RtXu67Ob/8P+T2Pybfjo7cHthEsocy/f7Kiw0emJI5YT4MUJEKABTodbzdOAcPRioxsxu5QRjZM8NkPrLfMQGA644BW9DrL7bqf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781356008; c=relaxed/simple;
	bh=N/aP5eDxpyw2n4AsTqEONVjJMGlgTeC3rtTHjXXYzAI=;
	h=Message-ID:Content-Type:MIME-Version:Subject:From:To:Cc:Date; b=LdS5+CJtfRsoBPbyrv0rTIumkC0yTQgDf35e5miLuqJ+1ilyUIO1qZdhHKJejhOOHwJlWAxlVXV+V7zClTn6GSrevlXqNTnXujbAMFwq3/qZ6CokSPE0lp+bBaFu/WIVCRm0vytqHbAH5PsSCq+WOXX+Jht1EwrwyKiB8XVqefM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BPy08EH1; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BPy08EH1"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1384eb94d20so2506785c88.1
        for <linux-clk@vger.kernel.org>; Sat, 13 Jun 2026 06:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781356003; x=1781960803; darn=vger.kernel.org;
        h=date:cc:to:from:subject:content-transfer-encoding:mime-version
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=N/aP5eDxpyw2n4AsTqEONVjJMGlgTeC3rtTHjXXYzAI=;
        b=BPy08EH11QJgztMKs97NWSC2nXQ/EkAD0bKuNp4u16ZrvkLgN1gT0AavIByGhX1bBB
         hFEkGnZl71HldQe8irHuaIPevBpMoCrKrb/Mg6C69hrBX0lP5mBd8lF056YA5MeOM1YZ
         xo2Q+WcBN1zAHreweTs1CjPnK3NBgDkIPoHxtHHL3xCEVAaihB0kwhbtmqK6+S+lQ0RZ
         ZxM49q342oc4BH0TYCBVQcj5FvOUOeZPkCxs+1GVT9y7GCKxctSRa6+7F9v7Old6x0Gc
         UIKEk7eXALThOhFhwgQpGRtw4XKlxfB7ZhOSbiUYx498HzHTYLF0pe04p0vpOkcakcn6
         nE5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781356003; x=1781960803;
        h=date:cc:to:from:subject:content-transfer-encoding:mime-version
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N/aP5eDxpyw2n4AsTqEONVjJMGlgTeC3rtTHjXXYzAI=;
        b=YSNPyqgwimS0HoBD8qdegLoUJ4lRN581/7WkIw1KThB/IRhAJjfh4UL0xdtl1E7gxL
         phdvuSTYnytgTHBvcC13GTGXynXFnA1o6KUWAN60nvaz8jHB8kb6NUFXMaUKCUSrWoWt
         c7EQW5XMt1l8nPZDIWy6XpRxA6qBh8cVuat+uomqxPXXhRw5iTOx3fHCtSgD9UhoYeL9
         +AaF2OJx/Qt4haEN0W0S6hFeHAfTTFMPi6/JiBYxmgfNCYPwMuVU+BCYP3Y3t6CkqQKG
         2JLUu2HHue8z0e14ExBHRW7zWcM58q5JYh0d+/Fm2ducos6KtdrkKleqsNBTRCi9ptad
         pCtw==
X-Gm-Message-State: AOJu0Yz7gAr50IQaaFm7rkiXKJSK4OVaGWNkxj/q1uinZJAgwiMonkr9
	qDXv+D/Beyedn0E3Q8+VwpfZYlINbV1+BBvhiHMgEwKxAot6w6S+boe7
X-Gm-Gg: Acq92OHUZ2o7JspOh2f3ybNu07dRPW900CGGFWLJ7WsNe5uSjWArUcoWsuX2BSMPFzQ
	wEoZrARxevaHR7SBW8BYsXpqnxg02MZWv+QxOwdz1FsSYe8f5TiYU/taoZPUZZaohf6dh3gTYf7
	9c6DYOzAS47nozBch8FXGvLaM+AGJ79BEC2kV/YJAma+We8QR4SWFDXntXGd5vr7yxvoVf7l5YT
	iYxSjb4uvahON4PNj+gxBjjhz4aChDyhtcb3+L1WfIN2izUwPqAUnN/skNafRjMWIkXa7rI1Trm
	zv+2Rptsl4r7gha+5YLlAZHxHzKqW2iR1oyAsjDqPNGdk0CJRa1AIXi3XrUBzVHt6R4UndNRgU8
	OFo6Zhvg912uJNzzi7XKYRNuhfnk9LCpDZSly143Ov/lhG2YqGl/dH4Nd7WWfiwr271F5vmj6xB
	knZYrer+BeJX1cAdBWji7l1A3a1dSeIADTxQ5AMEs=
X-Received: by 2002:a05:7022:619:b0:138:36f:4288 with SMTP id a92af1059eb24-1386f24697amr1581778c88.15.1781356002926;
        Sat, 13 Jun 2026 06:06:42 -0700 (PDT)
Received: from [127.0.0.1] ([38.252.222.131])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1384b9815a6sm5298534c88.15.2026.06.13.06.06.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 06:06:42 -0700 (PDT)
Message-ID: <6a2d55e2.bf38ae28.2d8f62.4755@mx.google.com>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: Re: [PATCH v3 3/3] clk: samsung: exynos990: Fix PERIS gate clock
 parents
From: Denzeel Oliva <wachiturroxd150@gmail.com>
To: linux-samsung-soc@vger.kernel.org
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Sat, 13 Jun 2026 08:06:40 -0500

T24gU2F0LCBKdW4gMTMsIDIwMjYsIFNhc2hpa28gQUkgd3JvdGU6Cj4gRG9lcyByZW9yZGVyaW5n
IHRoZSBtb3V0X3BlcmlzX2Nsa19wZXJpc19naWNfcCBhcnJheSBicmVhayB0aGUgaGFyZHdhcmUK
PiByZWdpc3RlciBtYXBwaW5nPwo+Cj4gSW4gdGhlIEV4eW5vcyBjbG9jayBmcmFtZXdvcmssIHRo
ZSBpbmRpY2VzIG9mIHRoZSBQTkFNRSBhcnJheSBjb3JyZXNwb25kCj4gZGlyZWN0bHkgdG8gdGhl
IGhhcmR3YXJlIG11bHRpcGxleGVyIHJlZ2lzdGVyIGJpdCB2YWx1ZXMuLi4KClRoZSByZW9yZGVy
IGRvZXMgbm90IGJyZWFrIHRoZSBtYXBwaW5nIOKAlCBpdCBjb3JyZWN0cyBpdC4gVGhlIG9yaWdp
bmFsCnVwc3RyZWFtIFBOQU1FIG9yZGVyIHdhcyBhIHBvcnRpbmcgYnVnIHRoYXQgaW52ZXJ0ZWQg
dGhlIHBhcmVudHMuCgpUaGUgZG93bnN0cmVhbSBFeHlub3M5ODMwIHNvdXJjZSBjb25maXJtcyB0
aGUgaGFyZHdhcmUgcmVnaXN0ZXIgZW5jb2RpbmcKKGRyaXZlcnMvc29jL3NhbXN1bmcvY2FsLWlm
L2V4eW5vczk4MzAvY211Y2FsLW5vZGUuYzoxMDkzLTEwOTYpOgoKICBlbnVtIGNsa19pZCBjbXVj
YWxfbXV4X2Nsa19wZXJpc19naWNfcGFyZW50c1tdID0gewogICAgICBNVVhfQ0xLQ01VX1BFUklT
X0JVU19VU0VSLCAgIC8vIGluZGV4IDAg4oaSIG11eCB2YWx1ZSAwCiAgICAgIE9TQ0NMS19QRVJJ
UywgICAgICAgICAgICAgICAgIC8vIGluZGV4IDEg4oaSIG11eCB2YWx1ZSAxCiAgfTsKClNvIGhh
cmR3YXJlIG11eCB2YWx1ZSAwIHNlbGVjdHMgTVVYX0NMS0NNVV9QRVJJU19CVVNfVVNFUiAodXBz
dHJlYW06Cm1vdXRfcGVyaXNfYnVzX3VzZXIpLCBub3Qgb3NjY2xrLiBUaGUgb3JpZ2luYWwgdXBz
dHJlYW0gaGFkIHRoZXNlCnN3YXBwZWQsIHdoaWNoIHdvdWxkIGNhdXNlIGNsa19zZXRfcGFyZW50
KCkgdG8gd3JpdGUgdGhlIHdyb25nIG11eApyZWdpc3RlciB2YWx1ZS4KClRoaXMgcGF0Y2ggZml4
ZXMgdGhhdCBpbnZlcnNpb24uCg==
