Return-Path: <thierry.reding@gmail.com>
Return-Path: <thierry.reding@gmail.com>
Date: Tue, 31 Jan 2017 22:42:43 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Eric Anholt <eric@anholt.net>, Mark Rutland <mark.rutland@arm.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Stephen Warren <swarren@wwwdotorg.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Lee Jones <lee@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	Rob Herring <robh+dt@kernel.org>,
	bcm-kernel-feedback-list@broadcom.com,
	linux-rpi-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 09/11] drm/panel: Add support for the Raspberry Pi 7"
 Touchscreen.
Message-ID: <20170131214241.GE872@mithrandir.ba.sec>
References: <20161214194621.16499-1-eric@anholt.net>
 <20161214194621.16499-10-eric@anholt.net>
 <20170131210717.GA872@mithrandir.ba.sec>
 <20170131211702.o2he5o6ktaztmrkx@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ffoCPvUAPMgSXi6H"
In-Reply-To: <20170131211702.o2he5o6ktaztmrkx@phenom.ffwll.local>
List-ID: <linux-clk.vger.kernel.org>


--ffoCPvUAPMgSXi6H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 31, 2017 at 10:17:02PM +0100, Daniel Vetter wrote:
> On Tue, Jan 31, 2017 at 10:07:19PM +0100, Thierry Reding wrote:
> > On Wed, Dec 14, 2016 at 11:46:19AM -0800, Eric Anholt wrote:
> > > +static int rpi_touchscreen_enable(struct drm_panel *panel)
> > > +{
> > > +	struct rpi_touchscreen *ts =3D panel_to_ts(panel);
> > > +	int i;
> > > +
> > > +	rpi_touchscreen_i2c_write(ts, REG_POWERON, 1);
> > > +	/* Wait for nPWRDWN to go low to indicate poweron is done. */
> > > +	for (i =3D 0; i < 100; i++) {
> > > +		if (rpi_touchscreen_i2c_read(ts, REG_PORTB) & 1)
> > > +			break;
> > > +	}
> >=20
> > Don't you want to fail when power on doesn't succeed? Seems kind of
> > pointless to continue if the panel doesn't power on.
>=20
> kms works under the assumption that even when the sink is dead, the
> display pipe (well, vblanks and pageflips) keep working. There's a patch
> floating around to give userspace more information about what's going
> wrong through an async uevent+read-only property for cases where an
> unresponsive sink is normal, i.e. link training for dp.
>=20
> But either way, continuing is generally the right thing to do, there's no
> way to report -EIO from here (because no reasons than that's where
> accidentally ended up with our evolved design ...).

I think this depends on the specific case. I was assuming that if the
panel fails to power up, then any subsequent operations like register
reads or writes would also fail, potentially causing a lot of confusing
error messages that could easily be avoided.

Also, the panel API is usually called from encoder or connector drivers
and propagating error codes might give them a chance of reacting.

Thierry

--ffoCPvUAPMgSXi6H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAliRBNEACgkQ3SOs138+
s6ErbRAApmTIsMNua/mJJO2KS72Frpyf0fOANkvTTTreRfoapD98RZCSfQrNrnlr
YJE8tTOMSEw7Y4tYeTkPlFKbKC636YqqNWksf/X8RR3KyW/8ZHndjhmC8N6l4i74
LA/B2D/XXSqHMdtDlMKzv9qmiYYZWqznjpIzGGIkB5BA1m3LyDWCSpMvkb/P17US
VRwCVKTCNP4QWmSe0zsvSQRj8nAR3Pug9ok9HIOyodGZC33js8hoS21IWpbCzKqG
ObFBiORPtrqGFppkEz9Tg3HBXCkAK/0dGcRkpCbeJXleDhTK702b5JI8EO/7IVvh
jejT1vtRRAlvGog1t4Bftd/y02ODszPFvEgdpDwUvCKazssN7NQHJbXcF4YiMH1n
vFZh+Yumpt+UoT0lAm84+6WCzG1tPjCnIRXC35YGjxjm6+ya594piHUynzSR1GVw
HlD0eVJkCLBHKbAHQ493IZqUCKpn9T6mby5PDdVRuH0Jpkw0cNBjO+Pu3hQBu2yS
zSwHK0nyVPzya9IEk9QKbZFq/0Hp/qu5qO6hlkTV3IWKyWNO1kUCjs4Ru49shn4Q
APYXonsFH0+E0CmRBEykRD2jkkAZTjWbuUzR0kbYim2+xAcjQCB5wlcHEqM9rKHH
Lg8I2aOwZYSXa7CpC6GcpN6VK6yUTk9voZ07/bb33wHwuoJC72I=
=8mCq
-----END PGP SIGNATURE-----

--ffoCPvUAPMgSXi6H--
