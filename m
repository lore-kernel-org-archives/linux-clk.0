Return-Path: <maxime.ripard@free-electrons.com>
Date: Thu, 19 Nov 2015 16:42:58 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Mike Turquette <mturquette@baylibre.com>,
	David Airlie <airlied@linux.ie>,
	Thierry Reding <thierry.reding@gmail.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-sunxi@googlegroups.com,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Chen-Yu Tsai <wens@csie.org>, Hans de Goede <hdegoede@redhat.com>,
	Alexander Kaplan <alex@nextthing.co>,
	Wynter Woods <wynter@nextthing.co>,
	Boris Brezillon <boris.brezillon@free-electrons.com>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
	Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 01/19] clk: sunxi: Add display clock
Message-ID: <20151119154258.GQ32142@lukather>
References: <1446214865-3972-1-git-send-email-maxime.ripard@free-electrons.com>
 <1446214865-3972-2-git-send-email-maxime.ripard@free-electrons.com>
 <20151030212902.GG19782@codeaurora.org>
 <20151106233926.GN6114@lukather>
 <20151112203154.GE15032@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="de1H0RjRxOSdb4we"
In-Reply-To: <20151112203154.GE15032@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>


--de1H0RjRxOSdb4we
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2015 at 12:31:54PM -0800, Stephen Boyd wrote:
> On 11/06, Maxime Ripard wrote:
> > Hi Stephen,
> >=20
> > Thanks for your feedback!
> >=20
> > On Fri, Oct 30, 2015 at 02:29:02PM -0700, Stephen Boyd wrote:
> > > > +
> > > > +	mux =3D kzalloc(sizeof(*mux), GFP_KERNEL);
> > > > +	if (!mux)
> > > [..]
> > > > +		goto free_reset;
> > > > +	}
> > > > +
> > > > +	return;
> > > > +
> > > > +free_reset:
> > > > +	kfree(reset_data);
> > > > +free_clk:
> > > > +	clk_unregister(clk);
> > >=20
> > > We really ought to have a clk_composite_unregister() API.
> >=20
> > Can we?
> >=20
> > We can always unregister the clock itself, but do we have a way to
> > retrieve the structure that has been allocated in there?
> >=20
> > (note that it also applies to the generic clocks registration: muxes,
> > dividers, and so on).
>=20
> Yes we have a way. We've done the same sort of design for other
> generic clocks. Do the __clk_get_hw() thing like in clk-divider.c

Ack. I'll cook up a patch for this then.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--de1H0RjRxOSdb4we
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWTe4CAAoJEBx+YmzsjxAgJDEP/jDQrJjvo0gE5obB+zqVXK4j
iK962m9StkVDIjwcMtQ1N1rO7Q5XAlcComAzUAAwSh9duhLuN05rf1/sPojplmYh
Aaz1FhYRrA2A11GOrHAYRw0d0HCab0elhBz8ByDHVkVgy9V0i9QV2Np91zcH5xmv
45QBWiqeeKEHh8Bmw0QompuK6ABuX1TKNQFSLNqYRSePAN0nSf/kp2yvpIyMUERd
zuDdfPVozMfvehMQil+wENelUI8iotY2QU0Chaj8VZvjNNeumGK7Ab3SFV89CxoD
z5ER+yknBj+F/rnr7n+Zn+JChzolqBvdDW0Es0NRlXYtaOWSXXtgbrQwwjoUkb9J
aF5K/XRwkGEzBY+mNyJPeKzv8kzXO7Xrq7+GoAdfXGYwerT6/JCegMzckC/dR/Qb
uXJ+iB7idxBxoJsVmxE0kzVYPugmKFY1kDqkNiO5qo9NxScmZXgeNY/EeRA5TcBN
Afkx1K+68iAZhn/gMmqNJi+UscIrqZc6k8WdScusxMIGaYdpngXp9Fdh8L4LXvr8
vhDc778NY8XV5tjKRhemC/pk0KARSm3bMOF+SWCNUIX37jPUh+/OKaYqggDB01LG
Egc5PB9o787/TDR3XIM4lsCgDg24H7gaUUYOcsIpwddYg+C//uRSiJstWo4JWPIn
8xUfYM9/keB+cK8tHbVE
=eNJ8
-----END PGP SIGNATURE-----

--de1H0RjRxOSdb4we--
