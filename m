Return-Path: <broonie@sirena.org.uk>
Date: Tue, 12 Apr 2016 05:42:03 +0100
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
	Alexander Shiyan <shc_work@mail.ru>, Milo Kim <milo.kim@ti.com>,
	Stephen Barber <smbarber@chromium.org>
Message-ID: <20160412044203.GW3351@sirena.org.uk>
References: <1459368249-13241-1-git-send-email-boris.brezillon@free-electrons.com>
 <1459368249-13241-31-git-send-email-boris.brezillon@free-electrons.com>
 <20160330212410.GX2350@sirena.org.uk>
 <20160407235431.788dc24a@bbrezillon>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xsILJLaVOAbiPmXa"
In-Reply-To: <20160407235431.788dc24a@bbrezillon>
Subject: Re: [PATCH v5 30/46] regulator: pwm: retrieve correct voltage
List-ID: <linux-clk.vger.kernel.org>


--xsILJLaVOAbiPmXa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 07, 2016 at 11:54:31PM +0200, Boris Brezillon wrote:

> Is there any reason for calling set_machine_constraints() after
> device_register() in regulator_register()?

I'm not sure there's a strong one, we don't really use the class device
for anything, but without doing a full audit I couldn't guarantee that.

--xsILJLaVOAbiPmXa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXDHyaAAoJECTWi3JdVIfQ6DgH/2y6DxyL0olPRjq8kiN0Mw6a
b3LLXd3ddx4NsYasp/3lDQK53ChTu4nF8prj70B5jGVh8vBk73k8kOHBpGr8weeq
HERNBp+ZZ5S3c7o/MaM2E08uFQKAKyf8ufmw6qpSBWPrINUoLwWsKzngBp05Q2S8
/CTQ7wnM2TTgA7BsPf8SNJDz6/KmKyMahe54Cf+UGBfW6ctYLP4tkvpAwSe3601x
OUlYcWYzGWzV1ZdF+3b3LACnjV5FtwR3cTfSO+VcZ4jfwTN0VQbXnRZ+A8RaO9r+
VVYDNlHQ+/58wHW+oLThZW0nuPw8mC3P7FA2R9I9dkonKHA60ep7jUekQgssG/c=
=WLfE
-----END PGP SIGNATURE-----

--xsILJLaVOAbiPmXa--
