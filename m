Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Mon, 15 May 2017 11:24:00 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH v7 11/13] ARM: sun8i: v3s: add device nodes for DE2
 display pipeline
Message-ID: <20170515092400.nzxmocrdqgt4u476@flea.home>
References: <20170514163045.40366-1-icenowy@aosc.io>
 <20170514163045.40366-12-icenowy@aosc.io>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="wkdg7dacrwu6npqt"
In-Reply-To: <20170514163045.40366-12-icenowy@aosc.io>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--wkdg7dacrwu6npqt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 15, 2017 at 12:30:43AM +0800, Icenowy Zheng wrote:
> +		de2_clocks: clock@1000000 {

display_clocks would be better there, we don't have to dissociate de1
with de2

> +			compatible =3D "allwinner,sun8i-v3s-de2-clk";
> +			reg =3D <0x01000000 0x100000>;
> +			clocks =3D <&ccu CLK_DE>,
> +				 <&ccu CLK_BUS_DE>;
> +			clock-names =3D "mod",
> +				      "bus";
> +			resets =3D <&ccu RST_BUS_DE>;
> +			#clock-cells =3D <1>;
> +			#reset-cells =3D <1>;
> +		};
> +
> +		de2_mixer0: mixer@1100000 {

and mixer0 here is enough too.

Is there several of them? Why not just use mixer if there's only one?

> +			compatible =3D "allwinner,sun8i-v3s-de2-mixer";
> +			reg =3D <0x01100000 0x100000>;
> +			clocks =3D <&de2_clocks CLK_MIXER0>,
> +				 <&de2_clocks CLK_BUS_MIXER0>;
> +			clock-names =3D "mod",
> +				      "bus";
> +			resets =3D <&de2_clocks RST_MIXER0>;
> +			assigned-clocks =3D <&de2_clocks CLK_MIXER0>;
> +			assigned-clock-rates =3D <150000000>;
> +
> +			ports {
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +
> +				mixer0_out: port@1 {
> +					#address-cells =3D <1>;
> +					#size-cells =3D <0>;
> +					reg =3D <1>;
> +
> +					mixer0_out_tcon0: endpoint@0 {
> +						reg =3D <0>;
> +						remote-endpoint =3D <&tcon0_in_mixer0>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tcon0: lcd-controller@1c0c000 {
> +			compatible =3D "allwinner,sun8i-v3s-tcon";
> +			reg =3D <0x01c0c000 0x1000>;
> +			interrupts =3D <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&ccu CLK_BUS_TCON0>,
> +				 <&ccu CLK_TCON0>;
> +			clock-names =3D "ahb",
> +				      "tcon-ch0";
> +			clock-output-names =3D "tcon-pixel-clock";
> +			resets =3D <&ccu RST_BUS_TCON0>;
> +			reset-names =3D "lcd";
> +			status =3D "disabled";
> +
> +			ports {
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +
> +				tcon0_in: port@0 {
> +					#address-cells =3D <1>;
> +					#size-cells =3D <0>;
> +					reg =3D <0>;
> +
> +					tcon0_in_mixer0: endpoint@0 {
> +						reg =3D <0>;
> +						remote-endpoint =3D <&mixer0_out_tcon0>;
> +					};
> +				};
> +
> +				tcon0_out: port@1 {
> +					#address-cells =3D <1>;
> +					#size-cells =3D <0>;
> +					reg =3D <1>;
> +				};
> +			};
> +		};
> +
> +

You have an extra new line here.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--wkdg7dacrwu6npqt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZGXOwAAoJEBx+YmzsjxAgOwkP/REPXiebsiLXxW2Jv++ylW5L
L8UmwiKpTBeK0/AGmToDRwCG6LBlKtHm61o2wAQ3unExqvB2/adQtPVomVZ2Bc5K
z4/dJ6oyZCIhL2mniwYQD+E2hGPtoUQIDOtoFUxMZnzkdtTqg1kk0gs+F1c/BQPU
IwW6+M0IPGVmvPmK5qQAmwa1ZLfQRMb2+fB0U/5Dmr1KGHYOyrWkMmMLrimNsIIg
kI4tcEPdp0sZFyfzn2qndkvXyVpcfTJ3Uo+BWUDrPuEikEzo1IdpEDpz80PLTbJk
85un3cR+4dckXzg5EXd29+ygFqmvVGXHRB5ex9QXakjuvoCXhR8P2q47WUJmfCfh
fEQ5XXew3pUgh2Ga31G5H0o7xVnl2wdFt3lCIRvvnBmvuEgK/ATOTytSPUHIblQu
MVCaCHlx7/PVa+PSoVvcwzA9gHe3GFBMfPmvuvqXrl1Tp2wNYoj6F5NNQM/5V+rA
58mjsIyDYK5lhXureugayrULVICApyZ3vVbDEN/W2SforJljzqqc/adWsxlYZBjt
p2JHGrtRr5EJJMbUJwHBSncze6RUsLWKzW6W0s1DQrpiY7HtqYDi4T8rxRBKL1+1
MpsMgsWR3jkek79ZEtojTC+7qcXbBcC/kGDR185B/fzpYPswiz9+t7StHKUPDgWf
cA+pjNAZWxMXwEvl8ESU
=vHX0
-----END PGP SIGNATURE-----

--wkdg7dacrwu6npqt--
