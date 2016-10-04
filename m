Return-Path: <broonie@sirena.org.uk>
Date: Tue, 4 Oct 2016 04:40:55 +0200
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Lee Jones <lee.jones@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@free-electrons.com>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	rtc-linux@googlegroups.com
Message-ID: <20161004024055.4kdjvoiig4fwxi54@sirena.org.uk>
References: <1475441897-15730-1-git-send-email-krzk@kernel.org>
 <1475441897-15730-3-git-send-email-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="giaj4hhin6z2jwxx"
In-Reply-To: <1475441897-15730-3-git-send-email-krzk@kernel.org>
Subject: Re: [PATCH 2/4] regulator: Enable compile testing for Maxim and
 Samsung PMIC drivers
List-ID: <linux-clk.vger.kernel.org>


--giaj4hhin6z2jwxx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Oct 02, 2016 at 10:58:15PM +0200, Krzysztof Kozlowski wrote:
> Most of Maxim and Samsung PMIC/MUIC regulator drivers can be compile
> tested to increase build coverage.

All these drivers already just depend on the MFDs which don't have any
weird architecture dependencies - the main goal with COMPILE_TEST is
usually to eliminate dependencies which just can't be selected so they
can be built at all.  Given that there's no easy way to select
everything in a subsystem otherwise does this buy us a lot?

--giaj4hhin6z2jwxx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAABCAAGBQJX8xayAAoJECTWi3JdVIfQnv0H/0zexfPE1tSdzJJaf8Aveugm
1iNs9WQYjg6ETfvh5UfeNS3uPHbkShrfjOhJkOvpTmwwvjLvc0jTWrgS9JqBM5r4
t5ONQbZElteES3tuzIKZr6nAjJbT9ZEZ3j2eJeW3J4ygFdF76d6HQP+2SMbsckNP
6D5xQZWWTD1/NodfRaZnOC34XxrirFgu3lp0BUPdDE5lGPefq+wiqvK1YShaKIuL
UUriZ9ILjX1BO4BzyCjZVDT7BWxyvq4jLJXf5yW5I5Nx23FbUhCmBPSh8tB1/RWx
+hIPVaXHtaWEDECbsMfZsHcFmvrmtnuHTZjGfjbldKlr6UQ64uXqewwoLl94tD4=
=qBzW
-----END PGP SIGNATURE-----

--giaj4hhin6z2jwxx--
