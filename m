Return-Path: <anholt@anholt.net>
From: Eric Anholt <eric@anholt.net>
To: kernel@martin.sperl.org, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Cc: Martin Sperl <kernel@martin.sperl.org>
Subject: Re: [PATCH 3/6] clk: bcm2835: enable clocks that have been enabled by firmware
In-Reply-To: <1456745963-2403-4-git-send-email-kernel@martin.sperl.org>
References: <1456745963-2403-1-git-send-email-kernel@martin.sperl.org> <1456745963-2403-4-git-send-email-kernel@martin.sperl.org>
Date: Mon, 29 Feb 2016 12:09:54 -0800
Message-ID: <87vb575ld9.fsf@eliezer.anholt.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
List-ID: <linux-clk.vger.kernel.org>

--=-=-=
Content-Type: text/plain

kernel@martin.sperl.org writes:

> From: Martin Sperl <kernel@martin.sperl.org>
>
> If a clock that has been enabled by the firmware gets disabled
> by a driver this may right now result in a crash of the system
> as then also the corresponding PLL_dividers as well as PLLs
> get disabled (if not used) - some of which are used by the
> VideoCore GPU (which also runs the firmware)
>
> This patch prepares/enables those clocks that have been
> configured by the firmware.
>
> Whenever the clock framework implements either
> CLK_IS_CRITICAL or HAND_OFF this can get changed to use this
> new mechanism.
>
> For this to be completely successful (i.e not missing a clock
> and subsequently a pll) it is recommended to add all the known
> clocks of the soc so that this can get applied to all clocks.

I think this makes sense to have, for now at least.

Reviewed-by: Eric Anholt <eric@anholt.net>

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJW1KWSAAoJELXWKTbR/J7oYV4QAJsOI+uEEPAuPETbpTFoOfuP
Fwc4lQlEVLY4m0m1hEObeML9JaChfW115nBIwvrgirA2a1ZKR+UrDK8ua43I7pih
oCpdFvluDZr69ZJLPuc1jTibN8VFitVaJkJLf27sL1eGVTTQkgRobgLyZW/UdLT5
E75AHO3iS83FO+ecqqnwOQtks3n5EzzZq46LuHuepFJuS7hxmfAOrZptEXRF4q8f
9OC35baCyArjdXo2tf0GzMW4rAldiCafC5u1HX/EDe6gHWCOQPX6GMX9aksrfJiA
xq9/7ZziBWZgWdFNrfNhgwArs/446oshhyKYaaV/Q3qnvLcgO9heJqiX9ybVrHMh
WQODhJxcGmVd0VDyNR6oCq15dv7RNRJR14IV5SFTLe8yEjoGR4EWy0h/M9tK2JpI
QXLXMKjF88w7xdOMeNz3S1ttlvXJLpBDdsBKQYID3yJXwR3EMeJVN6LhnwZaWq9S
agOCI6bjr8oVlUJbLfALigng4e6Z66aRoNVYJ+HwMoG2khEe5Ra+qZ6prHPHP3hJ
HCbSHACkX5kktYge+uXdUbr8pN3Fdu4TXs1OrJbemzd/edOtPQwuHbKMvAWRCslm
av12CQsiUjX2xvHB8RqRC9b+kEibBYtX58zcCUZxF44O3CJdro+zzIsh9ec/QQ/x
UiNusdm9UArJDIC8zZFg
=3q7P
-----END PGP SIGNATURE-----
--=-=-=--
