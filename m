Return-Path: <maxime.ripard@free-electrons.com>
Date: Tue, 16 Feb 2016 11:02:17 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Chen-Yu Tsai <wens@csie.org>,
	Emilio =?iso-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	linux-sunxi <linux-sunxi@googlegroups.com>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 1/3] clk: sunxi: improve mux_clk error handling and
 reporting
Message-ID: <20160216100217.GK4344@lukather>
References: <1455289913-29514-1-git-send-email-andre.przywara@arm.com>
 <1455289913-29514-2-git-send-email-andre.przywara@arm.com>
 <CAGb2v65hxNiY8XAL=yBbV4qazscJd+six432CKWAm+GfM6bd2Q@mail.gmail.com>
 <56C2EFD5.5080604@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qDymnuGqqhW10CwH"
In-Reply-To: <56C2EFD5.5080604@arm.com>
List-ID: <linux-clk.vger.kernel.org>


--qDymnuGqqhW10CwH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 16, 2016 at 09:45:57AM +0000, Andre Przywara wrote:
> Hi Chen-Yu,
>=20
> On 13/02/16 02:44, Chen-Yu Tsai wrote:
> > Hi,
> >=20
> > On Fri, Feb 12, 2016 at 11:11 PM, Andre Przywara <andre.przywara@arm.co=
m> wrote:
> >> We now catch and report a failing ioremap, also a failure in the final
> >> step of the clock registration is now handled and reported.
> >> Also warnings are turned into errors.
> >>
> >> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> >> ---
> >>  drivers/clk/sunxi/clk-sunxi.c | 19 +++++++++++++------
> >>  1 file changed, 13 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/drivers/clk/sunxi/clk-sunxi.c b/drivers/clk/sunxi/clk-sun=
xi.c
> >> index 49ce283..361f396 100644
> >> --- a/drivers/clk/sunxi/clk-sunxi.c
> >> +++ b/drivers/clk/sunxi/clk-sunxi.c
> >> @@ -690,11 +690,15 @@ static struct clk * __init sunxi_mux_clk_setup(s=
truct device_node *node,
> >>         int i;
> >>
> >>         reg =3D of_iomap(node, 0);
> >> +       if (!reg) {
> >> +               pr_err("Could not map registers for mux-clk: %s\n", no=
de->name);
> >=20
> > of_node_full_name(node->name) is better. node->name is almost always "c=
lk",
> > which is useless. (Unless someone goes through the dts files to replace=
 all
> > of them.)
>=20
> Good point. I both fixed the code here as well as amended the node names
> in the A64 DT.

I'm not sure what there is to amend in the DTSI. The node name is
defined as the class or function of the device, so all clocks should
be called clk@<something>.

This doesn't work for clocks that don't have a meaningful unit address
(like the oscillators), but it should be the exception, rather than
the norm.

>=20
> >=20
> >> +               return NULL;
> >> +       }
> >>
> >>         i =3D of_clk_parent_fill(node, parents, SUNXI_MAX_PARENTS);
> >>         if (of_property_read_string(node, "clock-output-names", &clk_n=
ame)) {
> >> -               pr_warn("%s: could not read clock-output-names for \"%=
s\"\n",
> >> -                       __func__, clk_name);
> >> +               pr_err("%s: could not read clock-output-names for \"%s=
\"\n",
> >> +                      __func__, clk_name);
> >=20
> > Same here. clk_name defaults to node->name. If you could, please replac=
e it.
>=20
> Really? Isn't clk_name directly from the DT clock-output-names strings he=
re?

Only if there is a clock-output-names property in the node. If not,
the string will not be modified by of_property_read_string, and you'll
default to the initial value of clk_name, in this case node->name or
node->full_name.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--qDymnuGqqhW10CwH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWwvOpAAoJEBx+YmzsjxAgn6gP/iVDuEEweyWDd4wPUWOKQ+mY
fuyt4DdIo/BQVSt6C41dORBveos07x4HcNrT0AcfQoKNfwR3V6ms3uhuF+u1kTeR
sq+BGnZOrAZh14MRWidiwlA4R4jpFMMTkxFfevulit34p7EjkTMiSbQ619sXAw6m
OfoXOvsk83lwSa3+0IOzj/HH1xkCzKQhQf3mCSvwiymFGRMI3U19EyIF3rofaMJ0
R/gV3zShqFCRDuSVJmzfPzaSXcivqI0q5gt7pQYV91fsy34ZtAuz6Eo0fk8MFybU
oxmy4yEHdgPSPK/P9dMIsfTAsV4rnG7D8bjgnKBG53x0u5YKAXbSfkyix9ERgWBa
8b/uGjhdIsC+yfFybHwYI2sURq/tSgV5GJA7JiFrJ3oPRqxKBaN4U9PP8YPvSg/0
l8tcv2M+bRd8VmaDFvXvVnpJBwtYSM2vk38o9m2/GDY+jXzI9XObKTL2btAIYzeI
It/1xvWkOtupM3SGFw1OBCLbVUjUmTeE3Wmuo6QAm+5cwVv6BT3Dygev0zNYxlQ7
f5SgkbKv5a6PaAfmMFk6WAaAz6U/Enmi3tHozvg3yBXrezB4FBvwo+DOForT1ieJ
OKLk38gBvNOfEfg+104tBPmJHdGO/iVUIFhs4PiyNtlkPRwQcA6gUgUNKsuNLGXo
BciZykB1b52AwkXkuglL
=+7hy
-----END PGP SIGNATURE-----

--qDymnuGqqhW10CwH--
