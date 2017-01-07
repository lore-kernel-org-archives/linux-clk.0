Return-Path: <megous@megous.com>
Subject: Re: [linux-sunxi] [PATCH] clk: sunxi-ng: fix PLL_CPUX adjusting on H3
To: dev@linux-sunxi.org
References: <20161125002852.18097-1-megous@megous.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Chen-Yu Tsai <wens@csie.org>, Jorik Jonker <jorik@kippendief.biz>,
 "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
 "moderated list:ARM/Allwinner sunXi SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
From: =?UTF-8?Q?Ond=c5=99ej_Jirman?= <megous@megous.com>
Message-ID: <0985b1ec-ba95-1505-cc59-adec4b88238f@megous.com>
Date: Sat, 7 Jan 2017 16:49:18 +0100
MIME-Version: 1.0
In-Reply-To: <20161125002852.18097-1-megous@megous.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="bj355qxPVXAo5du2TdUpl28PqKw8O3OU3"
List-ID: <linux-clk.vger.kernel.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--bj355qxPVXAo5du2TdUpl28PqKw8O3OU3
Content-Type: multipart/mixed; boundary="G2x79Cfh3LbH2gdSHUSbEve23dOwU5DA4";
 protected-headers="v1"
From: =?UTF-8?Q?Ond=c5=99ej_Jirman?= <megous@megous.com>
To: dev@linux-sunxi.org
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Chen-Yu Tsai <wens@csie.org>, Jorik Jonker <jorik@kippendief.biz>,
 "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
 "moderated list:ARM/Allwinner sunXi SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
Message-ID: <0985b1ec-ba95-1505-cc59-adec4b88238f@megous.com>
Subject: Re: [linux-sunxi] [PATCH] clk: sunxi-ng: fix PLL_CPUX adjusting on H3
References: <20161125002852.18097-1-megous@megous.com>
In-Reply-To: <20161125002852.18097-1-megous@megous.com>

--G2x79Cfh3LbH2gdSHUSbEve23dOwU5DA4
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Maxime,

Dne 25.11.2016 v 01:28 megous@megous.com napsal(a):
> From: Ondrej Jirman <megous@megous.com>
>=20
> When adjusting PLL_CPUX on H3, the PLL is temporarily driven
> too high, and the system becomes unstable (oopses or hangs).
>=20
> Add a notifier to avoid this situation by temporarily switching
> to a known stable 24 MHz oscillator.

I have done more thorough testing on H3 and this approach with switching
to 24MHz oscillator does not work. Motivation being that my Orange Pi
One still gets lockups even with this patch under certain circumstances.

So I have created a small test program for CPUS (additional OpenRISC CPU
on the SoC) which randomly changes PLL_CPUX settings while main CPU is
running a loop that sends messages to CPUS via msgbox.

Assumption being that while CPUS is successfully receiving messages via
msgbox, the main CPU didn't lock up, yet.

With this I am able to quickly and thoroughly test various PLL_CPUX
change and factor selection algorithms.

Results are that bypassing CPUX clock by switching to 24 MHz oscillator
does not work at all. Main CPU locks up in about 1 second into the test.
Don't ask me why.

What works is selecting NKMP factors so that M is always 1 and P is
anything other than /1 only for frequencies under 288MHz. As mandated by
the H3 datasheet. Mainline ccu_nkmp_find_best doesn't respect these
conditions. With that I can change CPUX frequencies randomly 20x a
second so far indefinitely without the main CPU ever locking up.

Please drop or revert this patch. It is not a correct approach to the
problem. I'd suggest dropping the entire clock notifier mechanism, too,
unless it can be proven to work reliably. The bypass makes some
intuitive sense, but for some reason it doesn't work in practice (on H3
at least).

Aside from this, uboot also needs to be changed to set that it uses M
and P factors correctly.

Whatever else I try, I always hit lockups sooner or later with the test
program. I tried 24MHz bypass and staged application of multipliers and
dividers as discussed before.

