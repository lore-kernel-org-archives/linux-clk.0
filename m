Return-Path: <thierry.reding@gmail.com>
Return-Path: <thierry.reding@gmail.com>
Date: Tue, 12 Apr 2016 14:21:41 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-pwm@vger.kernel.org, Mike Turquette <mturquette@baylibre.com>,
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
	Jingoo Han <jingoohan1@gmail.com>, Lee Jones <lee.jones@linaro.org>,
	linux-fbdev@vger.kernel.org,
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
Subject: Re: [PATCH v5 15/46] pwm: introduce the pwm_state concept
Message-ID: <20160412122141.GP18882@ulmo.ba.sec>
References: <1459368249-13241-1-git-send-email-boris.brezillon@free-electrons.com>
 <1459368249-13241-16-git-send-email-boris.brezillon@free-electrons.com>
 <20160412114904.GM18882@ulmo.ba.sec>
 <20160412141718.5fe4cf24@bbrezillon>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6sj9mcRtP+pTWLOo"
In-Reply-To: <20160412141718.5fe4cf24@bbrezillon>
List-ID: <linux-clk.vger.kernel.org>


--6sj9mcRtP+pTWLOo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 12, 2016 at 02:17:18PM +0200, Boris Brezillon wrote:
> On Tue, 12 Apr 2016 13:49:04 +0200
> Thierry Reding <thierry.reding@gmail.com> wrote:
>=20
> > On Wed, Mar 30, 2016 at 10:03:38PM +0200, Boris Brezillon wrote:
> > > The PWM state, represented by its period, duty_cycle and polarity,
> > > is currently directly stored in the PWM device.
> > > Declare a pwm_state structure embedding those field so that we can la=
ter
> > > use this struct to atomically update all the PWM parameters at once.
> > >=20
> > > All pwm_get_xxx() helpers are now implemented as wrappers around
> > > pwm_get_state().
> > >=20
> > > Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> > > ---
> > >  drivers/pwm/core.c  |  8 ++++----
> > >  include/linux/pwm.h | 54 +++++++++++++++++++++++++++++++++++++++++--=
----------
> > >  2 files changed, 46 insertions(+), 16 deletions(-)
> > >=20
> > > diff --git a/drivers/pwm/core.c b/drivers/pwm/core.c
> > > index 6433059..f3f91e7 100644
> > > --- a/drivers/pwm/core.c
> > > +++ b/drivers/pwm/core.c
> > > @@ -268,7 +268,7 @@ int pwmchip_add_with_polarity(struct pwm_chip *ch=
ip,
> > >  		pwm->chip =3D chip;
> > >  		pwm->pwm =3D chip->base + i;
> > >  		pwm->hwpwm =3D i;
> > > -		pwm->polarity =3D polarity;
> > > +		pwm->state.polarity =3D polarity;
> >=20
> > Would this not more correctly be assigned to pwm->args.polarity? After
> > all this is setting up the "initial" state, much like DT or the lookup
> > tables would for duty cycle and period.
>=20
> Yes, I wasn't sure about the pwm_add_with_polarity() meaning. To me,
> all the reference info should be extracted from DT, PWM lookup table or
> driver specific ->request() implementation, but I can definitely
> initialize the args.polarity here too.
>=20
> Should I keep the pwm->state.polarity assignment (to set the initial
> polarity when the driver does not support hardware readout)?

Wouldn't this work automatically as part of the pwm_apply_args() helper
if we extended it with this setting?

Thierry

--6sj9mcRtP+pTWLOo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXDOhVAAoJEN0jrNd/PrOhhwkQAJV2017vhS1DAf1uCVQWtngM
JY9NrWrvCeS1qLmCzic1jLPGRxoGl6Nh2TaVItVM8Ovr4/rPTOFpWSyrYNy/2mHv
FYQ/nEDzm9bjKLv5fbROW74egNBVvvBd1mxan7RVMuwR7aLjZa3mQv85cLTtNjIU
+bo4YMRkt4yW27zssHFcWg4TDBgRfbeOOKhgH6h8FujmeUiC7Vlom/hZVLpCx45H
r90GeIp3xv8vHIqUpT4/bf+8UvTVVJsczUPIZ+9QnLPRMNAbyZZUrlJLXCJnVEDB
1xcxM9LGD3Kzr9BgxlA1POS0O3Jya46fhnMoSJOc04DSlYPnMPEHY5Qu6EpMhn58
wZPYdEcUZQwXqzV8x8Hn7HMdK21B78nF22D0u7/dcdpKNMWIaBfrNrNUNYgvnK3n
HggfcpID6gTiuELb+aog3SxjN9ODf7WCxIWKHyJMRW9KYBn1WKpfH7PLKtw+ZTG+
u7/mx38Y4K6Az2XsZtgAN/x798xF45xcZfhEGhm4Y1DGkHItHcEsbrijfUOzxMFv
rQmKT7H8x72UOwxEC4B+gWG+omzSxrzX9MDDIfsLvLxVALlOiAjFY8rrDkvSrcP0
Xh44M11vHHNQUQh9zvj2KXvZicjziq79CjvcUc3WmbbDgZU29eU+EU0sQa2xmPfj
rBYFeFrNy3eyoIu2jFyI
=J8+t
-----END PGP SIGNATURE-----

--6sj9mcRtP+pTWLOo--
