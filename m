Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Fri, 18 Sep 2015 22:03:49 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Emilio Lopez <emilio@elopez.com.ar>,
	Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH 0/4] ARM: sun8i: Fix A23 and A33 clock gates indices
Message-ID: <20150918200349.GY4684@lukather>
References: <1441977997-29041-1-git-send-email-maxime.ripard@free-electrons.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lHWX6A2F7795X8SZ"
In-Reply-To: <1441977997-29041-1-git-send-email-maxime.ripard@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--lHWX6A2F7795X8SZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2015 at 03:26:33PM +0200, Maxime Ripard wrote:
> Hi everyone,
>=20
> Here is a patch set that adds the missing clocks for the message box
> in the A33 and A23 SoCs.
>=20
> In order to support that properly, the addition of a new clock driver
> for the A33 has been needed, and we split the gates definition that
> was previously shared to each DTSI.
>=20
> Let me know what you think,
> Maxime

Fixed the typo and applied.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--lHWX6A2F7795X8SZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJV/G4lAAoJEBx+YmzsjxAgPDAP/0WCjSvbeXLkFhzB80kzL/lD
vS6WyoBcGSSLJexeAA1K2YGPfiZuGtFNrcUY+Ze4Gshicxp6ZCHkEP9N/vKGTVSR
oTr1Z+6CxB9TC6ELynyCQM1q0vHljbhbXaiJr8odfZePuDXe1k+C22WE1psY4C43
FOH3GBfFdh18+K6PiHY05WopHO3ejT3k/qZ1Oma1+GnwPUzftG6uyVZgRcb3jqEz
a3QzU0xozm6VsOzdeQ55vLFVa8mvpGG+vPHdBZUrljS+658sqJqjMc7XV6oO7nfa
7+7nmZlyjHhrxSCGeyEZp8ECpHGn2g2kzN2RSJKtJy+6O7gNZIZoCJ3tg2GMInU+
OsFq70+s4eKBuR+nJRHyEdEJioQvJriDLMGFbAo1UqNfFwwbtcS8IhBOAMTVPbmQ
tb23M6P8Exnu1u14nIlH4hl3M5PZ0oiXsNrtyon/TSdRkTyJGlrhSBWtaPxZmovV
SwyCuAgKjSkPK9WFeVIsyZMkfsqZBpY+Jdm/ufZC8Ze4RHk4mJHb5qSqV1Oh1PCI
hNbLLL46pwYJ5D/VL2h5vNoKJAIE8DFq/+M6Dn2WkT0hwmbdWMNnAy0hNLnEjADL
/TBbZbhILczHWBqHTZzr8An7NzizR518AQLQ1OZxOf8TxoF774VfHl2v64laug6H
JoAajhGzas58rwnB6FVN
=/uIl
-----END PGP SIGNATURE-----

--lHWX6A2F7795X8SZ--
