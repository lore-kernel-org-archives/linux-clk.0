Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8569728DD1;
	Thu, 16 May 2024 07:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715844886; cv=none; b=OjTLCcheM93MXBeGdBgfhrq/IEwipncgI/DxbL5d4etO3LyKwwkmOkLoLg/RS1JN9VoiszC37guk6zsfS5/K/DG1xZm0LSF3OkoCyspUDmtH0FmP2SrHmO6wUzYoTC+txAXDDNwjkBWcc5C4KlCNlHhhLyZ8ERFcFJWhfPjIesk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715844886; c=relaxed/simple;
	bh=HjjWktb2E+qwmQh3WN8NAfnd2hZ98UJFlbhLh4iTajc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CqOt/+6UvEWr32M3BqDXSwy8FnUpKR63ksGEHqSmIDlCFo0F7DLjNYL1xoPDwvlWE4cW+SaILXmJ+2XprAYa14QFIK1fyuApaRG+Q1WNTnBpyNLH6cULcqugpYBFifPU4Sf/L+ECz3MPBhjPddA/QHXnNgt01rI3Ua2reH32KS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mhv0Nre2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mhv0Nre2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55A5AC113CC;
	Thu, 16 May 2024 07:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715844885;
	bh=HjjWktb2E+qwmQh3WN8NAfnd2hZ98UJFlbhLh4iTajc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mhv0Nre2XAy+CUz7ZsMJMdG8rL84beCFbY557hdgnKJs9B8GomZgtYk6OKrcBptxU
	 BrMUwFk8DExe0n8gVHokINdK0KznI6Vx03UcY+dOHVVlKUv2wu8RT/2in+t0RQ3/BD
	 7ekNHvh8bJaXZXitUUIDHGMld3JlI/VjnzhI8BgnGikGS4KCJFBHNwqzF3Llozqp2M
	 UvENit/g4pp+vbya+Z184Q2UNEZvlZd+kHruN2xx6sCHGWTdthde+wWTiEGu19F4iA
	 8Dnzevm75lFAjjQ5DomfSMajmmnK8Xwu1kjMH1Po05J2DTZJsVkcyQhnTmDoRY2Ur9
	 cAffreYqxcZjw==
Date: Thu, 16 May 2024 09:34:42 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: linux-clk@vger.kernel.org, p.zabel@pengutronix.de,
	mturquette@baylibre.com, sboyd@kernel.org,
	lorenzo.bianconi83@gmail.com, linux-arm-kernel@lists.infradead.org,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org, nbd@nbd.name,
	john@phrozen.org, dd@embedd.com, catalin.marinas@arm.com,
	will@kernel.org, upstream@airoha.com,
	angelogioacchino.delregno@collabora.com
Subject: Re: [PATCH 2/5] dt-bindings: reset: Add reset definitions for EN7581
 SoC.
Message-ID: <ZkW3Evc77TbQGNQF@lore-desk>
References: <cover.1715777643.git.lorenzo@kernel.org>
 <acb6aa6fe473c485605c108e551d6d28ceb27a60.1715777643.git.lorenzo@kernel.org>
 <20240515-imperfect-candle-6179aa934427@spud>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="H2XUFYL7Gi/l0bRz"
Content-Disposition: inline
In-Reply-To: <20240515-imperfect-candle-6179aa934427@spud>


--H2XUFYL7Gi/l0bRz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Wed, May 15, 2024 at 02:58:48PM +0200, Lorenzo Bianconi wrote:
> > Introduce reset binding definitions for reset controller available in
> > the Airoha EN7581 clock module.
> >=20
> > Tested-by: Zhengping Zhang <zhengping.zhang@airoha.com>
>=20
> Heh, what is there to test in a header of made up numbers?
>=20
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
>=20
> Just squash this into patch 1.

ack, I will do in v2.

Regards,
Lorenzo

>=20
> Cheers,
> Conor.
>=20
> > ---
> >  .../dt-bindings/reset/airoha,en7581-reset.h   | 66 +++++++++++++++++++
> >  1 file changed, 66 insertions(+)
> >  create mode 100644 include/dt-bindings/reset/airoha,en7581-reset.h
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
> > --=20
> > 2.45.0
> >



--H2XUFYL7Gi/l0bRz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZkW3EgAKCRA6cBh0uS2t
rMf/AQDnEDXwOXQ4+Z0hdyKgdFTbidsOI1DOqHwXGWARQ38diAEAq6q44ps9mkRc
W/Eg6ZoMDROqWto0BEtBz1kytx0zuwM=
=FKy2
-----END PGP SIGNATURE-----

--H2XUFYL7Gi/l0bRz--
