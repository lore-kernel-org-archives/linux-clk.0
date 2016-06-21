Return-Path: <maxime.ripard@free-electrons.com>
Date: Tue, 21 Jun 2016 11:20:49 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Michael Turquette <mturquette@baylibre.com>
Cc: Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Daniel Vetter <daniel.vetter@intel.com>,
	David Airlie <airlied@linux.ie>,
	Boris Brezillon <boris.brezillon@free-electrons.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH 02/20] clk: multiplier: Prevent the multiplier from under
 / over flowing
Message-ID: <20160621092049.GN26668@lukather>
References: <1463402840-17062-1-git-send-email-maxime.ripard@free-electrons.com>
 <1463402840-17062-3-git-send-email-maxime.ripard@free-electrons.com>
 <20160620205030.24587.98159@quark.deferred.io>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/TUrtqMIkCP4YtJm"
In-Reply-To: <20160620205030.24587.98159@quark.deferred.io>
List-ID: <linux-clk.vger.kernel.org>


--/TUrtqMIkCP4YtJm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 20, 2016 at 01:50:30PM -0700, Michael Turquette wrote:
> Quoting Maxime Ripard (2016-05-16 05:47:02)
> > In the current multiplier base clock implementation, if the
> > CLK_SET_RATE_PARENT flag isn't set, the code will not make sure that the
> > multiplier computed remains within the boundaries of our clock.
> >=20
> > This means that if the clock we want to reach is below the parent rate,
> > or if the multiplier is above the maximum that we can reach, we will en=
d up
> > with a completely bogus one that the clock cannot achieve.
> >=20
> > Fixes: f2e0a53271a4 ("clk: Add a basic multiplier clock")
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
>=20
> Applied.

Thanks, but apparently you merged it in clk-next, while it should go
in clk-fixes, shouldn't it?

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--/TUrtqMIkCP4YtJm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXaQbxAAoJEBx+YmzsjxAgeZEP/iVHW8R27efQFN5Di8VdkEbw
mFOBo1CJjFRtOQpQw9ty8OuEFJIKec0QcGNgxR3jxRGRbp/xVI97vlPQZ0JnzMTE
02LOruKb17KL+yS+0SSHWQmXCmOv71nHzLzYU8wUqEhjoh0NycQRJ3uNOUxeOiBy
fHN8ls5MdSvZTpoy14mcFNtFVZWzn1wrKAFAHKk3hylcaEF4VS0RkNWBoVvZGvQQ
K5UhAjs42naK93TNhoz0B8lv8xlfcARfGoRli2dqHv5otatA+gSuYWmfvaP2vMjR
woybO4tTGiuqM4nl8lwqaYo6CC55eeOeZlosFuEPNPrLP04og5gIxy5ZIJzfBlI7
kvPi+jkoJva73bQeuMJpXvDvrJfvc/DQxmLqxDryGtgB/mdTidhmBoent3oLNK3c
/zQXmOUtG8ijS4UI8/LvHXI4Y1YBNiLmRjq9LK6vZhiAHndBIuMakHqEvk1Xku++
nCdY1bYMm5n49/9cB3Y8MWd/fIdDhuqLQYLXA3dzK5fxDCpiP05NuJbaLEwdCXEW
Q2S/REmVFb1eZYpXrkmovsY2MRQbEeIkdx2F+LVgNw8JIx3S4Z68wWVF38dzeCTr
vHAfCuMfxzIp8lf78IPFSkN1S6PRNQOwklwiZPUUttbHT2vo9eoKUT0zfDie82js
/eU9IAlaPdoOEgnUxtyU
=dj5b
-----END PGP SIGNATURE-----

--/TUrtqMIkCP4YtJm--
