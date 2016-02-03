Return-Path: <maxime.ripard@free-electrons.com>
Date: Wed, 3 Feb 2016 21:47:30 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Rob Herring <robh@kernel.org>
Cc: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	David Airlie <airlied@linux.ie>,
	Thierry Reding <thierry.reding@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	dri-devel <dri-devel@lists.freedesktop.org>,
	linux-sunxi <linux-sunxi@googlegroups.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Chen-Yu Tsai <wens@csie.org>, Hans de Goede <hdegoede@redhat.com>,
	Alexander Kaplan <alex@nextthing.co>,
	Boris Brezillon <boris.brezillon@free-electrons.com>,
	Wynter Woods <wynter@nextthing.co>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
	Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2 17/26] drm: sun4i: Add DT bindings documentation
Message-ID: <20160203204730.GH3327@lukather>
References: <1452785109-6172-1-git-send-email-maxime.ripard@free-electrons.com>
 <1452785109-6172-18-git-send-email-maxime.ripard@free-electrons.com>
 <20160115031515.GA19797@rob-hp-laptop>
 <20160203195919.GB3327@lukather>
 <CAL_JsqLLvK0L+PaOxesgr9u_3hb6EWbb9w2-yw80D8sUqiohTA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Enx9fNJ0XV5HaWRu"
In-Reply-To: <CAL_JsqLLvK0L+PaOxesgr9u_3hb6EWbb9w2-yw80D8sUqiohTA@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>


--Enx9fNJ0XV5HaWRu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 03, 2016 at 02:19:31PM -0600, Rob Herring wrote:
> >> > +Required properties:
> >> > +  - compatible: value must be one of:
> >> > +    * allwinner,sun5i-a13-display-engine
> >> > +  - allwinner,pipelines: list of phandle to the entry points of the
> >> > +    pipelines (either to the frontend or backend)
> >> > +
> >> > +Example:
> >> > +
> >> > +panel: panel {
> >> > +   compatible =3D "olimex,lcd-olinuxino-43-ts";
> >>
> >> This should either be a child of what it is attached to or use of-grap=
h.
> >
> > You had a similar discussion with Thierry last time I sent it, and it
> > seemed to settle on keeping that property:
> >
> > http://lists.infradead.org/pipermail/linux-arm-kernel/2015-October/3821=
15.html
> >
> > Has that changed?
>=20
> No, I still disagree. We already have 2 ways to describe panels: as a
> child node of its controller or with of-graph. We don't need a 3rd way
> even if it is simple. The problem with of-graph today is too much of
> the parsing is left to the individual drivers. We need to fix that and
> make it be handled by common code.

Ok. I'm guessing from your answer you prefer of-graph over a child
node ?

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--Enx9fNJ0XV5HaWRu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWsmdiAAoJEBx+YmzsjxAgjjUP/ihzDkHF+6IFISkyEOzDwhll
oLsbKRh9ANnXhv1lYPk/4Eum3/27pk634k1wxwE/bH/l84/SJ5ttOir/fztm7Pal
qTzc0A5hgL/IG7y00JTtSzS+mWG4RBzr3clkmvleAqAtea63lenxj5uQCJOrpJ3S
rKgW5WlWxb4Bt8GY3Yye2LfZcu1XGl/DVQuCXjutgwB+UurluUQ9AVqWFp5fVPbf
Hv0lwxmdudIplskjM2/soPRflVC3G5zyeRrm/OAejhMoFcxz+VqVJBegS3SheN6A
/r2GpjcXKsNqqXgGfAEmeFbTnCOtT0PAzRI0cKIRgRYc99sZE0WEJc2jqzUGRclS
q+yxMv3gInIBhllZJzVNM6PbQn0XN7cQQqPvwHy4h4wo4TdDA0rG6QwLEm4+n3DO
AFLos38mWAOxDc/GP6mh9RV1C7Jmn383Q4UuHvxQix/eq/d33v/Ha+1EYo4gKX5k
VWgjMfGWVB5rXO4u9uZihmcDL+G24sinB9lMWZiy6ephqyVq52e7deipzbrbRa/e
Mny9pO1THbvyYSNJzwShzMMTa9zZfwX6xiVVlAwl5NMP6iks+rgYJ4hyvysoWcpA
wzmE2rgM1trVilkK7SlG8hyXE0uVveKQXqCJn7FIO0uwUvOlERikxryzfWiu4b6J
8y/xGj+vAItasxHqzrur
=kXQ2
-----END PGP SIGNATURE-----

--Enx9fNJ0XV5HaWRu--
