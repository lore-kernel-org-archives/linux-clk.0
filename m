Return-Path: <anholt@anholt.net>
From: Eric Anholt <eric@anholt.net>
To: kernel@martin.sperl.org, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Cc: Martin Sperl <kernel@martin.sperl.org>
Subject: Re: [PATCH 4/6] clk: bcm2835: divider value has to be 1 or more
In-Reply-To: <1456745963-2403-5-git-send-email-kernel@martin.sperl.org>
References: <1456745963-2403-1-git-send-email-kernel@martin.sperl.org> <1456745963-2403-5-git-send-email-kernel@martin.sperl.org>
Date: Mon, 29 Feb 2016 12:11:28 -0800
Message-ID: <87si0b5lan.fsf@eliezer.anholt.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
List-ID: <linux-clk.vger.kernel.org>

--=-=-=
Content-Type: text/plain

kernel@martin.sperl.org writes:

> From: Martin Sperl <kernel@martin.sperl.org>
>
> Current clamping of a normal divider allows a value < 1 to be valid.
>
> A divider of < 1 would actually only be possible if we had a PLL...
>
> So this patch clamps the divider to 1.
>
> Fixes: 41691b8862e2 ("clk: bcm2835: Add support for programming the
> audio domain clocks")
>
> Signed-off-by: Martin Sperl <kernel@martin.sperl.org>

Reviewed-by: Eric Anholt <eric@anholt.net>

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJW1KXwAAoJELXWKTbR/J7o4EoQAIFgNjMti3HJxsSp2Zu8Bl1T
jdF3etIrNF0AG+Kebt5sjCprtbGNJXKoIOxCGiNq69O09CnivtnTX2G1ntT5JxWs
UPGr2vlAPoZYMCW6psIcVgJpuf0qV3Ly1gY0ieXW4dqDpZhzH91iDOj0NoILLw7z
IRDzVBqzKGzZxTT22FUSb2k6i3J7H8RZAnaPUqn7Bo0gMkMzb2XPlvoes7A4h+AD
yTxWAHJecrhgjLlYOZgYBPHtpYcJplZLxYvWlU85Ta1u3tSnVKtdxy4RckZwgtiL
Y8Uc45itmaqhq7l6RPGddxM5uAHOTAYwQPBHYHq+o/S8z8YaOHbpOIMV140VD25r
wdtkocZXg+GiImKH+EXt520zSUpoZuzzgyiPl+wnpfBL6cOMRA2oZ/+gVQZlvO1r
av8PF5aZbCVcHtdMaWRMLc0aMmU7bubC4r2HGnYbhdUlZISL/6tvWgNyRKZbSiI8
sVpLnkHhpf8kAWxdms/7/G9lQ4A50QODTVC9TgxXUhRpkc22OS9NAR504RhYfxYz
1adIaMNmPv0c0LWH/zVruEQ6t03zQog9cw8SXVp+EWgO2dBV8QR6zX4yJfJCKjc6
PMTo7HszwfWs0AKFvqANlaHwHOiiuOIX+9uJBHEmFaHXh1DgHSoAfuJadY8ZIrvU
CBytSiKmzSrcl4jBIkPG
=m40E
-----END PGP SIGNATURE-----
--=-=-=--
