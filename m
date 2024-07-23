Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E2713957B
	for <linux-clk@vger.kernel.org>; Tue, 23 Jul 2024 06:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721715917; cv=none; b=EENDCgEuSgv/wxxatE7iwwhIUjF5uDadJkEcTWWMHbiRcKR+yJNn+ur54VYYCbzloLtgGSBpphJ4agRIdlZ5FqY4jzF8hveCA1PsFueop9Z/NrmV4KLldjYMoIqpiztludkPCLaXDdLzOREGMFJfmOJrhc+lx+33JdjPI1IBNNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721715917; c=relaxed/simple;
	bh=Qij07p89kKJpR5FZpRTpoWuLS4TTtSsYb67fppzLAQM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LgCyw39YATaakPygPhW7fbpt+sktE0hwFIAeUv2pKCRcJ7p5E70Soyei8mT7Yxebclnq/aNzzCZI6Tm61vXF/2ayPmW/nqtYL1xWcG38J+ea98NoEPWeeykogVnP2F06sI4Qxi1Gyifhr4j9TMYAcueSraaGLPvThPwVSCkwuvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BxPFCcLk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BxPFCcLk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45486C4AF09;
	Tue, 23 Jul 2024 06:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721715916;
	bh=Qij07p89kKJpR5FZpRTpoWuLS4TTtSsYb67fppzLAQM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BxPFCcLkH8DfwuUW4vBr12chL7UK8W6e7EipVBnXmMm1J+9YqKsTE+9vTkDw/Nemu
	 TAnwZPbYBHBdiI5+ylsggE0QtjoBj4CSIzZ00dvrrYrhC9X6qbzAFYEpy2w4msEUVd
	 TEtClUcc98418Yh1ROJpEHWd/xLPDRXcIspyIPUa7Nkzlm+9zteM9MHFcuHU1WDT1A
	 0/2dNpcbpjdtZ/aLoLrHXPeYCuILU447TwGotP30jyamN8BlOIq78ABwSqrEi9T9ph
	 CFCfZPGUtOuoF5vnKL5FbKwfo6GTYA2OK1X0VRCIYXWrl3yzxPI44SuWXC0vhPx8d1
	 qoG1FziYGBZ6g==
Date: Tue, 23 Jul 2024 08:25:09 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-clk@vger.kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
	p.zabel@pengutronix.de, lorenzo.bianconi83@gmail.com,
	linux-arm-kernel@lists.infradead.org, nbd@nbd.name,
	john@phrozen.org, upstream@airoha.com
Subject: Re: [PATCH 2/2] clk: en7523: fix scuclk io region for upcoming
 pinctrl
Message-ID: <Zp9MxSkxXctfe-F3@lore-rh-laptop>
References: <cover.1720510991.git.lorenzo@kernel.org>
 <f1c8e114fb1370b9a3a602e3ed3e9eeb5824c2e7.1720510991.git.lorenzo@kernel.org>
 <26151f58-9dd3-4e14-afaf-c62f539f8e26@collabora.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2m6eVZ4WKJf9tWRH"
Content-Disposition: inline
In-Reply-To: <26151f58-9dd3-4e14-afaf-c62f539f8e26@collabora.com>


--2m6eVZ4WKJf9tWRH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Il 09/07/24 09:48, Lorenzo Bianconi ha scritto:
> > EN7581 clock driver shares the IO region with the upcoming pinctrl
> > driver for Airoha EN7581 SoC. Fix it by reducing the clk mapped
> > region to only used registers in order to not overlap with pinctrl
> > one. This change is not introducing any backward compatibility issue
> > since the EN7581 dts is not upstream yet.
> >=20
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > ---
> >   drivers/clk/clk-en7523.c | 23 +++++++++++++++--------
> >   1 file changed, 15 insertions(+), 8 deletions(-)
> >=20
> > diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
> > index b20e56337a6b..d9ecbb6bf55a 100644
> > --- a/drivers/clk/clk-en7523.c
> > +++ b/drivers/clk/clk-en7523.c
> > @@ -31,7 +31,14 @@
> >   #define   REG_RESET_CONTROL_PCIE1	BIT(27)
> >   #define   REG_RESET_CONTROL_PCIE2	BIT(26)
> >   /* EN7581 */
> > -#define REG_CRYPTO_CLKSRC2		0x20c
> > +#define REG_GSW_CLK_DIV_SEL2		0x00
> > +#define REG_EMI_CLK_DIV_SEL2		0x04
> > +#define REG_BUS_CLK_DIV_SEL2		0x08
> > +#define REG_SPI_CLK_DIV_SEL2		0x10
> > +#define REG_SPI_CLK_FREQ_SEL2		0x14
> > +#define REG_NPU_CLK_DIV_SEL2		0x48
> > +#define REG_CRYPTO_CLKSRC2		0x58
> > +
> >   #define REG_PCIE0_MEM			0x00
> >   #define REG_PCIE0_MEM_MASK		0x04
> >   #define REG_PCIE1_MEM			0x08
> > @@ -203,7 +210,7 @@ static const struct en_clk_desc en7581_base_clks[] =
=3D {
> >   		.id =3D EN7523_CLK_GSW,
> >   		.name =3D "gsw",
> > -		.base_reg =3D REG_GSW_CLK_DIV_SEL,
> > +		.base_reg =3D REG_GSW_CLK_DIV_SEL2,
>=20
> This is practically just commit noise :-)
>=20
> You are adding the en7581_base_clks[] in patch [1/2] with the wrong base =
register,
> then fixing it here ... and that's wrong.
>=20
> Please squash the two patches.

