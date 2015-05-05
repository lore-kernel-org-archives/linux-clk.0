Return-Path: <maxime.ripard@free-electrons.com>
Date: Tue, 5 May 2015 10:03:09 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Lee Jones <lee.jones@linaro.org>,
	Mike Turquette <mturquette@linaro.org>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 4/5] ARM: dts: sun9i: Add A80 PRCM clocks and reset
 control nodes
Message-ID: <20150505080309.GE3274@lukather>
References: <1430410206-4410-1-git-send-email-wens@csie.org>
 <1430410206-4410-5-git-send-email-wens@csie.org>
 <20150504130546.GC3274@lukather>
 <CAGb2v676gpGKm+9vHLnfvhJ=tCyRAkE2G7Pi87oNsWmJJ5+ROg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wchHw8dVAp53YPj8"
In-Reply-To: <CAGb2v676gpGKm+9vHLnfvhJ=tCyRAkE2G7Pi87oNsWmJJ5+ROg@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>


--wchHw8dVAp53YPj8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 04, 2015 at 11:25:18PM +0800, Chen-Yu Tsai wrote:
> On Mon, May 4, 2015 at 9:05 PM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > On Fri, May 01, 2015 at 12:10:05AM +0800, Chen-Yu Tsai wrote:
> >> This adds the PRCM clocks and reset controls to the A80 dtsi.
> >>
> >> The list of apbs clock gates is incomplete. Tests show that bits 0~20
> >> are mutable. We will need documents from Allwinner to complete the
> >> support.
> >>
> >> Also update clock and reset phandles for r_uart.
> >>
> >> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> >> ---
> >>  arch/arm/boot/dts/sun9i-a80.dtsi | 64 +++++++++++++++++++++++++++++++=
++++++++-
> >>  1 file changed, 63 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/arch/arm/boot/dts/sun9i-a80.dtsi b/arch/arm/boot/dts/sun9=
i-a80.dtsi
> >> index d3dece2eea72..f0869ff8006f 100644
> >> --- a/arch/arm/boot/dts/sun9i-a80.dtsi
> >> +++ b/arch/arm/boot/dts/sun9i-a80.dtsi
> >> @@ -169,6 +169,14 @@
> >>                                            "usb_phy2", "usb_hsic_12M";
> >>               };
> >>
> >> +             pll3: clk@06000008 {
> >> +                     /* placeholder until implemented */
> >> +                     #clock-cells =3D <0>;
> >> +                     compatible =3D "fixed-clock";
> >> +                     clock-rate =3D <0>;
> >> +                     clock-output-names =3D "pll3";
> >> +             };
> >> +
> >>               pll4: clk@0600000c {
> >>                       #clock-cells =3D <0>;
> >>                       compatible =3D "allwinner,sun9i-a80-pll4-clk";
> >> @@ -751,13 +759,67 @@
> >>                       interrupts =3D <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
> >>               };
> >>
> >> +             prcm@08001400 {
> >> +                     compatible =3D "allwinner,sun9i-a80-prcm";
> >> +                     reg =3D <0x08001400 0x200>;
> >> +
> >> +                     cpus_clk: cpus_clk {
> >
> > I wonder whether it would not be more readable to have this as
> > clk@<prcm_offset>, just like all the other clocks?
>=20
> I agree it is more readable, though it is purely aesthetics. What offset
> did you have in mind? Offset from PRCM base (0x08001400)? Or the complete
> address?

I'd say the offset within the PRCM.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--wchHw8dVAp53YPj8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVSHk9AAoJEBx+YmzsjxAg0OwP/2KAEqM9YRulzdPSW8VOJH06
wOvIvEv4CDBwbyP1GcL7P31zzmWzGS9xfQxJiQFVahNEiEsBZKAS77SGugwJMCRM
Tf2+BKDlpjGGeQGr64KfO2I7b5YACZkEVZoM+qy632z11scWUUMDs3ZAXIeZJtuu
oWFDR2KWmACCfrgtQr2zHpiGK56trkohUlHHj+tPTX//bV28WvgYh7sJ5WidhQtx
Es8+N1pCpsudC+kLzX8OMvLB+IFGJAunkNfaqmvVrLyveA9XtBIx4dnNO4xlBQjB
7hMjN7fJ+yG+72yGQCpPRonYL83w+366TYVsDIu0+nMFbpoC0JqvOpzaWbiBs0Se
hOLCm83ORG4eE432hyyshOFchPIZFzkBSNTUBYc1giXuQG0IQjs8Hi7Xyz0+jKFm
K/Gb6eQzB8eSEZAV2UYqIcjaBA+3eekX5rmn+1VBmszc0f/JSalsS4CsaxfyeqJL
EzLxw7CpOXOZzvr2dlX9mh33i28dt+6ccprkx1EtM/Khu6VXsjvAZiO0toKGbED/
RHupbRros5qR4+nPo7iZnzEPXeCxD/5bsnPET4sYs0XHjC8BLVEh8wr10kWIM2Wr
sLJy9mbAyUkLjXvJRP1LqPIYPilFjASU5CZsQ+Rt9YO7yMAIs5CSD0xxqSJxpXl2
lFg7WDlenCSQr+VSKglO
=wxPf
-----END PGP SIGNATURE-----

--wchHw8dVAp53YPj8--
