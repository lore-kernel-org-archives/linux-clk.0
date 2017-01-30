Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
Date: Mon, 30 Jan 2017 10:06:59 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.xyz>
Subject: Re: [PATCH v3 05/10] arm: dts: sun8i: split Allwinner H3 .dtsi
Message-ID: <20170130090659.m7nv3z7mji2dhcsc@lukather>
References: <20170129023331.62106-1-icenowy@aosc.xyz>
 <20170129023331.62106-6-icenowy@aosc.xyz>
MIME-Version: 1.0
In-Reply-To: <20170129023331.62106-6-icenowy@aosc.xyz>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Vinod Koul <vinod.koul@intel.com>, Andre Przywara <andre.przywara@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-sunxi@googlegroups.com,
 linux-kernel@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>,
 linux-gpio@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 Mark Brown <broonie@kernel.org>, dmaengine@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============8661643379529873572=="
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>


--===============8661643379529873572==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="exyk2xw4ewndemgf"
Content-Disposition: inline


--exyk2xw4ewndemgf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 29, 2017 at 10:33:26AM +0800, Icenowy Zheng wrote:
> +#include <dt-bindings/clock/sunxi-h3-h5-ccu.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/pinctrl/sun4i-a10.h>
> +#include <dt-bindings/reset/sunxi-h3-h5-ccu.h>

You're also converting to the new headers you created. This should be
part of a separate patch, or merged with your next one.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--exyk2xw4ewndemgf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYjwIzAAoJEBx+YmzsjxAgOvEP/0oAIdeRrVp9T2PoSZlBdB0D
uoxXvSe2g9irdHPnALjypcMWEb0vST//ZeFhEMy7PYNvZ/E1zkxuaZon1vvhdnD4
G0yjiAoOq0sEqRzJsId06t5KX9g4qsBBi4eOluOi3qgNW9zJ9zAiCNNltPWSqdfX
3amBHhv2kRsATnrzdn90lxOcmEFihyiR4dnD4vwbfvK40AVRTPvcjlM3Sq2N3PTC
wsfnd+NiNDIrLpMAD9x8WzaysI7g55H3rSwl0LnKInJ3MU55545IxX9QGRY8PZPw
EX12np07r2kR1T3VgoWdWqdzJmfJ7w+Q8RXkT+vf4iCIYB+Sj52m0tGbdJjpLrQU
0bnP7G2qdKYojEKLeRFBpWJFcWXNS3/5OhYLjq1NhAkF9TDvBGsuvM0T/oTT49pJ
agYVBMKbThkm76HGxwHoD5KEcb2cZC793tUvQx+X+HmjqaJY15VHGHTQtzBToA3m
eH6vN3IfRz59U3rvHPlYpHqZq5DPP+eFzO9hCLl6G9ZCC+0Nj2bBb9A3/PfU4I6d
IxW7Vwt9MA4ijXvt24mUTfiLtHduVlaLWHSjAh+qktllrkEcVHcWePfAQcX+lGjI
ppxLpFwztiEBikjmikseDGZs23SlFPiGRX/3N8Qul9mOs80ey4aJdhvUoOjARBn+
5O30EaX4apnwxONI5fgj
=Ik4j
-----END PGP SIGNATURE-----

--exyk2xw4ewndemgf--


--===============8661643379529873572==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============8661643379529873572==--
