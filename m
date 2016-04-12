Return-Path: <thierry.reding@gmail.com>
Return-Path: <thierry.reding@gmail.com>
Date: Tue, 12 Apr 2016 13:03:50 +0200
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
Subject: Re: [PATCH v5 02/46] backlight: pwm_bl: remove useless call to
 pwm_set_period()
Message-ID: <20160412110350.GH18882@ulmo.ba.sec>
References: <1459368249-13241-1-git-send-email-boris.brezillon@free-electrons.com>
 <1459368249-13241-3-git-send-email-boris.brezillon@free-electrons.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="LZFKeWUZP29EKQNE"
In-Reply-To: <1459368249-13241-3-git-send-email-boris.brezillon@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>


--LZFKeWUZP29EKQNE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 30, 2016 at 10:03:25PM +0200, Boris Brezillon wrote:
> The PWM period will be set when calling pwm_config. Remove this useless
> call to pwm_set_period(), which might mess up with the internal PWM state.
>=20
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> Acked-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/video/backlight/pwm_bl.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

Applied, thanks.

Thierry

--LZFKeWUZP29EKQNE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXDNYWAAoJEN0jrNd/PrOhi/wQALBmuyKE4RytME0ICIXFzQsQ
jGXlqKggBvhkFVyrU+QtjfimQZjUhgRSntTt1KajJATlQ0lXrZvLIQUgBH4hQZkr
TBSN8zXMJGj7HOcHLa+lgOVQFcGYUIDU1rBW9SnI2thj0IQn3Zaya2KTDKizoGKT
dgSREYXCwtPaf7s8Paqe6T0jkrWfUc4Y/GA+H8uNpTo7FVf/n7KNaCTUzBPwekqE
UTD41WhqxgpfJaanIyWyspVyk7P3YKwPip++wpHTTXLM0MfQThliq2t7e/PxkT1C
rGe6rTdMmmwUy7BULhWBzntaTTnJtlodLkaKr0I/n0nhi8whqBVSj+JH6KPdivCB
tYSf8V5tA9Dl7yA4E8Jw0kvxvQGpFzDzCiwF4dxV5nysKy4wyrOdznAOeA4gZMje
z9g4XYPATKxkge2WCROg96iE5WlX4FWV3PyK5fhANgFD2lWLYL9S2g6z43rXjkRY
CzQopq6dn7WvIa4IigxbppZMzrRxGs1ZGWSlqU3RRiGqSAl4s5snSsZBZnjLIaiw
p5Fc15lG9MBkck/V5d8R7LwqqKYYmKCfTjOIXDNIhbFr3AKl+OrIx69fNJ8fVPh+
z1eiYWmkP5hOXUVFZFZuwp4ErzP32Zmk7ntPZ/1IkHXaVg1UCHqmM9AmXWSJWxXc
rU52OTaDF3TxRqKcXwAb
=iDpn
-----END PGP SIGNATURE-----

--LZFKeWUZP29EKQNE--
