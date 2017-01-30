Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
Date: Mon, 30 Jan 2017 10:09:44 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.xyz>
Subject: Re: [PATCH v3 06/10] clk: sunxi-ng: remove transitional headers for
 dt-bindings
Message-ID: <20170130090944.ie76ustqtbtdanli@lukather>
References: <20170129023331.62106-1-icenowy@aosc.xyz>
 <20170129023331.62106-7-icenowy@aosc.xyz>
MIME-Version: 1.0
In-Reply-To: <20170129023331.62106-7-icenowy@aosc.xyz>
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
Content-Type: multipart/mixed; boundary="===============7720565819271176294=="
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>


--===============7720565819271176294==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="d2szgefl7inb6lb3"
Content-Disposition: inline


--d2szgefl7inb6lb3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 29, 2017 at 10:33:27AM +0800, Icenowy Zheng wrote:
> As we have already changed the DTSI file, the trnasitional dt-bindings
> header sun8i-h3-ccu.h will not be needed any more.
>=20
> Remove them.
>=20
> Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>

Your prefix is wrong, this is not part of the clk framework, but
rather the DT one.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--d2szgefl7inb6lb3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYjwLYAAoJEBx+YmzsjxAgzQEQALKoyCRDNhZivKbMsqXrz6b9
W3HlhrDsxqqynFn1g4Fr6/qpxo69bnseuyqWMYntco18yL//eIlOAB9Mc6YcRetV
cEJWN8NUTPjqSfXfo1epne8uuwgrOxNSvPw7Z6oQ9zoMHg1y0TZCi1lX2ebGTRK9
e/AZe8+MOsgdiUHswHvzkS0axNgYpOElVgu6pIhPX0fs9qHr/HbVbUGMx/CIGSkk
1pkdGxME8WTNuAUd6e72d8WnYKxhBse4NX1cPaX1LPmF8SELv1hoZEHS10tZw559
ItBWaPpkpsGPHB9C6e0De6bgs7KwI7dtxNH7OwuWrf8eu19ozkmqqWEfQHE/TLzi
FjRdLjyLwvi7tE8I3D4v0WcYAyV2vRIbn8akhgRURyQHYrtKxM+gJZVe0LIY8bJC
Va4+9Xc3TDrjbadQ6Cosbm/q30KACGUp/OGnBqzTny9n0S7KTMIjg4YOgW6G4xKS
3UXc3Q6s4GoE2ONQS5kryJDFh1dFAKYLgEbLgwoF9ztd8mvzDtWVLuMzCUPVx7E/
sWDjI8EtrJsSrSrOduXTgjZyfBL9a+VT+DHnEOehKoQTQEOCdvzSG/V6ejMu1HJs
If5i844CeBnt69y6VR11wuwunH9m+r7g1JMu4yUfEMQGaokXEcJZmX+/pdpuj8GW
mFwS35bu+PXtbSopcPf1
=AG2g
-----END PGP SIGNATURE-----

--d2szgefl7inb6lb3--


--===============7720565819271176294==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============7720565819271176294==--
