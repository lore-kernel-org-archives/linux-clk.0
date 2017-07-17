Return-Path: <wsa-dev@sang-engineering.com>
Date: Mon, 17 Jul 2017 11:18:01 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Yoshihiro Kaneko <ykaneko0929@gmail.com>,
	linux-clk <linux-clk@vger.kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: clk: renesas: rcar-gen3: Fix error return code in
 cpg_sd_clock_recalc_rate
Message-ID: <20170717091801.GA2129@katana>
References: <1492624001-3758-13-git-send-email-ykaneko0929@gmail.com>
 <20170714142559.p6xp6dp4whlqcr5n@ninjato>
 <CAMuHMdV0fLG6m5hdyMpeKxb1nz_L+xEmyjvZV0iotXMSK517zw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cNdxnHkX5QqsyA0e"
In-Reply-To: <CAMuHMdV0fLG6m5hdyMpeKxb1nz_L+xEmyjvZV0iotXMSK517zw@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>


--cNdxnHkX5QqsyA0e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Geert,

> >> In .recalc_rate of struct clk_ops, it is desirable to return 0 if an
> >> error occurs, but -EINVAL is returned. This patch fixes it.
> >>
> >> Fixes: 5b1defde7054 ("clk: renesas: cpg-mssr: Extract common R-Car Gen=
3 support code")
> >> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> >> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
> >
> > Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>=20
> Why is it desirable to return 0 if an error occurs? Because the return ty=
pe is
> unsigned long?

Yes, I'd think so. Instead of an arbitrary high, kind-of-random, number, ju=
st
return 0 which also indicates that something unexpected happened? Also, all
other drivers return zero in an error case (did some quick coccinelle
grepping before).

>=20
> Is this routine allowed to fail? I don't see any handling of zero by
> its callers.

=46rom clk-provider.h:

 * @recalc_rate Recalculate the rate of this clock, by querying hardware. T=
he
 *              parent rate is an input parameter.  It is up to the caller =
to
 *              ensure that the prepare_mutex is held across this call.
 *              Returns the calculated rate.  Optional, but recommended - if
 *              this op is not set then clock rate will be initialized to 0.

What would be the benefit of keeping -EINVAL in an unsigned long?

Regards,

   Wolfram

--cNdxnHkX5QqsyA0e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAllsgMUACgkQFA3kzBSg
Kbb9Uw/+OYc7tD5vp6+0L5/yAoVdnuBMKhxCFAWmfU9bK45NvDdg2Qljchqfkezf
6ExyAqYaDDQOpT6bMlRhdYB1kSZCQCpc8kReeThveMdXPMxx4NfVKDxrLMvQlNub
+K6LrVmUEBiOSB79P5sROrMyOZPEtRWBHs7NeUkLqKuvEbLvjTGCco4U9YTMTvdp
6j5hgkqQwWG6b1AFnFc4rB06ApHvCEx7dX3kUVTteESmPY8sTDCT4BSj+cpqyvd3
9P6y0nPO9e4XLKKPPPBht+EW7EegKMhZVyB9k+eaqONDIa1VKVgqyFruuXqxabuf
aPfbnavW/5RBrbrxxoIAiujmmHbS5/0kfhNXB5bWVaSiNRfwQbe6RzKsSHWeK7e/
mvLkcpDfKcRbZeeIb5+hmrr51vZ5dTY/FHds6pjMKW1bF8KbDmqXPWUCmS96OFVw
AHi4yyaMK6SjquEDdV1UoKcXrUaWKJ1+DeJo61P5L1BwSYutVvxQRdNsktRTnKkX
sEDtxgZF5eW/2FYjWIP+jzscOBHfJ//oj5KcWgZsSyl8RRcsDy0fD5YOueMjoeF/
swnyCr9J1gA7mxki6HzrscTMaSujNHxuNb5Z2tuaYio1U2O6x66GSslDDT7gX3+u
OD08TZrJsFFxiD3XjW3NrmSvQQGQ+FizPszXMkSJzaetV3U1Or4=
=LdHT
-----END PGP SIGNATURE-----

--cNdxnHkX5QqsyA0e--
