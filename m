Return-Path: <anholt@eliezer.anholt.net>
From: Eric Anholt <eric@anholt.net>
To: Michael Turquette <mturquette@linaro.org>, linux-arm-kernel@lists.infradead.org
Cc: linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, linux-clk@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v4 1/8] clk: bcm2835: Add binding docs for the Raspberry Pi clock provider
In-Reply-To: <20150811211840.31346.28666@quantum>
References: <1437420787-32137-1-git-send-email-eric@anholt.net> <1437420787-32137-2-git-send-email-eric@anholt.net> <20150811211840.31346.28666@quantum>
Date: Wed, 12 Aug 2015 10:56:58 -0700
Message-ID: <87zj1w4cgl.fsf@eliezer.anholt.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
List-ID: <linux-clk.vger.kernel.org>

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Michael Turquette <mturquette@linaro.org> writes:

> Quoting Eric Anholt (2015-07-20 12:33:00)
>> The hardware clocks are not controllable by the ARM, so we have to
>> make requests to the firmware to do so from the VPU side.  This will
>> let us replace fixed clocks in our DT with actual clock control (and
>> correct frequency information).
>>=20
>> Signed-off-by: Eric Anholt <eric@anholt.net>
>> Acked-by: Stephen Warren <swarren@wwwdotorg.org>
>> Acked-by: Lee Jones <lee@kernel.org>
>
> Looks good to me. Do you want the clk patches to go through the clk tree
> or do you want them all together? For this patch feel free to add:
>
> Acked-by: Michael Turquette <mturquette@baylibre.com>

It would be nice to do them all together in the arm-soc tree, since the
later DT changes require that the clock driver be present.  (And, since
this is a dependency of the RPi2 work, it would let us stack that on
top, too).

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJVy4jqAAoJELXWKTbR/J7oOloP/RUD4KPLf/qJ0tZ1k9BWwD4M
k3xIusb6ULlIz7TtduCO/18cqFHuLDsyjcSbqRu6beRqUQoVXOZBwN6P33Ft1jXH
6HFy4RJLIIA1iWInotPH4Ldz0Jd1cIuw0/BYaqA+zjVFJLvuhlkavU6uGAHKAhSi
A3yN95IuKsTdIy6GmyqDuby2NSSQ6O1YD5+guLuT4QvzrBTlKTR4HryUIchjoV3O
28xk4rJlZe+5tAM8mr9VY3IXf9PRTKDs/6GvdUHF5dHjGxa6fsfS0Qu3VHaFGCX2
oO/DhBO2gqs/yJZDaYGoeDo7E+M42Cuk+bJgo1bbClrrM9479yoxUTec7+4C1b8w
l/f5Em3SSCCoMSLS/I8+hk4y6FzkUmwcWHrb+FDZQx3iKdKphA1u9r3LrWEZrjO0
QGZ85cq2qQe8qnDn2DVAgHlO9j2bFOVrbkDGXJNTgyvTssy8siy3RwaKPxpcp1/n
/uvXsYmJgm8kCAt+QVeSESmgj6oRGxLV7dZNj/h9oYongepMvvDhkA9zDNg1jOGD
ahOF8uwD0ynMx6eIfFMqAS698kMtzfWjRh/PJ/zK27oFweKmE9pE6t/KeSZunJFD
iuLuY5hWZ30TBQOJhkROQrDCx9/RA+jzBPy6uPIhrtGNGgIWaV8xxxIyXQ8cH84T
CgY8V/dreKaw6mqQf3Iq
=TiA5
-----END PGP SIGNATURE-----
--=-=-=--
