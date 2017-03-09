Return-Path: <maxime.ripard@free-electrons.com>
Date: Thu, 9 Mar 2017 11:59:34 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	dri-devel <dri-devel@lists.freedesktop.org>,
	Daniel Vetter <daniel.vetter@intel.com>,
	David Airlie <airlied@linux.ie>,
	Mark Rutland <mark.rutland@arm.com>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree <devicetree@vger.kernel.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-sunxi <linux-sunxi@googlegroups.com>
Subject: Re: [linux-sunxi] [PATCH 14/15] ARM: sun5i: a10s: Add the HDMI
 controller node
Message-ID: <20170309105934.ahsussan6p36lrzn@lukather>
References: <cover.bc06ffa88f847ddd9ddd7c259415d5f61b55307b.1488876832.git-series.maxime.ripard@free-electrons.com>
 <61406c0ba992f2fa5b5180b790a1ef3fa38d9567.1488876832.git-series.maxime.ripard@free-electrons.com>
 <CAGb2v64KKp0cYB3u0=bSVcq0gB41LkurCeiTJ3OEzn7UjdSPpQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ikoiozqmyzngxi4v"
In-Reply-To: <CAGb2v64KKp0cYB3u0=bSVcq0gB41LkurCeiTJ3OEzn7UjdSPpQ@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>


--ikoiozqmyzngxi4v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

1;4601;0c
On Wed, Mar 08, 2017 at 11:35:39AM +0800, Chen-Yu Tsai wrote:
> Hi,
>=20
> On Tue, Mar 7, 2017 at 4:56 PM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > The A10s has an HDMI controller connected to the second TCON channel. A=
dd
> > it to our DT.
> >
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> > ---
> >  arch/arm/boot/dts/sun5i-a10s.dtsi | 34 +++++++++++++++++++++++++++++++=
+-
> >  arch/arm/boot/dts/sun5i.dtsi      |  1 +-
> >  2 files changed, 35 insertions(+), 0 deletions(-)
> >
> > diff --git a/arch/arm/boot/dts/sun5i-a10s.dtsi b/arch/arm/boot/dts/sun5=
i-a10s.dtsi
> > index 074485782a4a..3482c9d2b120 100644
> > --- a/arch/arm/boot/dts/sun5i-a10s.dtsi
> > +++ b/arch/arm/boot/dts/sun5i-a10s.dtsi
> > @@ -72,7 +72,33 @@
> >                 };
> >         };
> >
> > +       display-engine {
> > +               compatible =3D "allwinner,sun5i-a10s-display-engine",
> > +                            "allwinner,sun5i-a13-display-engine";
> > +               allwinner,pipelines =3D <&fe0>;
> > +       };
> > +
> >         soc@01c00000 {
> > +               hdmi0: hdmi@01c16000 {
>=20
> Nit: is the 0 suffix needed? I don't see any indication that there is
> a second controller.
>=20
> > +                       compatible =3D "allwinner,sun5i-a10s-hdmi";
> > +                       reg =3D <0x01c16000 0x1000>;
> > +                       clocks =3D <&ccu CLK_AHB_HDMI>, <&ccu CLK_HDMI>,
> > +                                <&ccu CLK_PLL_VIDEO0_2X>,
> > +                                <&ccu CLK_PLL_VIDEO1_2X>;
> > +                       clock-names =3D "ahb", "mod", "pll-0", "pll-1";
> > +                       status =3D "disabled";
> > +
> > +                       port {
> > +                               #address-cells =3D <1>;
> > +                               #size-cells =3D <0>;
> > +
> > +                               hdmi0_in_tcon0: endpoint@0 {
> > +                                       reg =3D <0>;
> > +                                       remote-endpoint =3D <&tcon0_out=
_hdmi0>;
> > +                               };
> > +                       };
> > +               };
> > +
> >                 pwm: pwm@01c20e00 {
> >                         compatible =3D "allwinner,sun5i-a10s-pwm";
> >                         reg =3D <0x01c20e00 0xc>;
> > @@ -129,3 +155,11 @@
> >
> >  &sram_a {
> >  };
> > +
> > +&tcon0_out {
> > +       tcon0_out_hdmi0: endpoint@2 {
> > +               reg =3D <2>;
> > +               remote-endpoint =3D <&hdmi0_in_tcon0>;
> > +               allwinner,tcon-channel =3D <1>;
> > +       };
> > +};
> > diff --git a/arch/arm/boot/dts/sun5i.dtsi b/arch/arm/boot/dts/sun5i.dtsi
> > index f3b6e19244f9..3d009b2aa42a 100644
> > --- a/arch/arm/boot/dts/sun5i.dtsi
> > +++ b/arch/arm/boot/dts/sun5i.dtsi
> > @@ -273,6 +273,7 @@
> >                                         tcon0_out_tve0: endpoint@1 {
> >                                                 reg =3D <1>;
> >                                                 remote-endpoint =3D <&t=
ve0_in_tcon0>;
> > +                                               allwinner,tcon-channel =
=3D <1>;
>=20
> This looks like a separate patch, probably following the binding
> change?

I don't know, the binding says that without anything specified, reg
would be used. I was assuming that we only needed it once we had the
new endpoint to make it consistent, therefore it didn't need an extra
patch.

But I can definitely create one if you want.
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--ikoiozqmyzngxi4v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYwTWVAAoJEBx+YmzsjxAgunUP/0D7KJGfoMuMy1+eEyshi+D9
c1RT+29VmIa3vEPDT0yvR50Rz246p+UbarifLf+d1m0rLLJ9KCLQt30/+ISCbuDz
g34ZZyle0AKeCpUI+0bTpb09ARLEbE4ELpC3VVdqyfTfmDZmjUZyevf2mvMJwTiN
bQMuiriZXS9/zU4RxPd4K0RElhapXws9nLZ/AUwYH0GRgmVWEPc4aTu34tHK4s+I
bPat0bnkzoLHlkMmWbT7D4dBMNvxYLczAib8N9FFH1r65Mqw8qyhAjeJBvI5XdYl
aL56tcUDX72zQHY9oDHk2pqLgtlIlldJvDeSLRELlLiCgSKi/lkyd35WCYrCwI/h
EzPa5wcLlZ7NDOFUjABk4+5GYDLY0ig5bUwosbwCnxLgqbWwJq6HDkH1EevoYfpS
JhPSZV88g79eELMTOIpFMTnpRkiebuEsMcgNf8jWJSq/BmflI1DXz1rfQkq6Fo8G
BJB/4Qx/haXe9ZC8gMpmIQNYbEQW6Uc2+pclU3C137NGXfrDKC90IeZ+K4UXJbnE
mhEj5f4fbsWIvZdLOA672nvQiA8VS3fyq74ZoHQznIUz1ssgDCuD4fGyVb++W7Ot
RyupTgrDcmKw/uuD4PegQLJNj0exWNQWEIg/PvOcB5lK2ilaPTp4s7Injainzi4W
Feoiw/eidxij4UXvNh33
=Q/Ir
-----END PGP SIGNATURE-----

--ikoiozqmyzngxi4v--
