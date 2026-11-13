Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794551105;
	b=vygb+yVrnTV8rzy7YIbPzbuGtfgWIguiBT29pXp+p/zKv+4UOUanAOaIL9NSvSGBd6TM
	 G7HcXQOakW/6VoTAxhJsaMKuwqkoXV1ey2k07HlJY0jzyJk5lG2YTu0yDLlOtEx32SUmn
	 XHwFQYApa01fL31NVg2p66YQCuseRwCtLVL1P3TMbj4kUgn52JUpD3DPofH17dHUgB33a
	 aFcNzmtHKVQgcKePsNoKVVjuvLxexJggSjoPUaB7QYchxnxhQKcHJ8YnJHlY/0jsI2bTU
	 BU90bfixZTrEjBX6gtW5Jn2I03PIN1+L4Fe+d+ye5vrn6sl7W1XtfLGvB/9mkA7E57Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794551105;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=/Y/iVRnV4ObqWfBTvVOJIAncw0xRUL0KHEf+fXRemdw=;
	b=kZQN71GgFXpY7kljocew76G8mengS84qJqcpx8Xfi0A6oCIev0QyuNbRHGsB9UvH7Ysi
	 N7Gb6WhxjJhzE+bGDYYZAqUdW8XSpPvhdIjCk12+tRctPe8BtS9YdUD4bSooc7fi4CiOX
	 JV4RVCyImKOIp+Fqp9dHcx2aharZBQEmENbh5mDONsJYt1tXfBJJ1Om6RYcymjWYupbVn
	 jl94CP0v+SwsIgSvvK2Nlx4WrLnqlDYE7bjmkdHRpbe47rhEpJ/W4o6LEfXqonf7mSLnj
	 uyDA/91ePaR+aUK+pgBLDUc97YRGcZ28fs9J+voJZaIHnTDMVVAEfjBHJoJG3+V/8uA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=gj29W04e;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20611606A323
	for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 06:25:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20611606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=gj29W04e
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb55cda775so1717085e9.0
        for <linux-clk@vger.kernel.org>; Thu, 12 Nov 2026 22:25:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794551103; x=1795155903; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/Y/iVRnV4ObqWfBTvVOJIAncw0xRUL0KHEf+fXRemdw=;
        b=gj29W04eXkb5qIjLAIWJz8pxmukjfb6Kc8tpvLRp2RsZwRrX9TwNBoUGzZfXcbhDM0
         DjIV9Yq7n908GPX1ozQgjByI+/k+qXmFXYKSRJQ8ZyY8yoxXLDnJ/N6LqsbLDqyyRhle
         GEWaq4UHwYY1W7ZbxILKzy+mIUE7SsTqW83XGVFLj9vbHEl1WeDyT7eG6MAgu9KFowV9
         Hghd+RNvxyQjxFXsCxIRW/hoGjE+sM7D1jJuI2+cBGRHGyPn7og6LLZe7B0DMIJNzf7m
         Xydoiw8ZCuOhyb9Q/ZgiZXkZRu44scunyhEVctQm7gyHbu/x7Biuclr66oFGsSFN+j0W
         nZRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794551103; x=1795155903;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/Y/iVRnV4ObqWfBTvVOJIAncw0xRUL0KHEf+fXRemdw=;
        b=MRq8CQInKurWVPySigArYnO1BSJnwNslK6IQosh0/PZ/PV9TuzpqJYK++ICOQeYMJ8
         v085SFo1T4/kcJEaDRQGqZdMOkA3UtvaGkxYMn7ex66KZpVzwPMtQNO55htZWiE8socW
         FiCNZ69FPHRii93+qjk2SX9GOBu36xGVqkb4Xk4uKx6QlQVUpAJaIgNrVln0OvvB62LP
         149ptny27xNf1UazjHXkD307tm4xHgtANVJypGF3JXVQ07nXguIKLujMe90uPIWkWspf
         UB0O5ZxZbI6IcOQ6nXvstqtzfEIxeZQvdjS4BUfmMG7ZUIXeLGo8+1KmDTa3gBZFLao0
         2CjQ==
X-Forwarded-Encrypted: i=1; AL+hErF+JnaFXXU8606GiZUY3xCB+6upDZ9BDqBOq7/5ka3Ekgs48u2SMdjuhSFnaROgcz4o60o+0/Gkx5w=@vger.kernel.org
X-Gm-Message-State: APuU4Z9+V2//2PO0sBgqAgwVvPdYiwEzFvwf417u1wur83f69PeLMipm
	S0DOxv4L4iBGReDuzBmRCV/TWUVGieKXX+xcdw6Et/tZvEAssD8gfXb9vbebisJLzZ0=
