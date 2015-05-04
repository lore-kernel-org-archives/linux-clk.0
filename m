Return-Path: <maxime.ripard@free-electrons.com>
Date: Mon, 4 May 2015 14:53:31 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Lee Jones <lee.jones@linaro.org>,
	Mike Turquette <mturquette@linaro.org>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/5] mfd: sun6i-prcm: Add support for PRCM found on
 Allwinner A80 SoC
Message-ID: <20150504125331.GB3274@lukather>
References: <1430410206-4410-1-git-send-email-wens@csie.org>
 <1430410206-4410-4-git-send-email-wens@csie.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pvezYHf7grwyp3Bc"
In-Reply-To: <1430410206-4410-4-git-send-email-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>


--pvezYHf7grwyp3Bc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 01, 2015 at 12:10:04AM +0800, Chen-Yu Tsai wrote:
> This patch adds support for the PRCM on the A80 SoC. There is little
> to no document for this at the moment. Only register offsets are
> available. However with some testing, the clock and reset controls
> seem to be the similar to the ones on the A31.
>=20
> One thing that needs verifying is whether the apbs divider is the same
> as the A31 or the A23. The lowest divider is different between those
> 2 implementations.

Is this commit log still true now that we have access to documentation
the PRCM?

Thanks,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--pvezYHf7grwyp3Bc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVR2vLAAoJEBx+YmzsjxAgH0sP/20yeLLVAOoHDJcx9GGx+jtr
v91lA/bR8NKmFdJ6BNpoEhD3Y0ygMt11YHqgdvVEP9Fn8PyoIgsDfJ4BMuHyJZ+O
wsCh0RY7HQeBM34txeGahg/FpAHnbNPisaENZi0LvpsdCp1C91J7UAC4RZ3wkBIs
30R6QAAX0sqBnsCwU34Fcz9GK2a2toyCYshHV3aW7IuTg8bZd8bAJS6uYWRDA8Zd
w9e7d/5oyT/LEHfqZfgkgFHqPZJNAJwB29vzUxy96tGorkCQTPWCda39mWQwiME9
Ph1X/UGpYSknwCpyclXtlunSL8FmrwQ8fITgurfLBAZNiWsIcQCO3Pxl4FSlyVbx
yqVW05oTkIWne3z7TPlu/pF6idV2ulOA0hUp51UlcQ4Be6NhLcIKuFj9Y2N93nEv
qgxzEF6D2e6EHxOFSNFx5XMUa2mO+D9MFVswpLNvSGO68xGNphVJFTJjzk0uvqFL
ARlaoHTXX6rrqGSdYas8oPvFU8/cSrQoemGeYZiQRfSAxai0Equ6Zh02rcW/WbeC
1cPy8ky0NTonlLgOzAn6V09pxlOWtShlq+Yq51eb4fpiGq1cLjts0aurf/Gzntqo
6QUmt0jsfQC8Po9J8t8ws/12G8/3WpPMd00e4GvkZtS+xBBbn+7IWvmUKKWKXPM4
dgRHTHYV4iaqNvnWdQ/v
=G7jT
-----END PGP SIGNATURE-----

--pvezYHf7grwyp3Bc--
