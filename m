Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([85.220.165.71]:57775 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750764AbeEEHCK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 5 May 2018 03:02:10 -0400
Date: Sat, 5 May 2018 09:01:47 +0200
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Andrew Morton <akpm@linux-foundation.org>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
Cc: kernel@pengutronix.de, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        Russell King <linux@armlinux.org.uk>,
        Shawn Guo <shawnguo@kernel.org>,
        Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v6 3/6] kernel/reboot.c: export pm_power_off_prepare
Message-ID: <20180505070147.epsrglnypm72jr5u@pengutronix.de>
References: <20180305102524.5905-1-o.rempel@pengutronix.de>
 <20180305102524.5905-4-o.rempel@pengutronix.de>
 <20180504185052.bjhfkvpgrblc7tfc@pengutronix.de>
 <20180504134956.36dc72a253d03e94a517a867@linux-foundation.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="d2dufsg5h4kwcp6r"
In-Reply-To: <20180504134956.36dc72a253d03e94a517a867@linux-foundation.org>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--d2dufsg5h4kwcp6r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Moving Rafael from Cc to To.

Hi Rafael,

can you please help here?
I need your ACK or NACK for this patch.

On Fri, May 04, 2018 at 01:49:56PM -0700, Andrew Morton wrote:
> On Fri, 4 May 2018 20:50:52 +0200 Oleksij Rempel <o.rempel@pengutronix.de=
> wrote:
>=20
> > Hallo Andrew,
> > I need your ACK or NACK for this patch.
> >=20
> > This function is used to configure external PMIC to interpret
> > signal which will be triggered by pm_power_off as power off.
> > Since same signal can be used for stand by, I linked PMIC configuration
> > with pm_power_off_prepare to avoid possible conflicts.
> >=20
> > ...
> >
> > > --- a/kernel/reboot.c
> > > +++ b/kernel/reboot.c
> > > @@ -49,6 +49,7 @@ int reboot_force;
> > >   */
> > > =20
> > >  void (*pm_power_off_prepare)(void);
> > > +EXPORT_SYMBOL(pm_power_off_prepare);
> > > =20
>=20
> OK by me, but it's more of a Rafael thing.
>=20

--=20
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--d2dufsg5h4kwcp6r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEpENFL0P3hvQ7p0DDdQOiSHVI77QFAlrtVtgACgkQdQOiSHVI
77QObwf/cJgr0HweQIkx/33FIMM9bFE7R39Zd40PxhnmAGb2n5Jwgu1QH5AEUyRc
f1rIROhBmAh6hgX08WEb4axdAHGfERMpiOpak999lBC9VLCN5INt3jpLwfHPi/VM
21fzxr4jvEd9i4S9l670JWKtUPxUCAw7BBmn273tJQv1qdkNsJblqyW7XOe5qO+l
DIsp9ScgU2VOpt2vfk+tMEkdoNa4sCejrN6jt2umP0uQoJY+UQD7PAA5xAemfssW
aYF3aqpRlPKzn++AMgtiBDr8r3kerCx8+Klgjzt9PedqGxY2azr+ieZ1tkmYEDfg
4k+0ebsVUca+n9M8c7tmpQVqbnedQA==
=cKqR
-----END PGP SIGNATURE-----

--d2dufsg5h4kwcp6r--
