Return-Path: <maxime.ripard@free-electrons.com>
Date: Thu, 19 Jan 2017 23:14:46 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 5/7] clk: sunxi-ng: Add sun5i CCU driver
Message-ID: <20170119221446.so4gapdjylfdp77w@lukather>
References: <cover.8762813dc78858261716126c700983d4aee00458.1484035021.git-series.maxime.ripard@free-electrons.com>
 <da6a80f9368f5a7df9e8f9a8266f4dd62e4b6127.1484035021.git-series.maxime.ripard@free-electrons.com>
 <CAGb2v66bZ3_K11NHuN0aXG=VVYq1TL75sBCZ4o4LjwDcnJwFFw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wvr4ifdsqhvtvrzb"
In-Reply-To: <CAGb2v66bZ3_K11NHuN0aXG=VVYq1TL75sBCZ4o4LjwDcnJwFFw@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>


--wvr4ifdsqhvtvrzb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jan 16, 2017 at 03:15:20PM +0800, Chen-Yu Tsai wrote:
> > +static const char * const spdif_parents[] =3D { "pll-audio-8x", "pll-a=
udio-4x",
> > +                                           "pll-audio-2x", "pll-audio"=
 };
> > +static SUNXI_CCU_MUX_WITH_GATE(spdif_clk, "spdif", spdif_parents,
> > +                              0x0c0, 16, 2, BIT(31), 0);
>=20
> CLK_SET_RATE_PARENT?

Ack.

> > +static const char * const csi_parents[] =3D { "hosc", "pll-video0", "p=
ll-video1",
> > +                                           "pll-video0-2x", "pll-video=
1-2x" };
> > +static const u8 csi_table[] =3D { 0, 1, 2, 5, 6 };
> > +static SUNXI_CCU_M_WITH_MUX_TABLE_GATE(csi_clk, "csi",
> > +                                      csi_parents, csi_table,
> > +                                      0x134, 0, 5, 24, 2, BIT(31), 0);
>=20
> Not sure how CSI works, but you might need CLK_SET_RATE_PARENT?

I'm not sure either to be honest. That can always be added later on if
we really need it.

> > +static CLK_FIXED_FACTOR(osc3M_clk, "osc3M", "hosc", 8, 1, 0);
>=20
> As I mentioned for the last version, we don't really need this.
> It can be represented as a pre-divider. But it's just an
> implementation detail.

I think I found a good way to deal with that. It will be in the v3.

> > +static struct clk_hw_onecell_data sun5i_a13_hw_clks =3D {
>=20
> I selfishly want a comment on what's missing/different.

Ok.

> > +static void __init sun5i_gr8_ccu_setup(struct device_node *node)
> > +{
> > +       sun5i_ccu_init(node, &sun5i_gr8_ccu_desc);
> > +}
> > +CLK_OF_DECLARE(sun5i_gr8_ccu, "nextthing,gr8-ccu",
> > +              sun5i_gr8_ccu_setup);
>=20
> It should be possible to do a standard platform driver, right?
> The rest looks good, though I did not go through the list of
> clocks for the A13 and GR8.

No, we can't. Some of those clocks are needed for the timers and
hstimers, which are initialised way before the driver model kicks
in. We can do that on newer SoCs because we rely on the arch timers
that don't need any clocks, and we haven't found a usage for the
hstimer, but here we can't.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--wvr4ifdsqhvtvrzb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYgTpRAAoJEBx+YmzsjxAgq5UP/jscxeK8S8ESvgx0g6HJJv+j
0sG4zovbdAqTdmanJUK3FgCKket37/ChKrlYe3FkGsmCUzu8P4YBnQwBAj3ghjKb
EXohLIhSsLKsO+eqNQg8oVjtcaIZXtpXrVuD3NZHPslg5XGZnMG1BdlpcG/LYY6Z
BgmiTFB/x4dAwbgxh8+sXpmpYROC+4FJmXrbkpKwTI6TOxn9jZP1DMCOYkzFpodO
JAoDlSmFdtAwp9b8KaDUyTjoFsUecbbgrzRgzZHP8WSa1SsEcjwI0DOn1suNKe+i
7FyKMcgTFNo5p5ai9bGoNQi67BCkKgygHWSNdBKqJM8ISwvEbO5F4wQLYOeWrdaA
GNBMLiUiH4h5DvJdrLDn9Qf+TVSesktd+87dTMmmqQPMaKlVu2HNg1g9KiSGGAET
9TP9j8d/eIsWfmZP/ZoV0y7xe15eAoI/zGJ6KePHCOr1zSMshNNOyEBBSCnzTi8L
CQ8FLK3+1rPjZXQ5LimwsHWqpjLP/6xZ90yj/ZKZlZcUmep3VIdviCzBDAma7aW0
oanYIrAJEEe15DEcPPBn6ezPvohHWnZIVXtjQMZrlHX4jdCaMCPPo5+KWVj5csBF
3fTOA7Tgvw7vqKKUP+PcIscFwgBvpthnabusNaun4Okqu+cepk5Hp1/g689W+qOJ
EcAht4LfgpBwbDPMnNNl
=Lvi/
-----END PGP SIGNATURE-----

--wvr4ifdsqhvtvrzb--
