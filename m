Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794705664;
	b=Mj/GkLGlv01vSLsZIdbBdfqR9+BSDnXN3tl78fVzebsFZHoaPY24oy7GNuz61Dq3Xo6U
	 HgN7rWAKMwDinyITXdwdvRMlJSHJ5STGWMX8LFdyjVzRBiPWUq6041bh64hVCVRSoEZFw
	 t8AYiU03MWo15ov2A5X5HjchgD3CXnYrhEO84KPSbCoh4u+KRKvQ1tFqDZI5ZD8O/DOcd
	 KVCnLtKAgFyuFhZuGaaceS/QCyZNwOWkjCf3glXiiQ9knRAR+bJ79xD7M1DXSZO3+Awd3
	 XcmIa45UuS5WbuMJL+T/hK8xZb7H15SMYaySh/YLk4GtExoD+p2jRp6OJclTF27xBoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794705664;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=TgYSjiHbgPWcHQHlJLqHlZaybdYLXqmdLmzljtB2Wys=;
	b=XhPwl2DsiVfe8Gtfao01BbfNGNKvQGuWlIhD9XuIsY12sHaSQi4mj1QfQ9KPNO5boKtl
	 nrnhCfYJP5/jQOrGBEldx5dIgbGHhsVQ2ILNxy2ULSKinVaMpx5hwdhpTo7nb7ks6mYRj
	 W81aeO9+ADEJo0ImdSJ/k8ulcsA59w6fPcizggJrpoPK53VUncGVeJv8aexUACzHHjjnT
	 HJUa++3AI4JN9U2vHV/a/018zl7nGS0iRwEUMiEzIFrKIS6jTCq5mQGAV7xDYnTKj/xSK
	 QBnmaVRKj2taQVhYbYOpCBdZYXCY0dOVOCS6B/Tc2P2B5k1R10jEBPDX/5VlLYgZjwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l8pKJuQ+;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9705B606A323
	for <linux-clk@vger.kernel.org>; Sun, 15 Nov 2026 01:21:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9705B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l8pKJuQ+
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so26920095e9.2
        for <linux-clk@vger.kernel.org>; Sat, 14 Nov 2026 17:21:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794705662; x=1795310462; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TgYSjiHbgPWcHQHlJLqHlZaybdYLXqmdLmzljtB2Wys=;
        b=l8pKJuQ+VUtQkgo4OK4j8ZH/u2K5AGocT+qsHepJ4GnOlQ4wQPwHwael2d/C0h+xmh
         Ahux88zXNVMjsEbVU1wrBxjH2GFl3vT9yFPOzG95Nk/D9Z9Ufb0WomjdwyIxGA1+m0jT
         FkcQDjrD5Fn5GkJL4U7pTkjKbe0YowqEMQ7ZUDjMEuxRPJ9rFIk3vlQwKpBCN2da3oJE
         7YNmv1xWu4xc8VuBaMREZOc8flKGuYfJHy/OOrp81cIo9rk6oUyLewFXmsQXr/3NwUCD
         bsAaZBBHuaZhAm14/sAbMuk/rrNBxxPoehhx5+QSJ/w6JCWrBxGtrVKXBksuRTJGEODB
         I1uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794705662; x=1795310462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TgYSjiHbgPWcHQHlJLqHlZaybdYLXqmdLmzljtB2Wys=;
        b=XxQkGBi+FmNi+tCrk0Jibm8+0tSz6aC+4o5OOEJGCV5trX2yGuFOa6CXhfUg0HvNwm
         ZM5z27TQwt+lOPYfEsnPMfAGxnwqe3XvW/jPmx/gZ35yFPlmzAgvp1S7HrlqQvdLIlhL
         yX2E7swXj1QeB4gLtIFJN3/4Fe6ZMplILGgAp5d6Qpu6iXssFjijToQzkAjlGcPNM8i8
         nZDHADEbRXC7q/cgbl67qXgMOMaJN6N4HUa3Bw6CCQKSuV910nspw++UMM4yP6PAsPvq
         kTVqeOHySIsjpMYSjEpBMohCtVTWK4OlbtYqFGmAY3Qfj4alJEwRkymf5u0ywKtRb85O
         YkIg==
