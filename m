Return-Path: <eric@anholt.net>
From: Eric Anholt <eric@anholt.net>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "open list\:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, Russell King <linux@armlinux.org.uk>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk <linux-clk@vger.kernel.org>, "linux-kernel\@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] drm/pl111: Register the clock divider and use it.
In-Reply-To: <CACRpkdZUQX2MBiyd=m9P6HsxnNsf446RNR=R3-O_zm5GQXXOOg@mail.gmail.com>
References: <20170508193348.30236-1-eric@anholt.net> <CACRpkdZUQX2MBiyd=m9P6HsxnNsf446RNR=R3-O_zm5GQXXOOg@mail.gmail.com>
Date: Tue, 09 May 2017 11:18:56 -0700
Message-ID: <87a86lgagf.fsf@eliezer.anholt.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
List-ID: <linux-clk.vger.kernel.org>

--=-=-=
Content-Type: text/plain

Linus Walleij <linus.walleij@linaro.org> writes:

> On Mon, May 8, 2017 at 9:33 PM, Eric Anholt <eric@anholt.net> wrote:
>
>> This is required for the panel to work on bcm911360, where CLCDCLK is
>> the fixed 200Mhz AXI41 clock.  The rate set is still passed up to the
>> CLCDCLK, for platforms that have a settable rate on that one.
>>
>> v2: Set SET_RATE_PARENT (caught by Linus Walleij), depend on
>>     COMMON_CLK.
>>
>> Signed-off-by: Eric Anholt <eric@anholt.net>
>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Thanks.  Waiting on an ack from clock folks, then we'll be ready to go,
I think.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlkSCBAACgkQtdYpNtH8
nugiTQ/6Asj1IOQ8QIngEUVxkzEnFKmNtYacX29NiyEkTsLdwXtCGH956p1v7MMg
zlWoEtHLI0Us+ffyMje8cN5/HApUNSfa51ju4bf+yhtyuqmpdOLVdx8etsWxWRAa
mb1R/6WIHog5y5xohHc/8TtLVUNayrE1Kw3qZ5o7eNMPtltn9cV28AQQejojKsdm
dOgf8kXO2/HQLS21WIeOa98viz8hMww+AG2L5sLiWlLhasphu0flMbAHIgK2RBNS
2EXOXSEQGC+6m5iK12X30qwAWE/fq90K6omCR/Nv+ChhPgPl2OL7+Pnlc+WyS2we
GQvuj4/UDWfLC3T79VnGYo5y8MPUXiXVAmGjbIW2N93D9dEAsjqQ21q/LcTHOHOR
Bf051dO6LHD+r8Vr1cDa8NK6vZptDki6i4/B24kGXTSa0QmfL/XIvncHo2PUqOVy
uA7Q6gdgW9kHajfHZ5dX2VD+PiRKgKUydaXnVpQPzKufhdrU7pFz9QSewIV0pFGU
+aQErGeUICaZT46RUG3tJQfuJ2Lna55/Kq0egaByvIp6gzFetcslLnNNbeQmGr0i
4+oVBYZQkTeYK/BRFM3ctGU1NI11Kjn9c4PSumlTB6D/2o/Wkayf/8S+xyrqv7L8
fGoC0tJsrz1xZ/I/oEGEgXAUmYhwib9y7JklHk3OEMmYC7alaJM=
=ikaA
-----END PGP SIGNATURE-----
--=-=-=--
