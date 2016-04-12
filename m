Return-Path: <thierry.reding@gmail.com>
Return-Path: <thierry.reding@gmail.com>
Date: Tue, 12 Apr 2016 14:20:29 +0200
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
Subject: Re: [PATCH v5 05/46] pwm: introduce the pwm_args concept
Message-ID: <20160412122029.GO18882@ulmo.ba.sec>
References: <1459368249-13241-1-git-send-email-boris.brezillon@free-electrons.com>
 <1459368249-13241-6-git-send-email-boris.brezillon@free-electrons.com>
 <20160412113912.GK18882@ulmo.ba.sec>
 <20160412140412.42704302@bbrezillon>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7gLe/sNPhR777EPF"
In-Reply-To: <20160412140412.42704302@bbrezillon>
List-ID: <linux-clk.vger.kernel.org>


--7gLe/sNPhR777EPF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 12, 2016 at 02:04:12PM +0200, Boris Brezillon wrote:
> On Tue, 12 Apr 2016 13:39:12 +0200
> Thierry Reding <thierry.reding@gmail.com> wrote:
>=20
> > On Wed, Mar 30, 2016 at 10:03:28PM +0200, Boris Brezillon wrote:
> > > Currently the PWM core mixes the current PWM state with the per-platf=
orm
> > > reference config (specified through the PWM lookup table, DT definiti=
on or
> > > directly hardcoded in PWM drivers).
> > >=20
> > > Create a pwm_args struct to store this reference config, so that PWM =
users
> > > can differentiate the current config from the reference one.
> > >=20
> > > Patch all places where pwm->args should be initialized. We keep the
> > > pwm_set_polarity/period() calls until all PWM users are patched to
> > > use pwm_args instead of pwm_get_period/polarity().
> >=20
> > Perhaps a helper would be useful? Something like:
> >=20
> > 	static inline void
> > 	pwm_apply_args(struct pwm_device *pwm, const struct pwm_args *args)
> > 	{
> > 		pwm_set_duty_cycle(pwm, args->duty_cycle);
> > 		pwm_set_period(pwm, args->period);
> > 	}
> >=20
> > ? That would make it slightly easier to get rid of it again after all
> > clients have been converted.
>=20
> Sure. I'll add this helper.
>=20
> >=20
> > With the exception of pwm-clps711x all of these args are set at of_xlate
> > time (for DT) or from the lookup table in pwm_get() (for non-DT), so it
> > might even be possible to move this call to the core, so that removal of
> > it will be a one-liner.
>=20
> Not sure I get that one. Some drivers are implementing their own
> ->of_xlate() method, how would you get rid of this pwm_apply_args() in
> those custom implementations?

I was proposing to have pwm_apply_args() called from the core.
of_pwm_get() is where ->of_xlate() is called from, and the lookup table
arguments would be applied in pwm_get(). Taking into account clps711x,
which sets the arguments in ->request() it might be possible to simply
call pwm_apply_args() from pwm_device_request(), since that's also
called by all other request functions, even the legacy ones.

That said, the amount of code to modify isn't that large, so I'm fine if
you want to keep sprinkling the calls across multiple files, especially
since it's temporary.

Thierry

--7gLe/sNPhR777EPF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXDOgLAAoJEN0jrNd/PrOhOREQAIPk66lrbmHnUQErxZjFor5t
6qsDz+4y1kL9sUlQ12zZdqkj//AQLVoDEzh8NF2bfSZ+2MEmy3qyn46wV+off4WI
DGKPxsH30fpO6jZQimougBLGZETrEVjPhAU2AfN0sg05EhnouyTBkVEsIBHbOpYq
HtAO0WIGyCoLlfDnIoWysIJm8JI62F1CyqZ6xS4mxqCYyWnyZ1g7n8sQTQl5YI5h
VfZ8NizlFx1mipmj2SDTBPuyc3qE41Zk34DeqcA5TOM25+sqKa43vm4jd5YMn5sR
Gh7eOQt+vD8V8kZphD0y7HhPLfMTabQBtoXRLY5+3WIB6Freo69byvwKJMPhJ7J3
8hXD7D4jS0Dy6steC6RneZsdDIsP9IGppPdvTPHjb6WZp9jTzUeffvqFZ0nFPhGa
xin4DEpsqh+2yfwLce2zpbG2oETTsbKAaN6s8AsaUe47jhwO+2D4s69nKfMNC2EH
TdR1CIR8yVe14NjV/5tH2AU6CoD0SLBPaoopPmDByTC5l4CKIgcQWYqYHm2DdUqz
7gLxs1FSDZL5vn3FM92VGJ0WXmNQLQH+Sey067bm8vN/FKPKc6snfqvK1+5daVoO
W+RQYWeLkDQ7l79zU4WN9PFEnweVDvQ+0YwCPRJYEqRDhpEqH8ceh9wON+18ZY2t
769EkVNiN51a9zxJFpK5
=C5II
-----END PGP SIGNATURE-----

--7gLe/sNPhR777EPF--
