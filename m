Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794154305;
	b=k983IY7kiNI4q03pJ6TXdqQX1OHk7PeE3wn4aY+Wev5V6d+wDdT2rgdeQkVEIonuFKw6
	 TPq9O3ie7G1zotNiE2GcjTPWlPURTjlvgRODm7ENO2KsoXyH1QTLQK7UxKPPDFmxxY38F
	 XgMlmvnNYjwdcHiVV0DdooXxQ227+2eQ1xcDkKRxBTiSnUYakXlPfVeONgb4RZYRKynpA
	 qZXzIa/FmftveNnFoVE/zq/88OkCOt1ejUSsWmI41VvAj2z47dRVtpeXJPSZlMHqmgLN9
	 /A/wlF5pXTrYDM4psEH0eu7Cv1M+VwP6D972n6nvDJkMPRqemLVixmt1rtQiK05azuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794154305;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=BVw/azks66niKUWspfBTLSYSvTbsAlgD2VDvPx+Yq1Q=;
	b=P6+rReuJf/nAwlr3grTFFnvRLWKyyz2d6EZNle2qbjPJ0miRfgBVEYiPemBWUSZ43F/C
	 r7HXEtpZ1kz8O6fj7rMNyVciXr5AX9BQm510BAsJI4QUbpaXsXHSpqoNacV2qfZ4EfPPk
	 W2LBtxTk0oXxmFt8r6glZ2IauOagSowtQbwiaELGqVOaSqBzdlx7hc7M5qqWBvXLOmXDs
	 ePAeDCq293Y932EQdbc3qyxm6DQ9S/lpLrwd2+WuE2GRR+DzjW1mC6bHAL0vJH/yeRKmB
	 Ap7rHASc9LQYyYxbQPmAvQzxRvwHzfQA6Ax2cM/yukYwERyftnJzM+57dOMKWIqHTdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n9b8DFRB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F350606A31C;
	Sun,  8 Nov 2026 16:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n9b8DFRB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5467C1F0089F;
	Sun,  8 Nov 2026 16:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794154304;
	bh=BVw/azks66niKUWspfBTLSYSvTbsAlgD2VDvPx+Yq1Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=n9b8DFRBEFncMA3Aln6VKljF6B7ig77iJqhdF28rKv3rWeCFudnwjKV0ubE/HEOH+
	 0Sa1FGNBIlpziLhA3MFNrOcy0d2zaKoNeWRcxBRbqO6ywP6dNWU7+KaW16w24CarHJ
	 MU3zrsrrbEJIHMkrM5QtUfHFni3zHRZ6uaCjvJ75k68hhtTeVqv7jydjGWYWYV/5pT
	 rZkEzopEYK8cRFCZGsp9NEdtBcz22g+FUJOLEsoMCOos40+BuNeT0XS1zCqjquvesA
	 J40bsOx7/BJF5f25dLdt1WDp7jS4+LnNXhXwhPtOs6sLkfa2ALW+JZeRP0ossxco0P
	 dPsqY5BXbTXQQ==
Message-ID: <sashiko-outbox-203873@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: clock: sun4i-a10-ccu: add Allwinner
 B288
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pablo Mazzini" <pmazzini@gmail.com>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-sunxi@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261108155702.361022-2-pmazzini@gmail.com>
References: <20261108155702.361022-1-pmazzini@gmail.com>
 <20261108155702.361022-2-pmazzini@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 08 Nov 2026 16:11:43 +0000
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
- [Low] dt-bindings: clock: sun8i-b288-ccu: inconsistent clock and reset
  macro names
--

commit fb1a7b2f6dc03665d0714b13f4a0587e1bb34467
Author: Pablo Mazzini <pmazzini@gmail.com>

dt-bindings: clock: sun4i-a10-ccu: add Allwinner B288

This commit adds the Allwinner B288 CCU compatible string to the
sun4i-a10-ccu binding schema and introduces the clock and reset DT binding
headers for the SoC.

