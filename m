Return-Path: <thierry.reding@gmail.com>
Return-Path: <thierry.reding@gmail.com>
Date: Tue, 12 Apr 2016 16:25:09 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Lee Jones <lee.jones@linaro.org>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
	linux-pwm@vger.kernel.org, Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Kamil Debski <k.debski@samsung.com>, lm-sensors@lm-sensors.org,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org, Bryan Wu <cooloney@gmail.com>,
	Richard Purdie <rpurdie@rpsys.net>,
	Jacek Anaszewski <j.anaszewski@samsung.com>,
	linux-leds@vger.kernel.org,
	Maxime Ripard <maxime.ripard@free-electrons.com>,
	Chen-Yu Tsai <wens@csie.org>, linux-sunxi@googlegroups.com,
	Joachim Eastwood <manabian@gmail.com>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org,
	Jingoo Han <jingoohan1@gmail.com>, linux-fbdev@vger.kernel.org,
	Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>,
	Tomi Valkeinen <tomi.valkeinen@ti.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Alexandre Belloni <alexandre.belloni@free-electrons.com>,
	Kukjin Kim <kgene@kernel.org>,
	Krzysztof Kozlowski <k.kozlowski@samsung.com>,
	linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
	Daniel Vetter <daniel.vetter@intel.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
	David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Hartley Sweeten <hsweeten@visionengravers.com>,
	Ryan Mallon <rmallon@gmail.com>,
	Alexander Shiyan <shc_work@mail.ru>, Milo Kim <milo.kim@ti.com>
Subject: Re: [PATCH v5 02/46] backlight: pwm_bl: remove useless call to
 pwm_set_period()
Message-ID: <20160412142509.GA25006@ulmo.ba.sec>
References: <1459368249-13241-1-git-send-email-boris.brezillon@free-electrons.com>
 <1459368249-13241-3-git-send-email-boris.brezillon@free-electrons.com>
 <20160412110350.GH18882@ulmo.ba.sec>
 <20160412141653.GJ8094@x1>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="d6Gm4EdcadzBjdND"
In-Reply-To: <20160412141653.GJ8094@x1>
List-ID: <linux-clk.vger.kernel.org>


--d6Gm4EdcadzBjdND
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 12, 2016 at 03:16:53PM +0100, Lee Jones wrote:
> On Tue, 12 Apr 2016, Thierry Reding wrote:
>=20
> > On Wed, Mar 30, 2016 at 10:03:25PM +0200, Boris Brezillon wrote:
> > > The PWM period will be set when calling pwm_config. Remove this usele=
ss
> > > call to pwm_set_period(), which might mess up with the internal PWM s=
tate.
> > >=20
> > > Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> > > Acked-by: Lee Jones <lee.jones@linaro.org>
> > > ---
> > >  drivers/video/backlight/pwm_bl.c | 4 +---
> > >  1 file changed, 1 insertion(+), 3 deletions(-)
> >=20
> > Applied, thanks.
>=20
> Applied?

You Acked it, so I assumed you were fine with me taking it through the
PWM tree to take care of the dependencies.

Did I assume wrongly?

Thierry

--d6Gm4EdcadzBjdND
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXDQVCAAoJEN0jrNd/PrOhO+sQAIcwHY4cYUR6sTtIxCo+Uou4
i+Kuc1PlVOg+nbjWKFt5fFgMPE0F7MLYXS7CqwOMZ0iPyR+9kuWXJG+TxjbQiQGv
HpSirq5pUiCGPfRaHrLmdSWa4U5T1iKEAuh3Vld8czk49n3Dnj1fUVI80QkxRx2G
4JoNuACtNWMlJyJ1ZkAoka4GDT7OebN1BTOSotPNAArUoQpQubKm7HEcycreqkCK
F7btmSUexRfEloxATYnAuqaMRnSur/WA4FgTeDenIsZnQf4fHEtYe4wou3yCfJCm
ESKcjFc/knCBWrCswm5jI1kRrk4I5O7Me1rEeRWWQdf1x5IVKRZyq68PA2o74LgD
em16YvdYaaM2jMjiJ4TDueo6g97UC9mHKTLM6dTtqgdaodJWtu2FHXya37oda7nx
wsfpK8KUdguLkt6cJqptQx4KYdACm5QFDYW+vJyeL12QSisXmZ8sxKFGPO/dxb/t
YIw3W4WniASa4pBx6ZrOCTIJOqMv2eZqbJW3XjK+XpLv8o7zYovXYL+CgXPXCwXW
ZrQsJrqK9Uaz20U4+7NFDX5F1d2PyIJYiZ7XrGxFlk2e59maGpQg7Z/Nbra7L/ui
asd0pSLdkFDghkrSgmQvHF4yek/09FNNSTpoDa3MBifUEwfdy1MONB1orHaN+6n1
9KLxLpBo4dslwwYODbl/
=JTlp
-----END PGP SIGNATURE-----

--d6Gm4EdcadzBjdND--
