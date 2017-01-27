Return-Path: <maxime.ripard@free-electrons.com>
Date: Fri, 27 Jan 2017 09:46:29 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	devicetree <devicetree@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-sunxi <linux-sunxi@googlegroups.com>
Subject: Re: [PATCH 10/11] arm64: dts: allwinner: Remove no longer used
 pinctrl/sun4i-a10.h header
Message-ID: <20170127084629.hborqgkmm4exo7z7@lukather>
References: <20170124023230.3990-1-wens@csie.org>
 <20170124023230.3990-11-wens@csie.org>
 <20170126101529.j3fuku4hyy3pbge3@lukather>
 <CAGb2v66cQoPQzd6W1D8bZ5hSURfGP3icJjeoo1mNk2ccG9B2vw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ciukemjlu7lplsqt"
In-Reply-To: <CAGb2v66cQoPQzd6W1D8bZ5hSURfGP3icJjeoo1mNk2ccG9B2vw@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>


--ciukemjlu7lplsqt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 26, 2017 at 07:23:25PM +0800, Chen-Yu Tsai wrote:
> On Thu, Jan 26, 2017 at 6:15 PM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > On Tue, Jan 24, 2017 at 10:32:29AM +0800, Chen-Yu Tsai wrote:
> >> All dts files for the sunxi platform have been switched to the generic
> >> pinconf bindings. As a result, the sunxi specific pinctrl macros are
> >> no longer used.
> >>
> >> Remove the #include entry with the following command:
> >>
> >>     sed -i -e '/pinctrl\/sun4i-a10.h/D' \
> >>       arch/arm64/boot/dts/allwinner/*.dts?
> >>
> >> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> >
> > Applied, thanks!
> >
> > Maybe we should also remove the header entirely?
>=20
> I don't know. What do we do about deprecated bindings?

Well, we have to support the old device trees, but I don't think to be
expected to still compile them from the source

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--ciukemjlu7lplsqt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYiwjkAAoJEBx+YmzsjxAgdKQP/0q6a2JmnUseXwLxp//3Sl0v
pwLZgIAdW4TEc2YRlt4CNdyF44eUv+R1DWLwnEuuY7EDw81ZjNZ+pV1r5aKOIpDj
OQJkdoQf4OoQeTxFgh8SKE3W8kNbFd/Uvnqf2iCkMFdaBPzxU947hCTgvN1b7OtU
BnNET25B7Bs7Ut9sHE+66gc5V1yoXLKZxDWEguwcU05/4D/G8//z/oLq3SXsF8BX
6cMt2LmU12XlSg9nD4lSfRwCXwop2TnmMiH5j7XrQRxyw6+8fzBcTUI0J1V6L+aH
z17jcNNGjEZWu+TkrXo9bk2SRG8CbfdN0hpgb6RpeuMCs8EgULYrzyqTB11RDXAK
swDqNLV6v1wHqygeeLVbgUnI3bB173eijM8nHHMsPVPRc94KcNzrM3bMI7oCnMsG
CVc8aPcbD8aAG7QdEuHG+Rbm2AeHpFCDiA3BD5FmKrdwNKp1oVQsiVTi3dMG460p
DJ8YU5mzyoof6luk0sJCBz7hNNbgf9xAdcrrOv7bl0KzcbGzfQR827MoBS2ZRtxN
17rh1QgVJgbUwcuiQOxDbrtlVr0YASbLJXCDrfz2y1Men7pJcK39nKUz2au9NLQr
CJ5rlqQbPojpTGHfDAGODsdBs74q1ZSMQwPcTHFa+M9o+ZUecevyYFqVJCg9riYk
phP+4Nk4opZ35BEMUmgV
=zpnQ
-----END PGP SIGNATURE-----

--ciukemjlu7lplsqt--
