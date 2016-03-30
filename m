Return-Path: <broonie@sirena.org.uk>
Date: Wed, 30 Mar 2016 14:22:24 -0700
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
Message-ID: <20160330212224.GV2350@sirena.org.uk>
References: <1459368249-13241-1-git-send-email-boris.brezillon@free-electrons.com>
 <1459368249-13241-28-git-send-email-boris.brezillon@free-electrons.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+FNB8hLr74QeaOK6"
In-Reply-To: <1459368249-13241-28-git-send-email-boris.brezillon@free-electrons.com>
Subject: Re: [PATCH v5 27/46] regulator: pwm: adjust PWM config at probe time
List-ID: <linux-clk.vger.kernel.org>


--+FNB8hLr74QeaOK6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 30, 2016 at 10:03:50PM +0200, Boris Brezillon wrote:
> The PWM attached to a PWM regulator device might have been previously
> configured by the bootloader.
> Make sure the bootloader and linux config are in sync, and adjust the PWM
> config if that's not the case.

Acked-by: Mark Brown <broonie@kernel.org>

--+FNB8hLr74QeaOK6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJW/EOPAAoJECTWi3JdVIfQWWoH/2Twb+EMdVjxYbvoP9B+iqS8
GgeyI/BocMSlpDdLD5gxifkN8lrti5/ZXCVSiNqF/8Ji3W5L9hpDqYyyUCpaaxrj
VK+/waBde1BwNWf2NX4cKjG7JeMGz5I2NoQWye9xEueYXsYtwGQMOVJ9VPvyiJjH
xZcl00q0HkS2taXHetbfRmKuXFBK+/qS5oMU5L0BLeHYksH3dRhN2ffRdcqYBVpW
NYq42vcR0lNOeQxZYZVuljMgqOtXFEjyCj3cNvFngURtqPNH5P7xNdLvjdjFuF/T
dFcDhLQtTtG09EEbGHfrJxzqYZILnSRXA7fxPEm0bIMvg7R0azC3nUfrQXZdUZI=
=TtR5
-----END PGP SIGNATURE-----

--+FNB8hLr74QeaOK6--
