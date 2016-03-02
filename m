Return-Path: <anholt@anholt.net>
From: Eric Anholt <eric@anholt.net>
To: Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, Lee Jones <lee@kernel.org>
Subject: Re: [PATCH 02/41] clk: bcm: Remove CLK_IS_ROOT
In-Reply-To: <1456858826-28541-3-git-send-email-sboyd@codeaurora.org>
References: <1456858826-28541-1-git-send-email-sboyd@codeaurora.org> <1456858826-28541-3-git-send-email-sboyd@codeaurora.org>
Date: Wed, 02 Mar 2016 13:59:30 -0800
Message-ID: <871t7szgl9.fsf@eliezer.anholt.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
List-ID: <linux-clk.vger.kernel.org>

--=-=-=
Content-Type: text/plain

Stephen Boyd <sboyd@codeaurora.org> writes:

> This flag is a no-op now. Remove usage of the flag.

I like that this flag is going away.  It's a nice cleanup.

Reviewed-by: Eric Anholt <eric@anholt.net>

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJW12JCAAoJELXWKTbR/J7o2xwQALU9iSfrLVxDYIIVg8APqbNm
G+Hy7ZMcUbvfKcxxdkZCAFsrEsJ9mtCrYFVofloNcKUuk4hfgIOIFZoW1EoJ2mpi
015ubVDpniuUVmO6NNT40cj6G8e/0kJcADCX8m1dp/91ylgxUM+r2OCeYB3lJDHH
YI2Jb7fXR2krTLJOSrBZXQORym6Yh7LNMD/jGcm7orYyrdbiqQIr9BQ02Ye92tBF
b1jEwHXDxHfJc1nqyS8Kxgwdr8rRAn3NDFcClyu/Exv5GbaSi6oVMU9prhilTpbD
DnN5ub6pIMShvsc2yiCQpaNIoCNLh5TqepQfFe6X0FIJcm8nP0vWiaZXN3pXAihD
3dPfqtFseakD0kHt8+DXTO9/wzpPYjhlzjdSUrCdzRZYMhouAYtvHo+5p8YInI+r
NJ8iLQBdpeiGjLY8Uv/mWcUUcR7Ys37eQkdP90/jLXb0gCHCjdXn3mJPIXOeamts
HNIOahHpWXleR5BI7npd+9N7s6dNPOF5nON08BwbqPVa65p697eJ1J1dgrUyOToM
5/Rw0cZ0eitpWAa/kTvu08jBmX9IXIx8bmV5MsWtOT76LNpEVJ+/VWf4rDVBnHNU
NDExAqJ6g7ImyFeiC+ItMQSvzQaBhzVGxZlLtk7B/NkfnWmnMYWcFlBnxvG1dokf
I07A/B0KON7bjQ6lxqpq
=mfPV
-----END PGP SIGNATURE-----
--=-=-=--
