Return-Path: <maxime.ripard@free-electrons.com>
Date: Thu, 4 Jan 2018 16:50:20 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Jernej Skrabec <jernej.skrabec@siol.net>
Cc: airlied@linux.ie, robh+dt@kernel.org, mark.rutland@arm.com,
	wens@csie.org, architt@codeaurora.org, a.hajda@samsung.com,
	Laurent.pinchart@ideasonboard.com, mturquette@baylibre.com,
	sboyd@codeaurora.org, Jose.Abreu@synopsys.com,
	narmstrong@baylibre.com, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-sunxi@googlegroups.com
Subject: Re: [PATCH 07/11] drm/sun4i: Add support for A83T second TCON
Message-ID: <20180104155020.feximenjndl6vmpd@flea.lan>
References: <20171230210203.24115-1-jernej.skrabec@siol.net>
 <20171230210203.24115-8-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4y6vlbvte4j2niaz"
In-Reply-To: <20171230210203.24115-8-jernej.skrabec@siol.net>
List-ID: <linux-clk.vger.kernel.org>


--4y6vlbvte4j2niaz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Dec 30, 2017 at 10:01:59PM +0100, Jernej Skrabec wrote:
> This TCON doesn't have channel 0, so quirk has_channel_0 is added in the
> process.
>=20
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>

Ideally, this should be split in two patches, one to add the new flag,
and one to add the support for the A83t TCON-TV.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--4y6vlbvte4j2niaz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlpOTTwACgkQ0rTAlCFN
r3TdpA/+PXHq485cr3FPBAJwoj6MMsvTa6JleC6BDCBSOp9REq9nhnLDZpA8gqe6
exZK7/z8chWnowfIcdDfzGkhbzVAsR0VEmft+LoKFeVMEbPb9jGqgPvkaccdKQ28
7qKZtLRtHzmB6kIEqYGx4mlgOJZMVVu42UMACgqJgbFnB6WUpv8UuujewUc0eW8B
GIu/2eZ/j69vqIyHuzBkyNB/d1ez2v603WqpIa2v/ktRZ23BdrCrDuT9V5KeLzNt
z7nU/GOavQUxD7ljcBKYtEEjvQFWkz159KZ6kzUiIolBxWVMGcoLRthFnq7Bwg88
WDaRKAw27+K2vbW9pu4vn42X97WIFD6URh/WrY7QpRrhtLT/WBIfY3K/EcFBN0TB
EJS8gMYPuG+5EgLhNGNPDAhodIbKSyFdE29MqMf3h0qd3dboo1Ed5TV1SVyVMn6s
+JZAmkHVi+k/2aRGVTiqFaam8ADhdGoU3lhijxlGrGozrb8/llbECzv3Qgc3J4bM
lElsKf9CrjWoJ9hloIiYYN9PCO9ivxnSxonj0T2LDDdBV0pmifOYz6eWeCtid7MM
y2TmKYVOcZHUqoq22oxJnWAOdaXV+INBu13xrvpR+y0od0Aqkll3vZw6GLIavT/O
bBSb3LxlfFAp170yP2y4o44ME/N+gpUx2kLgGuVwd5rF0a0QtFY=
=qJ6H
-----END PGP SIGNATURE-----

--4y6vlbvte4j2niaz--
