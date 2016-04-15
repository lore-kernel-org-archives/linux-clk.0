Return-Path: <broonie@sirena.org.uk>
Date: Fri, 15 Apr 2016 07:54:23 +0100
From: Mark Brown <broonie@kernel.org>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, linux-pwm@vger.kernel.org,
	Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
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
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Hartley Sweeten <hsweeten@visionengravers.com>,
	Ryan Mallon <rmallon@gmail.com>,
	Alexander Shiyan <shc_work@mail.ru>, Milo Kim <milo.kim@ti.com>,
	Doug Anderson <dianders@google.com>,
	Caesar Wang <wxt@rock-chips.com>,
	Stephen Barber <smbarber@chromium.org>
Message-ID: <20160415065423.GA3217@sirena.org.uk>
References: <1460661464-11216-1-git-send-email-boris.brezillon@free-electrons.com>
 <1460661464-11216-8-git-send-email-boris.brezillon@free-electrons.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="WIyZ46R2i8wDzkSu"
In-Reply-To: <1460661464-11216-8-git-send-email-boris.brezillon@free-electrons.com>
Subject: Re: [PATCH v5 07/24] regulator: pwm: use pwm_get_args() where
 appropriate
List-ID: <linux-clk.vger.kernel.org>


--WIyZ46R2i8wDzkSu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 14, 2016 at 09:17:27PM +0200, Boris Brezillon wrote:
> The PWM framework has clarified the concept of reference PWM config
> (the platform dependent config retrieved from the DT or the PWM
> lookup table) and real PWM state.

Acked-by: Mark Brown <broonie@kernel.org>

--WIyZ46R2i8wDzkSu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXEJAeAAoJECTWi3JdVIfQhesH/j5qysMtUM7juetg1a9iQOtA
YVlbntwpGuluvdw4m2RGmZdCqf8YA86HsLKSyjEGOSlGAtvA27i91X7YC8pqPwLO
rQoTKlxjWo0VU7/NQ6CLu5xu+N8/+hGjXKq0aPRwjYFGjQkvB7Zuds/fbv6M9/G0
5VKsZ/1GjGM0/VVTcpdtNqPmYSy+qO1bJcspJiG3TFYVpAJj96n5GSIGFWgM2WzZ
d/xtM+XRmWwrH1ki+qWGGWiNCKzWfAlS5B1ApapKK5isa96QRyb3vjldnZLXYV1l
M3+0mh5F/9+lFc0Oz/LS/6wVyrF67PGVNgrk5PmsWpNuyZ541CbKaRmx3FVzC1w=
=sjtw
-----END PGP SIGNATURE-----

--WIyZ46R2i8wDzkSu--