I'll send a proper patch for nkmp clock driver and u-boot later.

regards,
  o.

> Signed-off-by: Ondrej Jirman <megous@megous.com>
> Tested-by: Lutz Sammer <johns98@gmx.net>
> ---
>  drivers/clk/sunxi-ng/ccu-sun8i-h3.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>=20
> diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-h3.c b/drivers/clk/sunxi-ng=
/ccu-sun8i-h3.c
> index 614d47c..cf266c9 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun8i-h3.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun8i-h3.c
> @@ -809,6 +809,13 @@ static const struct sunxi_ccu_desc sun8i_h3_ccu_de=
sc =3D {
>  	.num_resets	=3D ARRAY_SIZE(sun8i_h3_ccu_resets),
>  };
> =20
> +static struct ccu_mux_nb sun8i_h3_cpu_nb =3D {
> +	.common		=3D &cpux_clk.common,
> +	.cm		=3D &cpux_clk.mux,
> +	.delay_us	=3D 1, /* > 8 clock cycles at 24 MHz */
> +	.bypass_index	=3D 1, /* index of 24 MHz oscillator */
> +};
> +
>  static void __init sun8i_h3_ccu_setup(struct device_node *node)
>  {
>  	void __iomem *reg;
> @@ -827,6 +834,9 @@ static void __init sun8i_h3_ccu_setup(struct device=
_node *node)
>  	writel(val | (3 << 16), reg + SUN8I_H3_PLL_AUDIO_REG);
> =20
>  	sunxi_ccu_probe(node, reg, &sun8i_h3_ccu_desc);
> +
> +	ccu_mux_notifier_register(pll_cpux_clk.common.hw.clk,
> +				  &sun8i_h3_cpu_nb);
>  }
>  CLK_OF_DECLARE(sun8i_h3_ccu, "allwinner,sun8i-h3-ccu",
>  	       sun8i_h3_ccu_setup);
>=20


--G2x79Cfh3LbH2gdSHUSbEve23dOwU5DA4--

--bj355qxPVXAo5du2TdUpl28PqKw8O3OU3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEmrE4sgaRYhzUz5ICbmQmxnfP7/EFAlhxDgIACgkQbmQmxnfP
7/GucA//WHTNRB7d5+MWhRpmGwHFb26+BcNIbH/3SAXNQxCpCaMPhwVoi5mjPtce
zey7weVpKQKvZjzmjGL7J46r2mjFGQ8p+lW0ax/QSESh5aojhorZOpWSfFaz2R3z
QahTFlk1ZmwIaprQ90he7kVahZc88xNffZkz31fqgwH71G8Wk5yc0h8/7dE386jO
pY41zR20BYBhJSP3COkNgsaokYoPF7r5av6Hq6oJd3Ec5pmR84dtuHnuUP7x6Bkc
CCHlotvLRS8RgO6wBNXQQlHVTOuauz/IpiauZcOtYQlmxmipU/4wA+hhnjKIEoaB
seSjD+c9z+qcFvUfo8K3wnGxLVCaiPaJjL+28a8RfJfE1QUymPX57t/RkM6LmkSl
Hv6J1LrCAJmxjmdDGaiVkNXAt9pyth8z6k/8K4uh5bBdXnAhFJIj6JfbtIrLuEhk
a78rQD4V8OTyOgPYhXsIXXU6rRNKvt5FcO0eLx53B56kgi8vhASxBrn8vp334UZa
RFpzbSsHf8iuhbo+G26BJpG1du0MftZau9wnj0d7/YDbiO3Q2vyueYDHzPqx/F7z
Yeb36ERLHGiEL3SCwuimEuFCIImrhpjnKPvlj2DcesnRmaqDEDSFEBKB6KQ+h3eg
nfne7KTwJpJlXIPCHdCM+1FEJZ4FH7w536dINsKHfcuzsu2VADI=
=sPos
-----END PGP SIGNATURE-----

--bj355qxPVXAo5du2TdUpl28PqKw8O3OU3--
