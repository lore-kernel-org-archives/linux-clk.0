Return-Path: <broonie@sirena.org.uk>
Date: Wed, 27 Apr 2016 14:50:48 +0100
From: Mark Brown <broonie@kernel.org>
To: Wadim Egorov <w.egorov@phytec.de>
Cc: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org, mark.rutland@arm.com,
	devicetree@vger.kernel.org, a.zummo@towertech.it,
	pawel.moll@arm.com, rtc-linux@googlegroups.com,
	ijc+devicetree@hellion.org.uk, mturquette@baylibre.com,
	sboyd@codeaurora.org, linux-kernel@vger.kernel.org,
	robh+dt@kernel.org, lgirdwood@gmail.com,
	alexandre.belloni@free-electrons.com, dianders@chromium.org,
	galak@codeaurora.org, zyw@rock-chips.com, lee.jones@linaro.org,
	linux-clk@vger.kernel.org
Message-ID: <20160427135048.GQ3217@sirena.org.uk>
References: <E1aukkg-0007km-6s@debutante>
 <2754883.PYP7KbpM33@diego>
 <57205DC2.7070506@phytec.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="lC5mtDCkBY9vM1au"
In-Reply-To: <57205DC2.7070506@phytec.de>
Subject: Re: Applied "regulator: rk808: remove linear range definitions with
 a single range" to the regulator tree
List-ID: <linux-clk.vger.kernel.org>


--lC5mtDCkBY9vM1au
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 27, 2016 at 08:35:46AM +0200, Wadim Egorov wrote:
> On 26.04.2016 21:33, Heiko St=FCbner wrote:

> > with this patch applied, 4.6.0-rc5-next-20160426 fails to boot on=20
> > rk3288-veyron devices with the bug below. Reverting this one patch
> > results in the system booting again:

> This is because I missed to add the correct ops for LDO_REG3 in this patc=
h.

Any ETA on a fix or should I revert?

--lC5mtDCkBY9vM1au
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXIMO3AAoJECTWi3JdVIfQP58H/RIYe7XJNA5kA1cOquaaWbau
mPhq2KRpFNvY3jYlkmYkJ4kIDJogO1Ma0XjzCYqijsWQSDTRCoJGKX7cWpoWgNai
FJ8xeSP2aY6ma9Slc61DTFhg0XcPaj7DdORfwb9eMCnSa2anMcba7L14kpfV7JSN
tdxN/xe6xACfrs0P60m0CaIrPXxyfHY3Yr8tu1qOxE/IeOmVVDockzXT9pbiWui4
mftziiHYq0Gm1W6V4JcPw24h89rMyTyY2R5qPiqz0ASODqg76W/Ap/wlJ7lSzGKS
I5/hkegCu81rl4MWRNJ+HVe+9XPILq+289VcEgLULRPE76q18aXuofsDHShXHvE=
=eQgw
-----END PGP SIGNATURE-----

--lC5mtDCkBY9vM1au--
