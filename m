Return-Path: <maxime.ripard@free-electrons.com>
Date: Tue, 24 Nov 2015 08:26:13 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Josef Gajdusek <atx@atx.name>,
	linux-sunxi <linux-sunxi@googlegroups.com>,
	linux-clk <linux-clk@vger.kernel.org>, linux-pm@vger.kernel.org,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	devicetree <devicetree@vger.kernel.org>, gpatchesrdh@mveas.com,
	Mike Turquette <mturquette@linaro.org>,
	Hans De Goede <hdegoede@redhat.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Emilio Lopez <emilio@elopez.com.ar>,
	Russell King - ARM Linux <linux@arm.linux.org.uk>,
	Eduardo Valentin <edubezval@gmail.com>,
	Zhang Rui <rui.zhang@intel.com>, Kumar Gala <galak@codeaurora.org>,
	Ian Campbell <ijc+devicetree@hellion.org.uk>,
	Mark Rutland <mark.rutland@arm.com>,
	Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 1/5] ARM: dts: sun8i: Add SID node
Message-ID: <20151124072613.GF32142@lukather>
References: <cover.1448263428.git.atx@atx.name>
 <b897b1c8741c8a871163b84d01b480f99329536d.1448263428.git.atx@atx.name>
 <20151123124356.GW32142@lukather>
 <CAGb2v65qfaTdQqXHD=-FHz1M1sHCTro97QETZUH=vA2BbRS+7A@mail.gmail.com>
 <20151124063808.GB32142@lukather>
 <CAGb2v67aS+2vM8CLB=4ynFOvb14t+kiWjJvAa60U2nq22S8ZEw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="h6w+13shfCQ8v2Yw"
In-Reply-To: <CAGb2v67aS+2vM8CLB=4ynFOvb14t+kiWjJvAa60U2nq22S8ZEw@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>


--h6w+13shfCQ8v2Yw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2015 at 02:42:26PM +0800, Chen-Yu Tsai wrote:
> On Tue, Nov 24, 2015 at 2:38 PM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > On Tue, Nov 24, 2015 at 11:13:13AM +0800, Chen-Yu Tsai wrote:
> >> Hi,
> >>
> >> On Mon, Nov 23, 2015 at 8:43 PM, Maxime Ripard
> >> <maxime.ripard@free-electrons.com> wrote:
> >> > Hi,
> >> >
> >> > On Mon, Nov 23, 2015 at 09:02:48AM +0100, Josef Gajdusek wrote:
> >> >> Add a node describing the Security ID memory to the
> >> >> Allwinner H3 .dtsi file.
> >> >>
> >> >> Signed-off-by: Josef Gajdusek <atx@atx.name>
> >> >> ---
> >> >>  arch/arm/boot/dts/sun8i-h3.dtsi | 7 +++++++
> >> >>  1 file changed, 7 insertions(+)
> >> >>
> >> >> diff --git a/arch/arm/boot/dts/sun8i-h3.dtsi b/arch/arm/boot/dts/su=
n8i-h3.dtsi
> >> >> index 0faa38a..58de718 100644
> >> >> --- a/arch/arm/boot/dts/sun8i-h3.dtsi
> >> >> +++ b/arch/arm/boot/dts/sun8i-h3.dtsi
> >> >> @@ -359,6 +359,13 @@
> >> >>                       #size-cells =3D <0>;
> >> >>               };
> >> >>
> >> >> +             sid: eeprom@01c14000 {
> >> >> +                     compatible =3D "allwinner,sun4i-a10-sid";
> >> >> +                     reg =3D <0x01c14000 0x400>;
> >> >
> >> > The datasheet says it's 256 bytes wide, while the size here is of 1k=
B,
> >> > is it intentional?
> >>
> >> My H3 datasheet (v1.1) says its 1 kB wide.
> >
> > Is it? in the Security ID section, it is said to be 2kb =3D=3D 256B wid=
e.
>=20
> Right. I was looking at the memory map. Maybe it's sparsely mapped?
> I guess we'll know soon.

If it is just like the A20, I think there's a few registers at the end
to control the writes (that we don't use).

Which means that the size of the fuses is smaller than the size of the
mapped area (which also measn that our driver is broken making that
assumption).

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--h6w+13shfCQ8v2Yw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWVBEVAAoJEBx+YmzsjxAg2twP/RUNC7sjVheMuZaccIeB+zTI
6KnZloJJknaDMHzFkcriZD/VEbOMU0bUG18vV7jxFvjmRSfne1MFWjurskRa33bE
xZExviiYv4Asy3ap4ed3voSPmFJfF1Xzduf46ZLaJr3vfoSnQZo0+47B4j2VXsUJ
afhv9mfi1I+NzKqDaEzYYC9+XM62OO9W7HfghBjYiBSfArwUtW6Tfka/EixENeHF
B1iHJ7u6GBEZerIlbBNjTLYbrQp7XgwUCT86Oy+ndy3E05R65t518U/mMNc8K4nu
33K9ye8u8NhGFFOpLSbGJlsKl+vkfPMz8vH0VKz+YW5JAfc8fKpBVTt1WIuMfeaw
yKP/uDd+8Jodhr6box4T96UonSOG1U9cUR+JoB8RvBif6JfQfnJwZyiQHG6lU1Ai
Q5DY+VUAz6WD0m75rl3pegrxyHgydqOKPN46UKCRks22yH4f+OkOSW1z8hG/lwsm
Fjr2eKEWtRTRFFzQckHPFTHvTFKTSWeUE0xoftN63cWO2H03xxT1psUZjwOd0wDd
bCZCoJSO+4rx/AtR2FwS5Hn9cVuOQghKyCWWTqI0H/Rm2c99QWUMVE8AFtG1IhKV
NbLIPWjykhX1AfutR0/lJ78BJGnrXHFC8LPOlzlmVJTZ19mj1FxqFyc977sUEi+W
DHiRqGan93fOcWh0v8vM
=Db5t
-----END PGP SIGNATURE-----

--h6w+13shfCQ8v2Yw--
