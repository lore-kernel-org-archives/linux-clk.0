Return-Path: <maxime.ripard@free-electrons.com>
Date: Sat, 17 Sep 2016 16:51:21 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: =?iso-8859-1?Q?Andr=E9?= Przywara <andre.przywara@arm.com>
Cc: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, Chen-Yu Tsai <wens@csie.org>,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH v2 3/4] arm64: dts: add Allwinner A64 SoC .dtsi
Message-ID: <20160917145121.GE17518@lukather>
References: <20160909201029.24530-1-maxime.ripard@free-electrons.com>
 <20160909201029.24530-4-maxime.ripard@free-electrons.com>
 <fad78d40-b595-633c-6d43-6246ec893635@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="//IivP0gvsAy3Can"
In-Reply-To: <fad78d40-b595-633c-6d43-6246ec893635@arm.com>
List-ID: <linux-clk.vger.kernel.org>


--//IivP0gvsAy3Can
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 15, 2016 at 01:08:45AM +0100, Andr=E9 Przywara wrote:
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -982,6 +982,7 @@ M:	Chen-Yu Tsai <wens@csie.org>
> >  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> >  S:	Maintained
> >  N:	sun[x456789]i
> > +F:	arch/arm64/boot/dts/allwinner/
>=20
> If you promise to not break it needlessly ;-)

We started doing so since 4.7, and we're already fighting needlessly
with maintainers because of that.

> > +	cpus {
> > +		#address-cells =3D <1>;
> > +		#size-cells =3D <0>;
> > +
> > +		cpu@0 {
>=20
> This is probably me to blame here since I put you up to it, but you need
> "cpux" names (e.g. "cpu0: cpu@0 {") to match the ones that the PMU node
> references below. dtc will refuse to compile it otherwise.

Gaah, yes, of course.

> > +			i2c1_pins: i2c1_pins {
> > +				allwinner,pins =3D "PH2", "PH3";
> > +				allwinner,function =3D "i2c1";
> > +				allwinner,drive =3D <SUN4I_PINCTRL_10_MA>;
> > +				allwinner,pull =3D <SUN4I_PINCTRL_NO_PULL>;
> > +			};
> > +
> > +			uart0_pins_a: uart0@0 {
> > +				allwinner,pins =3D "PB8", "PB9";
> > +				allwinner,function =3D "uart0";
> > +				allwinner,drive =3D <SUN4I_PINCTRL_10_MA>;
> > +				allwinner,pull =3D <SUN4I_PINCTRL_NO_PULL>;
> > +			};
>=20
> So did I get this right that there is a strict "no user - no pins"
> policy here?
> I don't see a reason why we shouldn't have at least the other UART pins
> described here as well - since they are a pure SoC property. That would
> make it easier for people to enable them (with a simple, scripted fdt
> one-liner command in U-Boot, for instance).

To avoid having huge DT that are longer to load and parse, especially
since every one wires it in the exact same way all the time. And the
combination is just too high.

On the A64, the UART0 can be exposed through PB9 and PF4 for TX, and
PB8 and PF2 for RX. Even though the common usage would be to use PB8
and PB9, or PF4 and PF6. But absolutely nothing prevents from using
PB8 and PF4.

You can then add CTS and RTS into the mix, and multiply that by the
number of devices in the SoC.

> I guess there will never be an official DT with more than 2 UARTs
> enabled, although we have actually five UARTs on the headers on the
> Pine64, for instance (and personally I am looking into using one as a
> terminal server).

We relaxed the rule lately however. Boards that have access to those
UARTs on their headers can put a node in their DT with the right
muxing filled already. Which brings you the simple, script fdt
one-liner in U-Boot.

> Also UART1 is connected to that WiFi/Bluetooth slot, having it enabled
> should make BT work without further ado (but I haven't tested this).

That's probably not true. You'll most likely need to enable a few
regulators to have it working.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--//IivP0gvsAy3Can
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJX3VhpAAoJEBx+YmzsjxAg6xQP/1APfYusWSt1eq5XDuSd71Aq
IUyvlwYn4HgE2NDrg5pPnUP1gnuRWNFMIpoukBjkkn9rDOr6828K1/XmT3/NKErc
nFdgZyZa8/sAHP2xSdXkdW/ESDfqAPuPPn2YzVjrcMWokPPM+FU84vI6o43Jq3hD
h150m4wwFEmJO6In7TwzHWOmbeQ1fvDSq4YpycxHG4T/DUOPx1c2TqaxuWgzxy4w
K4idxD/xWXT/m3lsl/T9mDu4rL2aiaSvRibLU1HnP7rfabAun/CddNYWh/r/SMyL
pcNIbFMOd4YftKzue9/w9fAfNbdMMp2BU5SEuseyTmruZlc7mTR4d2XJt/MavOY3
dPk+14E1kCc/4L+AXoYNPUjofdW6JAShtq4S9ZImIEJUWvw83I03ttlxSwMsWrsF
cCT4ny18sGenjHp/V7Z4dy1Dl5FhjQE9HNPZL0Ci4eRUrDgZyEqHIqGqywYysbLn
tNwQFK/sIu6lAQC/A+lgRBDfhjfcIReLupvS3CO4sqbdEx2LfM2e0s9BvfCbAGjW
zzxbHC2/9PIXVm087hi3A5JfEU9cEzxDP1BLtSLO244hRcSfj9NcU4lnFBZM7LuI
ObQbA4uwweMN/Lv4xQJXr7NNDiA1pN5GXA+e+9C0g8m43rhrFmU+Vectksr3QIPU
nGwoxXVyejqI6YjTTY/g
=SWJl
-----END PGP SIGNATURE-----

--//IivP0gvsAy3Can--
