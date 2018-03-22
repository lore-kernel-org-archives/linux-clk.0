Return-Path: <eric@anholt.net>
From: Eric Anholt <eric@anholt.net>
To: Boris Brezillon <boris.brezillon@bootlin.com>, Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, Stefan Wahren <stefan.wahren@i2se.com>, Lee Jones <lee@kernel.org>, linux-rpi-kernel@lists.infradead.org, Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, stable@vger.kernel.org
Subject: Re: [PATCH v2] clk: bcm2835: De-assert/assert PLL reset signal when appropriate
In-Reply-To: <20180322091130.5997-1-boris.brezillon@bootlin.com>
References: <20180322091130.5997-1-boris.brezillon@bootlin.com>
Date: Thu, 22 Mar 2018 09:33:05 -0700
Message-ID: <87zi30ul32.fsf@anholt.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
List-ID: <linux-clk.vger.kernel.org>

--=-=-=
Content-Type: text/plain

Boris Brezillon <boris.brezillon@bootlin.com> writes:

> In order to enable a PLL, not only the PLL has to be powered up and
> locked, but you also have to de-assert the reset signal. The last part
> was missing. Add it so PLLs that were not enabled by the FW/bootloader
> can be enabled from Linux.
>
> Fixes: 41691b8862e2 ("clk: bcm2835: Add support for programming the audio domain clocks")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> ---
> Changes in v2:
> - simplify bcm2835_pll_off()

Reviewed-by: Eric Anholt <eric@anholt.net>

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlqz2sEACgkQtdYpNtH8
nugPJg/+OaqR9ApJ1qFs0QmLLx4o1YkVVH8Z5pT+Uts6uQsiROdEcOTu0zSUgZ4p
pGoBtAQijgfAWT7pvF0Xg8Jo48c3zUeYDWzj/vyqDEEOPix7wN+xU/FAje7DME5u
RW18suLE0jh/kNHJkAKnhpDbWj4a6RE7Kc4fX0tcxN3w324ybskQFq7vgzFLQMrR
hvoAc8e5IQ+L+VtiGeTOaRLC7Vh2Q9L7CNAnblaP0yMYp4rFKMnNyz6mZumbYtpO
kOQg8NRY4Yd+HpHOhiJvkp0fI8KWpoSzN8JxfirL6cn4DtqMCv4RFFRevayxLsOG
t+IZKIzNnoThSAFKljr4CYfD3sJNnFcaSJx4cHIkz+DzEP4O75Otp+SehgA9XFJV
1V3eeBPhPDj7KS4Ty363VqiK5xiuIyOOe7O8sX3IkBRzxNeoUNlZQL+knmKsKA0u
YL2H0sZMIouaOq3hnoA3aq2Ezy3Sc0ppdv3TNxTqmM0zmxT2yOwuIevSiaYSesJ8
CU973oruiqlrtg0LjaOZMk/HEd3QLRtQnap07YSkwDXwUnf1qZiYglzLZWfDLLCH
CB9binSMmGVjlYrZBP9+WXyK94OffH3QZn9xsOreNp3tCvmZbioyXgENpAlJlMQK
2E5eL4Co7TxLtgEDqYH1k+ad0VR2MJFWaOTkU1NheWRrke+9QfA=
=u0pB
-----END PGP SIGNATURE-----
--=-=-=--
