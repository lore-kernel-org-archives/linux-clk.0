Return-Path: <anholt@anholt.net>
From: Eric Anholt <eric@anholt.net>
To: Martin Sperl <kernel@martin.sperl.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 5/6] clk: bcm2835: correctly enable fractional clock support
In-Reply-To: <0ED2FB7F-B112-487B-B222-08E5FAEE27F9@martin.sperl.org>
References: <1456745963-2403-1-git-send-email-kernel@martin.sperl.org> <1456745963-2403-6-git-send-email-kernel@martin.sperl.org> <87mvqj5k9r.fsf@eliezer.anholt.net> <0ED2FB7F-B112-487B-B222-08E5FAEE27F9@martin.sperl.org>
Date: Mon, 29 Feb 2016 15:44:16 -0800
Message-ID: <87lh63jd4f.fsf@eliezer.anholt.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
List-ID: <linux-clk.vger.kernel.org>

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Martin Sperl <kernel@martin.sperl.org> writes:

>> On 29.02.2016, at 21:33, Eric Anholt <eric@anholt.net> wrote:
>>=20
>> kernel@martin.sperl.org writes:
>>=20
>>> From: Martin Sperl <kernel@martin.sperl.org>
>>>=20
>>> The current driver calculates the clock divider with
>>> fractional support enabled.
>>>=20
>>> But it does not enable fractional support in the
>>> control register itself resulting in an integer only divider,
>>> but in clk_set_rate responds back the fractionally divided
>>> clock frequency.
>>>=20
>>> This patch enables fractional support in the control register
>>> whenever there is a fractional bit set in the requested clock divider.
>>>=20
>>> Mash clock limits are are also handled for the PWM clock
>>> applying the correct divider limits (2 and max_int) applicable to
>>> basic fractional divider support (mash order of 1).
>>>=20
>>> It also adds locking to protect the read/modify/write cycle of
>>> the register modification.
>>>=20
>>> Fixes: 41691b8862e2 ("clk: bcm2835: Add support for programming the
>>> audio domain clocks")
>>>=20
>>> Signed-off-by: Martin Sperl <kernel@martin.sperl.org>
>>=20
>> Rewrite of the commit message:
>>=20
>> The driver has been using fractional dividers for all clocks with
>> fractional bits.  However, MASH clocks (those used to drive audio) only
>> do fractional division when in MASH mode, which is used to push clock
>> jitter out of the audio band.  The PWM clock (used to drive i2s audio)
>> is the only MASH clock currently enabled in the driver.
>>=20
>> Additional MASH modes are available that widen the frequency range, but
>> only 1-level MASH is used for now, until we characterize some better
>> policy.
>>=20
>> Fixes: 41691b8862e2 ("clk: bcm2835: Add support for programming the
>> audio domain clocks=E2=80=9D)
>
> That is not 100% true - non mash modes have CM_FRAC and CM_FRAC =3D CM_MA=
SH0
> so these map each other

Once again, trusting the docs turns out to be a bad idea.  You're right,
the non-MASH clocks *do* have a bit 9 to enable fractional mode.  Sigh.

So, this patch is:

Reviewed-by: Eric Anholt <eric@anholt.net>

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJW1NfQAAoJELXWKTbR/J7ocgYQAKG0lA62TYv0LdKO38rt3o/D
qF46FNTLe0VWY89D3lWHA2/35QZ8HQFrwTW2R4MIHeqFaGXORb7CXeYfYzudMAxq
HoCVRHsN60P/09hHPSSmiAESHgIaM4lFVLHVs0uduvIXuJkGIxefzILahsA8fQqT
gkPrpmcXJMBtbKtEE+VwoR6UuGxeNOibaBTFwlTbmFyW9ny7ODCj9xV7y2Ak2DmB
IZap3MkM8Ow1RxQz9YaKXOPOUvmx6lDH5MRtsfwLC9dLoQ69ml0FJiq9PzgNawE5
bBNHYSqlgh+VNZIxRaTvzfv0aWqQc5wK3hTeQ1rbw0ui7wFFteFMat5a5JB4zdyX
gHGbnBd/6x7YtWlfYZa3fOVjmJEgxm0GGlRWEUjCA8NyqgCE9l3W/l9lNhengKQh
IFFVv73jYI5deop/y1B6kqE3PH4qGrU1AVjxNlyEOVdscXf7GiklzqDf4QYrI4IM
FW648K68w63Bbr3KM1VCOW4PDoZQv/7qcdXFeAez636LmgIp0WGEb0xski+pTnMa
B/Ywv6a8n0p88QcIfzdm20tDntD+0OEItMNAMtsNtJxZ0yTTs7PbntkhF6DZZJmb
V/cvDXlsOSWsOMjYyEO5Gj4P9rkMqovFmXz0H0hJwpHiM9oCf2zRnrdAQL8gKyfJ
21kKASst50yD6Xf2NvgC
=c5TU
-----END PGP SIGNATURE-----
--=-=-=--