X-Forwarded-Encrypted: i=1; AL+hErEG8JPH6ZBiWkkW1WWWI4ohJPgKorC231UcJwSghniYbBGNpkDF/hRDYaGGlXp1vROcxTQTL4VHil8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+7MwDmN9NSU09WYnM2EB1rSkvqTz9lP8X9X1usPOClkgH6c/tT
	zGonDU4978Git2lJasPl1hxkuQMlD1WooLzJwdos46Rlyh2QSgzG3zU6
X-Gm-Gg: AYBFou23YgdrYQ2oyhHIFSGAQDNlQx1wBklbKFv9o5qevU/zMZRV0qePRLhDGPeSlnW
	F19qaGxfyAi7WUP/WfgcXMpdERIHjXUNaQhl5xmDqu0TxKsjckdjI5N52r2PkCOATYXJYN1iEK8
	6BNxExnHUsnH003MMUN9jMDt29oJ+li7kbrXsMjwLX4ev8S04Oi1AebeIyid4zm6IAQQNtdMtwa
	eZqdyv7Y7nkHH4IghNXBoQQL7L54rJwuKVNCLEbISdzbhgEs9criFc9yFLJ0BlYIw6B1KM+oDO5
	q1xV6wsjjbFTmfLnYC0TqX+iWGj9wNUSz3grlrBvzHZ18trudYrIS8gspVioavztTADZhctD0Zw
	WZcaZfix03F3MgFiTYh9EscW06Q4ofAgiJAbnv03H+yS1GrEWrMl9XR1/1dS/TOT1IKyIxmyNRv
	r2WJx7FPWaaCKsIavUxQXA7ajt48wnvuZt9hjYGdgP1sIGICHH73Ct7MGZcPcppHIScQaD7jlH6
	XC43XhaLWYdNOjH6qm+oQk4+UGQtXpDi2l/6bXPYsBFhyKvTkLck2+NhHS5IrZi01bqOPfd1gf1
	Ev0ggzcdrv53WzvxZ39lUPZlSNJOLSBHORcwoNXHxC2yg5WV6jfJ69w8u84yHf3aQMDmYnbMpcu
	7a0QwV+WzREt8E8UmJwQU3XnlRvSbdVST4E7cgZb9Fb2kNMmGXJNvy/G4MHfOpGagcGRuwCM3xJ
	ChgH0ZXhrDE0iS
X-Received: by 2002:a05:6000:2889:b0:491:da8f:7276 with SMTP id ffacd0b85a97d-49c7072cb5cmr16023280f8f.26.1794705661826;
        Sat, 14 Nov 2026 17:21:01 -0800 (PST)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net (lfbn-ncy-1-251-132.w83-194.abo.wanadoo.fr. [83.194.94.132])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c6020bb0fsm12967006f8f.34.2026.11.14.17.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 17:21:00 -0800 (PST)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Maxime Ripard <mripard@kernel.org>,
	Frank Oltmanns <frank@oltmanns.dev>,
	linux-clk@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: sunxi-ng: nkm: avoid 32-bit overflow in rate calculations
Date: Sun, 15 Nov 2026 02:20:59 +0100
Message-ID: <20261115012059.1022197-1-romain.tisserand@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261101203336.1360239-1-romain.tisserand@gmail.com>
References: <20261101203336.1360239-1-romain.tisserand@gmail.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Gentle ping on this fix, sent two weeks ago. It still applies as is on
sunxi/clk-for-7.5 and on 7.4-rc3.

On 32-bit sunxi the N-K-M rate math wraps above 4.29 GHz, so the clock
framework reports half the real pll-mipi rate on the A33 (594 MHz
programmed, 287 MHz reported), which broke the PocketGo S30 panel. Any
comment, or could it go in for 7.5?

Thanks,
Romain
