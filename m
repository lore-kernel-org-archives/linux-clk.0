Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
Date: Mon, 30 Jan 2017 10:09:10 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: =?iso-8859-1?Q?Andr=E9?= Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v3 05/10] arm: dts: sun8i: split Allwinner H3 .dtsi
Message-ID: <20170130090910.cer2nvedq3tjleih@lukather>
References: <20170129023331.62106-1-icenowy@aosc.xyz>
 <20170129023331.62106-6-icenowy@aosc.xyz>
 <2b8672bc-58ae-66a9-46d7-c7f3c5825a9d@arm.com>
MIME-Version: 1.0
In-Reply-To: <2b8672bc-58ae-66a9-46d7-c7f3c5825a9d@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <Mark.Rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Vinod Koul <vinod.koul@intel.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-sunxi@googlegroups.com,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, linux-gpio@vger.kernel.org,
 Chen-Yu Tsai <wens@csie.org>, Mark Brown <broonie@kernel.org>,
 Icenowy Zheng <icenowy@aosc.xyz>, dmaengine@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0239162580615198563=="
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>


--===============0239162580615198563==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uz4qhpp6t4hzqdua"
Content-Disposition: inline


--uz4qhpp6t4hzqdua
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 30, 2017 at 01:42:40AM +0000, Andr=E9 Przywara wrote:
> > +&ccu {
> > +	compatible =3D "allwinner,sun8i-h3-ccu";
> > +};
>=20
> I believe this kind of sharing nodes is a bit frowned upon in connection
> with sharing .dtsi's. If the compatible name differs, I think it
> deserves to be a separate node spelt out in each SoC's .dtsi.
> This also makes the DT more readable, since a reader doesn't have to
> refer to two files to see what's in that node.
>=20
> > =20
> > -		codec_analog: codec-analog@01f015c0 {
> > -			compatible =3D "allwinner,sun8i-h3-codec-analog";
> > -			reg =3D <0x01f015c0 0x4>;
> > -		};
> > +&mmc0 {
> > +	compatible =3D "allwinner,sun7i-a20-mmc";
> > +	clocks =3D <&ccu CLK_BUS_MMC0>,
> > +		 <&ccu CLK_MMC0>,
> > +		 <&ccu CLK_MMC0_OUTPUT>,
> > +		 <&ccu CLK_MMC0_SAMPLE>;
> > +	clock-names =3D "ahb",
> > +		      "mmc",
> > +		      "output",
> > +		      "sample";
>=20
> This applies even more here, since the MMC controllers also have
> different clock requirements.
>=20
> So why can't we just leave the CCU, MMC and possibly the pinctrl nodes
> completely out of the shared h3-h5.dtsi and introduce them from scratch
> in the SoC specific .dtsi?
>=20
> I think we still have enough identical nodes to justify this kind of
> .dtsi sharing.

We did it that way in the past in order to reduce the unneeded
duplication, but I can definitely understand your point. We'll wait
for the DT maintainers answer on this one.

Thanks,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--uz4qhpp6t4hzqdua
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYjwK2AAoJEBx+YmzsjxAgJtoQAJirwMZxRPmaDWq3PwYeWi9E
nhFRKMhj8jWBpbdAqFdSZuoDnv7VXEixUb8aAsvNWfi461jcDN70FgkXxSBIBOmk
Cy/pyxzs4V42X1JtTXSjIVrgyEOWYPu+38RhytI9hIiptsbvfSO2sQGPRoFGcNlW
PXFL9/sfMRemTK7mRJSQeY/xKbKZ5vJ+j9OmRbTDygas5SDB4MTyYxB3JYeUfoXi
QVjlyUroYR3BO/0nM9GLiOS1x1pevBG58xpgZaP2cOoR1XDXFgIf1RLvicHQxoTj
LLCCfyNT6HzfCivffYKfVnlZ34Oyj1ao1RRzYSd83y9lNSSrC/8rabbxb2bCgUeC
ltnyKg13TxCRt1sWxdF7ZyyIupxevyHqlZzNzWI5SkgCK6ko1xJGVDrgL3bYieot
b9Ll4pZ0h9UiiZh5u9boqa0LnZ2NrhCSDlPuchG/z21VKyrwHzqS+XHEBr1DOfke
x0DcP33237BvrbYDhAtIP7w5Hj7UXLWYVQex3o9fX+jqZn589rr84l7w4YUpuKeb
ToZYw6nDqxQ3gmOTWutFdBBuDxM0qc5M5ZQ9xcF6Q2s4kKV7LRR5gveC+3tM7Toq
Y/JJHNEZUYGi2iZmmSJn+h16SJjupnxUlSP96AmrPSokxzwSE77qvGxmKtnQtkLB
7796/d/1WtuKQdAzPs+W
=n00M
-----END PGP SIGNATURE-----

--uz4qhpp6t4hzqdua--


--===============0239162580615198563==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============0239162580615198563==--
