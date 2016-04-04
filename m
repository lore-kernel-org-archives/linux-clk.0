Return-Path: <thierry.reding@gmail.com>
Return-Path: <thierry.reding@gmail.com>
Date: Mon, 4 Apr 2016 17:30:29 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>, linux-pwm@vger.kernel.org,
	Mike Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
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
Subject: Re: [PATCH v5 34/46] clk: pwm: switch to the atomic API
Message-ID: <20160404153029.GC17856@ulmo>
References: <1459368249-13241-1-git-send-email-boris.brezillon@free-electrons.com>
 <1459368249-13241-35-git-send-email-boris.brezillon@free-electrons.com>
 <20160330220149.GU18567@codeaurora.org>
 <20160331085735.3574970b@bbrezillon>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ctP54qlpMx3WjD+/"
In-Reply-To: <20160331085735.3574970b@bbrezillon>
List-ID: <linux-clk.vger.kernel.org>


--ctP54qlpMx3WjD+/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 31, 2016 at 08:57:35AM +0200, Boris Brezillon wrote:
> Hi Stephen,
>=20
> On Wed, 30 Mar 2016 15:01:49 -0700
> Stephen Boyd <sboyd@codeaurora.org> wrote:
>=20
> > On 03/30, Boris Brezillon wrote:
> > > diff --git a/drivers/clk/clk-pwm.c b/drivers/clk/clk-pwm.c
> > > index ebcd738..49ec5b1 100644
> > > --- a/drivers/clk/clk-pwm.c
> > > +++ b/drivers/clk/clk-pwm.c
> > > @@ -28,15 +28,29 @@ static inline struct clk_pwm *to_clk_pwm(struct c=
lk_hw *hw)
> > >  static int clk_pwm_prepare(struct clk_hw *hw)
> > >  {
> > >  	struct clk_pwm *clk_pwm =3D to_clk_pwm(hw);
> > > +	struct pwm_state pstate;
> > > =20
> > > -	return pwm_enable(clk_pwm->pwm);
> > > +	pwm_get_state(clk_pwm->pwm, &pstate);
> > > +	if (pstate.enabled)
> > > +		return 0;
> > > +
> > > +	pstate.enabled =3D true;
> > > +
> > > +	return pwm_apply_state(clk_pwm->pwm, &pstate);
> >=20
> > This doesn't seem atomic anymore if we're checking the state and
> > then not calling apply_state if it's already enabled. But I
> > assume this doesn't matter because we "own" the pwm here?
>=20
> Yep. Actually it's not atomic in term of concurrency (maybe the
> 'atomic' word is not appropriate here). Atomicity is here referring to
> the fact that we're now providing all the PWM parameters in the same
> request instead of splitting it in pwm_config() + pwm_enable/disable()
> calls.

It's usually not possible to do really atomic updates with PWM hardware.
The idea is merely that we should be able to submit one request and the
framework (and drivers) will be responsible for making sure it is
applied as a whole or not at all. With the legacy API it is possible for
users to set the duty cycle and period, but then fail to enable/disable
the PWM.

pwm_apply_state() reporting success should indicate that the hardware
state is now what software wanted it to be. That kind of implies that
the application is serialized.

This doesn't imply that hardware state won't change between a call to
pwm_get_state() and pwm_apply_state(), though technically this is what
will usually happen because PWM devices are exclusively used by a single
user. Users are responsible for synchronizing accesses within their own
code.

> Concurrent accesses still have to be controlled by the PWM user (which
> is already the case for this driver, thanks to the locking
> infrastructure in the CCF).
>=20
> > Otherwise I would think this would be unconditional apply state
> > and duplicates would be ignored in the pwm framework.
> >=20
>=20
> Yep, I'll remove the if (pstate.enabled) branch.

Yes, it should be the PWM framework's job to check for changes in state
and discard no-ops.

Thierry

--ctP54qlpMx3WjD+/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXAoiUAAoJEN0jrNd/PrOh770QAL7A4P9FXDqUgGYy3Fh1Z0tC
W1sLVSxLFyxsC7iFVKWBqTGcTPdXVC5vQ7BJ/CViZxPN0zLRFE2XPIlLHbXfALGI
ioNodJFDMt7ZXy2vsiIUnhs1fQKD1xkulE0KmQE03GGX9U80wdw5eN6fTZ1WgoCj
x+vjcPFZ/FKpJ7krY6AC08Rj8EA9Ki8CDmy5BhqalWSJEqN3Wbj6XYmzJbBKUMQ9
I6UG9Zp+qrgz202OKeRNUdV2wn8ZbguomNCKC32Ue38uI1J2hp8bbyV363QQ3pSy
cIdiGfbZUfabQtSKDj/qqZ4C77yRigh4Aw70AJtC5cUkGzWH74IcVt9zBeI0k4ZY
qbJ5RnprnryDWVpvjB1kVW8mdqVjcd6IqK6YyvmqPG4ziaAo6Vjvpl2UaWmnu4NV
PcbYFAi8H8ySIUQnnvCYvZuJVbQ8szDkjrovYbnKcGF+7mcp8ltT81VJHG9FM0Y7
xULfQYeQeI8twq4v0Vjq7LzpMjCSeFlzVMS1aqUhmtIUJVDI8E+ZHcKV8+SsPel2
OAKBx6rcm/edT9r1OtIQmFaK7fPPaIStQPJBPf8RXxXta0+NmYn3nHsvFNO9CV0f
fsIYD3t6rCXMEzMkCT6gSTFDFex2ouabZ440jyFMqSFoZeePpKfNhHs/DrS5rU+K
VpRarTkMkp5A7DwPIDbk
=rj9Q
-----END PGP SIGNATURE-----

--ctP54qlpMx3WjD+/--
