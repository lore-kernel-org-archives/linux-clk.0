Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794326146;
	b=s0Rli95oyR87scNy7OhpMDeNsau8LcJuNU/evDgGcRCM235m88tMy14KtcjsbEV3OIMn
	 ljm8dJe+DJ6efZXIJqr7Kk0DZI/Cn5oni+rQ7PGt1P4FcdMIvkXZ159dFS0XHKoOm5dgI
	 Lyrt5AOLWCG9axVDWOJSoZUfSp6Rchxvbk3pSH8qAxzuNXgUP7mENz5Oc46NGVJ/lVaD8
	 Ra9bJUZ/8fwwm4nqlMuU5Tbys2SrdlZUJ7g3Y4rGqZ5UA9TqDObPqRdfqtytI0CwyC1lr
	 VJMPzlCmJgkqh/RJxzvBjAKO6ubNlvm7RM2MHG9rD8pMInuu70X6SBg750BMKjUdJrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794326146;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	bh=aM5tBn3ODTZ1/FCzgvJ2PUNZD7PoTyZUo4VRYYi2yLY=;
	b=fX+it2rdP33qRbXXkEoySKwSni2yu4iaNtOYWRswH2IEq9XaQNXlXw02dLD36MsCC7/r
	 A+ZYuCXA9CimsEpg+FxVgMaLOjynkJH0WmdABNHhTFxvdYgabAnEW+801Yhj96wjpuBxA
	 X1Fj1piGA1ny9DSUkVCMtXxmQGySJqE/y189Xc04/dr67ClW03LajqvFPQ/xp8BsYb1MZ
	 LPyAeWp++jOJSi/nJno/m300hyGbKSUVrBE8T9ay1RCEM24sxx5mL/NBpHIgonuft1Gjv
	 sWAXy9V2fk65rfMAsdE0l+DEgrjsZaQtILxqlP9RvQMaNACRJUC1pSc0JxzftefIXVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JC8ZByDM;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2EE606A33F
	for <linux-clk@vger.kernel.org>; Tue, 10 Nov 2026 15:55:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D2EE606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JC8ZByDM
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a5036bbac7so14363265e9.3
        for <linux-clk@vger.kernel.org>; Tue, 10 Nov 2026 07:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794326144; x=1794930944; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aM5tBn3ODTZ1/FCzgvJ2PUNZD7PoTyZUo4VRYYi2yLY=;
        b=JC8ZByDMjknsyEpwTuwVgXFmocCEOhUTrbthwhiblOhrsWSGvDJo7/Rg/6oEFhuNUi
         O1ygA4AJMvLYdlLXB8F/Ic71Fa2a+fpsHV54QBhMrofde7CTX+mnhHq1vvwUsgcAwYW1
         qpJciVL0a2oVKA+g2iEbs73aA9+1JAkpg6dsyKW0on+P3IU47ixO+vShx0DX/NUTmURy
         gjUTvi0Cj6LWYxSgTyTYbI6EbBfV0EvkxS5T0NktsFJopDDZ+8THjRFBq1UlLBPvr6Dc
         dBbU7Z7JvrwMKD3qNU8vtqoO1OfbSSxXnTCIBPNX1VryJZyrK1hFuwkDt/8kyQtcjMGH
         GO8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794326144; x=1794930944;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aM5tBn3ODTZ1/FCzgvJ2PUNZD7PoTyZUo4VRYYi2yLY=;
        b=tKaNeMt1PDtNMTn5mXQ4qUxqKOA3FIICSmtCHosxe7M1dlEgUBaHrBKUgQ15/39Ez3
         Eorj7yS/Ph+HL1OQlmRCp2jZUFbL9N9ngO4SL45NPd34djeBdFO8Jf/QJpF1erCbgNLe
         oOXH99zbyxzqqT43ArJpySWN8Cq84o1/0Nev388M03bf9fTU0GUjyyhbaICtAqi5FMEC
         AqjL9CO+n/p2pVNXEn4t7AC09PjWOYkXaKbODxi9/LhZwctTzY/0Sm49nVwqVxe7IVqw
         z6NuU7MwNhN8+tckWjG1+oFiRs+bTGku7NU0JCRb29l0hewJLIqbC/8DW2DM4AlvlRvv
         6xsg==
X-Gm-Message-State: APuU4Z8KkiKFqjlxPoVO8/RjzpVBXPlOMSI8CgLbAd0dun2HHW219Ems
	6Zn+NKbjRWFlSY9FNVjqgJ4+xc3DaK/zu7Xz2qiTMHwnrWhlbSV0VAN4
