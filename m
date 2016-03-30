Return-Path: <broonie@sirena.org.uk>
Date: Wed, 30 Mar 2016 14:23:04 -0700
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
	David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Hartley Sweeten <hsweeten@visionengravers.com>,
	Ryan Mallon <rmallon@gmail.com>,
	Alexander Shiyan <shc_work@mail.ru>, Milo Kim <milo.kim@ti.com>
Message-ID: <20160330212304.GW2350@sirena.org.uk>
References: <1459368249-13241-1-git-send-email-boris.brezillon@free-electrons.com>
 <1459368249-13241-29-git-send-email-boris.brezillon@free-electrons.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="s3puAW9DMBtS2ARW"
In-Reply-To: <1459368249-13241-29-git-send-email-boris.brezillon@free-electrons.com>
Subject: Re: [PATCH v5 28/46] regulator: pwm: swith to the atomic PWM API
List-ID: <linux-clk.vger.kernel.org>


--s3puAW9DMBtS2ARW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 30, 2016 at 10:03:51PM +0200, Boris Brezillon wrote:
> pwm_config/enable/disable() have been deprecated in favor of
> pwm_apply_state().
> Replace all those calls with the equivalent pwm_get/apply_state().

Acked-by: Mark Brown <broonie@kernel.org>

--s3puAW9DMBtS2ARW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJW/EOzAAoJECTWi3JdVIfQ+k8H/0AJ6dz8O64HpBcKpVdlzTjm
XadmMu/4rogd7PPyfk9L6YU6L4pdMMxPaO/LURz/OTOb4L3uzeDXmidHCXV10oka
2lwnEmngQ5LZHQo/+jcNDdljpG1RYYT8RI7Zoy/tLx5wrtHIajyx7nui1snwgvYA
ggbi93H4s/KC+jTcG6b1RxxApC+Dv56xEyAlNVw1t+YIHuM4KGOA/aoLy3+60Hp/
d70O6IlMh53v4SvFMDjG4pCLKc5mA/dCninOcrqMbjA7NXcqnNgDJLnHuuJQNOLM
8MKUHRy64dGTGrE1T/Ybq0oE8RyntPT/ANNlV4Or6Lbv+cLWuT4GAErGrExQxFM=
=CoDU
-----END PGP SIGNATURE-----

--s3puAW9DMBtS2ARW--
