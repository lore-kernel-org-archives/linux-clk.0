Return-Path: <anholt@anholt.net>
From: Eric Anholt <eric@anholt.net>
To: kernel@martin.sperl.org, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Cc: Martin Sperl <kernel@martin.sperl.org>
Subject: Re: [PATCH 3/6] clk: bcm2835: enable clocks that have been enabled by firmware
In-Reply-To: <87vb575ld9.fsf@eliezer.anholt.net>
References: <1456745963-2403-1-git-send-email-kernel@martin.sperl.org> <1456745963-2403-4-git-send-email-kernel@martin.sperl.org> <87vb575ld9.fsf@eliezer.anholt.net>
Date: Thu, 17 Mar 2016 10:39:28 -0700
Message-ID: <87poutf1gv.fsf@eliezer.anholt.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
List-ID: <linux-clk.vger.kernel.org>

--=-=-=
Content-Type: text/plain

Eric Anholt <eric@anholt.net> writes:

> kernel@martin.sperl.org writes:
>
>> From: Martin Sperl <kernel@martin.sperl.org>
>>
>> If a clock that has been enabled by the firmware gets disabled
>> by a driver this may right now result in a crash of the system
>> as then also the corresponding PLL_dividers as well as PLLs
>> get disabled (if not used) - some of which are used by the
>> VideoCore GPU (which also runs the firmware)
>>
>> This patch prepares/enables those clocks that have been
>> configured by the firmware.
>>
>> Whenever the clock framework implements either
>> CLK_IS_CRITICAL or HAND_OFF this can get changed to use this
>> new mechanism.
>>
>> For this to be completely successful (i.e not missing a clock
>> and subsequently a pll) it is recommended to add all the known
>> clocks of the soc so that this can get applied to all clocks.
>
> I think this makes sense to have, for now at least.
>
> Reviewed-by: Eric Anholt <eric@anholt.net>

Scratch that, this breaks display.  Since the clkgen clocks are flagged
as needing to be gated in order to change dividers, it means you can't
set clock rates for anything that was turned on at boot.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJW6uvQAAoJELXWKTbR/J7oVtsP/0HcjJgv/tKGTSDmX49Rjtsq
faUaT0WPQssRnlrQm60iOyaRswHIcJb8cWqu7c0ruh2BKxY7F4mOnx8ScdDBFsPu
WjnP5Ixp/S5v+eslZt4bIx1/YGrCp+DAOFJni7tJtJTaxp/y8PPKMq/tFRIGl2iO
/wuERhzOOljdhY2hXu5qnnQyp0QTZu80mSNI6UQ4rbwKDat+TojhuS5H1YI2A7Db
kLTORlTaLusilHkE4QNzLzThJPhjkjaA3tVAMLOqTWM31zcBV8hQVytISkZ5YFdS
/nNkpWJZeIQJLVal16cP8GAnNNkg6ufKsYzF793chjl1CG3AydApM4wGF5f2/BEs
3jRKF283gB2UG5nJ43/FseKpM4vbViWpURa+kFrMVHOCPA4drP+RqXY6nsYLdZGH
2fW4zT7xvq81vprSA7yNgYm2Ezj1q7ajh8crzr6nG+3mFWEip9wPzxjqV+v4GR1j
9/Le+HC2QcePyRLDkZJWKj9+yb0LSArZMarHL9QSOfj5NXNzAihUJ/WB/Cpfd4OX
KikcfSBYGmLDm/CJkcqIBCno7LhNtLgBqguMsUTC9z23dLOyEJ1ENn4BK/WBPDpf
tYkJK5TM6QiT2UljzKJ1KeJOXzsvABY+E5zyMZEULOOkRaJf+qTxxHdeoVKpJ5zC
fR8G69JkGywSX94rhno5
=AXI5
-----END PGP SIGNATURE-----
--=-=-=--
