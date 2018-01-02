Return-Path: <eric@anholt.net>
From: Eric Anholt <eric@anholt.net>
To: Bryan O'Donoghue <pure.logic@nexus-software.ie>, mturquette@baylibre.com, sboyd@codeaurora.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Cc: Bryan O'Donoghue <pure.logic@nexus-software.ie>, Stefan Wahren <stefan.wahren@i2se.com>, Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, Boris Brezillon <boris.brezillon@free-electrons.com>, Phil Elwell <phil@raspberrypi.org>, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 09/34] clk: bcm2835: change clk_get_rate() helper return type
In-Reply-To: <1514835793-1104-10-git-send-email-pure.logic@nexus-software.ie>
References: <1514835793-1104-1-git-send-email-pure.logic@nexus-software.ie> <1514835793-1104-10-git-send-email-pure.logic@nexus-software.ie>
Date: Tue, 02 Jan 2018 14:21:45 -0800
Message-ID: <87r2r7gava.fsf@anholt.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
List-ID: <linux-clk.vger.kernel.org>

--=-=-=
Content-Type: text/plain

Bryan O'Donoghue <pure.logic@nexus-software.ie> writes:

> bcm2835_pll_rate_from_divisor returns a long but the function calling it
> returns an unsigned long. There's no reason to have a type disparity here
> so tidy up the return type of bcm2835_pll_rate_from_divisor() from signed
> to unsigned long.

I'm still surprised that clocks are using longs instead of u64s, but
this seems like a fine change.  For the 2 bcm2835 patches,

Reviewed-by: Eric Anholt <eric@anholt.net>

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlpMBfoACgkQtdYpNtH8
nui3PA//RIW+nxhg3XpGb4HzXfIkPRirmURSlZPS9NAMefUhbA3bBeuIiRRbasgf
hcX6K5sWDHE5UPNv0igdnY7fNrbx6hmG8qmj4VQFSh4vdKTo2ckWxqXI2aXxWzPo
KEtzwC25AvdBo+WAplXQpVuGd0Yo21qQqg761rjgTuxfcZfl+vLbQO3ORjn2+ucA
/6Q1M4DdGz4akTiJbRX/rAF3j3u7Ex9giEDwZFK4Sp8kM0LqvVPeY6EfXZ42TLZM
4ZAVTLiZqQtEceunp6u4wYMd7esreqLu+NIfLnEF6H1ySZpswKXQqPfHOwZv41dL
qUtDXSVQ2M4zD7f48uivkQTHdleJS3GP/4isfzRXiW2MGkqfnFeTee7tkKIcQNk1
l6Q5JkCa6udXnSUClBlmrq1YRqUYeTErtLkA6F4vv9eq66BNtORUB6puQQ1zvija
7gOsWKanYS6RZVtFQKTb5hIhy5FoYXMAEfjxUxjqlQX/1rW/aaSxipNm6RC1X6xo
CmScNIQQDZULKniz+BlabDBnb6Jup4i1QJPsgouETp0j48lhx/EWm0xhPCWZ88y7
UCNTENRel6xvzo9ORpLM3oTMWHDuAl7QTbuy0MfCvcRPCmy79NJ0hLbYkOoizNYV
MjpJ8f97DUNHl4D+xPHK5miO0mYUJx/8AH7G2sbMYOjb8tQzvR0=
=lz0Q
-----END PGP SIGNATURE-----
--=-=-=--
