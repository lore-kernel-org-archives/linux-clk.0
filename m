Return-Path: <broonie@sirena.org.uk>
Date: Thu, 2 Aug 2018 11:44:43 +0100
From: Mark Brown <broonie@kernel.org>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	kernel@pengutronix.de, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Leonard Crestez <leonard.crestez@nxp.com>,
	Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Fabio Estevam <fabio.estevam@nxp.com>,
	Russell King <linux@armlinux.org.uk>, linux-imx@nxp.com,
	yibin.gong@nxp.com, "A.s. Dong" <aisheng.dong@nxp.com>
Subject: Re: [PATCH v9 3/6] kernel/reboot.c: export pm_power_off_prepare
Message-ID: <20180802104443.GH9117@sirena.org.uk>
References: <20180802103425.3053-1-o.rempel@pengutronix.de>
 <20180802103425.3053-4-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2oox5VnwalALFvA7"
In-Reply-To: <20180802103425.3053-4-o.rempel@pengutronix.de>
List-ID: <linux-clk.vger.kernel.org>


--2oox5VnwalALFvA7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 02, 2018 at 12:34:22PM +0200, Oleksij Rempel wrote:
> Export pm_power_off_prepare. It is needed to implement power off on
> Freescale/NXP iMX6 based boards with external power management
> integrated circuit (PMIC).

I thought we'd got an ack for this from Raphael on a previous version or
am I mistaken?

--2oox5VnwalALFvA7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlti4JoACgkQJNaLcl1U
h9DRVggAgz0AKW33j9seRp5nJB5gGs1Gi5SjZMd7GKJLj7Fk6GOZEj4vBxZV+AWc
9F3COPoOWo7sFq2OVhmDw2UgfGWLqI3atHUkkqmk31mrAsHcts6+6AIlGK0z2sii
QrxzJoVm+7vn7ft6OcXu8Z73I5pWvzAHxOA16GNDoJDMxYgXFNjaetpntWq/z0XG
AlgagvG+Tn3ibAP5UxWR2hbfNP9gVxOMz+W784ssF02puTjU/4oY+ZQkDJYuE+Km
gbvLWq6E77+S6cF0CxuKYcqUVv4xcmMsHz0jRJWBSgJBuRG6jQiVCFxzGFy0TFx5
BgMtR9r3+Fze77Wb4fjJURqe0dykNQ==
=YEMF
-----END PGP SIGNATURE-----

--2oox5VnwalALFvA7--
