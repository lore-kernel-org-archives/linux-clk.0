Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898A914534B;
	Thu, 16 May 2024 11:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715858084; cv=none; b=FChHfnEUdOmBtq9NJNGDvFKwYwzhdGGG7vU3DDVXoK83FC37x0CoENtPDibVsMYZYKESL/vaXoX3WKNYl2yU1MYzMl75jKTmqjvtkEkXS0LPKMF51+nMLthXJVvLcAE0VW1vLO2q/rHSODMTQ42dSSZxg1rK2KAsblRIaalgQz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715858084; c=relaxed/simple;
	bh=f3m3tpKfjEj+h303wNF7d1vDkKKiGrQRJ0cjVD8zqPM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QTuEzLGY3ZKU0gTx+MezQ1TGShDsoBksdNOwqFdob6ynlSQLxhn5EaYS+glT1oGubbBKskPV5HSJjNkB95DCbf8KsWIf844Qhx5Kjf+Ll3FL7f+utnskXcuw4uX/Qqm2HN1KbORRN5R7rTR2WUWILaYYa9uCYw2tl7luEVp1wcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ujI5xr1F; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ujI5xr1F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BDE3C113CC;
	Thu, 16 May 2024 11:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715858084;
	bh=f3m3tpKfjEj+h303wNF7d1vDkKKiGrQRJ0cjVD8zqPM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ujI5xr1FKF49y0M3ABHaKP0TpajZrmtan6Z0RcRQCrphdhgUmfnFLWXkqD+fdn3lt
	 KSUs+cnLgffV+MzDufxu+2nc+Y52PJV033aDY4N+eagsfa6Fss4ZLIIVlORE+U+RuD
	 t0e/mJh9ZDcg7+HaN7HV0xijkNl+vLa5L7i3Mc/m5CNZT7BMseb+PwdO0NUbGCc5kx
	 2mXc47g3aUpng5pZKm1cWy/wxi8JCKwwuGkByIXclUMhTEK4VsvznMNgH/fu7tEBSx
	 Bh0Q+S/MSz+fHeY3/AjqfzlRIYVla6YhDQDfh2pCaIrqwu3u3XjBWbaXctsk+hwv1z
	 ryRJQJJSCnKDQ==
Date: Thu, 16 May 2024 13:14:40 +0200
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
Message-ID: <ZkXqoG6xIsrrLyh4@lore-desk>
References: <cover.1715777643.git.lorenzo@kernel.org>
 <acb6aa6fe473c485605c108e551d6d28ceb27a60.1715777643.git.lorenzo@kernel.org>
 <b1e0db1a-2bcb-4d11-a386-e395c2946591@collabora.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RpZgGcsqwUws+u1I"
Content-Disposition: inline
In-Reply-To: <b1e0db1a-2bcb-4d11-a386-e395c2946591@collabora.com>


--RpZgGcsqwUws+u1I
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Il 15/05/24 14:58, Lorenzo Bianconi ha scritto:
> > Introduce reset binding definitions for reset controller available in
> > the Airoha EN7581 clock module.
> >=20
> > Tested-by: Zhengping Zhang <zhengping.zhang@airoha.com>
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > ---
> >   .../dt-bindings/reset/airoha,en7581-reset.h   | 66 +++++++++++++++++++
> >   1 file changed, 66 insertions(+)
> >   create mode 100644 include/dt-bindings/reset/airoha,en7581-reset.h
> >=20
> > diff --git a/include/dt-bindings/reset/airoha,en7581-reset.h b/include/=
dt-bindings/reset/airoha,en7581-reset.h
> > new file mode 100644
> > index 000000000000..1b7ee62ed164
> > --- /dev/null
> > +++ b/include/dt-bindings/reset/airoha,en7581-reset.h
> > @@ -0,0 +1,66 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (c) 2024 AIROHA Inc
> > + * Author: Lorenzo Bianconi <lorenzo@kernel.org>
> > + */
> > +
> > +#ifndef __DT_BINDINGS_RESET_CONTROLLER_AIROHA_EN7581_H_
> > +#define __DT_BINDINGS_RESET_CONTROLLER_AIROHA_EN7581_H_
> > +
> > +/* RST_CTRL2 */
> > +#define EN7581_XPON_PHY_RST		0
>=20
> ** sarcasm mode on **
>=20
> Count with me: 0... 1... 2...

