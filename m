Return-Path: <thierry.reding@gmail.com>
Return-Path: <thierry.reding@gmail.com>
Date: Tue, 12 Apr 2016 13:49:04 +0200
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
Message-ID: <20160412114904.GM18882@ulmo.ba.sec>
References: <1459368249-13241-1-git-send-email-boris.brezillon@free-electrons.com>
 <1459368249-13241-16-git-send-email-boris.brezillon@free-electrons.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bPrm2PuLP7ysUh6c"
In-Reply-To: <1459368249-13241-16-git-send-email-boris.brezillon@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>


--bPrm2PuLP7ysUh6c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 30, 2016 at 10:03:38PM +0200, Boris Brezillon wrote:
> The PWM state, represented by its period, duty_cycle and polarity,
> is currently directly stored in the PWM device.
> Declare a pwm_state structure embedding those field so that we can later
> use this struct to atomically update all the PWM parameters at once.
>=20
> All pwm_get_xxx() helpers are now implemented as wrappers around
> pwm_get_state().
>=20
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> ---
>  drivers/pwm/core.c  |  8 ++++----
>  include/linux/pwm.h | 54 +++++++++++++++++++++++++++++++++++++++++------=
------
>  2 files changed, 46 insertions(+), 16 deletions(-)
>=20
> diff --git a/drivers/pwm/core.c b/drivers/pwm/core.c
> index 6433059..f3f91e7 100644
> --- a/drivers/pwm/core.c
> +++ b/drivers/pwm/core.c
> @@ -268,7 +268,7 @@ int pwmchip_add_with_polarity(struct pwm_chip *chip,
>  		pwm->chip =3D chip;
>  		pwm->pwm =3D chip->base + i;
>  		pwm->hwpwm =3D i;
> -		pwm->polarity =3D polarity;
> +		pwm->state.polarity =3D polarity;

Would this not more correctly be assigned to pwm->args.polarity? After
all this is setting up the "initial" state, much like DT or the lookup
tables would for duty cycle and period.

Thierry

--bPrm2PuLP7ysUh6c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXDOCwAAoJEN0jrNd/PrOhF68QAKrMJWoxnwNOpnE/XLaupLry
RUQQTeF+cQA1lO4lHfFVMv0XWggtYkblrnI3hvNeG+MBjKBnRHSj2JCruLITHkKw
cxWH6brZ6e7hB/0zSe/sBxlpzm9ujTSzkwVAJ0WnznqhuOU8fFYALw4tMLu37q8d
whp1cmw3lhaIvgtUJS1DeY0EKl5jBcI71045hZPPPuQ5dYUqj3n5l8MZha8FG0Rl
r9XoPzYk2gTXX/9CrEcluXzPF9hmkgOsHBPjZpIx7fb0dutR3GWSbdj1tS/jk4wt
Yu/co8aokTh/kkL5E+lh4c48FvLePfkDIyYqLUsX+LzvReixnyN4gy7neV3GJ7v6
6+QWZdqQN5GSiH82iYIKn7Ej2KTqPgOY1ZNP7i6C2cjLajKcVSNhmeCwYK53sRCa
YdGpxEqy5TRmtnaUu4kgVJjCRWzysk++1OZufUBl9E0AivAD/6z/4eXaPLYUafjN
Rz9vSozXE0kiyLVaZVx7EVlLIpygsb1kDZZJHCJAIa/MTltiIjfw2MPfVYKmK+jk
6n8Si072Aisr32K8Zj0k/djbTeYpIY1C1egGcPQaKef6xOs38FB/mJE66VeuYMvr
ImzlLDT6ISDX68KzUTBEJMy0hmpcA9V2tnIzFthzxHaToUG/tkMbby8scysoQxxP
flcXc/+fg+cX8lgFJkKR
=SGvk
-----END PGP SIGNATURE-----

--bPrm2PuLP7ysUh6c--
