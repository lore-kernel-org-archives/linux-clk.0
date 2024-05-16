Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE94114D431;
	Thu, 16 May 2024 16:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715875200; cv=none; b=ZbZJicmGIDU6H24Akrwd5dmp+kniyHQA4dIOXqH/P3bzNLxHwwRSfP9cQ3e13wF+sQ4ZQ+9YFSfOCisjeHQhcSjLiNDXxusz6AM3dCR8TG2EUsr/iLXzLZyX2xVL56J+aPh15uFayAh9IhaYa3wRFcrXrfqHJDDKrwIkkrIGInI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715875200; c=relaxed/simple;
	bh=4/gi6rbxuk3sno82iZjHcKkwDvcnwcT2fdJHUnfyx4s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KZoamZnhQBa3UWLBvvVmf8JT02PVNYC35ajbKVXwkGqyD8o0oxEx1feXZRmO+ifJRLt2/E62wEM+jG88yE/btRjXxypwvZvnlztHDaroef07+c+80RjRWcK24Fs4l3TcAldRJWhGZSJ5vlvpSHtPHrgIFgbUSo5+P3u/eflEXSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R/fbyDWI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R/fbyDWI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3A69C113CC;
	Thu, 16 May 2024 15:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715875200;
	bh=4/gi6rbxuk3sno82iZjHcKkwDvcnwcT2fdJHUnfyx4s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R/fbyDWIdw/BlYva1qA8M7jHYRc2BbLagdyT8ozD04xSBrvT+rIdFxIBzewHLZPdv
	 quPuDIZsgxW99btEGdZSwOF8KbLJOmAj8LPZ6u+xgD9DFjlvXVKmuDgrrHq8/ymMjT
	 cTdubTUXJWz39X5hBYl02/9L8X9pIb+qP8zGRqJccw8GE2vvuJbruEX/roO11P+sEQ
	 NaxKEhI7MvSmge6pJNXskqLKZfDGqm6OsvGfoHAI+U7yXt2znBlFJqJx7Cu/Ta+lc4
	 37jH+RcBgG81ULOdluy69/5J+FDB6VXqzcn3Gi2W6RJ+eiqSOAIuFKEO/x+mSm+G6o
	 5OglkRznj34Tg==
Date: Thu, 16 May 2024 17:59:56 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-clk@vger.kernel.org, p.zabel@pengutronix.de,
	mturquette@baylibre.com, sboyd@kernel.org,
	lorenzo.bianconi83@gmail.com, conor@kernel.org,
	linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, nbd@nbd.name, john@phrozen.org,
	dd@embedd.com, catalin.marinas@arm.com, will@kernel.org,
	upstream@airoha.com
Subject: Re: [PATCH 2/5] dt-bindings: reset: Add reset definitions for EN7581
 SoC.
Message-ID: <ZkYtfJJHIL1z2-vv@lore-desk>
References: <cover.1715777643.git.lorenzo@kernel.org>
 <acb6aa6fe473c485605c108e551d6d28ceb27a60.1715777643.git.lorenzo@kernel.org>
 <b1e0db1a-2bcb-4d11-a386-e395c2946591@collabora.com>
 <ZkXqoG6xIsrrLyh4@lore-desk>
 <d6b7aa1e-ce0d-4ea3-9f2d-c256a296dd1f@collabora.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UFOJValw8646IkIF"
Content-Disposition: inline
In-Reply-To: <d6b7aa1e-ce0d-4ea3-9f2d-c256a296dd1f@collabora.com>


--UFOJValw8646IkIF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Il 16/05/24 13:14, Lorenzo Bianconi ha scritto:
> > > Il 15/05/24 14:58, Lorenzo Bianconi ha scritto:
> > > > Introduce reset binding definitions for reset controller available =
in
> > > > the Airoha EN7581 clock module.
> > > >=20
> > > > Tested-by: Zhengping Zhang <zhengping.zhang@airoha.com>
> > > > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > > > ---
> > > >    .../dt-bindings/reset/airoha,en7581-reset.h   | 66 +++++++++++++=
++++++
> > > >    1 file changed, 66 insertions(+)
> > > >    create mode 100644 include/dt-bindings/reset/airoha,en7581-reset=
=2Eh
> > > >=20
> > > > diff --git a/include/dt-bindings/reset/airoha,en7581-reset.h b/incl=
ude/dt-bindings/reset/airoha,en7581-reset.h
> > > > new file mode 100644
> > > > index 000000000000..1b7ee62ed164
> > > > --- /dev/null
> > > > +++ b/include/dt-bindings/reset/airoha,en7581-reset.h
> > > > @@ -0,0 +1,66 @@
> > > > +// SPDX-License-Identifier: GPL-2.0-only
> > > > +/*
> > > > + * Copyright (c) 2024 AIROHA Inc
> > > > + * Author: Lorenzo Bianconi <lorenzo@kernel.org>
> > > > + */
> > > > +
> > > > +#ifndef __DT_BINDINGS_RESET_CONTROLLER_AIROHA_EN7581_H_
> > > > +#define __DT_BINDINGS_RESET_CONTROLLER_AIROHA_EN7581_H_
> > > > +
> > > > +/* RST_CTRL2 */
> > > > +#define EN7581_XPON_PHY_RST		0
> > >=20
> > > ** sarcasm mode on **
> > >=20
> > > Count with me: 0... 1... 2...
> >=20
> > :)
> >=20
> > >=20
> > > ** sarcasm mode off **
> > >=20
> > > There's a jump here, you have a reset index 0 and an index 2,
> > > but you're missing index 1, that's not right :-)
> > >=20
> > > Please fix.
> >=20
> > it is because BIT(1) is marked as 'reserved' in the documentation so I =
skipped it.
> > Do you prefer to have it in that way?
> >=20
>=20
> This is not my preference, it's rather a requirement for the bindings...
>=20
> That's why in the MediaTek reset controller part of the clk driver there =
is
> a way to map those numbers (which are always sequential) to actual reset =
bits
> in the controller...

