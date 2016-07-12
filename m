Return-Path: <broonie@sirena.org.uk>
Date: Tue, 12 Jul 2016 09:22:56 +0100
From: Mark Brown <broonie@kernel.org>
To: Andi Shyti <andi.shyti@samsung.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Kukjin Kim <kgene@kernel.org>,
	Krzysztof Kozlowski <k.kozlowski@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Jaehoon Chung <jh80.chung@samsung.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-spi@vger.kernel.org,
	Andi Shyti <andi@etezian.org>
Message-ID: <20160712082256.GD9976@sirena.org.uk>
References: <57837606.8050906@samsung.com>
 <1468306444-18512-1-git-send-email-andi.shyti@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZARJHfwaSJQLOEUz"
In-Reply-To: <1468306444-18512-1-git-send-email-andi.shyti@samsung.com>
Subject: Re: [PATCH v3 6/7] spi: s3c64xx: restore removed comments
List-ID: <linux-clk.vger.kernel.org>


--ZARJHfwaSJQLOEUz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 12, 2016 at 03:54:04PM +0900, Andi Shyti wrote:
> Patch a9e93e8 has erroneously removed some comments which are
> important to understand why the bus frequency is multiplied by
> two during the spi transfer.

Please don't bury patches in the middle of old threads, it makes it very
confusing trying to figure out what's going on especially when you do
this one patch at a time in a series.  Submit new patches as a complete
series, ideally not threaded in with anything else (at least for me).

--ZARJHfwaSJQLOEUz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXhKjfAAoJECTWi3JdVIfQSQ8H/imKcL5X9zL3/qnSek1oyoD8
Zdq2JKr2OiJ57H7NtoTFcZqHfEdSFgXqNVumGTeA0Nzpn04PT1UsMzcS/xjwt2l8
c52YhqCZx7JCOPwPY9/IOtVa5B2OkE6HH7pzPVtFyJY5LbswpPCpzXYomjig5Yxq
f2og8S1BvMX31EiIJQCN2CY1O1OQV6gOMR866l9I2ii4G1Ji47hOsWUGBUJ25ick
1dhKP48XFPNs1fkTkdzPmAIyw4qVEG6Hv0qNDH+RPIKe2cW/rZQixLOLlcHIzmzo
eX3mFgUeEjfgnr8FDDtsC1nUxQKxFR5zwSyFK7LabRtsxM2mqQr2eJ3zWDNr698=
=sadm
-----END PGP SIGNATURE-----

--ZARJHfwaSJQLOEUz--
