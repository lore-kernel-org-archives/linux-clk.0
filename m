Return-Path: <maxime.ripard@free-electrons.com>
Date: Wed, 18 May 2016 21:59:29 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Jean-Francois Moine <moinejf@free.fr>
Cc: Chen-Yu Tsai <wens@csie.org>,
	Boris Brezillon <boris.brezillon@free-electrons.com>,
	Vishnu Patekar <vishnupatekar0510@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 02/16] clk: sunxi-ng: Add common infrastructure
Message-ID: <20160518195929.GS27618@lukather>
References: <1462737711-10017-1-git-send-email-maxime.ripard@free-electrons.com>
 <1462737711-10017-3-git-send-email-maxime.ripard@free-electrons.com>
 <CAGb2v67XWt6tjG_xXWgGatTaiN5uYQb2_Q6bgixMDUkHfVHLHg@mail.gmail.com>
 <20160515183122.GA27618@lukather>
 <20160516100239.a93a238b0d458b38a3689a95@free.fr>
 <20160516201509.GL27618@lukather>
 <20160517085427.f2f3aa0c66686f8f5f6318ff@free.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="z+AhoeLdLI498vdY"
In-Reply-To: <20160517085427.f2f3aa0c66686f8f5f6318ff@free.fr>
List-ID: <linux-clk.vger.kernel.org>


--z+AhoeLdLI498vdY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 17, 2016 at 08:54:27AM +0200, Jean-Francois Moine wrote:
> On Mon, 16 May 2016 22:15:09 +0200
> Maxime Ripard <maxime.ripard@free-electrons.com> wrote:
>=20
> > > > Yes, I intended it to be a simple busy waiting loop since I don't
> > > > expect it to be very long. Do yu have any more data on how much time
> > > > it usually takes?
> > >=20
> > > I have a Soc in which the rate of the audio clock is stable after a
> > > good second.
> >=20
> > You mean before the clock is actually stable, or before the lock bit
> > is cleared?
> >=20
> > Which SoC is it? As far as I've seen, only the H3 allows to configure
> > the stable time, and while by default it will take 16us, you can
> > configure as high as 66ms (which is still way higher than the current
> > limit).
>=20
> Hi Maxime,
>=20
> Well, it is not a SoC, but an external chip, the SI5351 (in the Dove
> Cubox). There is no lock bit, but as it is used for audio, and as I did
> not set any delay at streaming start time, I can hear when the clock is
> stable.

Ok. So I guess we set it high enough to cover the maximum we know for
know (65ms), and we can always rise that up later if needed.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--z+AhoeLdLI498vdY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXPMmhAAoJEBx+YmzsjxAguZIQAKWQ7LeXvNaeex20p/xK5TQT
/j9oq1+ILbj9qPdjPv4FTXCAO3zVRJpLa5JCNeLastZcRt3rjuZpbCKSQ5mIs1Ro
e0gJ9obIDW+5dpwtJTBfXhkeiWUvkMrlKvgD9Tsk41I1qHeSyucU8nH8MIbgeuZ6
UCAHdU9BEzQzW/id465GArcnj6vPLTW0NbXDTWAKe/turfS0FYvFfoBqaMTgjrzR
9W0VYggXmsVtvVoDth1QlPz65TQWaY341x3qdLe85CZbiq/Sf308MpbKm5ld5dSc
nxZ0TUqUyY242tWSWaBekjLGLAFh0Dwg0fDYMItRKxR+8aeTfbqE/ky9UlRxWelg
orSYYIFsEtuysX9U64zy1+qqoru1rboovxpD846GcKvfASR+O1herX23sgH+Ul/g
oTVbRqxwEVXy+sEvSKcJDTZIpcDltz/lKO3loGYlzz9kJqAlEz6qoJHV4h8zFO2V
NOej6CBiq/W59JRfK3pzw6kxZUEDGmlOtvavRqPGsYlMwIc3jQg82gQ7oA/aoFOT
M/97GeFxkUj+TdQARxlfLtdrDb8wQwBjtr6ttwfLCbGTbnwQAvpetY42O/ew/cvz
/XpFZVDcxEAstIGRfUQZbXKDV3i3kWsnDZo0HZ2rouYFYdJccVQY5i0GiNXfJzI0
heQnuWQMOYVa/ByWA+mI
=2dGs
-----END PGP SIGNATURE-----

--z+AhoeLdLI498vdY--
