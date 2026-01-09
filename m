Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7C5500942;
	Fri,  9 Jan 2026 21:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767994325; cv=none; b=FG6y4YFlf1XX7TZH0O0HI4UTjU4btIkWFoEBncXA/PIzu2tXXk/RhvZ79vcVhDIth+ycH+ludOBOKaJ4hiZE51H9pxukHcIEdmv0C8D1hTHwg8EP8w1isxB7E+uBeyuOLHDPXsTz38E2RypvtGGOkxIt+93htqX0/0o7/fXHGxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767994325; c=relaxed/simple;
	bh=jmXgesLrf6BlXMJgU46sieiYHnF1uBZSohRg/Opr9CY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jXocST472lhHppkeQG0VlhDt16IJmgUqqfbR/zXFXqHeddrD8ml/C5MEypCUursKfna/ACkjlxCpBveAbSK1sIrhx8kfIwGl9k15NUAbBbSeHdUSrHTa5JUI4X16rQfEd8EcCEmOHKjp4cIfsCpU/bw5A79FIvIkFHn79AErHew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nPYFodVY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nPYFodVY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C968C4CEF1;
	Fri,  9 Jan 2026 21:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767994324;
	bh=jmXgesLrf6BlXMJgU46sieiYHnF1uBZSohRg/Opr9CY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nPYFodVYkJKKaNAmB7BJ6Y3jrMXONYgVTwTovhmDd6J/LvLCc34t0iP3QzU7+A2X8
	 1T47XWL06CnA0qDIp4Br08bs4I8RuUwwyVa88KHZXFM4tFT9cAj49jTBGQs/NTwvne
	 7zNBwvEnFwbRWkmzNyrEsWvoL1rCi/hm/n7xWpuOucmW/RWemKwH7y/rwhZMPofeeR
	 rcZS2jisdQoHW+bDNUsN97ID6z9TRKvWsE6U6zUd5txphAICycVtxbB+WcqhPwJAca
	 +tUfw2HwFfX2qoIIc/V+orTsnboD3x55KlRUwkZx+WTDqSh28ys7UBf6BfQ5ztqCqj
	 r5eaZ2BoZKVJg==
Date: Fri, 9 Jan 2026 21:32:00 +0000
From: Conor Dooley <conor@kernel.org>
To: claudiu beznea <claudiu.beznea@tuxon.dev>
Cc: linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/3] clk: microchip: drop POLARFIRE from
 ARCH_MICROCHIP_POLARFIRE
Message-ID: <20260109-static-sauciness-be0ab0b410d2@spud>
References: <20251121-tartar-drew-ba31c5ec9192@spud>
 <20251121-prude-dilation-79d275fec296@spud>
 <86bd75e7-1191-458d-b71e-c3cecb960700@tuxon.dev>
 <20251208-flatten-devious-56abcfecd510@spud>
 <af02ffd7-4876-4bce-8a79-2b34114d6ccc@tuxon.dev>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/ujGXdfmic+jHB7W"
Content-Disposition: inline
In-Reply-To: <af02ffd7-4876-4bce-8a79-2b34114d6ccc@tuxon.dev>


--/ujGXdfmic+jHB7W
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 09, 2026 at 09:22:25AM +0200, claudiu beznea wrote:
>=20
>=20
> On 12/8/25 20:02, Conor Dooley wrote:
> > On Sat, Dec 06, 2025 at 01:18:30PM +0200, Claudiu Beznea wrote:
> > >=20
> > >=20
> > > On 11/21/25 15:44, Conor Dooley wrote:
> > > > From: Conor Dooley <conor.dooley@microchip.com>
> > > >=20
> > > > This driver is used by non-polarfire devices now, and the ARCH_MICR=
OCHIP
> > > > symbol has been defined for some time on RISCV so drop it without a=
ny
> > > > functional change.
> > > >=20
> > > > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > > > ---
> > > >   drivers/clk/microchip/Kconfig | 4 ++--
> > > >   1 file changed, 2 insertions(+), 2 deletions(-)
> > > >=20
> > > > diff --git a/drivers/clk/microchip/Kconfig b/drivers/clk/microchip/=
Kconfig
> > > > index cab9a909893b..a0ef14310417 100644
> > > > --- a/drivers/clk/microchip/Kconfig
> > > > +++ b/drivers/clk/microchip/Kconfig
> > > > @@ -5,8 +5,8 @@ config COMMON_CLK_PIC32
> > > >   config MCHP_CLK_MPFS
> > > >   	bool "Clk driver for PolarFire SoC"
> > > > -	depends on ARCH_MICROCHIP_POLARFIRE || COMPILE_TEST
> > > > -	default ARCH_MICROCHIP_POLARFIRE
> > > > +	depends on ARCH_MICROCHIP || COMPILE_TEST
> > > > +	default y
> > > >   	depends on MFD_SYSCON
> > > >   	select AUXILIARY_BUS
> > > >   	select COMMON_CLK_DIVIDER_REGMAP
> > >=20
> > > OK, I found v2 in my inbox. Same symptom here. It doesn't apply on to=
p of
> > > the current at91-next either.
> >=20
> > I think this should sort itself out after -rc1, but I'll resend if it
> > doesn't.
>=20
> Still doesn't apply. It conflicts at least with
> commit c6f2dddfa7f9 ("clk: microchip: mpfs: use regmap for clocks")

Right, I'll resend. Thought it was based on the aforementioned patch
tbh!

--/ujGXdfmic+jHB7W
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaWFz0AAKCRB4tDGHoIJi
0lDFAP41AelcberGgT4Fh6QhHg746myZBCiXqHa6oCY+lLjliwEAizke4evc/wgP
3w0M939O+a5TZLZwHMXtuSzTsWDDRQg=
=PVZG
-----END PGP SIGNATURE-----

--/ujGXdfmic+jHB7W--