X-Gm-Gg: AYBFou1GuKRQl+CZ+NSqv5JGXW9fEmK6bfoZ6krLn8H6d+K6SA8Ze8CKKuwgrhZ7R7u
	2/KGowOzrKmXUEaqv6qjQEOZylZh6+IZfye4UjvzjedrXVPyffXrsZt4uEl9ZC3jBuE20BZSdgu
	JTQ4JYWqD+enYeQz7DzQAoEesZY+ZinRPe87QMRERJcOoPGjtG5r3GeZreYer4MEjj3PxrYoI5X
	AZ4s6fphBat1HdkugdYKJWrCEk31JSW2MEy+JHkyK1QOM4F6IQQ5jxAZpKMbLD1BJmkjnp2ckE+
	3cTWSTuyjgABDj12TYEz/j+wL+U86MYrHF8/TUni+UdNV2iGXn6ehM8Wa6yl5d8ibm3RnJ9QCYY
	DdvsHnw0MEXWgId98/Yra3O+/sbfEM7BVP6DR36gTgNGDKRcbqoK9W43BsU/ASLBtidUzG7jlZ9
	wDpF+c78hAuomB28t0acYigasRtly/Obg6p+sQOcRu/YTpeS/K6Z1vd4zfLfxpM1k1qReh+tkaA
	C1g0oezCiEsbN+sW4clFfq9qg5AtaWsUr4PMkpRBtYsN+vgRk6aTpSEEBOp7FGyVIRXVz481ad3
	wu3Yjm1ZdqNmhSBCjdt64aJihDGL0ejM3r4NzvegV9jfYgJmWAUJm7+Il6E1z0SgUHQ97NArNWd
	1YaV8yLO81L1wHFq6VCbtEM2E+HaeztYT2TmmxEZ5iOST6Gp9eqkfJHL+GRygHPUkiH4JDyWzXS
	c223wiX5ywOlQKawDcEDj6wsGciSp4owYBkUZJfg5Hj35gGPjv3C66XYZ6sVQcQJlXZSnjvie8p
	VyRDH3Bo4hGfAKv6CFJkaoGDqe//MObXxzodyUdRi9U0ClvG1frZw==
X-Received: by 2002:a05:600c:c4a3:b0:4a1:dbdf:17a8 with SMTP id 5b1f17b1804b1-4ba02308542mr51845065e9.2.1794326144134;
        Tue, 10 Nov 2026 07:55:44 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-12-36.dynamic.telemach.net. [86.58.12.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0234a5dcsm73237085e9.2.2026.11.10.07.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 07:55:43 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>,
 Andre Przywara <andre.przywara@arm.com>, aiyengar1990@gmail.com
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject:
 Re: [PATCH 2/2] clk: sunxi-ng: h616: Let the S/PDIF clock set the audio PLL
 rate
Date: Tue, 10 Nov 2026 16:55:41 +0100
Message-ID: <ThOkLORdSauix4Mt72r-lQ@gmail.com>
In-Reply-To: <20261110-h616-clk-emac-spdif-v1-2-e5e36e8963e4@gmail.com>
References:
 <20261110-h616-clk-emac-spdif-v1-0-e5e36e8963e4@gmail.com>
 <20261110-h616-clk-emac-spdif-v1-2-e5e36e8963e4@gmail.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne torek, 10. november 2026 ob 07:03:01 Srednjeevropski standardni =C4=8Da=
s je Arun Iyengar via B4 Relay napisal(a):
> From: Arun Iyengar <aiyengar1990@gmail.com>
>=20
> sun4i-spdif asks for 22.5792 or 24.576 MHz on the S/PDIF (OWA) module
> clock, depending on the sample rate family. The spdif clock has no
> CLK_SET_RATE_PARENT, so it can only divide down the rate pll-audio
> already runs at. Unless another audio device has already set the PLL for
> the right family, the power-of-two divider rounds down and the request
> succeeds at a wrong rate: about 12.3 MHz from the reset PLL value, so
> 48 kHz content is sent at about 24 kHz.
>=20
> Propagate rate changes to the parent, like the audio codec clocks
> already do. This is the same change as the one just applied for the H6
> [1].
>=20
> Link: https://lore.kernel.org/all/20261104185027.883011-1-jernej.skrabec@=
gmail.com/ [1]

There is no need to link to H6 patch. It's clear that patch is needed.

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> Fixes: 88dde5e23da1 ("clk: sunxi-ng: Add support for the Allwinner H616 C=
CU")
> Cc: stable@vger.kernel.org
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
>  drivers/clk/sunxi-ng/ccu-sun50i-h616.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c b/drivers/clk/sunxi-n=
g/ccu-sun50i-h616.c
> index d2625fec651a..f703d690a563 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
> @@ -529,7 +529,7 @@ static struct ccu_div spdif_clk =3D {
>  		.hw.init	=3D CLK_HW_INIT_PARENTS("spdif",
>  						      audio_parents,
>  						      &ccu_div_ops,
> -						      0),
> +						      CLK_SET_RATE_PARENT),
>  	},
>  };
> =20
>=20
>=20




