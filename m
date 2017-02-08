Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Wed, 8 Feb 2017 09:00:51 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.xyz>
Cc: Chen-Yu Tsai <wens@csie.org>, Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Andre Przywara <andre.przywara@arm.com>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH v4 5/9] dt-bindings: remove transitional headers for
 Allwinner H3 CCU
Message-ID: <20170208080051.7atx3w2nosz43sib@lukather>
References: <20170207183042.62699-1-icenowy@aosc.xyz>
 <20170207183042.62699-6-icenowy@aosc.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="udk6vfcl5f4rjemz"
In-Reply-To: <20170207183042.62699-6-icenowy@aosc.xyz>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--udk6vfcl5f4rjemz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 08, 2017 at 02:30:38AM +0800, Icenowy Zheng wrote:
> As we have already changed the DTSI file, the trnasitional dt-bindings
> header sun8i-h3-ccu.h for clock and reset will not be needed any more.
>=20
> Remove them.
>=20
> Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>

This can be folded in the previous patch.

Thanks,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--udk6vfcl5f4rjemz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYmtAzAAoJEBx+YmzsjxAgIXgQAIuCl/iixDKqMd8H+c7Lc2gT
h20ZOso4JM5tVlRVZhi0JJxKaeIF7s91lRUncoEEksiTzCimrul+c0JVOHksmMaG
KlcNtmg0PZj+e/zarJY+wGo3HI7gtGCri6jj5PRULvmmY57nDKUudbEuhI1ATLI0
+lo837fBtz/HNt2ivDZfQSTpa6udS4btqQbhy5jShKitZVSq/xE9gBKVJNpeQ+FQ
GTb48F1vSITD0wbA0FI3WHq4OFDLTytX/cIBsdP9UnM7ufK4UVqGkKuJ3YsLpvy6
BvedeskW/EyNmZ6n+zhsB7yCT0gKSLz2p2sNnb52AqOARmunw8SWuxv/K6yPX/PL
xk5qDEvDsnOjlN1taZFrAYs3Hgeco82h60gCOQ3d7uiqsgW0jUtbnNrfTzcQDvze
eCTiIdWOA3MMx5uYD3DYMxPFFSMcB5JPsVK9gm8zpMyXWkJL0t8Cp0sYK9QQzDcf
xaZwAeC11OaYF4hFOpkbg/NszshW90VuM9OxrwZaUOOkQLMUlaI55UrtVG8TUXeV
tCD9cyP/JX31NWhCu5J7oGQDZElxLVKK6MmL+vIBjZCaaPjRuV3vdEhJMzR6lTcW
mZTKlQ1OiDyRYmo8OZCd+xDHpZOaXBsyFtjPQT8eP1mZDAcsQOalSLl2w8NSxfD+
h9ImD3GbkpWvZ9G+eEI5
=9fSg
-----END PGP SIGNATURE-----

--udk6vfcl5f4rjemz--
