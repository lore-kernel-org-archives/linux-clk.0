Return-Path: <anholt@anholt.net>
From: Eric Anholt <eric@anholt.net>
To: kernel@martin.sperl.org, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Cc: Martin Sperl <kernel@martin.sperl.org>
Subject: Re: [PATCH 2/6] clk: bcm2835: add locking to pll*_on/off methods
In-Reply-To: <1456745963-2403-3-git-send-email-kernel@martin.sperl.org>
References: <1456745963-2403-1-git-send-email-kernel@martin.sperl.org> <1456745963-2403-3-git-send-email-kernel@martin.sperl.org>
Date: Mon, 29 Feb 2016 12:06:28 -0800
Message-ID: <87y4a35liz.fsf@eliezer.anholt.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
List-ID: <linux-clk.vger.kernel.org>

--=-=-=
Content-Type: text/plain

kernel@martin.sperl.org writes:

> From: Martin Sperl <kernel@martin.sperl.org>
>
> Add missing locking to:
> * bcm2835_pll_divider_on
> * bcm2835_pll_divider_off
> to protect the read modify write cycle for the
> register access protecting both cm_ctl and a2w_ctl
> registers.

s/ctl/reg/ in the commit message

bcm2835_pll_divider_set_rate() also does an RMW on cm_reg, why was it
left out?

Since the a2w reg is only modified by _on and _off, and the core holds
the prepare lock across those, I think it was already safe and doesn't
need to be mentioned here.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJW1KTEAAoJELXWKTbR/J7oTDkP/0HumzgSo6V19ectuNSj1FVe
CeSBizPbRLuhFu9X6FWrIYRq1LPwC9VZ2o31D6t6edFhNb99inMg+AmAoc9BJJoD
Ly+R0qtbQnNEyBZm6XsHMWVsjzdHbRsCkNh05HPjBUEyvChcihqv3BDArbn2qOEf
mE0LmQQZMvichkngN1ppHZGgFdoKieRuDGIr2zILdcrDiP+LtQEgsCrTkS8Y2NZV
2Hh4TK/zppeGa9edMa/IYaVIvCbZmbqacOyVtttjIe4PDAQDI6DSRZeD6rZLBfou
TIMBaZ/K+/Bfu0+54IxExjddUdGIAACGa+kLjlNlbp/xAEj7cZWadW5ceo7J+olF
UKNIfHSCFzSg0I5w0wwcwWW4Qlfr90jEulQRPC3lXNYDLL64N5SAhZfdOLi1JobL
OM2yLrqWZci1ZrriPacDyejk0Ytr51dsV8dxIOv6k8I0OwgcnQE0avLpKzz2hTea
XEEtWmIF/B99mD+HHGknnp62OO+sEC1M2NYnIzJ54zJ8gqA8QNh78CzgdIaWqbf2
OpQZnVZoSBD008cYmjt5vZeGctE/d5SGPcx21eudm+lR90QiggHLNwpYwnY+2xIA
WvOrtrLdHUwLqWfQsm8D9L1GrpfYmhllMtX/Hdre0T/LP0zDasYErXzws+mocOv6
+gg6PD61wpn9/xQQiOR9
=J0J8
-----END PGP SIGNATURE-----
--=-=-=--
