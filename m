Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Mon, 22 Jan 2018 13:14:35 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Chen-Yu Tsai <wens@csie.org>, Russell King <linux@armlinux.org.uk>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [RFC PATCH 0/9] initial support for "suniv" Allwinner new ARM9
 SoC
Message-ID: <20180122121435.bpayxk4uzfqbhqse@flea.lan>
References: <20180119231735.61504-1-icenowy@aosc.io>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="jeuhtqwctfssk4ie"
In-Reply-To: <20180119231735.61504-1-icenowy@aosc.io>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--jeuhtqwctfssk4ie
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 20, 2018 at 07:17:26AM +0800, Icenowy Zheng wrote:
> This is the RFC initial patchset for the "new" Allwinner SUNIV ARM9 SoC.
>=20
> The same die is packaged differently, come with different co-packaged
> DRAM or shipped with different SDK; and then made many model names: F23,
> F25, F1C100A, F1C100S, F1C200S, F1C500, F1C600, R6, etc. These SoCs all
> share a common feature set and are packaged similarly (eLQFP128 for SoCs
> without co-packaged DRAM, QFN88 for with DRAM). As their's no
> functionality hidden on the QFN88 models (except DRAM interface not
> exported), it's not clever to differentiate them. So I will use suniv as
> common name of all these SoCs.

Where is that suniv prefix coming from?

And you need to have a SoC in all your compatibles. This isn't about
being clever or not, this is just a matter of being able to accurately
read in a crystal ball. Or maybe it's just the same, in which case,
I'd really like to have a course :)

You should really answer two questions here:
  - Are you able to predict whether you'll find an SoC part of that
    family in the future that derives a bit and will need a compatible
    of its own?
  - Are you able to predict which quirks we'll need along the way to
    support all the SoCs you've listed there?

If you can't answer yes to both these questions, with a 100%
certainty, then you'll need a SoC name in the compatible.

Which doesn't prevent you from sharing as much as possible the DT like
we did between the A10s and the A13 for example.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--jeuhtqwctfssk4ie
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlpl1aoACgkQ0rTAlCFN
r3Sihw//fq2FqLaf2YOdj2sToRGlKYI5WmeXeHiVKSX1S0jGd/8L02RtbSWd0Bvk
o2SG1GgP0UMtlrZcyX35SgWp12ofA05+stVDh/5Ff5L6a51AnfbmmOsCNxOMGXHs
vRqCFxwtlvKv77BJK6c4Ro2tmppIQAMF2omCwUcwXNsTVQ++RXxJJfiq8bOHxA5a
+yYoABmpMdk7u9TVL+G1ZiNMT8FyMMiY5L09FBmVUJohtPlvY/81Uawl+RdcBfbu
KyYXvOhf9Wq4fiuU+xFWBXA3xNsyMWLz0DxdAbjAR7tp9TtqbjRxVQHs15DQYM8o
i5aVD98tj9h0t6ddP7stbUj9uiFyAI9SJJw+8cEQZuHfU0VqATcwU6JKzMYIGSAS
nRw6WbE+MJSVf5E+oSUQ+5p4EACel9jrPsArDzQoGxOzJArO9Ky7du1+ORrDYYF/
erFyDhQyN1/it4Och0QqlIA0VygytgV94+3PycUjN2L6waKRlVb8T2LplApnZmVQ
RM/5odWnAlJTxENw4kvBT3OVWuJKC3qYkDgI7pfdH8HglUtA6kyfO3JTO0/nAvwc
vYJuT5pvfXCW2sOKlFL47pv/F33yRaZbdCnj5ON36WC54NW7dK7sukS8TGZJARNU
8m6liBg0TVtPJde1y6eWdL4FHJ17WOGjeY7IxwLUK+GfHF+APSI=
=7OBU
-----END PGP SIGNATURE-----

--jeuhtqwctfssk4ie--
