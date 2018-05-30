Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from anholt.net ([50.246.234.109]:46142 "EHLO anholt.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753896AbeE3S1q (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 30 May 2018 14:27:46 -0400
From: Eric Anholt <eric@anholt.net>
To: Stefan Wahren <stefan.wahren@i2se.com>,
        Boris Brezillon <boris.brezillon@bootlin.com>
Cc: linux-rpi-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: Mismatch clk-bcm2835 debugfs and vcgencmd measure_clock
In-Reply-To: <606467100.56923.1527090826606@email.1und1.de>
References: <606467100.56923.1527090826606@email.1und1.de>
Date: Wed, 30 May 2018 11:27:43 -0700
Message-ID: <87wovlhucg.fsf@anholt.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

--=-=-=
Content-Type: text/plain

Stefan Wahren <stefan.wahren@i2se.com> writes:

> Hi, after changing the ARM frequency on a Raspberry Pi (for instance
> bcm2835-cpufreq), the pllb_arm in clk_summary (stays the same) doesn't
> match to the output of
>
> vcgencmd measure_clock arm
>
> which should be correct (tested with downstream kernel 4.14).
>
> My question is there a chance to fix this in clk-bcm2835?

Unfortunately clk_summary doesn't reflect what a get_rate() would
return, it's just what the kernel tried to program the rate to last, so
it doesn't catch the firmware's changes.

It would be nice to either make clk_summary show the actual rate as
returned by get_rate(), or have another column showing that.  If we had
that column and also an optional driver method to measure rate, then
that could replace the use of vcgencmd measure_clock with the
measurement code currently in clk-bcm2835.c, which would be pretty nice.

Back when I asked about it, the clock maintainers thought that exposing
measurement would be a good idea, but I don't think any progress has
been made on it.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlsO7R8ACgkQtdYpNtH8
nugQjA/+PlpVCeGEgDaLNbxQ+igTEG0zV2ZbfFnvHxvynltuy88kx6YyE78nDIa8
XDCZ9j9X8SzuQzDgITTcSlMbfNIVRjBKSrwDCk6dU8A0TOSc+QtJm8eMy/c3i7FN
bem6Ny/eezghrV9hxbhj5QxE7ks+qLK+kok/D4vfN1MrYga2KLvqqe51i6Mg4L9w
nf++wLyPG2FAsNpY01JlFV6mrKoH2HCAe4F37L7SwASuGLYdvQO/6S3TZwkhaG3V
w9uJxPQXm/iNtJrlnRAHKXOD88/RxP7axHxzvCDyd29vM+79KjYSHrssu6bBuDTl
fHpkm/5oikVcZfddxRD2dQ4i7qatqEhCVSuWvNLWw3bWb7j6jWaGJ5bl7KqoK1l2
1q0I+zu12lTozi59hbhodLGozR35jv0EQUrkqQD6weVvOZBo/b18sDRviDtwykZO
liXLzlDnKtQBpL2cfY95erFd8KeTpxgLRvodm+TAjhBB86E/3h5tTNLZKEGNw3QW
l5+ER556NVSl1OoyMgWJQSmI7W9JC4DXvOPxN1t0geqzrD5PeMexh+c4BMEUdVIn
0VOzCh0yg5hQlshx0CCAGNm6mzFhec8wYK0Miiv13EiRivbxPN+wZUJC61zBSjMX
+wAXsqZ0gi8kZWtTL9Y8yd/q00QIOn2AwS6EcUAvzaJ4CFnDuA0=
=+WN8
-----END PGP SIGNATURE-----
--=-=-=--
