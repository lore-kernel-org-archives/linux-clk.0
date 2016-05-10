Return-Path: <anholt@anholt.net>
From: Eric Anholt <eric@anholt.net>
To: kernel@martin.sperl.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Cc: Martin Sperl <kernel@martin.sperl.org>
Subject: Re: [PATCH 0/5] clk: bcm2835: add flags for mash and parent clocks
In-Reply-To: <1462463608-22940-1-git-send-email-kernel@martin.sperl.org>
References: <1462463608-22940-1-git-send-email-kernel@martin.sperl.org>
Date: Mon, 09 May 2016 18:05:41 -0700
Message-ID: <87h9e6yb6i.fsf@eliezer.anholt.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
List-ID: <linux-clk.vger.kernel.org>

--=-=-=
Content-Type: text/plain

kernel@martin.sperl.org writes:

> From: Martin Sperl <kernel@martin.sperl.org>
>
> Allow flags to be set on a per clock index basis, which control:
> * the parent clocks selected when not setting clocks explicitly

I don't think we need this other than avoiding PLLC.  What else do you
want to filter, and why?

> * the clock mode with regards to integer only or higher order mash

Please provide justification in the commit message explaining why there
is no obvious mash setting to just implement in clk-bcm2835.c, but that
that a better policy can be encoded in the DT.

Overall, I'm skeptical of this series.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJXMTPmAAoJELXWKTbR/J7oxKgP/0xD2f60vjRKnNaDmmIunYGF
Pb3ViIdWgEL3A3t9vzAkmap8DS29wBiX7rTB4h0zVy2Ps5y1T+1KChJQb662vk+q
7CqWfdx4WIkSk0fQ/HBB6wKmOWmZvzo/3z9tZN99syvhYWHCqkhdnQC6xkQ7WMBz
avZMSB9JPRKjR55tbTToqLCv+/4g7zkChnnV83RvedsiOvxHGlZyZgEy5mD1B2OY
c6coqZPIIDpcl77WpYCY+uALwvNuVRPGdh3/9nZJeyRsDn9UCFa70E9Z7PHOM1PG
V6iuuHZuLvpgJqM6zPSFtX+ALZCj1+T3Y4NIN7vxc0Au1AO+MOiuLUurMvq3Nz9D
VJ9GgKXddAOFwHGF2L+C0ovFNBx97CRx9c+yydtdr4RTZaZgy8YsYnBmHa2sNTPY
K7jk6ROMTxhIXrmLEkP3PwiIVQOAy+AzrSBKT7nGuJi4K5RYS9rDYeRH3sBfdVmX
AzgouCpWHzxNV/Rn1qksM/t8EXvr0JYkkW5XTxVdDajznvU03sUNQKkwvOEBdaT0
aVn7Nfusq+lZjra8EyE+IsQ/JsA8RuIjo1ulZ0NAusM/rmsKgWSBnZ5d7WQfbOP+
Al/SqO5GeqMdYRb5modiylkTKdOKL7whc4keUrLOXqOc6ngXa1W4rpUWUljebqgG
NdsfvNW+LEoLAjnMxFvE
=/GE5
-----END PGP SIGNATURE-----
--=-=-=--
