Return-Path: <thierry.reding@gmail.com>
Return-Path: <thierry.reding@gmail.com>
Date: Tue, 31 Jan 2017 22:38:51 +0100
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
Message-ID: <20170131213849.GD872@mithrandir.ba.sec>
References: <20161214194621.16499-1-eric@anholt.net>
 <20161214194621.16499-10-eric@anholt.net>
 <20170131210717.GA872@mithrandir.ba.sec>
 <20170131211952.jirg7scbzajshpec@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wULyF7TL5taEdwHz"
In-Reply-To: <20170131211952.jirg7scbzajshpec@phenom.ffwll.local>
List-ID: <linux-clk.vger.kernel.org>


--wULyF7TL5taEdwHz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 31, 2017 at 10:19:52PM +0100, Daniel Vetter wrote:
> On Tue, Jan 31, 2017 at 10:07:19PM +0100, Thierry Reding wrote:
> > On Wed, Dec 14, 2016 at 11:46:19AM -0800, Eric Anholt wrote:
> > > +static int rpi_touchscreen_dsi_remove(struct mipi_dsi_device *dsi)
> > > +{
> > > +	struct device *dev =3D &dsi->dev;
> > > +	struct rpi_touchscreen *ts =3D dev_get_drvdata(dev);
> > > +	int ret;
> > > +
> > > +	ret =3D mipi_dsi_detach(dsi);
> > > +	if (ret < 0) {
> > > +		dev_err(&dsi->dev, "failed to detach from DSI host: %d\n", ret);
> > > +		return ret;
> > > +	}
> >=20
> > You might want to continue after this anyway, because the driver will be
> > unloaded regardless of your error code and you'll leave behind a
> > dangling panel and leak a reference to the I2C bridge.
>=20
> Sounds like we should switch the mipi_dsi_driver->remove callback to
> return void then? But separate cleanup series if someone bothers with it.

I think there are advantages to keeping this consistent with the driver
core's definition of ->remove(). There have been efforts lately to deny
unloading drivers if they are a dependency for other drivers, so we may
yet see the day where the driver core actually does something with this
return value.

Thierry

--wULyF7TL5taEdwHz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAliRA+kACgkQ3SOs138+
s6HwrQ//ck4B/dtyoEU9ZuChGt794vnYtlL+ieQvtCX0K6NH8HlcewJVqRDtceuE
pIJG6i+KAYpjBX0b96NM4609/+Bo8S5DLCdpt3zvOkii6sdDGwugEQHB5XwdJ3sU
U1YE89AAozHbODEZqBijbzTB5NP6k9A0e2iawPBVyI1qGcdTo1OAJDpS4VnWL0ZN
f+YJIx36TFkbP700zPgta9UIgf7R6AvlNMn2ZOsDHK5IFQCUmRPz8zzjVqIEPVZa
zUnX0EcAH+mqmJ7BsdHs+w2qUbEeKPZIC19F+xOAehK15B6eUBhQ39zDI1wZbSQA
chB0Z49sP9g2d7Byxyqftn8TUlC3gXvixiXGsobMfj/ceUGoUqqeBzIPbfUnbo4P
HDhSCxricaUdhyppxOuw4+pbEMBsAeBvpd5BgnmfG7mx9zVuZmvzZwNavAOQfJzc
2eD3b2gtqQabpybkpFFeSQZyPRE7YKnYzoQBJYvUGsAg7y3uoD/XkhJ2PjpwpcbD
1iidGrMP4ThVJKxmcfNXiRWnTajTiivf1sl/GRQf8DpdCAKOL8O2h1BbpT2jnXpp
tx5RTAf09zJniNDCUdPvIuBWy3O+5vJzS15pVYw3tVS2mlavvIZ18ErrJ/k0kVic
84uEoh69wULJkUQcRbMh9nf5zVjocuu8/S5jc6MtK2FBhr7M5DY=
=cVgP
-----END PGP SIGNATURE-----

--wULyF7TL5taEdwHz--