ack, I will do.

Regards,
Lorenzo

>=20
> Cheers,
> Angelo
>=20
> >   		.base_bits =3D 1,
> >   		.base_shift =3D 8,
> >   		.base_values =3D gsw_base,
> > @@ -217,7 +224,7 @@ static const struct en_clk_desc en7581_base_clks[] =
=3D {
> >   		.id =3D EN7523_CLK_EMI,
> >   		.name =3D "emi",
> > -		.base_reg =3D REG_EMI_CLK_DIV_SEL,
> > +		.base_reg =3D REG_EMI_CLK_DIV_SEL2,
> >   		.base_bits =3D 2,
> >   		.base_shift =3D 8,
> >   		.base_values =3D emi7581_base,
> > @@ -231,7 +238,7 @@ static const struct en_clk_desc en7581_base_clks[] =
=3D {
> >   		.id =3D EN7523_CLK_BUS,
> >   		.name =3D "bus",
> > -		.base_reg =3D REG_BUS_CLK_DIV_SEL,
> > +		.base_reg =3D REG_BUS_CLK_DIV_SEL2,
> >   		.base_bits =3D 1,
> >   		.base_shift =3D 8,
> >   		.base_values =3D bus_base,
> > @@ -245,13 +252,13 @@ static const struct en_clk_desc en7581_base_clks[=
] =3D {
> >   		.id =3D EN7523_CLK_SLIC,
> >   		.name =3D "slic",
> > -		.base_reg =3D REG_SPI_CLK_FREQ_SEL,
> > +		.base_reg =3D REG_SPI_CLK_FREQ_SEL2,
> >   		.base_bits =3D 1,
> >   		.base_shift =3D 0,
> >   		.base_values =3D slic_base,
> >   		.n_base_values =3D ARRAY_SIZE(slic_base),
> > -		.div_reg =3D REG_SPI_CLK_DIV_SEL,
> > +		.div_reg =3D REG_SPI_CLK_DIV_SEL2,
> >   		.div_bits =3D 5,
> >   		.div_shift =3D 24,
> >   		.div_val0 =3D 20,
> > @@ -260,7 +267,7 @@ static const struct en_clk_desc en7581_base_clks[] =
=3D {
> >   		.id =3D EN7523_CLK_SPI,
> >   		.name =3D "spi",
> > -		.base_reg =3D REG_SPI_CLK_DIV_SEL,
> > +		.base_reg =3D REG_SPI_CLK_DIV_SEL2,
> >   		.base_value =3D 400000000,
> > @@ -272,7 +279,7 @@ static const struct en_clk_desc en7581_base_clks[] =
=3D {
> >   		.id =3D EN7523_CLK_NPU,
> >   		.name =3D "npu",
> > -		.base_reg =3D REG_NPU_CLK_DIV_SEL,
> > +		.base_reg =3D REG_NPU_CLK_DIV_SEL2,
> >   		.base_bits =3D 2,
> >   		.base_shift =3D 8,
> >   		.base_values =3D npu7581_base,
>=20

--2m6eVZ4WKJf9tWRH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZp9MwgAKCRA6cBh0uS2t
rF5eAP9AYHsoVKv5YP+LfG61ITUZJQAfTb/vYDnk3EBbuqniCwD8DPpNRGzgRjMM
cOaMynYKucUcfHh8jHL5UtI01iVnegA=
=b8hY
-----END PGP SIGNATURE-----

--2m6eVZ4WKJf9tWRH--
