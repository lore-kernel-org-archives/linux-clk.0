Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F1743B8D53;
	Mon,  8 Dec 2025 18:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765216972; cv=none; b=ueKI4NfDBrz8To2/k5+rlXqp6aO5f4AJQZoMh7RtVoqN6b64gpXQdm7vGOXH+FQ0JYA9hHHs4acveEx3QvLzDx0IOALZ8IRsXfPPllKC8/kVqftvIg/hmf+dPHphbiawHEKC6n9sTu6Kve6Q42GE7WCSJjv5bZc5WweMkCX7wow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765216972; c=relaxed/simple;
	bh=7q6s7jx4rNURD2mNarlLSt82SNn58lTyP8BfcayLfG0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jBllS7Ggyd9QvXviQY5q4w4FulYmzAZGHocnrteh7yBzFDkvAPoaDPLhrLyMnOqiFIGu6989j0A1+/elwDuMJoEE6NVlL0QHSatRF2HkjzqKe8L0vxoo7kOmKgNMjHrbe5Pe/Gw9yE9Tx/uWvMpIvUpWmdOs0NGApQzD+YcV9O8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hfy4FPNK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hfy4FPNK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDFA0C4CEF1;
	Mon,  8 Dec 2025 18:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765216972;
	bh=7q6s7jx4rNURD2mNarlLSt82SNn58lTyP8BfcayLfG0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hfy4FPNK9p+GuCosrgIElaGczapNltTYDZOAtYAY//Avlm4hGayWMCiLl/T6vi6wD
	 xeMwgX/ayl8GJkvQGaPiR1Owrr+TX3kG6lVUqyRqOg2isAVEq7DtY8Tyr+OisgEefH
	 KNRRNjz1PgXtI6tQQdc68bZKfPljiWplTyrYmM3EwvE8pFplSxwLKiZUmbic7hJ2ND
	 ACO5IEcTWDXtVkk4Ta/D1MYE9G2FIsKkfOCCjpgAkuih+Kmv+vrrUHKdB3d7WxTxdI
	 nEXDkNphrd5uzsZ+I1ou6PN+enwz3qbcx89F+g5gK4yPfKX4Nbt6oFXm4D0EsDXedk
	 9UQtOR+aHrAbg==
Date: Mon, 8 Dec 2025 18:02:47 +0000
From: Conor Dooley <conor@kernel.org>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/3] clk: microchip: drop POLARFIRE from
 ARCH_MICROCHIP_POLARFIRE
Message-ID: <20251208-flatten-devious-56abcfecd510@spud>
References: <20251121-tartar-drew-ba31c5ec9192@spud>
 <20251121-prude-dilation-79d275fec296@spud>
 <86bd75e7-1191-458d-b71e-c3cecb960700@tuxon.dev>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SZ4voAMfwUKL6i6u"
Content-Disposition: inline
In-Reply-To: <86bd75e7-1191-458d-b71e-c3cecb960700@tuxon.dev>


--SZ4voAMfwUKL6i6u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 06, 2025 at 01:18:30PM +0200, Claudiu Beznea wrote:
>=20
>=20
> On 11/21/25 15:44, Conor Dooley wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> >=20
> > This driver is used by non-polarfire devices now, and the ARCH_MICROCHIP
> > symbol has been defined for some time on RISCV so drop it without any
> > functional change.
> >=20
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> >  drivers/clk/microchip/Kconfig | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/clk/microchip/Kconfig b/drivers/clk/microchip/Kcon=
fig
> > index cab9a909893b..a0ef14310417 100644
> > --- a/drivers/clk/microchip/Kconfig
> > +++ b/drivers/clk/microchip/Kconfig
> > @@ -5,8 +5,8 @@ config COMMON_CLK_PIC32
> > =20
> >  config MCHP_CLK_MPFS
> >  	bool "Clk driver for PolarFire SoC"
> > -	depends on ARCH_MICROCHIP_POLARFIRE || COMPILE_TEST
> > -	default ARCH_MICROCHIP_POLARFIRE
> > +	depends on ARCH_MICROCHIP || COMPILE_TEST
> > +	default y
> >  	depends on MFD_SYSCON
> >  	select AUXILIARY_BUS
> >  	select COMMON_CLK_DIVIDER_REGMAP
>=20
> OK, I found v2 in my inbox. Same symptom here. It doesn't apply on top of
> the current at91-next either.

I think this should sort itself out after -rc1, but I'll resend if it
doesn't.

--SZ4voAMfwUKL6i6u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaTcSxwAKCRB4tDGHoIJi
0gVcAQDoPZftNez0ce9Cr5hdYrZWaD7QcZQW5iseNvgVStkiYgEAtL73tR0IcFyP
78nHFeNdr2XPy6pfdAdtCgcSvw7Ojg0=
=t3LO
-----END PGP SIGNATURE-----

--SZ4voAMfwUKL6i6u--
