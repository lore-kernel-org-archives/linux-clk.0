Return-Path: <thierry.reding@gmail.com>
Return-Path: <thierry.reding@gmail.com>
Date: Mon, 4 Apr 2016 17:34:33 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-pwm@vger.kernel.org,
	Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Kamil Debski <k.debski@samsung.com>, lm-sensors@lm-sensors.org,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>, linux-input@vger.kernel.org,
	Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>,
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
Subject: Re: [PATCH v5 36/46] input: misc: max77693: switch to the atomic API
Message-ID: <20160404153433.GD17856@ulmo>
References: <1459368249-13241-1-git-send-email-boris.brezillon@free-electrons.com>
 <1459368249-13241-37-git-send-email-boris.brezillon@free-electrons.com>
 <20160331174801.GC39098@dtor-ws>
 <20160331205718.057a6f38@bbrezillon>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8w3uRX/HFJGApMzv"
In-Reply-To: <20160331205718.057a6f38@bbrezillon>
List-ID: <linux-clk.vger.kernel.org>


--8w3uRX/HFJGApMzv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 31, 2016 at 08:57:18PM +0200, Boris Brezillon wrote:
> On Thu, 31 Mar 2016 10:48:01 -0700
> Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
>=20
> > Hi Boris,
> >=20
> > On Wed, Mar 30, 2016 at 10:03:59PM +0200, Boris Brezillon wrote:
> > > pwm_config/enable/disable() have been deprecated and should be replac=
ed
> > > by pwm_apply_state().
> > >=20
> > > Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> > > ---
> > >  drivers/input/misc/max77693-haptic.c | 23 +++++++++++++++++------
> > >  1 file changed, 17 insertions(+), 6 deletions(-)
> > >=20
> > > diff --git a/drivers/input/misc/max77693-haptic.c b/drivers/input/mis=
c/max77693-haptic.c
> > > index cf6aac0..aef7dc4 100644
> > > --- a/drivers/input/misc/max77693-haptic.c
> > > +++ b/drivers/input/misc/max77693-haptic.c
> > > @@ -70,13 +70,16 @@ struct max77693_haptic {
> > > =20
> > >  static int max77693_haptic_set_duty_cycle(struct max77693_haptic *ha=
ptic)
> > >  {
> > > +	struct pwm_state pstate;
> > >  	struct pwm_args pargs =3D { };
> > > -	int delta;
> > >  	int error;
> > > =20
> > >  	pwm_get_args(haptic->pwm_dev, &pargs);
> > > -	delta =3D (pargs.period + haptic->pwm_duty) / 2;
> > > -	error =3D pwm_config(haptic->pwm_dev, delta, pargs.period);
> > > +	pwm_get_state(haptic->pwm_dev, &pstate);
> > > +
> > > +	pstate.period =3D pargs.period;
> > > +	pstate.duty_cycle =3D (pargs.period + haptic->pwm_duty) / 2;
> > > +	error =3D pwm_apply_state(haptic->pwm_dev, &pstate);
> >=20
> > This does not make sense with regard to the atomic API. If you look in
> > max77693_haptic_play_work(), right after calling
> > max77693_haptic_set_duty_cycle() we either try to enable or disable the
> > pwm. When switching to this new API we should combine both actions.
>=20
> True. I'll address that, unless Thierry is fine keeping the non-atomic
> API, in which case I'll just drop patches 32 to 46.

I'm fine with keeping the pwm_enable(), pwm_disable() and pwm_config()
APIs, but they should only be used as shortcuts. Where possible the new
atomic API should be used to combine multiple operations into one.

Thierry

--8w3uRX/HFJGApMzv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXAomJAAoJEN0jrNd/PrOhH+EP/3jGqBaPwMU4xFzqvHz67ECo
BWRC6Xmjcjj3cLylcB4IeIBaTRxiGF8rf61/1tooFEr49b285hU5/V5ndhjk6HDm
v7YjqNjFjWkHJvEGhUyf4iCNCw9rtGdDvYwz0tI6bBnMS8Ll6ZaMSTA8UkfiKUiv
nCHUFyzrvYm7QmMn+Wr7IgyhhiK0LO4eqQk5LY4aP1qMFSnknAv+VXPKFH1pWJ3d
BMo6SW2l31oC7kEKTM7BscdEbOdTBlSC5sCdff0QjKYWevyjmPcYZJtYqZw9dD14
rdKL0aXHjeh3PWKMeXYk0rkiCpR4o7bvFn0BSUpQwNCLQYaHLfFFKqqWFiUWa+cF
JFJJhMpUMeqfmfqGu6KQ3BY7ThzpGFkEGPgrXVIve2sPTUwccwWls0ZPTWtF2F7L
ED7EvnCnYMEFfzyrav/vLIDz6vKhR5MLjXiTKanuwDEpx3zEG0W44IbA+8JxvNAO
zfOnAByBx47TLUdHIZqSBtnLRrxQrAh91VrMJaDHqfTn+eJFDxOuVoQ1E2reKqCk
OF0Ljt6VvQSKpzslj/2lf/dY4Iap40xf7avutbDW6Y9LF0LFgayiAQ5uRD7Bam6N
vEfMdfObS6YYpx9Dr1uvVEoAYVDH9CETQISWNWYwyUNW0LhSfanIAhkaIpUpsYbQ
00YdDc4WqABZU72XaLSG
=oCBS
-----END PGP SIGNATURE-----

--8w3uRX/HFJGApMzv--