X-Gm-Gg: AYBFou0dbhEFpRIBtEWk5TLP7Dluy6rF+iMZxW/Qensls2CR4HsxvphFWi2ArkLb8sR
	fq2u3wbAmBxwErDu7pVBJMhvVqNS7E9sePARuOLzZ1mCY3GfflNQaVlcCYbEX1E601BukLdnjK3
	cePfhc/xqQAFSjlKaptgDAWNj+NLkIuZ81z2/dvfvMDKJvZSIf2vDMsgj6w7EO2Qx3uFerW4F2O
	k3iT4R3DK+tWkmtHxdyUY2AoMnTwvpsn6b/rwha40+NybGxsIYQIpfUJrEBvvesaDOls/5zB/5h
	XO5ozaaHNlE+ySdjwOfIXv2NZKMpQGNZ88fGQG8lVRfKYhUByyeufDAXvvu0nqcSZOMJHwu3JYc
	fMgu75GQiJxxFOK6Pkod42U/2DpI+IoVXcYT4eLTSHoGgp0F5zh6VzHWxNXRDQe6JP6iDjHc+HA
	8d+bivfn6WpHV1RI3tIqn+pzbvrNLdRuBc5oyG+5D6FYy+emH3aGQkv2gThM4gDW7bIFC/1CqWS
	9ZmuiZCac0L0UZxPYmHiueZx8ocoZpGwAQdPepWc7jZSKdiD2/1PruXKT0B4QQ19bQwjBIgNOmr
	nQ2QxYdoCjLhGneGt481hWOs3bhHDSKXBwMXCfGfbCtYwmW9EYY3dIZ2anHuyTGQOIBSRhbj2Q=
	=
X-Received: by 2002:a05:600c:4e44:b0:4a2:180a:3417 with SMTP id 5b1f17b1804b1-4bb55c5f5admr25342125e9.1.1794551103537;
        Thu, 12 Nov 2026 22:25:03 -0800 (PST)
Received: from localhost (ip-091-089-005-024.um28.pools.vodafone-ip.de. [91.89.5.24])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb571cfa2esm25586955e9.2.2026.11.12.22.25.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 22:25:02 -0800 (PST)
Date: Fri, 13 Nov 2026 07:25:01 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Christophe Roullier <christophe.roullier@foss.st.com>, Dario Binacchi <dario.binacchi@amarulasolutions.com>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] clk: stm32: Add STM32MP25 SYSCFG clock driver
Message-ID: <avas_9BOcoyn4j0y@monoceros>
References: <20261110-ups_mp25_clk_syscfg-v1-0-667829cd290a@foss.st.com>
 <20261110-ups_mp25_clk_syscfg-v1-3-667829cd290a@foss.st.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ekj7jpy4oarwkme4"
Content-Disposition: inline
In-Reply-To: <20261110-ups_mp25_clk_syscfg-v1-3-667829cd290a@foss.st.com>


--ekj7jpy4oarwkme4
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 3/5] clk: stm32: Add STM32MP25 SYSCFG clock driver
MIME-Version: 1.0

On Tue, Nov 10, 2026 at 11:42:18AM +0100, Gabriel Fernandez wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

Please don't add <linux/mod_devicetable.h>. of_device_id is already
provided (with less dependencies) by <linux/platform_device.h>.

Best regards
Uwe

--ekj7jpy4oarwkme4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmr2rToACgkQj4D7WH0S
/k7rcwgAuyIO02PIHScObbQSwpTN1bOxntCQuOefipHur6Tv164hiCD+Ows3bueO
hHN81SuXrTS4hzRGcT5jFlW7zlkz9L2tSHYZ0us3Hep0wntBkIeA0JeCZqBCoASn
RuXE5+uHnhkMUlqy+/xZlblQtRTUnoCZmce9NixemtTaCIMPlL9gIeoouNGk9r2B
2Ov8mhk3tjy1A9K9YCE3vdde8NAm9G0myqV85K2q+/6a8k9IqoogrLX5x/9uNZgI
wH/iThyVCnk4MnvbQGHVc7Q3QXDOZAVGeZPck+t/XfvkrsVkuawozxF0NWZO8LMe
ldXWek5P8iobsActxH4I13gTcjgwBA==
=QOFE
-----END PGP SIGNATURE-----

--ekj7jpy4oarwkme4--
