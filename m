Return-Path: <thierry.reding@gmail.com>
Return-Path: <thierry.reding@gmail.com>
Date: Tue, 12 Apr 2016 13:22:46 +0200
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
Subject: Re: [PATCH v5 04/46] pwm: get rid of pwm->lock
Message-ID: <20160412112246.GJ18882@ulmo.ba.sec>
References: <1459368249-13241-1-git-send-email-boris.brezillon@free-electrons.com>
 <1459368249-13241-5-git-send-email-boris.brezillon@free-electrons.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="QnBU6tTI9sljzm9u"
In-Reply-To: <1459368249-13241-5-git-send-email-boris.brezillon@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>


--QnBU6tTI9sljzm9u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 30, 2016 at 10:03:27PM +0200, Boris Brezillon wrote:
> PWM devices are not protected against concurrent accesses. The lock in
> pwm_device might let PWM users think it is, but it's actually only
> protecting the enabled state.
>=20
> Removing this lock should be fine as long as all PWM users are aware that
> accesses to the PWM device have to be serialized, which seems to be the
> case for all of them except the sysfs interface.
> Patch the sysfs code by adding a lock to the pwm_export struct and making
> sure it's taken for all accesses to the exported PWM device.
>=20
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> ---
>  drivers/pwm/core.c  | 19 ++++--------------
>  drivers/pwm/sysfs.c | 57 ++++++++++++++++++++++++++++++++++++++++++-----=
------
>  include/linux/pwm.h |  2 --
>  3 files changed, 50 insertions(+), 28 deletions(-)

This is a little overzealous. Only accesses that can cause races need to
be protected by the lock. All of the *_show() callbacks don't modify the
PWM device in any way, so there is no need to protect them against
concurrent accesses.

I've dropped the changes when applying.

Thanks,
Thierry

--QnBU6tTI9sljzm9u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXDNqDAAoJEN0jrNd/PrOh/vAQAKV4cr0k4hIkuQzUAxTydr3e
J2KR01Td7f6t5RRgL036NiAdezmQjUHpjsWrvGzhoXGFG18xJcOvDaEqx4eBZVO8
AcvoTPJBPb7cK4iQzIBFj6f7pRuDLJiO3VvbGnt5KBX6gxb5L7Ob6uCh7KUqcPQY
TSVZEyvCz5IOrjY3+ae1z182RMPUpSgYhvoPOvCnnWf55L1uM5PYTDQfYK3mCVMq
XEsuynzPOdMmFSBwY2EDnfMH20rReqWpkJt8p2t1JRCQKEV4+APC56MSqALX70ru
WcjrwHGAfbB0D9vBDRyS6MKfQHKvSN8vr/tKLgyARHCGQaVIaWlSn0YIVrUBvu7e
w/wjJzgjUPHHJRid3V+8iSzJXnx7VFkmo6kEsIPx2bPPzehKD0IwvuBvWly6/SEn
NYzRO0ACcUC6BZTREIIEIDvIYNLoArvDM0KzraPdFOCaOGeJPUYA7QpzqZyViD/B
2fXH+Vd9N5Fu2b5ZrVEvqlT+hZ+LF7226wqTD/swx1uBqlyE813nuGiJ1GEydppL
Zwbr/YgOwd6sbUC2BLd6FXRkvvUnOuL924jivltGKF1zMZRcc0mNRLcqtmQH/DOM
Vo+LsKMjdOQ5xPEcthrnAIL09zThghXmNo0nefauiz8rKhsfzGOAK8bmcoNZ6M+Y
a5yLktJ92zpWwaSBfX5R
=ImQE
-----END PGP SIGNATURE-----

--QnBU6tTI9sljzm9u--
