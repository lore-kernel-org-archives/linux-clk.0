Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
Date: Mon, 3 Apr 2017 10:00:29 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.io>
Subject: Re: [PATCH v3 03/11] dt-bindings: add bindings for DE2 on V3s SoC
Message-ID: <20170403080029.6goqw657ptljou3o@lukather>
References: <20170329194613.55548-1-icenowy@aosc.io>
 <20170329194613.55548-4-icenowy@aosc.io>
MIME-Version: 1.0
In-Reply-To: <20170329194613.55548-4-icenowy@aosc.io>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 linux-sunxi@googlegroups.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Icenowy Zheng <icenowy@aosc.xyz>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============8794852643566439065=="
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>


--===============8794852643566439065==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="65r6y6fg2z6tcynb"
Content-Disposition: inline


--65r6y6fg2z6tcynb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 30, 2017 at 03:46:05AM +0800, Icenowy Zheng wrote:
> From: Icenowy Zheng <icenowy@aosc.xyz>
>=20
> Allwinner V3s SoC have a display engine which have a different pipeline
> with older SoCs.
>=20
> Add document for it (new compatibles and the new "mixer" part).
>=20
> The paragraph of TCON is also refactored, for furtherly add TCONs in
> A83T/H3/A64/H5 that have only a channel 1 (used for HDMI or TV Encoder).
>=20
> Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
> ---
> Changes in v3:
> - Remove the description of having a BE directly as allwinner,pipeline.
>=20
>  .../bindings/display/sunxi/sun4i-drm.txt           | 37 ++++++++++++++++=
+++---
>  1 file changed, 33 insertions(+), 4 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.tx=
t b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
> index b82c00449468..38de5e96f359 100644
> --- a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
> +++ b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
> @@ -31,11 +31,11 @@ Required properties:
>     * allwinner,sun6i-a31-tcon
>     * allwinner,sun6i-a31s-tcon
>     * allwinner,sun8i-a33-tcon
> +   * allwinner,sun8i-v3s-tcon
>   - reg: base address and size of memory-mapped region
>   - interrupts: interrupt associated to this IP
> - - clocks: phandles to the clocks feeding the TCON. Three are needed:
> + - clocks: phandles to the clocks feeding the TCON
>     - 'ahb': the interface clocks
> -   - 'tcon-ch0': The clock driving the TCON channel 0
>   - resets: phandles to the reset controllers driving the encoder
>     - "lcd": the reset line for the TCON channel 0
> =20
> @@ -52,7 +52,12 @@ Required properties:
>    second the block connected to the TCON channel 1 (usually the TV
>    encoder)
> =20
> -On SoCs other than the A33, there is one more clock required:
> +On TCONs that have a channel 0 (currently all TCONs supported), there
> +is one more clock required:
> +   - 'tcon-ch0': The clock driving the TCON channel 0
> +

Why did you change that if they all have a channel 0?

> +On TCONs that have a channel 1 (currently all TCONs except the ones in
> +A33 and V3s), there is one more clock required:
>     - 'tcon-ch1': The clock driving the TCON channel 1

And that can be added too just by saying "On SoCs other than the A33
and V3".

Looks good otherwise, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--65r6y6fg2z6tcynb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJY4gEUAAoJEBx+YmzsjxAgfhcQAIFaedf1CbcGUn+l7Twz7z0q
sRfl0lfb/xjn43XV3NIN3vSN/Eni/VKw1Xdx/JeuwjpRn9z8ozSCFSn7mqm/PMBd
fxKo5+yPHqm1Y8sLTUnRKtbZXO1bAt6nzClZDYvNXHzxBalZCENTaExXOKriuT21
2+VJRfPQRPbylSl/AXlqczdPHO9yd305pa1Z3uwMH3HN4+upz2/QrgQjtpcLRCb5
kKBe13Z6simQBqf+bAWyQ/IGmSbXu/su18K0WZ93ikF2Ejqyc57Wg7+SqwY12Sau
CiNs08Drt7dU8FHq75Cii+UgrvlDgcqqO3TebiRD6QZp6pa6O9RgHSQ8uvxOpmOH
2LcKZwjYGzNbsoc5Q+0LgdNOlCZ/zU+kuWqcxGeohc4vnoQvvCNgTph7uVulOtfy
za30MRR1D+qBWdWGzzgh8iyr+x0YRLUdAUTWnWTrMDOXaoNOGZ+YbO5GlLTpm2PS
g4plsJIMknEtLPRWTv+cnozwry6H4PE8Nr68eQhggYwdbLlt/OOQ6+Ve0F+A+Jwk
navz4IztydTqkXAkMZq1NM8KAYm6uTBONlKV2Gwf+51/ALo6w+x4c+qBiHS1t8Qe
PK0KafjMC9TxSILVql8TLAyUUUs1tWabDYIIa5LNu+ZcSTHBCeNDfEQCs3Q7lOPU
0lTmwHtUyHV8Js7kKIm/
=a0Wq
-----END PGP SIGNATURE-----

--65r6y6fg2z6tcynb--


--===============8794852643566439065==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============8794852643566439065==--
