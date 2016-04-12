Return-Path: <thierry.reding@gmail.com>
Return-Path: <thierry.reding@gmail.com>
Date: Tue, 12 Apr 2016 16:26:08 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Lee Jones <lee.jones@linaro.org>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
	linux-pwm@vger.kernel.org, Mike Turquette <mturquette@baylibre.com>,
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
	Jingoo Han <jingoohan1@gmail.com>, linux-fbdev@vger.kernel.org,
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
Message-ID: <20160412142608.GB25006@ulmo.ba.sec>
References: <1459368249-13241-1-git-send-email-boris.brezillon@free-electrons.com>
 <1459368249-13241-4-git-send-email-boris.brezillon@free-electrons.com>
 <20160412110809.GI18882@ulmo.ba.sec>
 <20160412141613.GI8094@x1>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TakKZr9L6Hm6aLOc"
In-Reply-To: <20160412141613.GI8094@x1>
List-ID: <linux-clk.vger.kernel.org>


--TakKZr9L6Hm6aLOc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 12, 2016 at 03:16:13PM +0100, Lee Jones wrote:
> On Tue, 12 Apr 2016, Thierry Reding wrote:
>=20
> > On Wed, Mar 30, 2016 at 10:03:26PM +0200, Boris Brezillon wrote:
> > > pwm->period field is not supposed to be changed by PWM users. The only
> > > ones authorized to change it are the PWM core and PWM drivers.
> > >=20
> > > Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> > > ---
> > >  drivers/video/backlight/lm3630a_bl.c | 3 +--
> > >  1 file changed, 1 insertion(+), 2 deletions(-)
> >=20
> > Applied, thanks.
>=20
> Applied?

You didn't specifically Ack this one, but I presumed that since the
change is essentially the same as for pwm-backlight, and this is another
prerequisite for the remainder of the series it should go in through the
PWM tree as well.

Thierry

--TakKZr9L6Hm6aLOc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXDQWAAAoJEN0jrNd/PrOh74sP/is8Fx+HimV+xQUGl5bNRqB8
C9t16YiTbMALk6NDTOQsdDrPcXHqhVuuV/7GW+tC4JmQ/BejNof5OZP7z7BJ6QFi
eNSBlMQn4pcMnHOOEE8NgcMuowI9Q+WDaXsYGHUd59nnYbZpScuVqJ1qZVB3DBN/
2rS+2kjdZIS322znn71gYAck/DyEX2uoOE9QdGU7gu18ipYoEdUXGo/XFjY8I+FB
js8LEfye1ymplhIAtfkB/sncisB59Uy3/DPN04eVf+ra1QikIYcoaFDMIIzMTfFl
oTLDqK2ANU+cJaOlsdK8C1TACgoTqhB6PtgvYLnyL/9sUbyFKo9l51/TigvUZSCk
Xylz4LAF0rHK/MnyR4gF5imkicv4MeyIAc9P9pSMq3Gekv02N+JsqYyXqzVhk12B
9ea3fBivD0nmUbLwvLPcZhBEbV7x3ItW+rY2gwLVgBYEo2lFmfVuXg6U/T8KX8JM
jHvd0lfwe2qQ1wIp1iuU9YkKsg9c9Dz1Hn7yMsTRhXoKSJQrxNrSM2Esemcuo0qv
4aLzqaajqWWslcCDjEFYCL0zcs/n25Po6eLvHcRiIZrx+CjvQfjJf9IvQ84OFrTN
QL+AeJwJHlrvxsVYZ5iyc/lRsl7goLJD8xMyX1pDlLWLO0a77CLXuB3YWnQIyvuG
RP3jBvYmYnieu5++2opT
=Dd/s
-----END PGP SIGNATURE-----

--TakKZr9L6Hm6aLOc--
