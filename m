Return-Path: <thierry.reding@gmail.com>
Return-Path: <thierry.reding@gmail.com>
Date: Tue, 12 Apr 2016 13:51:55 +0200
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
Subject: Re: [PATCH v5 16/46] pwm: move the enabled/disabled info into
 pwm_state
Message-ID: <20160412115155.GN18882@ulmo.ba.sec>
References: <1459368249-13241-1-git-send-email-boris.brezillon@free-electrons.com>
 <1459368249-13241-17-git-send-email-boris.brezillon@free-electrons.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ztcJpsdPpsnnlAp8"
In-Reply-To: <1459368249-13241-17-git-send-email-boris.brezillon@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>


--ztcJpsdPpsnnlAp8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 30, 2016 at 10:03:39PM +0200, Boris Brezillon wrote:
[...]
> @@ -145,7 +146,11 @@ static inline void pwm_get_state(const struct pwm_de=
vice *pwm,
> =20
>  static inline bool pwm_is_enabled(const struct pwm_device *pwm)
>  {
> -	return test_bit(PWMF_ENABLED, &pwm->flags);
> +	struct pwm_state pstate;

No need for the p prefix, in my opinion.

Thierry

--ztcJpsdPpsnnlAp8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXDOFbAAoJEN0jrNd/PrOhsToP/1uhEhMZpq9YKlTiLiibDzYV
zrFHNUSyfTcQw558pV4nyn6M+I2lfMYSEEsAhcxQQbZBY1adaijQfv3lnwQiBQ8C
4D6KR/Y8fT/r0/JXx4MuXPHx4D0/CSobFXiv2Oi3FGGG4ZvsGunkVxXq/Sad0EQp
xFE1wUzT0zSYZNP3eoeP35kgVo5431m0eSgNxaqbPM8qEkX8iuwz/GZncEymJeO5
1P1teQy9lo48s6DkT1M4NEIKGgWH0EU4J14DYYO3h+aQ+mkalX11ZZTlhxr5drli
tGM/QhY/TRD3Rc9CEO5d9Fxu6Xn90GsG1oEwg64tDafO/9372A6tFTzYvCMqnYqf
6ezYLCrdWu2r2IIjYaeXzUnEyBcoRkNg1qNa0Vk6TbpehsWFNIYrTAejTKCXQqwB
sPqYwe6xpNCbsTckkxJPpSnvZfFe57rOIxDxO1ZWNW6Bn1ZjDwsU0TauRxxlTr83
BwcGdrySQVgLuhw0pqu4xuQVd5bRI8SB0S9NJXfkR9KLaTI/ZsIB556GZbAsIVbh
2aLkvqvOTNqIKUFV10p+lsH8aYEOreyXRLgjtGorSdViYLy3dzmjhtHD5yUy4K7X
7mY6B5GLv6D3o1N0dfaiz5CWYZ9RDmdFwcSxq2KP9jrZT8HRSO9is2lsDjEbA6nv
1xjYbH/4MybBBst/ECXX
=af3Z
-----END PGP SIGNATURE-----

--ztcJpsdPpsnnlAp8--
