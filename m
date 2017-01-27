Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
Date: Fri, 27 Jan 2017 16:59:14 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.xyz>
Subject: Re: [PATCH v2 7/9] dmaengine: sun6i: allow build on ARM64 platforms
 (sun50i)
Message-ID: <20170127155914.fwbssmehlgwf5q7j@lukather>
References: <20170126154859.55855-1-icenowy@aosc.xyz>
 <20170126154859.55855-8-icenowy@aosc.xyz>
MIME-Version: 1.0
In-Reply-To: <20170126154859.55855-8-icenowy@aosc.xyz>
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
Content-Type: multipart/mixed; boundary="===============1169428816459833012=="
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>


--===============1169428816459833012==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ogvszedoamq4z6gj"
Content-Disposition: inline


--ogvszedoamq4z6gj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 26, 2017 at 11:48:57PM +0800, Icenowy Zheng wrote:
> As 64-bot Allwinner H5 SoC has the same DMA engine with H3, the DMA
> driver should be allowed to be built for ARM64, in order to make it work =
on H5.
>=20
> Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>

Acked-by: Maxime Ripard <maxime.ripard@free-electrons.com>
Thanks,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--ogvszedoamq4z6gj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYi25SAAoJEBx+YmzsjxAgcLIQAIK9OBWPs/lZ+XHaJA9Rg0eM
drnCp6rcGkrAiMbhz3qNLLyZgBJY5DqHwe6HGt5EF/mukAHFv3VgnsckgFGvw8wa
TOd0dmka7lDkNMZboID0W/QVZwSgyso6X88hFhPAjoZP7zTHi/KSu6ylAb7/0iiW
MJh1u890NhSDMm4k5fUArdsNBstrTF+bfOeEQNqucTqUva42j19JRO03dRMfXXRH
/bQGgwjGHgRRyTyaWSiL/l8JPyT/TB8BeAaNmELjeIcbxjlA1IJbfJnqdJDq0uI4
iIpMdeuM+2ToUZGu+4ftq4jxqVvpSnVUlLUr2HXIFQ43DptLgSGVtQwZ3IiWxHOa
6Qu/h4gnhbBKdrrjFZxLlKCoPAeK0pQ+F2lgVTpW2Bbgq1gqRp9kQvTmuYiL1rzl
EYpsKtzZjyNMjK87TLmwb6ST6QT+Spfph2KcQPeYRqu5E+5r0orWrOWCLD5/UDNK
6tbh5lhICzTv+MOIUfnXT2FCqxob9sq36kyqBNqVXVZzvcf5Gy32kKK56ZSl0LQ1
PFGLct0Dsjo7C6lpc2Ii/gmDKuNbKbSq5rO8o5Xjy0NsnFyHTtYeT0ZMD5tRep1H
XAm04muuJCFu/y5+m3/8cmgvA1p3Y0rC4xHViX3Lnf5CxFtIrKwCb2vJJWb6OMZk
BHIC7LufIPpe0ByFpQOi
=qCeg
-----END PGP SIGNATURE-----

--ogvszedoamq4z6gj--


--===============1169428816459833012==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============1169428816459833012==--
