Return-Path: <eric@anholt.net>
From: Eric Anholt <eric@anholt.net>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "open list\:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, Tom Cooksey <tom.cooksey@arm.com>, Russell King <linux@armlinux.org.uk>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk <linux-clk@vger.kernel.org>, "linux-kernel\@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/pl111: Register the clock divider and use it.
In-Reply-To: <CACRpkdZkz16hfW7S1m5=gY=L8fN9u47zfoHHbwrL=_HgQx=TCg@mail.gmail.com>
References: <20170424194527.19426-1-eric@anholt.net> <CACRpkdZkz16hfW7S1m5=gY=L8fN9u47zfoHHbwrL=_HgQx=TCg@mail.gmail.com>
Date: Wed, 26 Apr 2017 10:01:33 -0700
Message-ID: <87zif3je6q.fsf@eliezer.anholt.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
List-ID: <linux-clk.vger.kernel.org>

--=-=-=
Content-Type: text/plain

Linus Walleij <linus.walleij@linaro.org> writes:

> On Mon, Apr 24, 2017 at 9:45 PM, Eric Anholt <eric@anholt.net> wrote:
>
>> This is required for the panel to work on bcm911360, where CLCDCLK is
>> the fixed 200Mhz AXI41 clock.  The rate set is still passed up to the
>> CLCDCLK, for platforms that have a settable rate on that one.
>>
>> Signed-off-by: Eric Anholt <eric@anholt.net>
>
> I like this, it is pretty.

An aside, for anyone else considering common clk and thinking "this is a
bit more complicated than I need": It's really nice for platform
debugging to have your divider or mux or whatever show up in
/debug/clk/clk_summary.  I don't know how many times I've been saved by
diffing that file between a good and bad state of my platform.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlkA0m0ACgkQtdYpNtH8
nuiq4Q/+KYBu5u3v0+6udawd9UM3ag44S3iFk+0lAdyyZBMr2yIRk/aLx3p7OlON
cRp76cOxhuFaQQcG8eJIiG11FK2qWrbusddTnNvGaly4T9ZKn9d7q7nw5UgZgZq1
Rp/QUD0swsKGbOv8JsQDWrzSdHO5cwhkBFCVe3D4Ry1p8irkHaBjfMZDxRFZOsMT
q9solik4qUuZnObf34WcC+O+e24E7KoQdKojhpCuUZbmHfVe4+ToVRMw4Cq2rMul
2fZus/Q0X+Xy6SbDpY9SBz+RsE1EYeSFJndstiAtF1M1EAauvPSR6foG/BIUl5Z4
OuPWoevMkS0Edqo/zusl/noZJZgJZNJBxuG/sMJr2fSzDRT42mPHGKVZcYvHqEIw
DF3FJHXxctd/srANRmyiyuU+088YJutFwRAJkJWL7cP1NnP0N20/MnqHkUIPcpkA
BjUI5c+gNMxhCmp+Ix2FmDtX3Hehe74Hp6bnsecsqWzGNLlkjmjm8FUw6pCIrSZf
7T87TBnnGmxSwgjbnn9a/n1btcee2HjgdhZrn2KYkG7RgJ/L6LOqkB2vm6fQhlOo
X7qDHfoLjmIMy3rvEdVKy5oQjFhgYNQpsi3UZ/BcjQIPcpUMu15Fyqs5mNR5BEMf
e+J4/8QtlpdbJlMyZHoj+EoOtDXHMQUYYxB1YnDeq90itOg1mdc=
=G9JW
-----END PGP SIGNATURE-----
--=-=-=--
