Return-Path: <maxime.ripard@free-electrons.com>
Date: Mon, 1 Feb 2016 21:24:58 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	Vishnu Patekar <vishnupatekar0510@gmail.com>,
	linux-sunxi <linux-sunxi@googlegroups.com>
Subject: Re: [PATCH RFC 11/11] clk: sunxi: rewrite sun8i-a23-mbus-clk using
 the simpler composite clk
Message-ID: <20160201202458.GJ4652@lukather>
References: <1453727747-23307-1-git-send-email-wens@csie.org>
 <1453727747-23307-12-git-send-email-wens@csie.org>
 <20160127174932.GP4317@lukather>
 <CAGb2v658SFy6SF87=obYLW1YAxvk0T4dRuBU-F1oLT3Yq=PgTQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VIOdPewhitSMo36n"
In-Reply-To: <CAGb2v658SFy6SF87=obYLW1YAxvk0T4dRuBU-F1oLT3Yq=PgTQ@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>


--VIOdPewhitSMo36n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Jan 28, 2016 at 10:41:33AM +0800, Chen-Yu Tsai wrote:
> Hi,
>=20
> On Thu, Jan 28, 2016 at 1:49 AM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > On Mon, Jan 25, 2016 at 09:15:47PM +0800, Chen-Yu Tsai wrote:
> >> sun8i-a23-mbus-clk used sunxi's factors clk, which is nice for very
> >> complicated clocks, but is not really needed here.
> >>
> >> Convert sun8i-a23-mbus-clk to use clk_composite, as it is a gate + mux
> >> + divider. This makes the code easier to understand.
> >>
> >> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> >
> > Applied, thanks!
> > Maxime
>=20
> Given your suggestion for extending and generalizing factors clk
> clock rate calculations, maybe we just leave this one out and use
> the new stuff later?

My suggestion was only about the core of the clk-factors, the
"external" API would not change, so I'm guessing it's still relevant.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--VIOdPewhitSMo36n
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWr78aAAoJEBx+YmzsjxAgNaEP/3AcXi9I4vM91fmG5k4s3Mm8
1kSMqDE56Esa97TzBEV2K6NUpSUCk7EPQw4kYfQCfOZ5JbppQOX4G7oDxzdTJ63v
55GHTZPjDKcMjBXYj75DdYfJV2tc9LGhctjkGkWI6lxVuV9URzMDWLg5wYpAddjy
5VzPc2Ued8WCsZgSJqbt5FRfI8epj3tObTddEsLYjxntX05a3qEtzyURe5XX75py
fg7QmEBreZSuKmb47dc6pMUtdf1u6prGhOnR5oOK31RGuH7FbqbK/HvGmq0JsZbp
yAYJwDTRgvSW7xV6hkAgd/ZNrL0qukc+nOSsL92WqkFPWQoNHHtqN5Bs9JgsY9fU
zrTQa7LOB/0c1C6XArkujNhQG1vPQ3BMYBwBGovNzDy+lcDIrbDAxutERGlQs3ik
ui4dOvHHduIZqQmR8vTpV5viskRwoPxbHFv4Lq+cG+5E51RA8KvgSDrODqrbVzR8
ewv3eDNyGjqGJbZl64VnJ3xi/zvwBJc1C66Ebcyr7ZHzpcEmqStBoSp7EInhDtcQ
JiMetz/nULUGbw/XCymquhFOon6rn5tM8d4ZgGrw67Ddr0GdhiAIXwZLxy7PZPJ3
n1aIBgBMYKPbx5HGKLbD3Idi8MJ0ecK3KeLYbRopTous7M8xrPeah+Hwf0y+CrDz
2BYUIXuoLYp9S4GnfVwY
=kimr
-----END PGP SIGNATURE-----

--VIOdPewhitSMo36n--
