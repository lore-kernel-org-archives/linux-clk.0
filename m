Return-Path: <maxime.ripard@free-electrons.com>
Date: Thu, 3 Nov 2016 09:15:01 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	linux-sunxi <linux-sunxi@googlegroups.com>,
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v6 1/4] clk: sunxi-ng: Add A64 clocks
Message-ID: <20161103081501.vvnfoezubsgvnlbk@lukather>
References: <cover.6088b64645bde9b847d2fede5ecb15a0e204a9dd.1478123413.git-series.maxime.ripard@free-electrons.com>
 <fb266cd536fce7fc7800189f3aa0f8cd73d75ec3.1478123413.git-series.maxime.ripard@free-electrons.com>
 <CAGb2v676Ddz1wmRwDGwTd8gGH5AJJBkyAe-WyvZ=D+2OKoRb4w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4uwydchqx5r6bafk"
In-Reply-To: <CAGb2v676Ddz1wmRwDGwTd8gGH5AJJBkyAe-WyvZ=D+2OKoRb4w@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>


--4uwydchqx5r6bafk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 03, 2016 at 09:52:26AM +0800, Chen-Yu Tsai wrote:
> On Thu, Nov 3, 2016 at 5:50 AM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > Add the A64 CCU clocks set.
> >
> > Acked-by: Rob Herring <robh@kernel.org>
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
>=20
> I thought I acked this one...
>=20
> Skimming through it again, I think you would want to add CLK_SET_PARENT_R=
ATE
> to the hdmi and mipi dsi module clocks.
>=20
> Otherwise,
>=20
> Acked-by: Chen-Yu Tsai <wens@csie.org>

I added the flags, and applied, thanks!

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--4uwydchqx5r6bafk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYGvIBAAoJEBx+YmzsjxAgwocQAKBIC/0wakVzUpTNcJYNj8Lc
tLzMqlw+PDHdSFa7wRjjBpdyLJUdfXO2IsaqOlE8Vtv5+CS9pyAtZLNd+62EOJCB
s73jS7C0Xx+BuF4fEL5D2pWojTPwk3h3D/WcxIo4Gixg6vN9vMobJ1GNQhawjJnu
86SzVXi3A6TyAnewsGKvYHEG5j/pCkWlKiwA+vvOdBVv8oer2dqsK0M4WZVCte2C
VeRzr1wBL+bRSkon/Y/7nAQrFQJwvZ/HUp93H/5/rezHfphqI6WnJ/LjdYHwZTWV
npyhbkcXSneVjvy2W7BYjfBgCLQDcUWNDwiPLyOMnaTFmd4wRyGTF8nOvkjKOvdU
qa4sN0CIMP1eLIUgaknHdyLF5cOx9mrXsFXfm7IPvqFcl0zaQt89qt8knD4OrRdf
1gNPHl8Qvej+ljGg57upNZdjZ0vjOv3F97vgMwnYrmJ6zhn1JiHw4C136KNGinND
OmfykwZ7bNPqC8RImCFZtC9vdG3QegJ5ylRaZGgGbtKhDBGDk/attNfwtuz6sVcc
ZGGmQuw11Fyh7pqfi8EZe4NSksCqmzyp6A1qpNnbLLtJAI+amovpPVmAjx9An6Nd
Gt66XUsVwtYdxroo/CibIWVPL58WnXjgJJ7R4w4OsOzJlTBCD5/fy7VEzplc52di
KKcWMA+ZTkU1x5kn4zqc
=J/jD
-----END PGP SIGNATURE-----

--4uwydchqx5r6bafk--
