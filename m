Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Mon, 18 Apr 2016 18:03:11 +0100
From: Mark Brown <broonie@kernel.org>
To: Wadim Egorov <w.egorov@phytec.de>
Cc: Alexandre Belloni <alexandre.belloni@free-electrons.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org, rtc-linux@googlegroups.com,
	linux-rockchip@lists.infradead.org, robh+dt@kernel.org,
	pawel.moll@arm.com, mark.rutland@arm.com,
	ijc+devicetree@hellion.org.uk, galak@codeaurora.org,
	linux@arm.linux.org.uk, mturquette@baylibre.com,
	sboyd@codeaurora.org, lee.jones@linaro.org, lgirdwood@gmail.com,
	a.zummo@towertech.it, dianders@chromium.org, zyw@rock-chips.com,
	arnd@arndb.de, k.kozlowski@samsung.com, javier@osg.samsung.com,
	kgene@kernel.org, olof@lixom.net, geert+renesas@glider.be,
	sjoerd.simons@collabora.co.uk, treding@nvidia.com,
	public_timo.s@silentcreek.de
Message-ID: <20160418170311.GK3217@sirena.org.uk>
References: <1460711790-22646-1-git-send-email-w.egorov@phytec.de>
 <1460711790-22646-4-git-send-email-w.egorov@phytec.de>
 <20160415102602.GE3217@sirena.org.uk>
 <20160415162406.GD25196@piout.net>
 <57148C05.4090900@phytec.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3NJww9yp20AXRsxZ"
In-Reply-To: <57148C05.4090900@phytec.de>
Subject: Re: [PATCH 3/6] regulator: rk808: Make rk808 generic, rename
 rk808-regulator.c
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--3NJww9yp20AXRsxZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 18, 2016 at 09:25:57AM +0200, Wadim Egorov wrote:

> It seems this topic has been already discussed here [1].
> So the right solution is just to rename the rk808 struct in rk808.h,
> don't touch the driver names and config options and naming the
> additional RK818 PMIC in the Kconfig?

Something like that, yes.  If it's really useful for clarification some
renaming of code might be useful.

--3NJww9yp20AXRsxZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXFRNMAAoJECTWi3JdVIfQ9ucH/2UcY+YmZyUcGyDgMIayC9dd
ua6QDXSgx1W/VNkI+ddPNUHgaIjG4uor6mhhRIE7ltFkVWcyoCqzhnArzPP6GYAX
WXTLm5BetM6vv2gnJXXnUmFWG9TlXa+7uTbR7QdANPdP1Qk3URHecS0O4W8gNyoI
0pA/4ndRrs9q2Gq23W+810jCyl/M26uO7f6xdRir8hugCJWnJgXzQ2VWI55uhRXR
r5Z3wqhnhIPmu0W9y3r0yfND7Fw0NiJOL+lzXNVH1gJYK0zK9JKtrrqAR1tD+7Eh
pv4G1G9N7NnreQcwC3ijQ9UFVyXQ74dGEUL3EGT+7DvmYIVcGVFqbRQAmD/Uvjg=
=/lfo
-----END PGP SIGNATURE-----

--3NJww9yp20AXRsxZ--
