Return-Path: <thierry.reding@gmail.com>
Return-Path: <thierry.reding@gmail.com>
Date: Tue, 12 Apr 2016 13:08:09 +0200
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
Subject: Re: [PATCH v5 03/46] backlight: lm3630a_bl: stop messing with the
 pwm->period field
Message-ID: <20160412110809.GI18882@ulmo.ba.sec>
References: <1459368249-13241-1-git-send-email-boris.brezillon@free-electrons.com>
 <1459368249-13241-4-git-send-email-boris.brezillon@free-electrons.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2xeD/fx0+7k8I/QN"
In-Reply-To: <1459368249-13241-4-git-send-email-boris.brezillon@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>


--2xeD/fx0+7k8I/QN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 30, 2016 at 10:03:26PM +0200, Boris Brezillon wrote:
> pwm->period field is not supposed to be changed by PWM users. The only
> ones authorized to change it are the PWM core and PWM drivers.
>=20
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> ---
>  drivers/video/backlight/lm3630a_bl.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Applied, thanks.

Thierry

--2xeD/fx0+7k8I/QN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXDNcZAAoJEN0jrNd/PrOhTYQQAJIra7IMWwqrg+lUp7EqOQZY
eV/VGRUmo6g3HLR3dTRbwKUjKeOyq9hqA+tvfaM+XsB1/2Ts2hVQZLs/XfC7/WgE
3D0UifQLJgh0NwAg0LBYe0DIbTHKtNBsiga91l6LQV50hZWJeDXlgyY9y+kAnZEP
FTIZbgfnCfI6yuHMf8RFIOFEOnr+6pNXK3C47kFky1V9VoPTqS7rjtJ6uyu7HSYw
gtJWDXlu9UceaCWP8VUI6xaAxoh5II+oFzUUePTrssff1feTueIMNRGr4e4jY8e8
Sp97XG/YMUY06CYQNsPC7EEnL4moGDbavsegDYOl0IgdKGP14soC++Vf5jwYMZ/p
hIxv771iBUD0nhXzxMyL+mXenEnNqFhAn5GaJuFv3NpIRbDwhxageXibLRlGfUDJ
G9nJywOwN4JIhBslQFFuelx+lLhWRVOdIArviNFYy+RcgyMcQ5MHVfPaJA56Z36V
D/axa/U7ONgs4atxdcNXHhDxiGd3ts4/2YPlSFieP7AE6fyToKwvBTzLLKaXxiNG
F1PrDU+ybLuiTJOXYu7dH7/vA+X2sbMxeIqm14wI9Kp5usguogRbayx/pBFmRHVy
qs+Jz3p01xbvfTEpevyF/aWMSa6nmv+njc1kFfUXrv858Y3ztkmF8pYhyVkvQV1+
MKYEQnJf9T0KJwmjgGKM
=BxVW
-----END PGP SIGNATURE-----

--2xeD/fx0+7k8I/QN--
