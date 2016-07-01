Return-Path: <linux-kernel-owner@vger.kernel.org>
Subject: Re: [PATCH v2 06/14] ARM: sun8i: clk: Add clk-factor rate application
 method
To: Maxime Ripard <maxime.ripard@free-electrons.com>
References: <20160625034511.7966-1-megous@megous.com>
 <20160625034511.7966-7-megous@megous.com> <20160630204001.GC5485@lukather>
Cc: dev@linux-sunxi.org, linux-arm-kernel@lists.infradead.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Chen-Yu Tsai <wens@csie.org>,
	=?UTF-8?Q?Emilio_L=c3=b3pez?= <emilio@elopez.com.ar>,
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
	<devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
From: =?UTF-8?Q?Ond=c5=99ej_Jirman?= <megous@megous.com>
Message-ID: <64d0c1e2-d818-0806-7c92-c10603b4f6f5@megous.com>
Date: Fri, 1 Jul 2016 02:53:52 +0200
MIME-Version: 1.0
In-Reply-To: <20160630204001.GC5485@lukather>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="fdvBJL65LA0PmWpTBxnc5qkVEVM2DxNHg"
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--fdvBJL65LA0PmWpTBxnc5qkVEVM2DxNHg
Content-Type: multipart/mixed; boundary="afwhiQc7HFslU4v78w6XQoFn1U3eTk8K4"
From: =?UTF-8?Q?Ond=c5=99ej_Jirman?= <megous@megous.com>
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: dev@linux-sunxi.org, linux-arm-kernel@lists.infradead.org,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Chen-Yu Tsai <wens@csie.org>,
 =?UTF-8?Q?Emilio_L=c3=b3pez?= <emilio@elopez.com.ar>,
 "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Message-ID: <64d0c1e2-d818-0806-7c92-c10603b4f6f5@megous.com>
Subject: Re: [PATCH v2 06/14] ARM: sun8i: clk: Add clk-factor rate application
 method
References: <20160625034511.7966-1-megous@megous.com>
 <20160625034511.7966-7-megous@megous.com> <20160630204001.GC5485@lukather>
In-Reply-To: <20160630204001.GC5485@lukather>

--afwhiQc7HFslU4v78w6XQoFn1U3eTk8K4
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 30.6.2016 22:40, Maxime Ripard wrote:
> Hi,
>=20
> On Sat, Jun 25, 2016 at 05:45:03AM +0200, megous@megous.com wrote:
>> From: Ondrej Jirman <megous@megous.com>
>>
>> PLL1 on H3 requires special factors application algorithm,
>> when the rate is changed. This algorithm was extracted
>> from the arisc code that handles frequency scaling
>> in the BSP kernel.
>>
>> This commit adds optional apply function to
>> struct factors_data, that can implement non-trivial
>> factors application method, when necessary.
>>
>> Also struct clk_factors_config is extended with position
>> of the PLL lock flag.
>=20
> Have you tested the current implementation, and found that it was not
> working, or did you duplicate the arisc code directly?

Also of note is that similar code probably doesn't crash in u-boot,
because there, before changing the PLL1 clock, the cpu is switched to
24MHz osc, so it is not overclocked, even if factors align in such a way
that you'd get the behavior I described in the other email.

