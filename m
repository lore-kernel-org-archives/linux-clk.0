Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Wed, 8 Feb 2017 09:01:42 +0100
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
Subject: Re: [PATCH v4 2/9] clk: sunxi-ng: rename sun8i-h3 driver to
 sunxi-h3-h5
Message-ID: <20170208080142.u3ouhen5lewdeg2l@lukather>
References: <20170207183042.62699-1-icenowy@aosc.xyz>
 <20170207183042.62699-3-icenowy@aosc.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="sscjeccr74k6ld2x"
In-Reply-To: <20170207183042.62699-3-icenowy@aosc.xyz>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--sscjeccr74k6ld2x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 08, 2017 at 02:30:35AM +0800, Icenowy Zheng wrote:
> As the CCU in the Allwinner H5 SoC is very similar to the one in H3,
> rename the H3 driver to sunxi-h3-h5 so that it can be extended with H5
> support.

Saying why you create a symbolic link for your headers in your commit
log would be great.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--sscjeccr74k6ld2x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYmtBmAAoJEBx+YmzsjxAgQPYP/0Dh5jj2RxktHd1Ts5HyE4iT
7ICYHIPJO7o+wsUveVlGfuILJmhxFJOd+HjAG7wKmsXhFd52S+pATUyejaG7k/kN
vKxeCRLvs113rB0b2RkfZfqmHzUFtghBS1UIAZET22FjB+OGuB3PY7R4t/QWB/RT
Bq4fp6tZgP0BZYME6s+8Dr+RP4S2C/CaHRbREWDnRJ1tJjk11Eyv6aS5aLZrr3hJ
4mgj07IEghbrPlqXDDPeIvuhkYaJZ2aWUXyXRpnyipoIT/hsZayzbmMbDO/jR066
fFrMikl/RNsdKSPVeTkTvEzlfw3WcNYLVXgTNbSs+UJ1BkfgGmIAN+pQnAvptczz
RYFXWPzrdUDNRjzb52ZqRiYHSCprcwJyoNaR6kv0cHiP5VzKd2MNevgXFIUGUfDn
8J+HhT7//cUyo6XroxBPEmk7sOcXyRWRCzjtrfVLhziBhBGxorO5atN7W7lsWbF+
cBZ+9aFJ4T1sjABGiw+Co7ES5az14t/aUfjEe12o4DXu4csVXrvX90r5f6hIuvcZ
U1DFWID072lTo1Ka2EAI1Wd5iD41LWhECxt98abt1CR7J4Xk4QiLAhwpasTGCzsc
AEUkrcoDdY+ctkR+NTj059F38vsZpqL1SucvM2Rn4WFgrd1BDL1zj7cekECBFrAh
Il+o097aE5yLmvLrr/HN
=HpTa
-----END PGP SIGNATURE-----

--sscjeccr74k6ld2x--
