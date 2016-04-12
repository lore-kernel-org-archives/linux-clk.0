Return-Path: <thierry.reding@gmail.com>
Return-Path: <thierry.reding@gmail.com>
Date: Tue, 12 Apr 2016 15:11:18 +0200
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
Subject: Re: [PATCH v5 15/46] pwm: introduce the pwm_state concept
Message-ID: <20160412131118.GQ18882@ulmo.ba.sec>
References: <1459368249-13241-1-git-send-email-boris.brezillon@free-electrons.com>
 <1459368249-13241-16-git-send-email-boris.brezillon@free-electrons.com>
 <20160412114904.GM18882@ulmo.ba.sec>
 <20160412141718.5fe4cf24@bbrezillon>
 <20160412122141.GP18882@ulmo.ba.sec>
 <20160412144508.2ee181fe@bbrezillon>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="V2tfspbppmK1TQo2"
In-Reply-To: <20160412144508.2ee181fe@bbrezillon>
List-ID: <linux-clk.vger.kernel.org>


--V2tfspbppmK1TQo2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 12, 2016 at 02:45:08PM +0200, Boris Brezillon wrote:
> On Tue, 12 Apr 2016 14:21:41 +0200
> Thierry Reding <thierry.reding@gmail.com> wrote:
>=20
> > On Tue, Apr 12, 2016 at 02:17:18PM +0200, Boris Brezillon wrote:
> > > On Tue, 12 Apr 2016 13:49:04 +0200
> > > Thierry Reding <thierry.reding@gmail.com> wrote:
> > >=20
> > > > On Wed, Mar 30, 2016 at 10:03:38PM +0200, Boris Brezillon wrote:
> > > > > The PWM state, represented by its period, duty_cycle and polarity,
> > > > > is currently directly stored in the PWM device.
> > > > > Declare a pwm_state structure embedding those field so that we ca=
n later
> > > > > use this struct to atomically update all the PWM parameters at on=
ce.
> > > > >=20
> > > > > All pwm_get_xxx() helpers are now implemented as wrappers around
> > > > > pwm_get_state().
> > > > >=20
> > > > > Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.co=
m>
> > > > > ---
> > > > >  drivers/pwm/core.c  |  8 ++++----
> > > > >  include/linux/pwm.h | 54 +++++++++++++++++++++++++++++++++++++++=
++------------
> > > > >  2 files changed, 46 insertions(+), 16 deletions(-)
> > > > >=20
> > > > > diff --git a/drivers/pwm/core.c b/drivers/pwm/core.c
> > > > > index 6433059..f3f91e7 100644
> > > > > --- a/drivers/pwm/core.c
> > > > > +++ b/drivers/pwm/core.c
> > > > > @@ -268,7 +268,7 @@ int pwmchip_add_with_polarity(struct pwm_chip=
 *chip,
> > > > >  		pwm->chip =3D chip;
> > > > >  		pwm->pwm =3D chip->base + i;
> > > > >  		pwm->hwpwm =3D i;
> > > > > -		pwm->polarity =3D polarity;
> > > > > +		pwm->state.polarity =3D polarity;
> > > >=20
> > > > Would this not more correctly be assigned to pwm->args.polarity? Af=
ter
> > > > all this is setting up the "initial" state, much like DT or the loo=
kup
> > > > tables would for duty cycle and period.
> > >=20
> > > Yes, I wasn't sure about the pwm_add_with_polarity() meaning. To me,
> > > all the reference info should be extracted from DT, PWM lookup table =
or
> > > driver specific ->request() implementation, but I can definitely
> > > initialize the args.polarity here too.
> > >=20
> > > Should I keep the pwm->state.polarity assignment (to set the initial
> > > polarity when the driver does not support hardware readout)?
> >=20
> > Wouldn't this work automatically as part of the pwm_apply_args() helper
> > if we extended it with this setting?
>=20
> Well, as you explained in you answer to patch 5, pwm_apply_args()
> should be called on a per-request basis (each time a PWM device is
> requested), while the initial polarity setting should only be applied
> when registering the PWM chip (and its devices). After that, the
> framework takes care of keeping the PWM state in sync with the hardware
> state.
>=20
> Let's take a real (though a bit unusual) example. Say you have a single
> PWM device referenced by two different users. Only one user can be
> enabled at a time, but each of them has its own reference config
> (different polarity, different period).
>=20
> User1 calls pwm_get() and applies its own polarity and period. Then
> user1 is unregistered and release the PWM device, leaving the polarity
> and period untouched.
>=20
> User2 is registered and request the same PWM device, but user2 is
> smarter and tries to extract the current PWM state before adapting the
> config according to pwm_args. If you just reset pwm->state.polarity
> each time pwm_apply_args() is called (and you suggested to call it as
> part of the request procedure), then this means the PWM state is no
> longer in sync with the hardware state.

In that case neither will be the period or duty cycle. Essentially this
gets us back to square one where we need to decide how to handle current
state vs. initial arguments.

But I don't think this is really going to be an issue because this is
all moot until we've moved over to the atomic API, at which point this
is all going to go away anyway.

Thierry

--V2tfspbppmK1TQo2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXDPPzAAoJEN0jrNd/PrOh1yAP/3nvf/RgYXdbhgmDWCHl2PVr
mVP39k7S/GJyVYIGRc9g583CSiJkQRF+vv2NJBUJ3Ar2QHtSWgu/9uik8uNtEPkv
xRWDIZ/aP4klGr70tjP+PnXW68Utep2xO49CqUTmUxFaIV6vCazxIVa3+n76Ggmp
RnSWjJFFouoZ3LIRC/yhQtpH899pqcJmWxn4F7dd6KEkAdGL3PrCsW48lakUKN4l
6UmZ4kWflaBY7EZni0qPoyDwkWBwee2fcKSTRfMVKQLelb+xN0qPKmy7OOp5lvHk
9p14zqxST5OlqFk7KCWieCgajbTR3To91etVE3g7s1dD8ZkPi1loKl9u3xd0nl4p
Y1NOhvaXR6Ww+MZvNL/mvMRepFLl4/Atckotrabxd11j2THeNqa4+nd1VN5BsXqK
vvk3PjNo6ctissPZsCnf0pVRjpt/Sz8mA00YNFt8okBXJDTXzpzl4FIfyg46uwFI
Q66s1iXJhlXgWaQaG6mPvADB48x9CdeQhdWAnN5DBQRsiRrG7LFyKIPilOHVa7L0
OyUzECSXdtZJqZ9FFxVEIsAY2/RDvaIjoho8NFtT2gCzWPVzifA1mJK0NtlLLZ2Q
WTFXO1A+nctxffZcpkUNmyHB1Z2Rg41i3Ku2CmdPeKLsRxqz5Dbaq12mMt5xbj9L
jULs54pPs6gOpxseZdCc
=DuKa
-----END PGP SIGNATURE-----

--V2tfspbppmK1TQo2--
