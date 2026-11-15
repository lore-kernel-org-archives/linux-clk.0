Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794757266;
	b=TRoIzAskf76EASTLhWu5cqGbhYwLg9W9CazI8eMP2X1bmanLvMe9NlDioz/TBuRsmV8z
	 svKEBYz4Ms8g3W3/18GICrXHqICfZYFlekMbRjO3ABYPATArx0hTqtYQ+dTun/pQGQ13Y
	 4vPMY+bCE8NXTblbpo/oPceVLFf72b4f2QsS4+qc8teJXl3auwUbfinVDFNrBqEdzlc6y
	 D+KmoGEFgvoe5/tcRi3uHPS6OBQgLLq2MLl8MybVdurGJi8XO3Wfghpser9XLMWq+OQ76
	 1cBi+bSqTbUWb/NptbGD8QpghuD3VfbLq64mTFZZyh7JgDga/uQ66kNyNpnP1tlm/eA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794757266;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=PVuohZ8xLFR5YiCoEYGFhyPTULZBGZj7Wpwh1r3TICY=;
	b=gm/XIQQbiNONt1OoUoNFBQ2qdoB4uA7BQ0NUXcCwsRPzURXRhJD9KtZPpy2fPvmcMC9k
	 /p2Hpaz5pjllGS0CTLa/3p2t118+b8qGi9iXMDID1R8UK6vzMPjmumDtSYrsa/oTyCkFF
	 +zb5+8jHBwbrL9BUbHhW5FTTEfXAJDUABNELePbwpJdEv4DRO1T41cPn2cCEs7aG4NoFB
	 QQH0vi0tW5G718rOd8TdrF+hT+6luMnPn7sh8+Tn9IgHm1fcVLK2332oi7mlDlxLHsbEB
	 92TgB1oSW7KD+lgOSXpxV0XTQ9NBz+1gua/mHpDrauQs5f5gVs830P/aOfs3wAYbTEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=JcnXBjQ6;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06EE1606A32D
	for <linux-clk@vger.kernel.org>; Sun, 15 Nov 2026 15:41:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06EE1606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=JcnXBjQ6
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4922523d1afso1243813f8f.0
        for <linux-clk@vger.kernel.org>; Sun, 15 Nov 2026 07:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794757264; x=1795362064; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PVuohZ8xLFR5YiCoEYGFhyPTULZBGZj7Wpwh1r3TICY=;
        b=JcnXBjQ6oVs3WO6WxsJjlXF3Srfn+XWnPXlN0yzPpJsvcbjAwiYznR2yVsrq+dIF0J
         W9K1hDH1dg4Rq7lZSMIhfD3gchU0KLGorPdGJ+zlQeEucdr7nNce45CvydySUCY90PWY
         Xyu/qB9TRVQV4d6tUrWZIxOCTwwDWe69IsTtjWCZjxdP2vvALjzMAogu8SPoZHkOZyaF
         zuC9NuaXKcHS/ydQMct1JDP/0pjhpMGbTARWR/YcAz+Qib3t24DwWdP7jNV5O7sXEqo0
         nlPhnW30vWk79ZmVTGvnuZbrJ2Vgh12vhrZe5Vz+JkN4iiK2dMUW8v2WdxiY8cHNmbsu
         Y4BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794757264; x=1795362064;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PVuohZ8xLFR5YiCoEYGFhyPTULZBGZj7Wpwh1r3TICY=;
        b=hVZaSFwIpeqlLXRXeqqzMDpCsQuSmRhrsu/kq2v+aCBzLUbxFtS7Eya6Dpimu94lPK
         x7sV/wZZGEgC3LMuacH3S256+wCv09nY+C0Jf17yal4bgH/GBmix1f4vnYBAcFr+VAyl
         4QtYAAq992lGr6HtBI3Nlb54EI5Sh88UxrF6R+jWpb4Rx63iLDOBzr2TM4dCmMpUK7Ly
         YlCfKrAgYP0ZS/V/fjW9mu7puH7iAxORWTtmbCIylrdzlhiMNeGvOUf59JMWS0jqwhcf
         2nFEsyglAg9dw7olKDe8ke/u9KuzLSzy1Az+CzpTvIsTorA6AX4iazH/KPzBIlwOeWA4
         Sk4Q==
X-Forwarded-Encrypted: i=1; AL+hErEFEAB75J2dpS0xfs7TjjkyfOH0HGduA8HePaOPEGI80KF6p8N4wH5Brmv9yP0YYQs/ZKy0oaxrTeQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+5aFR4pTGveyFM4ObllSpMDrV2AhmjEg9J7xcY97dsDOpsX6xT
	mwYAcPzAnTMmGDiEI+SXDLoqOIJ4so2mWl2513XbP7VjCwzd4aqIOsqLrYtWW8pct88=
