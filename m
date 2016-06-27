Return-Path: <maxime.ripard@free-electrons.com>
Date: Mon, 27 Jun 2016 21:23:21 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Mark Brown <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@free-electrons.com>,
	Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Ian Campbell <ijc+devicetree@hellion.org.uk>,
	Kumar Gala <galak@codeaurora.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, rtc-linux@googlegroups.com,
	linux-kernel <linux-kernel@vger.kernel.org>,
	devicetree <devicetree@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-clk <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v3 5/8] rtc: ac100: Add clk output support
Message-ID: <20160627192321.GX4000@lukather>
References: <1466391138-12862-1-git-send-email-wens@csie.org>
 <1466391138-12862-6-git-send-email-wens@csie.org>
 <20160622100206.GV26668@lukather>
 <CAGb2v67DVBZbRb2PWLP8WurPaNin=2Fa=HMAEK_PdBeqv1x+8Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="o/BvujNCPFVhiGON"
In-Reply-To: <CAGb2v67DVBZbRb2PWLP8WurPaNin=2Fa=HMAEK_PdBeqv1x+8Q@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>


--o/BvujNCPFVhiGON
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 22, 2016 at 06:11:55PM +0800, Chen-Yu Tsai wrote:
> On Wed, Jun 22, 2016 at 6:02 PM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > Hi,
> >
> > On Mon, Jun 20, 2016 at 10:52:15AM +0800, Chen-Yu Tsai wrote:
> >> +     /*
> >> +      * The ADDA 4 MHz clock is from the codec side of the AC100,
> >> +      * which is likely a different power domain. However, boards
> >> +      * always have both sides powered on, so it is impossible to
> >> +      * test this.
> >> +      */
> >
> > If that ADDA clock is exposed by the codec, why are you putting it in
> > the RTC?
>=20
> The thing is it's not entirely clear that it's from the codec side.
> I'm just inferring this from the name. (I'll make the comment clearer.)
> The codec parts of the datasheet don't mention this clock at all.
>=20
> Allwinner's SDK puts all the clocks under the RTC module. And the
> are always on, so I can't really turn off the codec and see what
> happens. That and I don't have an oscilloscope or logic analyzer.

Why not just create a separate clock driver then?

Thanks,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--o/BvujNCPFVhiGON
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXcX0pAAoJEBx+YmzsjxAgH5oP/1SDE/ZGU8JvaVyGamQnRemk
hGoiDYWZ5t0/fradi68lkp9imwYvPCxd8EfG6vyVw+J4/4QBXdKijPc4s5XzRuNU
CaS46PpfxpPkk4UHSEjxCoXY6RHZCsexl7AIdZWXuUxinyLqqEjI3vV/rZvtdh3L
68tJsyfuamITQAkcAKp+z6g4BY3pTA8sZHJPt1NsmApHD2d5Px6qIlsRSnPNVXNa
h6yvocYDeZbDqcKrWax77ZN+FROvdNdA9PcJgAJDgi1WCsirlKBZ6CxueR8ME2rd
JxfGUJecdpijXhNdA39mkvMnAJ3OPBrsupLeox2pd3zN+v9IPvd4Qz3Rwp1PYk91
jvq9jmxaU5IvidDA7Mf1aV0k464S33J1oTWGMwsg2+qaciRg0RhH3Gd4KDGdEL7x
7TU2ftZE3ni+sUHBVHUgvJB07QNhZsVYmLb/7uZo5JmhGwKMcMKZTJ5wIdUbAodz
kMhD8KwJ22W7camroq2odh8DQouAOki3uS4IkAMbSx/ztr8gkUnVhHl6YbjsvCqM
V7dVQSTYbV3RN+CtOxyKbaRWbDLXx6AiC4tJCpr3cRbZ6XvCG5A+nC7yNQf0w/i/
XYk54xexFTZO54b0wUqSkpw/cgfj5LDkxcstTYMDRPj/B1kVUnoqAHuAWtUvzvhh
FvvgltlJclLztLZyRr9T
=Vh/U
-----END PGP SIGNATURE-----

--o/BvujNCPFVhiGON--
