Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794724024;
	b=m0Bv+0tRxP26Nth1mxFRk0bp+H7jgLph3jVASV2TeEwqHh2I6UHeLiWUVTEPnAWWPcL6
	 7JKTzSM+4TiehLAOsQwQq7TeqJW+FnypBmzYH35nkWsQupkFH5OMXzMjIzM1kZQsKG1uH
	 4aDEc6wND1X2dt6NPRuzzSfap7ZIde+FQ7HlkotVN3CM/9ttI/8eEKSPiyNT5hC5XrpTq
	 vqoarJKfyPIcRC7e9Uj1ebn5ntl+gqxTwj15YZCumbl93vOt+uBUnLzEjbz51BtrARqRS
	 ukV5dTL6EZ8xbyeBNjmQVbWup2hH3oQM8DfkwMHJH7bYOFqFR4N/DoeDMwxsibmf2Tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794724024;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=iVTcBxQQMl4QzfL9Wdiozi+f51d/Q7jY5E2o0iqZOks=;
	b=zJWWwdpOu3T6ks/M9CzLTywIQeXEHm5HjZXIduR9x1+3Congazj+SRGuUXiC5KQLirim
	 MvSX+OC6V+utlOflz31VgEnQqaWzbXFU4sSJkNjqetFe3ELQGf4SRCIGaUxq+8d1AM5W6
	 Qb2bIPXC3f+0gPLhgz70EzW4rIb4TzktfI+bmKxaon8bIr6zUY/J/KcYqN6q7kng/FXtv
	 88sBV05I6mDLfc3PGmxaYVituYfrSS8Rhk7x8PW/S5520r+vYZXhlfPFb5gB+/xBfY3FI
	 W1Govu1EVWu39CEaBA5ImLA1d3a/RUcq9SKlLWmpJ6ApYrU7m2kvFDG8/mDMhynANAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W6Tmr4oD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3F2606A323;
	Sun, 15 Nov 2026 06:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W6Tmr4oD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC37F1F000C4;
	Sun, 15 Nov 2026 06:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794724024;
	bh=iVTcBxQQMl4QzfL9Wdiozi+f51d/Q7jY5E2o0iqZOks=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=W6Tmr4oDHfCtdgw/mn8gk1am3AOunmQEzWCVaHlo+C38Q38TIpM/Va0iNihGLgj97
	 oWdVVyR1aFu3kSWSyr7BRNSg8FypnDw+lhEPic63LahlAun78swqc/zOt0Z3bRp9Qm
	 TZlRreph8au3yoSth1yhBgu/5yAIsYSQwyFUEVcxfiJWaGQsR+oKUMzHINFdAMtlfE
	 j3MKvhTFvB8oHPNSRyGdNv1Qa/Dv34VjZ0MVDj5nZJ3XIXiaVf0I/2h00wEkAE2jMY
	 gSi4DU+BdNvbkzi/YGmY4ADuVi/5xwg/MD4GoOML4H9HCA6h1KjIitvUlbvZBy35Nv
	 MPMe7ebcJ5e2A==
Message-ID: <sashiko-outbox-215249@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/8] clk: sunxi-ng: de2: Export register regmap for
 DE33
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jernej Skrabec" <jernej.skrabec@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev, linux-clk@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261115061102.229680-3-jernej.skrabec@gmail.com>
References: <20261115061102.229680-1-jernej.skrabec@gmail.com>
 <20261115061102.229680-3-jernej.skrabec@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 06:27:03 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] clk: sunxi-ng: de2: missing select REGMAP_MMIO for
  SUN8I_DE2_CCU
--

commit d1c006fcc75e6e1facbfb7f265581bef0d4d672a
Author: Jernej Skrabec <jernej.skrabec@gmail.com>

clk: sunxi-ng: de2: Export register regmap for DE33

This commit removes the hardcoded DE33 plane mapping writes from the clock
driver and exports those registers via an MMIO regmap instead.

> diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c b/drivers/clk/sunxi-ng/=
ccu-sun8i-de2.c
> index 6ec6c0dc4c261..f17570efafaae 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun8i-de2.c

[ ... ]

> @@ -336,13 +367,19 @@ static int sunxi_de2_clk_probe(struct platform_devi=
ce *pdev)
>  	}
> =20
>  	/*
> -	 * The DE33 requires these additional (unknown) registers set
> +	 * The DE33 requires these additional plane mapping registers set
>  	 * during initialisation.
>  	 */
>  	if (of_device_is_compatible(pdev->dev.of_node,
>  				    "allwinner,sun50i-h616-de33-clk")) {
> -		writel(0, reg + 0x24);
> -		writel(0x0000a980, reg + 0x28);
> +		struct regmap *regmap;
> +
> +		regmap =3D devm_regmap_init_mmio(&pdev->dev, reg,
> +					       &sun8i_de2_ccu_regmap_config);
> +		if (IS_ERR(regmap)) {
> +			ret =3D PTR_ERR(regmap);
> +			goto err_assert_reset;
> +		}
>  	}

[Severity: Medium]
Should SUN8I_DE2_CCU select REGMAP_MMIO in drivers/clk/sunxi-ng/Kconfig?

Without it, enabling SUN8I_DE2_CCU when REGMAP_MMIO is disabled (for
example under COMPILE_TEST=3Dy with ARCH_SUNXI=3Dn) or built as a module wi=
th
SUN8I_DE2_CCU=3Dy breaks compilation on sun8i_de2_ccu_regmap_config or fails
to link __devm_regmap_init_mmio_clk().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261115061102.2296=
80-1-jernej.skrabec@gmail.com?part=3D2
