Return-Path: <eric@anholt.net>
From: Eric Anholt <eric@anholt.net>
To: Boris Brezillon <boris.brezillon@bootlin.com>, Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, linux-rpi-kernel@lists.infradead.org, Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, stable@vger.kernel.org
Subject: Re: [PATCH 2/4] clk: bcm2835: Protect sections updating shared registers
In-Reply-To: <20180208134338.24590-2-boris.brezillon@bootlin.com>
References: <20180208134338.24590-1-boris.brezillon@bootlin.com> <20180208134338.24590-2-boris.brezillon@bootlin.com>
Date: Fri, 09 Feb 2018 09:34:06 +0000
Message-ID: <87r2puv75d.fsf@anholt.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
List-ID: <linux-clk.vger.kernel.org>

--=-=-=
Content-Type: text/plain

Boris Brezillon <boris.brezillon@bootlin.com> writes:

> CM_PLLx and A2W_XOSC_CTRL registers are accessed by different clock
> handlers and must be accessed with ->regs_lock held.
> Update the sections where this protection is missing.

Just to be clear, while I think we have an interesting question on patch
4/4, I'd love to see 1-2 land.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlp9aw4ACgkQtdYpNtH8
nuiWQg/9GwFu9ULemDvBXw4H2J8Zvc7dNM955UX/Rd62dQOokkoEL+6d5Ynf85pV
1bTvwAD/oeYpY9buGE9zwkgGXJKD0dtgXb+jw5Ki22Jq8XtNTeW0g103dzeA0ujQ
697EFl5ziDaVYioVSkTbo9tZ7Y3ENr3HZQaqXR/ups1GeTNGi+PnVVm7zdTWx1wO
MLS4CbYDIjKG2la/dXjJLXz+A3hny1/DMaVRfGLdMIt2stXrRm0sTnmyho/PwTxl
aO0Y9d1CFV+S3mbusGJcON+JrxNBVybcyWjSKXsxdBH7/1gSIxFAkrN5oefQA7nQ
JQtvxReAHiUt3Y3MoRrsINVJQeX9XxbaoCb/YhLReC4wH3k/FnWUGme0GtxCK/J2
MEl6AMMWTxFyNLGSyr19O9LmdPThNvzefrPEsICctYGIuhddtceV+BD6ycn/63tI
DhJeWARHVbaqxkk2Pc89K7Q9Y6Rei5KFDI63gwFE4gq6sJd+bhjk01dCnVje5c9D
qRLQiH0yTx4yXApfcTo/MD1DUo6k9LSQMG2jH5iDWxM2wXI+gfyGB5dvX+JlkH/L
Mvwvv5FETYlEhVXqOBQ0gMN9ixJK8TatgghZjRSB+9ZJTlcCwYWRT7CUIF+I/L/I
kSnGyv1j9ilLZzv3tFdm/XrMsgAtMdsvCgwAH8Wvwe/mYA48TYg=
=UqHr
-----END PGP SIGNATURE-----
--=-=-=--
