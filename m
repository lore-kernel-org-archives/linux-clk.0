Return-Path: <maxime.ripard@free-electrons.com>
Date: Wed, 27 Jan 2016 20:13:25 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Vishnu Patekar <vishnupatekar0510@gmail.com>,
	linux-sunxi@googlegroups.com
Subject: Re: [PATCH RFC 00/11] clk: sunxi: factors clk clean up and refactor
Message-ID: <20160127191325.GR4317@lukather>
References: <1453727747-23307-1-git-send-email-wens@csie.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="O7Os1+MGCLLi8F5z"
In-Reply-To: <1453727747-23307-1-git-send-email-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>


--O7Os1+MGCLLi8F5z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Chen-Yu,

On Mon, Jan 25, 2016 at 09:15:36PM +0800, Chen-Yu Tsai wrote:
> Hi everyone,
>=20
> This series cleans up and reworks parts of sunxi's factors clk. The goal
> is to support non-standard formulas for clock rate calculation, such as
> pre-dividers on some parents, or all power-of-2 dividers. One such clock
> is the AHB1 clock on A31/A31s.
>=20
> Patch 1 is Maxime's patch adding an unregister function for composite
> clocks. Patches 3 and 4 use this, so it is included for completeness.
>=20
> Patch 2 makes the config tables for factors clk constant. These contain
> the shift and width for the factors. They are used to manipulate the
> clk register values. There should be no reason to change them in-flight.
>=20
> Patch 3 adds a proper error path for the factors clk register function(),
> so we don't leak memory when a call fails.
>=20
> Patch 4 adds an unregister function for factors clks.
>=20
> Patch 5 adds an error patch to sunxi_factors_clk_setup()
>=20
> Patch 6 packs the parameters passed to get_factors callbacks in a struct.
> This makes it easier to extend factors clk without having to edit all
> the function definitions, and also makes the lines shorter.
>=20
> Patch 7 makes factors clk support custom formulas for calculating clock
> rates. On the clock rounding/setting side, we only need to teach
> get_factors about different parent clocks. On the recalc side, we add
> support for custom .recalc callbacks for clocks that need them.
>=20
> Patch 8 drops .round_rate from factors clk ops. Since only one of
> .round_rate and .determine_rate is needed, and the clk core prefers the
> latter, remove .round_rate.
>=20
> Patch 9 rewrites sun6i-a31-ahb1-clk using factors clk with the new custom
> formula support. sun6i-a31-ahb1 has a pre-divider on one of its parents.
>=20
> Patch 10 rewrite sun6i-ar100 using factors clk.
>=20
> Patch 11 rewrites sun8i-a23-mbus-clk using the simpler composite clk.
> While this patch is doing the reverse, i.e. rewriting a factors clk into
> a composite clk, it is included because some changes overlap. I'm not
> sure whether this approach is worthwhile, as it actually adds more code,
> though it might make it easier to understand.

Thanks a lot for working on this.

I'm guessing we could even take a step further, since most of the
clocks are re-using a variation of the factor calculation code. We
roughly end up in a handful of cases (the clocks are just from a quick
look at the A10 and A31 datasheet and the source code, which might
leave a few clocks that we don't support yet in the newer SoCs)

  * A single factor:
    + These ones are trivial to handle, a simple division gives us
      directly the divisor to use.
    + Clocks in this case:
      - A13 AHB (p)
      - A80 AHB (p)
      - A10 PLL3 (m)
      - A31 AHB (m)
      - A80 GT (m)

  * Two factors:
    + These ones might be a bit more difficult to handle. One case is
      quite trivial too, it's the n and m case, where we can use
      directly rational_best_approximation() that handles this just
      fine.
      The other cases are a bit more tricky, but we can always brute
      force it, it shouldn't be very difficult to implement or very
      long to run.

    + Clocks in the (p + m) case
      - A10 APB1
      - A20 CLK OUT
      - A10 MOD0
      - A31 AR100
      - A80 APB1

    + Clocks in the (n + k) case
      - A10 PLL5
      - A31 PLL6

    + Clocks in the (n + m) case
      - A10 PLL2
      - A31 PLL3
      - A31 PLL4
      - A31 PLL8
      - A31 PLL9
      - A31 PLL10

  * Three factors
    + There's probably some consolidation that can be done here too,
      or to consider brute-forcing the whole thing again. The number
      of combinations would probably rise quite a lot, which might
      have a quite significant performance hit. I'm not really sure we
      care though.

    + Clocks in the (n, k and m) case
      - A31 PLL1
      - A31 PLL5
      - A31 MIPI PLL

    + Clocks in the (n, p and m) case
      - A31 pll2
      - A80 pll4

  * All factors (n, k, p and m)
    + I'm not sure it's worth it in this case. I'd expect the code to
      be quite complex and slow to evaluate all the cases.
    + Clocks
      - A10 PLL1
      - A10 PLL4
      - A23 PLL1
   =20

So, I guess we could have a default (and overridable) function that
would cover at least the cases where we have a single or two
factors. I think we already have everything we need in the clk_factors
structure, so we shouldn't need to modify each and every clocks.

What do you think about it?
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--O7Os1+MGCLLi8F5z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWqRbVAAoJEBx+YmzsjxAgxaMP/32CNOaJ7PQgouXzckRsqqn6
dNlaJkA8myzWFQxmSwux3YVyfIj9hhMyRYQB60PIiwQYLt7Dtlls+eXuIzRl+lJF
WUyTTQodobUgPQCHZoeVHDzzoVhhWbI1D/197ygvPQBknQlzzKrcccHJPwu89+zo
6C4ePt9YmafOpDfvBXLMbqpth0hhLw4l16OxCCFS7TCxNNBJJTuPFCdOMMGLL+mV
KVZR5Iz8BYSIk9f4iXG77JpmDEFC/6ARs52D43v4LcvMtjpnkzWmidjoZ4OFjG+V
0spdI3p288khe9Ygm+WDnK8xkSMIrxdjrRrB32n1zgR6CB/FGizb/D2YR6QVWgId
T064ThimZJmgRklj5n7gAOzBRvrAxFrcAcSXGo1pmrT5KVl95+z5iF6v3UVUdWe8
3qblomVYTA4Y/aMNcFH/naUr1z/tnVqS8+1BjM5jeAjO/B96jjbB64OeKej6kdOD
IyXMyMIRun8iH2StizrM3ygjgnxnxG+KsAvnUOosobvr0ky30jmq/g1ldXjq1c4e
YGQ31rKD07Kjxpp93DmoqH/fjm2Y3+vKbil9HcXkRFhrX4l/lMpnH46KhlQmO/C+
G6mAovCZMvTaW5wSKGI8CNPms/Y+QdQRiM5fODd5l6HxgyyiwTwUS/FvB6ShkB7u
u33MgkrW66DJXZVhhBzv
=Rg6s
-----END PGP SIGNATURE-----

--O7Os1+MGCLLi8F5z--