:)

>=20
> ** sarcasm mode off **
>=20
> There's a jump here, you have a reset index 0 and an index 2,
> but you're missing index 1, that's not right :-)
>=20
> Please fix.

it is because BIT(1) is marked as 'reserved' in the documentation so I skip=
ped it.
Do you prefer to have it in that way?

Regards,
Lorenzo

>=20
> Cheers,
> Angelo
>=20
> > +#define EN7581_CPU_TIMER2_RST		2
> > +#define EN7581_HSUART_RST		3
> > +#define EN7581_UART4_RST		4
> > +#define EN7581_UART5_RST		5
> > +#define EN7581_I2C2_RST			6
> > +#define EN7581_XSI_MAC_RST		7
> > +#define EN7581_XSI_PHY_RST		8
> > +#define EN7581_NPU_RST			9
> > +#define EN7581_I2S_RST			10
> > +#define EN7581_TRNG_RST			11
> > +#define EN7581_TRNG_MSTART_RST		12
> > +#define EN7581_DUAL_HSI0_RST		13
> > +#define EN7581_DUAL_HSI1_RST		14
> > +#define EN7581_HSI_RST			15
> > +#define EN7581_DUAL_HSI0_MAC_RST	16
> > +#define EN7581_DUAL_HSI1_MAC_RST	17
> > +#define EN7581_HSI_MAC_RST		18
> > +#define EN7581_WDMA_RST			19
> > +#define EN7581_WOE0_RST			20
> > +#define EN7581_WOE1_RST			21
> > +#define EN7581_HSDMA_RST		22
> > +#define EN7581_TDMA_RST			24
> > +#define EN7581_EMMC_RST			25
> > +#define EN7581_SOE_RST			26
> > +#define EN7581_PCIE2_RST		27
> > +#define EN7581_XFP_MAC_RST		28
> > +#define EN7581_USB_HOST_P1_RST		29
> > +#define EN7581_USB_HOST_P1_U3_PHY_RST	30
> > +/* RST_CTRL1 */
> > +#define EN7581_PCM1_ZSI_ISI_RST		32
> > +#define EN7581_FE_PDMA_RST		33
> > +#define EN7581_FE_QDMA_RST		34
> > +#define EN7581_PCM_SPIWP_RST		36
> > +#define EN7581_CRYPTO_RST		38
> > +#define EN7581_TIMER_RST		40
> > +#define EN7581_PCM1_RST			43
> > +#define EN7581_UART_RST			44
> > +#define EN7581_GPIO_RST			45
> > +#define EN7581_GDMA_RST			46
> > +#define EN7581_I2C_MASTER_RST		48
> > +#define EN7581_PCM2_ZSI_ISI_RST		49
> > +#define EN7581_SFC_RST			50
> > +#define EN7581_UART2_RST		51
> > +#define EN7581_GDMP_RST			52
> > +#define EN7581_FE_RST			53
> > +#define EN7581_USB_HOST_P0_RST		54
> > +#define EN7581_GSW_RST			55
> > +#define EN7581_SFC2_PCM_RST		57
> > +#define EN7581_PCIE0_RST		58
> > +#define EN7581_PCIE1_RST		59
> > +#define EN7581_CPU_TIMER_RST		60
> > +#define EN7581_PCIE_HB_RST		61
> > +#define EN7581_XPON_MAC_RST		63
> > +
> > +#endif /* __DT_BINDINGS_RESET_CONTROLLER_AIROHA_EN7581_H_ */
>=20

--RpZgGcsqwUws+u1I
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZkXqoAAKCRA6cBh0uS2t
rCueAP9MHJO7lt6I/1ogxtDK7sBU5a3Asb4kFHCnT/6Htx1s6wEAk4sLUHj4feFl
yuDrUp3NGJIBhOpJPHZ7fvvM/Jgakwo=
=ftcA
-----END PGP SIGNATURE-----

--RpZgGcsqwUws+u1I--
