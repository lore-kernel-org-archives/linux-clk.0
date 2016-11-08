Return-Path: <maxime.ripard@free-electrons.com>
Date: Tue, 8 Nov 2016 19:45:12 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.xyz>
Cc: Michael Turquette <mturquette@baylibre.com>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-clk@vger.kernel.org, Jorik Jonker <jorik@kippendief.biz>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Quentin Schulz <quentin.schulz@free-electrons.com>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com,
	Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH 1/2] clk: sunxi-ng: Fix CPUX clock for the A23/A33
Message-ID: <20161108184512.jlln3xyvege6jcnb@lukather>
References: <20161107173135.Ux5KXCv5@smtp1h.mail.yandex.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3w7tbgn6ftlie325"
In-Reply-To: <20161107173135.Ux5KXCv5@smtp1h.mail.yandex.net>
List-ID: <linux-clk.vger.kernel.org>


--3w7tbgn6ftlie325
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 07, 2016 at 05:36:03PM +0800, Icenowy Zheng wrote:
> > And your commit log should explain why it is an issue. Yours is even=20
> > wrong here, we could definitely change the rate of these clocks=20
> > already. The only thing that was not allowed was to change the rate of=
=20
> > its parents, which is what this patch fixes.=20
> >
> > > Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>=20
> > > ---=20
> > > Patch 4.9-rc too.=20
> >
> > I don't see why it should be part of 4.9. No one uses that code in 4.9.=
=20
>=20
> It can be triggered by a modified dt in 4.9, by add operating points.

Still, there's no reason to fix something that is not used by anyone,
it can definitely wait until the next release. Linus also said that he
didn't want patches like that last week.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--3w7tbgn6ftlie325
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYIh04AAoJEBx+YmzsjxAgUK8P/RehGnf4pZGpxzBR24LjMPVV
SqcbhKMupCJ34P4EiJwjQTyDKvxBBMgFzc+D5ftAK6kG3M5Qi/oYApVUNCjysj4i
vVgDBHvd19OXM2zHn+ZU1AJCs7yB3KtcawIvtKQJKvVh9YzvxAo/1YAK8ZqscaFe
9zMc57GQ74uy1Q5+n44ksB1FN4MJrmL8PmC6oDQWdEsPX/MjbOATLhKEmhlma6Fp
tvo1LHEdonO2Es9KbHI+cQ9evtVTKK3ztv8IIgLgMgi0hXWQBJlUafnPYn8lX3xI
SaBi0+Dd2wcZvu8CH/HdowEoG+EbRDiX7mgrwFIiiXHYA78pbakf6h4bavCAetOF
F2FIkWDlHCMSS7llTB9eeHY2o/Bl/aNum8xTvmhTbm/GvkI/Waug5a+nQIXKfUFM
dFB0/3DjU7uVc5k4aKV8YvjiXL3X0QvLJ4+BZ8rghZ6WydJrkj+YlyQidJyyXhCc
24t2YtPQw3SOcuI5VbTqLELTkzzDO5cDhWZGpKSzg2dU85BnTrGMJvb+P0pM0REF
vDwyycUVxeOkMXT+fcsUcpXtY+IeGo6re5cNBt6VV1DNRlMrsoVflUjWN0i9y7tn
aeicVi3zu9iqN/JPdPLM9M+KG3pL1rrp1QaaR7aVijRyeDi7wmh5VAqL/NgS+AqT
8ChEUpnMmgOw8GsWMRm+
=ag8B
-----END PGP SIGNATURE-----

--3w7tbgn6ftlie325--
