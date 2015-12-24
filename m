Return-Path: <anholt@eliezer.anholt.net>
From: Eric Anholt <eric@anholt.net>
To: kernel@martin.sperl.org, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Cc: Martin Sperl <kernel@martin.sperl.org>
Subject: Re: [PATCH] clk: bcm2835: added missing clock register definitions
In-Reply-To: <1450815189-3342-1-git-send-email-kernel@martin.sperl.org>
References: <1450815189-3342-1-git-send-email-kernel@martin.sperl.org>
Date: Thu, 24 Dec 2015 15:55:54 -0800
Message-ID: <87oadfqu45.fsf@eliezer.anholt.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
List-ID: <linux-clk.vger.kernel.org>

--=-=-=
Content-Type: text/plain

kernel@martin.sperl.org writes:

> From: Martin Sperl <kernel@martin.sperl.org>
>
> Added missing CTRL and DIV clock register definitions for:
> PCM, SLIM, TCNT, TEC, TD0, TD1
>
> Register information taken from:
> https://rawgit.com/msperl/rpi-registers/master/rpi-registers.html#CM
> which extracted the information from the header files shared by
> Broadcom/rpi foundation in this file:
> http://www.broadcom.com/docs/support/videocore/Brcm_Android_ICS_Graphics_Stack.tar.gz
>
> Signed-off-by: Martin Sperl <kernel@martin.sperl.org>

I had previously generated the list of registers by typing in a bunch of
them from specs, sorting, and adding missing ones for the clocks I meant
to expose.  I'm happy to see these missing registers added, even if we
haven't exposed those clocks yet.

Reviewed-by: Eric Anholt <eric@anholt.net>

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJWfIYKAAoJELXWKTbR/J7oIIQP/2sVL+e03xBOOlAOFTToA4Mw
YZ8Gn3+7OJNpP3PLmHsS7M5oRiCBoHbFwpDbO5zYEiTWl4SpDlnpxxNw4fHl/Q/U
nVI2neyUC9Fi4ar4pcWnMjHfobWfo93EoKFkr8xD4DVKtdaS6D+2wfUlx0hzSojY
p+LhEBuFfBb17wcu8R6dXst2k1F28aAs8RVOlqKFSBV6ZEU7629KY/k+HTWnjtPT
vWU8NFwdp24AF3L357FAZEACnREDjtItaCGbjrY7XA4IeVUbod5Q//x8gAblFZs3
Ecey6UjbE3SRNo9NU8OybLDU+7WQm1mrODKW4VcA+ZzNSxCvNXoKO7Xswc82Z3dt
Fx6OVXZzqNUCh2QzyTWNDqHtP/BThQpFSVZ/lkQIiPi9LHT9mY0kfCsMWhMD3/R9
+ZFqGzA8aQffSxQHp17Ub6G6TbSbzxvD3nJYmWWlxuolgWrF9jypQPwpnjSc5tz/
4uyywwT3WshKu5D5TZNub96TcmJW9H3v6fkavR0kc05TKZ/QKSTLVZNJl89o8u9f
Bgwb+XqeXqv0t+4GZFtYYyAVCmx/So3BxaZ4tykFhcaj5y2ocQG/JrzXDtr8gwyP
7nO8iI/0Sjk3/G3kxMEmIYqjOaFlrqceiex91PaG9rR2JpXzBGJOhacYVa3+k4gm
y/MKDawkk+e0xcweMUHc
=Zkps
-----END PGP SIGNATURE-----
--=-=-=--