> diff --git a/include/dt-bindings/clock/sun8i-b288-ccu.h b/include/dt-bind=
ings/clock/sun8i-b288-ccu.h
> new file mode 100644
> index 0000000000000..c9b9eaf979ad0
> --- /dev/null
> +++ b/include/dt-bindings/clock/sun8i-b288-ccu.h
> @@ -0,0 +1,82 @@

[ ... ]

> +#define CLK_NAND	18
> +#define CLK_MMC0	19
> +#define CLK_MMC1	20
> +#define CLK_MMC2	21
> +#define CLK_MMC3	22
> +#define CLK_SPI0	23
> +#define CLK_SPI1	24
> +#define CLK_SPI2	25
> +#define CLK_DRAM	26

[ ... ]

> +#define CLK_BUS_THS	32
> +#define CLK_BUS_NAND	33
> +#define CLK_BUS_SDMMC0_BUS	34
> +#define CLK_BUS_SDMMC1_BUS	35
> +#define CLK_BUS_SDMMC2_BUS	36
> +#define CLK_BUS_SDMMC3_BUS	37

[ ... ]

> +#define CLK_BUS_USBOHCI0	46
> +#define CLK_BUS_USBEHCI0	47
> +#define CLK_BUS_USBOTG	48
> +#define CLK_BUS_DE	49
> +#define CLK_BUS_EE	50
> +#define CLK_BUS_TCON0	51
> +#define CLK_BUS_CSI	52
> +#define CLK_BUS_ADDA	53
> +#define CLK_BUS_SDRAM	54

[ ... ]

> +#define CLK_BUS_TWI0	63
> +#define CLK_BUS_TWI1	64
> +#define CLK_BUS_TWI2	65

[ ... ]

> diff --git a/include/dt-bindings/reset/sun8i-b288-ccu.h b/include/dt-bind=
ings/reset/sun8i-b288-ccu.h
> new file mode 100644
> index 0000000000000..6751456545487
> --- /dev/null
> +++ b/include/dt-bindings/reset/sun8i-b288-ccu.h
> @@ -0,0 +1,45 @@

[ ... ]

> +#define RST_BUS_MMC0	2
> +#define RST_BUS_MMC1	3
> +#define RST_BUS_MMC2	4
> +#define RST_BUS_MMC3	5

[ ... ]

> +#define RST_USBPHY0	14
> +#define RST_BUS_OHCI0	15
> +#define RST_BUS_EHCI0	16
> +#define RST_BUS_OTG	17

[ ... ]

> +#define RST_BUS_DRAM	25

[ ... ]

> +#define RST_BUS_I2C0	34
> +#define RST_BUS_I2C1	35
> +#define RST_BUS_I2C2	36

[Severity: Low]
Could these macro names be aligned between the clock and reset headers and
with existing sunxi-ng CCU bindings before they become ABI?

Specifically:
- CLK_BUS_SDMMC0_BUS..CLK_BUS_SDMMC3_BUS vs. CLK_BUS_MMC0..CLK_BUS_MMC3
  (matching CLK_MMC0..3 and RST_BUS_MMC0..3, without the redundant _BUS
  suffix)
- CLK_BUS_USBOHCI0, CLK_BUS_USBEHCI0, and CLK_BUS_USBOTG vs.
  CLK_BUS_OHCI0, CLK_BUS_EHCI0, and CLK_BUS_OTG (matching RST_BUS_OHCI0,
  RST_BUS_EHCI0, and RST_BUS_OTG)
- CLK_BUS_SDRAM vs. CLK_BUS_DRAM (matching CLK_DRAM and RST_BUS_DRAM)
- CLK_BUS_TWI0..CLK_BUS_TWI2 vs. CLK_BUS_I2C0..CLK_BUS_I2C2 (matching
  RST_BUS_I2C0..2)
- RST_USBPHY0 vs. RST_USB_PHY0 (matching other Allwinner CCU reset headers)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261108155702.3610=
22-1-pmazzini@gmail.com?part=3D1