X-Gm-Gg: AYBFou2LReP8H/Iz+ITwYxyLPTsRSVkUl7BgJdMZAb8UIw79epv4rMF9KIgW+pccQIB
	YA6kvU/OS5UYz9FgBblbeOItDRmG0GI9yDwuEHIqx3ipEHeM40jMdkEbU05amTq58f7e3LXe7Ej
	KudGxs4pA+7AFPfa268d9ZaZRrCWh7vu0jdZyQ6eyL5fDp3/CxIPTBOSGJyTuGu/TLwgbgT3f5Y
	RiHSsXVcFfbjHSiN0qGMqWXz+Uo7bXxA9BDhNqaC3N+Kazr8APZZ5Ub8MYsflEZq97SvaCYrs2C
	BrNyh8mESoibrXLoKIKGUmG79+dqqzV4Ry865iUnQJ2XwdhQRt7dBtL+sTS7fsUyEJFsmvvS5F2
	Tn9IAkNW0ypbEKxrhJLk7e201qIFCXoxhdF/WNXNl++xFyvH1vS3wBQNMdTNiHW38qrXuAIRQn9
	xMsp64omZtHvSp2OBbqgzgGFBHktj5PZzUnbrYUDlK6XZuenJZI6Xj553Ca/nd8TwEZg5dycckE
	T54mo7aLudyRjPOVSVyY7M8JvSvxjehXWjYSO0nhquxrtqblp2/oFWgflodh5xBF35YMCYtJnWL
	zOIloSirKRBRuK2xFu74RWgTi223oKcq8Bo=
X-Received: by 2002:a05:6000:2c04:b0:48e:d36:77 with SMTP id ffacd0b85a97d-49c6fc9db5bmr19465481f8f.4.1794757264141;
        Sun, 15 Nov 2026 07:41:04 -0800 (PST)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-49c888b90d4sm16462060f8f.9.2026.11.15.07.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 07:41:03 -0800 (PST)
Date: Sun, 15 Nov 2026 16:41:01 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: gaohan@iscas.ac.cn
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Samuel Holland <samuel.holland@sifive.com>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Maxime Ripard <mripard@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Andre Przywara <andre.przywara@arm.com>, 
	Han Gao <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@sifive.com>, 
	Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, linux-csky@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rtc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 14/19] pinctrl: sunxi: add support for the Allwinner V861
 PIO
Message-ID: <avnR67LnZo4Mo0Tf@monoceros>
References: <20261114-v861-v1-0-eb71ec3ee523@iscas.ac.cn>
 <20261114-v861-v1-14-eb71ec3ee523@iscas.ac.cn>
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
	protocol="application/pgp-signature"; boundary="fgskattfdxvvv7hb"
Content-Disposition: inline
In-Reply-To: <20261114-v861-v1-14-eb71ec3ee523@iscas.ac.cn>


--fgskattfdxvvv7hb
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 14/19] pinctrl: sunxi: add support for the Allwinner V861
 PIO
MIME-Version: 1.0

Hello,

On Sat, Nov 14, 2026 at 06:33:40AM +0800, Han Gao via B4 Relay wrote:
> new file mode 100644
> index 000000000000..742465076d86
> --- /dev/null
> +++ b/drivers/pinctrl/sunxi/pinctrl-sun252i-v861.c
> @@ -0,0 +1,49 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Allwinner V861 SoC pinctrl driver.
> + *
> + * Copyright (c) 2026 Han Gao <gaohan@iscas.ac.cn>
> + */
> +
> +#include <linux/mod_devicetable.h>

Don't include <linux/mod_devicetable.h>. <linux/platform_device.h>
already provides of_device_id with less dependencies, so please just
drop including <linux/mod_devicetable.h>.

> +#include <linux/platform_device.h>
> +#include <linux/pinctrl/pinctrl.h>
> +
> [...]
> +static const struct of_device_id v861_pinctrl_match[] = {
> +	{ .compatible = "allwinner,sun252i-v861-pinctrl", },
> +	{}
> +};

Please drop the comma before the closing } and add a space in the list
terminator.

Best regards
Uwe

--fgskattfdxvvv7hb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmr50okACgkQj4D7WH0S
/k78BwgAggANSfiR3lIax5U5QxcHapAeEwjkuu5kUUd7ThVymu6geBziPkTKM9LN
kV1vp14gkKuMuThllE6yPhDE+jBai3H2dmZPRAVxRmkHkRXaCGvN2Qy6QvjG7hn+
pKrIhNm9FD3gtJcf3syW5npYiRAxG/6TkK+Gz1PXPgmg9Yj7puOzJ5ZZsZ+kBOcS
xiSHHn5ujqEIP4jnBc7Dv7UpeDH4NxdbQ6ssuWEYpdmNKvGpbP4Xi4tlxo4RAMXF
XWXJcAtussx3dylMOghSQ5VBKABwOqksAb/tX5/oaY13ScR8Lg/M3WzfjwXPwvtR
yRXJHXEAk7lxYPB9WoXGrz3bVWm0dg==
=Eo1Y
-----END PGP SIGNATURE-----

--fgskattfdxvvv7hb--