ack, fine. I will look into it. Thx for the pointer.

Regards,
Lorenzo

>=20
> Cheers!
>=20
> > Regards,
> > Lorenzo
> >=20
> > >=20
> > > Cheers,
> > > Angelo
> > >=20
> > > > +#define EN7581_CPU_TIMER2_RST		2
> > > > +#define EN7581_HSUART_RST		3
> > > > +#define EN7581_UART4_RST		4
> > > > +#define EN7581_UART5_RST		5
> > > > +#define EN7581_I2C2_RST			6
> > > > +#define EN7581_XSI_MAC_RST		7
> > > > +#define EN7581_XSI_PHY_RST		8
> > > > +#define EN7581_NPU_RST			9
> > > > +#define EN7581_I2S_RST			10
> > > > +#define EN7581_TRNG_RST			11
> > > > +#define EN7581_TRNG_MSTART_RST		12
> > > > +#define EN7581_DUAL_HSI0_RST		13
> > > > +#define EN7581_DUAL_HSI1_RST		14
> > > > +#define EN7581_HSI_RST			15
> > > > +#define EN7581_DUAL_HSI0_MAC_RST	16
> > > > +#define EN7581_DUAL_HSI1_MAC_RST	17
> > > > +#define EN7581_HSI_MAC_RST		18
> > > > +#define EN7581_WDMA_RST			19
> > > > +#define EN7581_WOE0_RST			20
> > > > +#define EN7581_WOE1_RST			21
> > > > +#define EN7581_HSDMA_RST		22
> > > > +#define EN7581_TDMA_RST			24
> > > > +#define EN7581_EMMC_RST			25
> > > > +#define EN7581_SOE_RST			26
> > > > +#define EN7581_PCIE2_RST		27
> > > > +#define EN7581_XFP_MAC_RST		28
> > > > +#define EN7581_USB_HOST_P1_RST		29
> > > > +#define EN7581_USB_HOST_P1_U3_PHY_RST	30
> > > > +/* RST_CTRL1 */
> > > > +#define EN7581_PCM1_ZSI_ISI_RST		32
> > > > +#define EN7581_FE_PDMA_RST		33
> > > > +#define EN7581_FE_QDMA_RST		34
> > > > +#define EN7581_PCM_SPIWP_RST		36
> > > > +#define EN7581_CRYPTO_RST		38
> > > > +#define EN7581_TIMER_RST		40
> > > > +#define EN7581_PCM1_RST			43
> > > > +#define EN7581_UART_RST			44
> > > > +#define EN7581_GPIO_RST			45
> > > > +#define EN7581_GDMA_RST			46
> > > > +#define EN7581_I2C_MASTER_RST		48
> > > > +#define EN7581_PCM2_ZSI_ISI_RST		49
> > > > +#define EN7581_SFC_RST			50
> > > > +#define EN7581_UART2_RST		51
> > > > +#define EN7581_GDMP_RST			52
> > > > +#define EN7581_FE_RST			53
> > > > +#define EN7581_USB_HOST_P0_RST		54
> > > > +#define EN7581_GSW_RST			55
> > > > +#define EN7581_SFC2_PCM_RST		57
> > > > +#define EN7581_PCIE0_RST		58
> > > > +#define EN7581_PCIE1_RST		59
> > > > +#define EN7581_CPU_TIMER_RST		60
> > > > +#define EN7581_PCIE_HB_RST		61
> > > > +#define EN7581_XPON_MAC_RST		63
> > > > +
> > > > +#endif /* __DT_BINDINGS_RESET_CONTROLLER_AIROHA_EN7581_H_ */
> > >=20
>=20

--UFOJValw8646IkIF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZkYtfAAKCRA6cBh0uS2t
rGFhAQDAYBya1TZrQ7qULTFv41plUuJk73mvvx61a908F//wDAD/UvJzzr1aPkzR
5We0gdkRDcqRGucjOeWf3Yen0jl39Qs=
=Nrb/
-----END PGP SIGNATURE-----

--UFOJValw8646IkIF--
