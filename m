Return-Path: <maxime.ripard@free-electrons.com>
Date: Wed, 27 Jan 2016 19:08:22 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Vishnu Patekar <vishnupatekar0510@gmail.com>,
	linux-sunxi@googlegroups.com
Subject: Re: [PATCH RFC 04/11] clk: sunxi: factors: Add unregister function
Message-ID: <20160127180822.GQ4317@lukather>
References: <1453727747-23307-1-git-send-email-wens@csie.org>
 <1453727747-23307-5-git-send-email-wens@csie.org>
 <20160127155210.GH4317@lukather>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zxEKvxCKojqA/Afl"
In-Reply-To: <20160127155210.GH4317@lukather>
List-ID: <linux-clk.vger.kernel.org>


--zxEKvxCKojqA/Afl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 27, 2016 at 04:52:10PM +0100, Maxime Ripard wrote:
> On Mon, Jan 25, 2016 at 09:15:40PM +0800, Chen-Yu Tsai wrote:
> > sunxi's factors clk did not have an unregister function. This means
> > multiple structs were leaked whenever a factors clk was unregistered.
> >=20
> > Add an unregister function for it. Also keep pointers to the mux and
> > gate structs so they can be freed.
> >=20
> > Signed-off-by: Chen-Yu Tsai <wens@csie.org>
>=20
> Applied, thanks!
> Maxime

So, yeah, that obviously didn't work, since clk_unregister_composite
wasn't in.

I want to give that as much linux-next coverage as possible, so I
still pulled 3, 5 and 11, replacing the call to
clk_unregister_composite by clk_unregister, adding a todo note on top.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--zxEKvxCKojqA/Afl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWqQeVAAoJEBx+YmzsjxAgazQQALx9CmQ1RGMyRQD0YEXiCqyo
HVzngUvktJYpncnqLhz6yXJC+z+7fLpKw0fYr3R8kX+f2kcNne3PGoVPXZo3nY43
Z6EaBWRO5ORnS7p8GbEAfkE56BlEU4WNg4FuNdElSGbozDWkrpjF/sOU/KhRioqU
50kOc3mRGIr2EkbXAXONX1PjSQmx/HGzSFIG8RNLIPF4LeWIULqIt/j5Juc9vysM
uMdy0qxNMOjNrEOSWUbop2WiX2mJ+qoTZp1dsxi1O+ZB8bhscGGc8uQz0cb1+i+r
YlLNnDogO9g3N6+rAGa+JXFeXmuPOmjb82FwdZsK5bCa+smNvNqJpLCmafjIh76g
0gYZ5VUQlCO8UCraKAa4NqxrJe3GFI4LmB4lY1H+ssxZGJ9tDUojeV85ilsH+sos
S7SvNpFQS3126Kgt9zJFe7bVU4Gg0xxaIMDD05HoVm5IdMA6qBXxTiEYP7vVka7H
BulTABn9EaMIiFtlphGRiu3bP3dbtNVPDvVXl3apb1WC1Q0rRwYBXW/6Lev8eUfa
FRgy2moIx/L55NZqlS+haBJbp+Jwxh105VoNjcot81/hKC01QYbO8YJqtXd7m5pf
7F58QSSCtRbyli0NSu2jXIv29bzgweBb9Xk6qd/okxLi9yJnb1CzSFzi7c1Nyth4
k/sKUfOVoSGEuQ92H9dI
=xXio
-----END PGP SIGNATURE-----

--zxEKvxCKojqA/Afl--
