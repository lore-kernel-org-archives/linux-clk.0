Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
Date: Fri, 27 Jan 2017 21:05:32 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.xyz>
Subject: Re: [PATCH v2 8/9] ASoC: sunxi: allow the analog codec driver to be
 built on ARM64
Message-ID: <20170127200532.pemk36hwyzkun3i5@lukather>
References: <20170126154859.55855-1-icenowy@aosc.xyz>
 <20170126154859.55855-9-icenowy@aosc.xyz>
MIME-Version: 1.0
In-Reply-To: <20170126154859.55855-9-icenowy@aosc.xyz>
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
Content-Type: multipart/mixed; boundary="===============2079775241947976789=="
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>


--===============2079775241947976789==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xfdin3uw722yn6qj"
Content-Disposition: inline


--xfdin3uw722yn6qj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 26, 2017 at 11:48:58PM +0800, Icenowy Zheng wrote:
> As the 64-bit Allwinner H5 SoC has the same analog codec part (also the
> same digital part) as H3, enable the driver to be built on ARM64
> Allwinner platform, so that it can be used on H5.
>=20
> Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>

Acked-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Thanks,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--xfdin3uw722yn6qj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYi6gIAAoJEBx+YmzsjxAgYnsP/0GupldOFOkM3oxInAY1X52T
Go0fkmAsTQ/hNcJrPDudq9GEXC5x3boU3L4XZRG3idh9agGVqUWQhsUZOLdNTzWf
GefaPJfFecXaEnktKWKrmcrktkckF6moW0KoctZbhDkOvz9zTvUGsfBIKU//4yia
ZNgTmhvK2x5dc4krlp6STG3AZ0APlxXutwA0Dj9FVKiH2Hx30NkGSSoi/XMgInqv
Ih4H6ckOiC4vdG2yiabNNtd1Hjn7ytPg6DzGPkJuppO6JZxOyW4+oLZmcCUWxQUd
sw0ZuAQpVTuPftW89C3rYaHLSl7cJgSO9HQxwjA1CwBzT99KS47g7qyiLXfFycUh
5W5RVES8WMcRxnCkw42wZ5uVoC81C8BPFZ1DknX3wy1qVH/www8ZDLS/4ZqyW8iZ
A87rhe6ce/pWpeTn5pNT1UXmyGmSgDWKw1jUvIl6mERnQ1jSnBFKOe0EJQ1mGasW
rKUp0KJCFU97+kDfTXq3cF1efiJ0eb7PBLH2QNEKbX7/sq7IPYMJuS9JJooOhaoR
bSs/htksdUzsaogjRnj2auRGMSRmof/lNDfMKRSIhBXXFHrCwasobS0XKWg7mFs7
WMVC97oRqwxgUsnC/jA9u4YGDGfjGyD2OzK/wG0fpZgzcdt1mHvY2P8o31M20TPj
HipMSCZeg0OBfUdjMUwN
=Y9W6
-----END PGP SIGNATURE-----

--xfdin3uw722yn6qj--


--===============2079775241947976789==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============2079775241947976789==--
