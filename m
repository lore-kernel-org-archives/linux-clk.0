Return-Path: <thierry.reding@gmail.com>
Return-Path: <thierry.reding@gmail.com>
Date: Mon, 4 Apr 2016 17:22:54 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-pwm@vger.kernel.org,
	Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Kamil Debski <k.debski@samsung.com>, lm-sensors@lm-sensors.org,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>, linux-input@vger.kernel.org,
	Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>,
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
Subject: Re: [PATCH v5 32/46] pwm: deprecate pwm_config(), pwm_enable() and
 pwm_disable()
Message-ID: <20160404152254.GB17856@ulmo>
References: <1459368249-13241-1-git-send-email-boris.brezillon@free-electrons.com>
 <1459368249-13241-33-git-send-email-boris.brezillon@free-electrons.com>
 <20160331173858.GB39098@dtor-ws>
 <20160331205454.630734ab@bbrezillon>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kORqDWCi7qDJ0mEj"
In-Reply-To: <20160331205454.630734ab@bbrezillon>
List-ID: <linux-clk.vger.kernel.org>


--kORqDWCi7qDJ0mEj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 31, 2016 at 08:54:54PM +0200, Boris Brezillon wrote:
> Hi Dmitry,
>=20
> On Thu, 31 Mar 2016 10:38:58 -0700
> Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
>=20
> > Hi Boris,
> >=20
> > On Wed, Mar 30, 2016 at 10:03:55PM +0200, Boris Brezillon wrote:
> > > Prefix those function as deprecated to encourage all existing users to
> > > switch to pwm_apply_state().
> >=20
> > Why not keep at least some of them as wrappers where we do not need to
> > chnage several parameters at once? It is much easier to have a driver
> > do:
> >=20
> > 	error =3D pwm_enable(pwm);
> > 	if (error)
> > 		...
> >=20
> > rather than declaring the state variable, fectch it, adjust and then
> > apply.
>=20
> True. Actually deprecating the non-atomic API was not my primary goal.
> Thierry would you mind if we keep both APIs around?

I'm fine with keeping these around, though purely as shortcuts. If users
need to modify two parameters at once (e.g. duty cycle and enable) then
they should be converted to use the atomic API, otherwise there'd be
little point in introduce it.

Thierry

--kORqDWCi7qDJ0mEj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXAobOAAoJEN0jrNd/PrOhbMEP/2DnMXfDO3dPUupPXHVnApG7
P03B4P1PaX5ZZlgEfqr3Wb4Z7gTVW2ZDjCJTN8iMV9ZKhMZr9w8iU2XXTDylE/2/
bmfVYYWOkGfU/pWfrAlxg/9IohVMK8K1XpGPOv9ODo0RZrlMcziUtx2X78IRJBym
+LhBMoWNXQuFCGScUdTBLqo4UMy4U7dEbMJdi8m3eAfn6Ox/u3W7LQDRYvkJhXmJ
LwzEkBhXEWEAaWUaebfAa6xEdWvcTH8PV5muwi7KZszCJqrNbPT3xc2nkOJJAG4E
xoEgOhMYaw6a1Cwt/hwjvzsXrMj7JMA2CLkZtkgv1ceLALG+O8Yo8+TiZI1Xu7yM
0yv+A9FqV8B/h+ou13DLoqk78559Dy7HhVegEn/C3Gu8QlGLX3Nuh+HfXfYqr+mE
Cj04NZz+PKWTZJO4ROGMAyue8HgNtTqwv6Emfd4+rN41YeVaB/ERIEXXU+QnhBZJ
lhoqi5hXa9Cm+/JNSJQiBDNt8GWoxy/CadmAT9wslfX0ZLWHWirKiebgc4zbFmI4
YVZgJRC4KLOITYfYwcaf7MtztW7MEGUqkoo2zVfwTcMzvDwIaGTc7rslB9irKKmi
5T8emrW3eAYOWamLKnv4jrMVr1Agrn1AxG496vqS0Mg9iXHi6syZzwe9MqHhshhv
UYUxq1mR6q8f+fGL7SFN
=twQ2
-----END PGP SIGNATURE-----

--kORqDWCi7qDJ0mEj--
