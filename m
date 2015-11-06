Return-Path: <maxime.ripard@free-electrons.com>
Date: Fri, 6 Nov 2015 14:32:29 -0800
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Rob Herring <robh@kernel.org>
Cc: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	David Airlie <airlied@linux.ie>,
	Thierry Reding <thierry.reding@gmail.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	linux-clk@vger.kernel.org,
	dri-devel <dri-devel@lists.freedesktop.org>,
	linux-sunxi <linux-sunxi@googlegroups.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Chen-Yu Tsai <wens@csie.org>, Hans de Goede <hdegoede@redhat.com>,
	Alexander Kaplan <alex@nextthing.co>,
	Wynter Woods <wynter@nextthing.co>,
	Boris Brezillon <boris.brezillon@free-electrons.com>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
	Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 09/19] drm: sun4i: Add DT bindings documentation
Message-ID: <20151106223229.GM6114@lukather>
References: <1446214865-3972-1-git-send-email-maxime.ripard@free-electrons.com>
 <1446214865-3972-10-git-send-email-maxime.ripard@free-electrons.com>
 <CAL_JsqLuUUApGAgdw7U8EJ7p5yrYJg8AKFB32AE9Ufrf47=WpQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cO2ZlOvi7VNgmdOy"
In-Reply-To: <CAL_JsqLuUUApGAgdw7U8EJ7p5yrYJg8AKFB32AE9Ufrf47=WpQ@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>


--cO2ZlOvi7VNgmdOy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rob,

On Fri, Oct 30, 2015 at 11:40:03AM -0500, Rob Herring wrote:
> > +Display Engine Backend
> > +----------------------
> > +
> > +The display engine backend exposes layers and sprites to the
> > +system. It's split into two components, the frontend and backend, the
> > +frontend doing formats conversion, scaling, deinterlacing, while the
> > +backend actually manages the layers.
> > +
> > +Required properties:
> > +  - compatible: value must be one of:
> > +    * allwinner,sun5i-a13-display-engine
> > +
> > +  - reg: base address and size of the memory-mapped region. Two are ne=
eded:
> > +    * backend0: registers of the display engine backend
> > +    * frontend0: registers of the display engine frontend
>=20
> Why the zeros? I think they should be dropped.

We have SoCs that have two backends and two frontends, hence why I
added 0. I guess I can also add several devices for them, but then I'd
need to move to the component framework I guess (which was the plan anyway).

> > +
> > +  - allwinner,tcon: phandle to the TCON in our pipeline
>=20
> Use of-graph or just let the relationship live in the driver. If there
> is only 1 instance of the blocks, the latter is fine.

We can also have several TCON instances in the SoC, and even though
you can on a theorical point of view use any TCON with any backend,
usually you're tied because of how the pins are routed on the boards.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--cO2ZlOvi7VNgmdOy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWPSp9AAoJEBx+YmzsjxAgimwP/2I7iIkZYajB5ZrsxAiDOQfU
dRu0Sr4HoCU6+Ok2M01dPwn/V5+qQ+PrqFbKLW/SQ+TmH1WQhs7HS1oYmPkB6J4B
VMz/9RCzX3Eo8lDWw/nclTRrwZIKlOMFqx4aYQgnx0wusTVOrzziAlnW/slqpOhU
jXl20LMIeMdVy32SqK1CvT9LyzfIFpmsu9hOdfQDGyT+axanaBflkS/OAzhOmjkT
moYYxr+05/blOUxlvFBegW4gNj45XTpVRkImEkvrZsNhdJokiNRae8IEBA8pm7f2
UhaTT+FJdUatMbSn0tfD5QOQ7M0dmqiqsxqWHuK84msTkJy4mqYrU9yiv43L9jYw
myEL+vnLRgXDHKGC0OZLsQJaGnoSxmtG5s8aAlUzZyv4t5aS9DDbcenH1BXCP771
XypEszvQx2e/5RS/d9LNQC1OjcDUEcPQaYpQjwQha9WYjxKhe+TTlcNCyKXStk3d
8MxZaQJzPwFTZBWbALbvBd4yxw9lM4iteG9Y5ury9T7kgLKwMJoT7UH1niup58xR
cI21R2rCHW/2T48oCXqQDnrGZrVPheOpVyB0zeRGF5+bVVprpg8v/v0AfioH0v1f
rfV4W4m2D7LXTPU5doe7OhO6rWsX52aCOJ6XaZnxlLx4dFokoTvQVYBfvsTFs2ou
fyZNARsigPyUyMG2KuTM
=6kHb
-----END PGP SIGNATURE-----

--cO2ZlOvi7VNgmdOy--
