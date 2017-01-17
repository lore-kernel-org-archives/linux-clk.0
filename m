Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
Date: Tue, 17 Jan 2017 10:04:56 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.xyz>
Subject: Re: [PATCH v2 2/4] clk: sunxi-ng: add support for V3s CCU
Message-ID: <20170117090456.fgw6lpqgurwwcczj@lukather>
References: <20170116180116.36729-2-icenowy@aosc.xyz>
 <20170116180116.36729-3-icenowy@aosc.xyz>
MIME-Version: 1.0
In-Reply-To: <20170116180116.36729-3-icenowy@aosc.xyz>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Zepan <715805855@qq.com>,
 linux-doc@vger.kernel.org, linux-sunxi@googlegroups.com,
 Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0162904541052099102=="
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>


--===============0162904541052099102==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kydoof46rcmptsw3"
Content-Disposition: inline


--kydoof46rcmptsw3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Jan 17, 2017 at 02:01:14AM +0800, Icenowy Zheng wrote:
> V3s has a similar but cut-down CCU to H3.
>=20
> Add support for it.
>=20
> Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
> ---

Output from checkpatch:
total: 5 errors, 2 warnings, 3 checks, 857 lines checked

> I think I should make a comparsion between V3s and H3 CCU here:
> (I won't mention the missing/added clocks here, only list conflicting clo=
cks)

That should be in your commit log.

> - "bus-ehci0" is at different bit (The bit that is "bus-ehci0" on V3s is
>   "bus-ehci2" on H3)
> - The mux of "ce" is different. (According the view at V3s datasheet by t=
he
>   author of sun4i-ss, V3s may have sun4i-ss, not sun8i-ce)
> - The mux of "de" is different. (V3s do not have "pll-de", but it can mux=
 "de"
>   to "pll-video")
> - Clocks about CSI largely differs. (As V3s is designed as a camera SoC, =
and
>   it have an extra "pll-isp")

OK.

Thanks,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--kydoof46rcmptsw3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYfd40AAoJEBx+YmzsjxAg2v8QAIA259BtpZ5c6JgZtfrwAUjn
po37fnkE5KXBzetxBh+HfaLUGOhwiwcfh4kCLL3Ob3BjXBpsY3zENRQxPEzP+Shj
dcv5lZ7OtbS8fXc6NdLaMo0jidzsSsSFqhGL76VzkKmaZqIeuHzp2IevCdwb3R8o
4M58uMyz0ipD1RI9SFogH3X4IXF4zGMXhjSDXuwIzTfXvxR2Ly8IX4YhfQb9ZsMj
dzl2VGxyi4yS2lkTh7xhN4D2GnDSpH1fXFfA4VJ8xXVgqsplMiGvD7g4/c/ORgLF
5RbHnXZMXOMPN7gMIoPU3rKuNh6Iiho9Q6zElpy2prA3pLjz2s3YCsvXV6u8Lq34
LHfAFzqc/YwQ15H14kPicokXdW3mznfZyLXohgWjEwtFp5lhEV1IJSncg59r3CDc
ULCOiCkILbtESPxTU5AX25iMr3j/cH1zt3I2GlIrIC1BegAiqAAHytLowBFhKiQe
6Z2k4w4NN9QmyHY4yQ2I1MkYxzQAFJR84DzGeQ6MJbfSe4apHqPhVXqpo6AZqsz1
R+broUn7n1yKxu+BWGXVcYCWW6X3UGtFMJmPkJr/ltJgABAccSTaSpd2b5gL3Gb/
5Zg+DNpWKHEgPpyK4US9FyzILzQOhPt329CBh2iWrHg4/rdele/8sRGD/atsDhVe
d31tYGCbALUXn1nevDI/
=AX7x
-----END PGP SIGNATURE-----

--kydoof46rcmptsw3--


--===============0162904541052099102==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============0162904541052099102==--