>>  /**
>> + * sun8i_h3_apply_pll1_factors() - applies n, k, m, p factors to the
>> + * register using an algorithm that tries to reserve the PLL lock
>> + */
>> +
>> +static void sun8i_h3_apply_pll1_factors(struct clk_factors *factors, =
struct factors_request *req)
>> +{
>> +	const struct clk_factors_config *config =3D factors->config;
>> +	u32 reg;
>> +
>> +	/* Fetch the register value */
>> +	reg =3D readl(factors->reg);
>> +
>> +	if (FACTOR_GET(config->pshift, config->pwidth, reg) < req->p) {
>> +		reg =3D FACTOR_SET(config->pshift, config->pwidth, reg, req->p);
>> +
>> +		writel(reg, factors->reg);
>> +		__delay(2000);
>> +	}
>=20
> So there was some doubts about the fact that P was being used, or at
> least that it was useful.
>=20
>> +	if (FACTOR_GET(config->mshift, config->mwidth, reg) < req->m) {
>> +		reg =3D FACTOR_SET(config->mshift, config->mwidth, reg, req->m);
>> +
>> +		writel(reg, factors->reg);
>> +		__delay(2000);
>> +	}
>> +
>> +	reg =3D FACTOR_SET(config->nshift, config->nwidth, reg, req->n);
>> +	reg =3D FACTOR_SET(config->kshift, config->kwidth, reg, req->k);
>> +
>> +	writel(reg, factors->reg);
>> +	__delay(20);
>> +
>> +	while (!(readl(factors->reg) & (1 << config->lock)));
>=20
> So, they are applying the dividers first, and then applying the
> multipliers, and then wait for the PLL to stabilize.
>=20
>> +
>> +	if (FACTOR_GET(config->mshift, config->mwidth, reg) > req->m) {
>> +		reg =3D FACTOR_SET(config->mshift, config->mwidth, reg, req->m);
>> +
>> +		writel(reg, factors->reg);
>> +		__delay(2000);
>> +	}
>> +
>> +	if (FACTOR_GET(config->pshift, config->pwidth, reg) > req->p) {
>> +		reg =3D FACTOR_SET(config->pshift, config->pwidth, reg, req->p);
>> +
>> +		writel(reg, factors->reg);
>> +		__delay(2000);
>> +	}
>=20
> However, this is kind of weird, why would you need to re-apply the
> dividers? Nothing really changes. Have you tried without that part?
>=20
> Since this is really specific, I guess you could simply make the
> clk_ops for the nkmp clocks public, and just re-implement set_rate
> using that logic.
>=20
> You might also need to set an upper limit on P, since the last value
> (4) is not a valid one.
>=20
> I guess you could do that by adding a max field in the __ccu_div
> structure.
>=20
> Maxime
>=20


--afwhiQc7HFslU4v78w6XQoFn1U3eTk8K4--

--fdvBJL65LA0PmWpTBxnc5qkVEVM2DxNHg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXdb8gAAoJEG5kJsZ3z+/xDw0P/iavGyh00l1RKa65H54guJvH
rqk5BhV6XOH/1GoN0DJ2h07YlP//Ksz+T1ygmdzJme9d3L1YHKWaiUaoQAFUYtnv
ylnrUsfvJbMlTB2AbJGPrsczF3kVzj7FBGuMOLqs/3qjwwmEWBLjpyuunzLY8ZZL
HJ0U/svBCNCZdcjhhLBxsVWuGUJcxwHXZlqJ1il4b+lTLHGCVt6+znbyReK81kIc
yfrXHLnU0rxDIjyQTfJqyrzpxWp2FoIWwOOtDX2mDCXEb3mRUMqwlTWsQ1UHwNtn
oAAY6kZwNCi52vjNFi1+udbUKHlOUVOUHFD2aeX2X6pFIUP5shm0q+Otq3WTgoCi
B2cEoHzN4pcmMtroyvZROY2GunlW1lcxohvKON5Lr1vbGtZWJdG/V61B4BMsuF+N
LBsB1zEUtsRX71TjhMMiQGXjCrRUByuQ0cN+xMm9E6Fgrmmi/6iiwh2IApLH+q4j
88XkpjSXXWOgpXaeJnlMDfqDKU2U64TrN3Cg0WMb2T7i9JGgTYzb64Mhl/3KfBjl
hh4u3VhdadBYo6mZTAq9qHl8c0Tg4BlpuGepgGdtbqDAjSJ+HVTvd5rDq8co2sQ4
jGUMtJo+6QHryvdGFXQTr2doWYuLseMxCPulmWGzr2O9rCu0f2p/MmRKfTULsqri
yAp1V1qgzNFCuePX+eMX
=JWKh
-----END PGP SIGNATURE-----

--fdvBJL65LA0PmWpTBxnc5qkVEVM2DxNHg--
