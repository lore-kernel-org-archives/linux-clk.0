Return-Path: <thierry.reding@gmail.com>
Return-Path: <thierry.reding@gmail.com>
Date: Fri, 30 Oct 2015 18:37:38 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>,
	Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	David Airlie <airlied@linux.ie>,
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
Message-ID: <20151030173738.GD17183@ulmo.nvidia.com>
References: <1446214865-3972-1-git-send-email-maxime.ripard@free-electrons.com>
 <1446214865-3972-10-git-send-email-maxime.ripard@free-electrons.com>
 <CAL_JsqLuUUApGAgdw7U8EJ7p5yrYJg8AKFB32AE9Ufrf47=WpQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DiL7RhKs8rK9YGuF"
In-Reply-To: <CAL_JsqLuUUApGAgdw7U8EJ7p5yrYJg8AKFB32AE9Ufrf47=WpQ@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>


--DiL7RhKs8rK9YGuF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2015 at 11:40:03AM -0500, Rob Herring wrote:
> On Fri, Oct 30, 2015 at 9:20 AM, Maxime Ripard
[...]
> > +Optional properties:
> > +  - allwinner,tv-encoder: phandle to the TV Encoder in our pipeline
> > +  - allwinner,panel: phandle to the panel used in our RGB interface
>=20
> Use of-graph please.

Why? Panels are a really simple resource and a simple phandle is fully
capable of describing the relationship.

Thierry

--DiL7RhKs8rK9YGuF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWM6rhAAoJEN0jrNd/PrOhe5MP/Rz/SQpr6XBAaweD0OTh1bj8
2u3x4pyBd4Z73GS/nVzflQjZf4B6AqwkvV/Nrrr9E2pdo91uacdfL3uW6n7tLIIM
y0rkDnx5YNTkkM8CM9X4wiziYGuJ0oSxTauw1nH2TEpYf0pFzfrDI16u5mJT0/vS
oL+4Iv5kt1F1/Fnk7ttAioEpvhhz9nMuTqzAI7cajq34CN9s6w2J1pizWQokxJI/
w719JEPIL6Qu8d4cx5N7J7XBaP9giBjSvCsR+ShobF35N5hO1U/JoCGnwZaw81H1
W/vl3xiQwn9PZKZk/fiUguHrfFSXcdLmEFCXn6l9Rxr0lTWmkArF+XfDj/g+BrKB
4Y65KTvHLaUWEPL0Zyt/us6rZGoULSV73wZYLmBttkSgDDdVWeTx9R9llsU5CwJG
pHdSf/WF4lZ5KKQw+H/ajFly+jxQLi34mCugaNkWJZ1jmLVE/XVRyXe4GeeuS8rO
31EprNW6EViDFL2VDqo2R2Pu5XKyEcYHuRzBXCSCuZe1FdNkbtoESq+HnqbhF911
Ni5aTra90uAE3cO15w15sLfKxdIadnI7WpgbTGEG+CfVVY3Fra/hNE9hdMTlwTNb
hNodQv+gnrjmCeYaiJPyg4lWXqEqqeOOd40POR9L7RGeyvXRDYiB/q0S4l2eIRKj
LP2c5ial8yO7oeFJx4MP
=RgVR
-----END PGP SIGNATURE-----

--DiL7RhKs8rK9YGuF--
