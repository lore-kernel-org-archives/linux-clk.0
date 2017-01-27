Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
Date: Fri, 27 Jan 2017 16:55:30 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.xyz>
Subject: Re: [PATCH v2 4/9] arm: dts: sun8i: split Allwinner H3 .dtsi
Message-ID: <20170127155530.co72bqdx4fdhvy4g@lukather>
References: <20170126154859.55855-1-icenowy@aosc.xyz>
 <20170126154859.55855-5-icenowy@aosc.xyz>
MIME-Version: 1.0
In-Reply-To: <20170126154859.55855-5-icenowy@aosc.xyz>
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
Content-Type: multipart/mixed; boundary="===============6850147887687936464=="
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>


--===============6850147887687936464==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="f4ls6hajlsfz6iar"
Content-Disposition: inline


--f4ls6hajlsfz6iar
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 26, 2017 at 11:48:54PM +0800, Icenowy Zheng wrote:
> -		mmc0: mmc@01c0f000 {
> +		mmc@01c0f000 {

There's no point in removing the labels, and you can even use the
label-based syntax to reference them, instead of using the path.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--f4ls6hajlsfz6iar
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYi21xAAoJEBx+YmzsjxAgIasQAMIsEbIPus9slcpkocYUCMQf
0ng0EM68Q0Q4E+rCSNWGXw3MjXs0XAYWp+2tM7K+CZnZ2eGFrmssuLtt9mgEE9N6
UfP7epCuCc7k0oPBsdAmNTXBZO49x4ZWAswvHdU5VSSiWyJUEzQm0+HqeXRYzsFi
2TQZKyGnPL4wFJT8R8AY8hzPZ/6u4aOdk52TTOOebf/4BDgxw1o939pGo1gQ9qhL
5daXa8FlGhJNzMDFCSDMI72oCrnXVDXrpbMCCzvsCTh1rdkZydKcLapEgc80fQW+
AWWwvuRM76u4xOJLO9WBdJisTxQw5cSf2hhMzV8DNfCAqfVEzN555TgA9R4Y8uqs
NPUYcVWzlAsdm6C+ujt3+7dMCX9Xsjeb5T0QG60IUxj9OcqiT7PZRJOf1cbNufgr
mrotVQcFd4q93p0PTSO/93NQYVJKtEdg6Vv/p0YKfbdWch6kILu/br2gq4TJSA60
D7VJREh+SSgqmPlinqTj2/qQPRJFyf3kkcajGOhJjtRSGGsPpcYR9E5dByrdT2Dw
+lMK/d756ZAwmKriNiK+4FHU5oGxbEiZiHQCHKFiPjuMIK2Z7Uu7OitTgck7Lm4V
kK+xOlU3uE6SmoFLC3VMPsHy/PkHTcZXdC9o/c4w45E0/PDuquFkqhcq1LFCBmui
CoFH8so1dvq8k9XFvL2x
=Yscw
-----END PGP SIGNATURE-----

--f4ls6hajlsfz6iar--


--===============6850147887687936464==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============6850147887687936464==--
