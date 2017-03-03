Return-Path: <maxime.ripard@free-electrons.com>
Date: Fri, 3 Mar 2017 08:12:03 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Peter Robinson <pbrobinson@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, Chen-Yu Tsai <wens@csie.org>,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] clk: sunxi-ng: tighten SoC deps on explicit AllWinner
 SoCs
Message-ID: <20170303071203.xbfu4t2jgwt3low3@lukather>
References: <20170302174357.6246-1-pbrobinson@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="p7qxd2pjecup72hi"
In-Reply-To: <20170302174357.6246-1-pbrobinson@gmail.com>
List-ID: <linux-clk.vger.kernel.org>


--p7qxd2pjecup72hi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 02, 2017 at 05:43:57PM +0000, Peter Robinson wrote:
> Tighten the depends on the various AllWinn SoCs so we don't
> inadvertantly get clock drivers when we're not wanting them
> like 32 bit SoC clocks for 64 bit configs. Ensure there's
> still test coverage though.
>=20
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--p7qxd2pjecup72hi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYuRdCAAoJEBx+YmzsjxAgXCIQAJTQUD/Vt2OtIQAuPJ4Qi6HV
l/0VRzOMIyNHIDA74bbdGn/kgiwWj4M5t09RkQ6PHyPXS2REN4oo2xZ1icXTSs9o
Ieg+FQqlUfBL//dxawfgIfIjYtjmdVDCSZ6jPOorZkMI3xQevt+3AkshBhO/S98S
SDCLjw/MgaLyY6cwkdYe5u4GFJSS0j6H7eBc6fA4Wrqemo1YoxtsfxAPh1WA7o+R
NCqdzgRf+PEglFbC6fO65ARsdT4uZISl7i2qZvc/GLImScDloZOHQBb7/xmmLWgW
O4uoOliNWX28Kyzrud848SklSYP/OpPbLc9UF8kBTTnfngjn/IJWQDZpfayPkO/n
C0bnD3ekVnOPx0Q6MMIaEergvBA1CzVLSC/j1sWUBRbuAlzHEW45hZNODOf/exog
kNh1b4EQtl1rCNz6NZWMMpvcmv3kq3JbqfCEAgI60GH1g8/Z6YeNdCvawXEuEMhv
5+qsKhi2l31PsOb/NWIDsbSz4Oo7Qmt6Q1EcZ0pcfc5QFonbSNyGZ+pVZRI8jsIX
Ghwn7kEZ/4Cgh/aGtmm7ievkKnRMRMOBcDSYakeRp/uqitg76unpV+eRbV5bZdnH
BfrK0s6vS/NvoO8GsaTfOXhgLNKxU1TX1I4mlq7KeVMDP0+W/YvAWG/WKWIml1jU
HbRdd2C+IT2Gct7GE4iM
=bHUV
-----END PGP SIGNATURE-----

--p7qxd2pjecup72hi--
