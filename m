Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794435282;
	b=Ysx0z59jY9FUlqwih7/oKi69QZoCJsDWwPIZLBEHd8dW1M4w3yHm1Zd5Q18B73toKV1V
	 1ILjBOOhyRxCMXxOOrhtyjd+g5BCFHWGU4GS0PjCCst7zwzDcu85vXctDRtlVfQiu8R41
	 ujFL2e7l9kUjZeJ7dQSe40ae8hJrA6ahb3/bpdK3hNUMMPqFdUplVuEcIJiYvfIZOJZ7m
	 8EM+DbMTcFgDmoJ9ZimLHk32ZAvY35ZXjmZ4kxsbhj+vL+ebbgHqv7Qw90QrOnElCwvgG
	 1FgMMqNy8EfYii32h7WMHbhVpBQ6/Jl803rFXDh7uD+Zm9hxATDegzTMEq9LCILOqAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794435282;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=adv/YdsF5nvc2MG+S8IQd+/CC/0iW3a3t9NYWKnS0cM=;
	b=w9deKS0ay6OUMZ4voRwf0LYsAPPaYOJNmSLrgLTtkPM7EBNNFBWiPjOVgbKufaBJd/V/
	 rmPC5vn6LCdhMDforbtq3VPuMQ+e9/4Xc/VT4Ra9fS6fkQfpft77i/SyO02oVg0+GAZEh
	 6n2UT5tKDUXAfBUNIX60Ei5CB+f8WJuxeUJyDWAdoE20miPkfFYkirdqBHkxb/PlBTgcJ
	 lytvj6MiUNNDbY69mIAJXBLMbwZ+dB2lmBzLv+cWQbECMuqaqGIVaZzv6wc4hDAyEs86h
	 X/WF8YzPFEIL18/i8BlkzVu95JI9t3SaN45dnvFLmIqhrT4ptzaIHZQmwW3gD7LTY9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KWg54Ta1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB630606A334;
	Wed, 11 Nov 2026 22:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KWg54Ta1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 476F01F00A09;
	Wed, 11 Nov 2026 22:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794435282;
	bh=adv/YdsF5nvc2MG+S8IQd+/CC/0iW3a3t9NYWKnS0cM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KWg54Ta1ipNweWCovDUSGKCAfPelWBJfTvsGEae+LwqugF9JCRZgSmSPPtnGTN1zY
	 xLIqGNx82RUijDvIDILYsa/toYCxEE6csJSQjL9zLS0HWi3szuXlBUuuIjxmLL7wlu
	 Sqn+Z1mkVSy+4rj5G+ujyb8e/8EYFWI+x6Ba+GdiI72m7K5A/lRX2H/69OQSCHAyQH
	 o84HNE16kDtW0N/zMfgioijQHDlPUQfgDqBJ1L6JOoeLS+Cpg2eYN0ZpOre1nFQ1ZT
	 l18ZUE1dPMuhbCKO/6nyCM19UVWhZjnLgmQnmdRQLyupmXTuVwVrp8jwshORfQiLSB
	 DoLDoINudHeDQ==
Message-ID: <sashiko-outbox-209774@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 6/7] clk: add a driver for the Atheros/Qualcomm ath79
 PLL controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261111215729.10683-7-rosenp@gmail.com>
References: <20261111215729.10683-1-rosenp@gmail.com>
 <20261111215729.10683-7-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 22:14:41 +0000
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
- [Medium] clk: ath79: zeroed hfrac shift in qca956x_pll_rate()
--

commit 423abf763de32c1b127032d8210181c833b02aa9
Author: Rosen Penev <rosenp@gmail.com>

clk: add a driver for the Atheros/Qualcomm ath79 PLL controller

This commit adds a common clock driver for the Atheros/Qualcomm ath79 PLL
controller to replace the arch/mips/ath79/clock.c setup code.

> diff --git a/drivers/clk/clk-ath79.c b/drivers/clk/clk-ath79.c
> new file mode 100644
> index 0000000000000..6eab4cd1a91f7
> --- /dev/null
> +++ b/drivers/clk/clk-ath79.c
> @@ -0,0 +1,782 @@

[ ... ]

> +#define QCA956X_PLL_CONFIG1_NFRAC_L			GENMASK(4, 0)
> +#define QCA956X_PLL_CONFIG1_NFRAC_H			GENMASK(17, 5)
> +#define QCA956X_PLL_CONFIG1_NINT			GENMASK(26, 18)

[ ... ]

> +static unsigned long qca956x_pll_rate(unsigned long ref, u32 config,
> +				      u32 config1, u32 refdiv_mask,
> +				      u32 outdiv_mask)
> +{
> +	u32 ref_div, out_div, nint, hfrac, lfrac;
> +	u64 rate;
> +
> +	ref_div =3D (config & refdiv_mask) >> __ffs(refdiv_mask);
> +	out_div =3D (config & outdiv_mask) >> __ffs(outdiv_mask);
> +	nint =3D FIELD_GET(QCA956X_PLL_CONFIG1_NINT, config1);
> +	hfrac =3D FIELD_GET(QCA956X_PLL_CONFIG1_NFRAC_H, config1);
> +	lfrac =3D FIELD_GET(QCA956X_PLL_CONFIG1_NFRAC_L, config1);
> +
> +	if (!ref_div)
> +		return 0;
> +
> +	rate =3D div_u64((u64)ref * nint, ref_div);
> +	rate +=3D div_u64((u64)ref * lfrac, (ref_div * 25) << 13);
> +	rate +=3D div_u64((u64)ref * (hfrac >> 13), ref_div);

[Severity: Medium]
Does (hfrac >> 13) always evaluate to 0 here?  QCA956X_PLL_CONFIG1_NFRAC_H
is a 13-bit mask (GENMASK(17, 5)), so hfrac is at most 0x1fff and shifting
it right by 13 drops the upper fractional multiplier completely when
computing the QCA956x CPU, DDR, and AHB clock rates.  Matching the lfrac
term above, it looks like the divisor should be shifted instead:
div_u64((u64)ref * hfrac, ref_div << 13).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111215729.1068=
3-1-rosenp@gmail.com?part=3D6
