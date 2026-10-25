Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792957016;
	b=cFkvcR0t2IhFzOmxhWhFPyAD3vo0a/VI9Q4m1zUHO/8nf2Od0FlZXeG2w/Hmkn+DHn8A
	 QwcAnvp78PiY7YJ7DwBBr/AzISNYmIoyoHAFJtABsEK7O1QOYaOyUBvz85RUzoC/Eljdu
	 wftvadotTHNMa3oWvCZHNSPzxh7HNcfrkUPU81pTEA0M1NXrnBPTrK8o4ECb63eG7wFV+
	 OuUZMeNgQEGtUzVRYthvldCyDiXwu7iRBRPOHIDw8wLFi9ETOo0YeEBeJkQSvU6LchKCh
	 jCXkjAkqjDmDFw6Lj2AzSkRRK8AWuC+0uUxYMN2gaGq5Cq2WYlnuH2r72EqhP4teL0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792957016;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=J61VcvAbLcQSMmEAeRL+qVhICzSX+teUF//9ewPBhdc=;
	b=O1T1W+anJB0xmdqkg8F49JN5apMIGmM+TLIoO4ofng21WP9Us+HZSGin+296NZ2x1qxb
	 HxPfv/C1zrYNhhwispUICqdWVdxLn2fqGCxs35tT11pBACUOkQr8jR5BJ9rz8GXCOcRB1
	 pMEW34kct4+QC3zn6/mwChAlTIN4feSwIcmWNpKMinPs2vWt/HXt/3kJdrrGZo6PJD61M
	 gwEViNJz0GF5+EgdICtgKLMZ7NjxK3GW+NsxuVb0u1Z/uQ6d+X8LQZjfi2/7IjtCtvkB5
	 bqFpF1LF7NHCVi9UqQSHWXHGzeWTt45zb6hmN/kUq+ZxFJscqkfZeWAH724Zx3flL4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RxrZjwTQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAEC5606A31D;
	Sun, 25 Oct 2026 19:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RxrZjwTQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29CAF1F01825;
	Sun, 25 Oct 2026 19:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792957015;
	bh=J61VcvAbLcQSMmEAeRL+qVhICzSX+teUF//9ewPBhdc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RxrZjwTQpnxb6jo2Nfk+J6yyivqSmmSfSqz6mB5YWiTRNVmbkB/k/wUhMtrmZzCfJ
	 +Ez7DCoPfjEL3gm1tVKJL9RAEdHfvfUthaBrpGsJyUCrBGkGDQY1uMHqoDCfkKsc7F
	 ESTtR1FyxLsJ4G3C4+pBtzYeU3MwvdtXJdgkBBJMsdwUxfTu2uz1/j7Qxb3exRVn6r
	 8SNmitgncSAPFEFd02JkU6oHwziZhyqQukiN/eMYrr1SZlSIpRt3wfgz0ZeeQAerwj
	 fhqzDkxfkT8t8Ja5WUmeCCcV2rKwiPxoJrZsgMWD7DmYTo/lsquAfGwI4BOUnktc9D
	 /DvMmfku+raIA==
Message-ID: <sashiko-outbox-184383@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/4] clk: ingenic: Add Ingenic X1600 CGU clock driver
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <50983be55e467076e83e3ffc37b30fc4e5648e15.1792955907.git.hns@goldelico.com>
References: <cover.1792955907.git.hns@goldelico.com>
 <50983be55e467076e83e3ffc37b30fc4e5648e15.1792955907.git.hns@goldelico.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 25 Oct 2026 19:36:54 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 10 potential issue=
(s) to consider:
- [High] clk: ingenic: uninitialized m and n in x1600_pll_calc_m_n_od()
- [High] clk: ingenic: x1600: overlapping mux and div bits for X1600_CLK_CI=
MMCLK
- [High] clk: ingenic: x1600: missing .gate initializer for X1600_CLK_RTC
- [High] clk: ingenic: x1600: duplicate CLKGR0 gate bit for SADC and UART0
- [High] clk: ingenic: broken mdiv handling in ingenic_clk_calc_div() and s=
et_rate()
- [High] clk: ingenic: x1600-cgu requires undocumented clk12m external DT c=
lock
- [Medium] clk: ingenic: off-by-one od_max check in ingenic_pll_recalc_rate=
_od()
- [Medium] clk: ingenic: uninitialized d_reg and signed shift in ingenic_cl=
k_set_rate()
- [Medium] clk: ingenic: x1600: missing -1 parent sentinels for X1600_CLK_O=
TGPHY
- [Medium] clk: ingenic: x1600: missing cgu->lock in OTG PHY enable/disable=
 callbacks
--

commit 3e8079f374773cb8ca4b149b680046e60d28f341
Author: Paul Boddie <paul@boddie.org.uk>

clk: ingenic: Add Ingenic X1600 CGU clock driver support

This commit adds Clock Generation Unit (CGU) driver support for the Ingenic
X1600 SoC, including custom OTG PHY and PLL rate calculation handlers. It a=
lso
extends the common Ingenic CGU core to handle secondary post-VCO PLL divide=
rs
(OD1) and fractional I2S M/N/D divider fields.

> diff --git a/drivers/clk/ingenic/cgu.c b/drivers/clk/ingenic/cgu.c
> index 41e4c69131bd6..b4ef8ddf043a7 100644
> --- a/drivers/clk/ingenic/cgu.c
> +++ b/drivers/clk/ingenic/cgu.c
> @@ -76,6 +77,40 @@ ingenic_cgu_gate_set(struct ingenic_cgu *cgu,
>   * PLL operations
>   */
> =20
> +static unsigned
> +ingenic_pll_recalc_rate_od(u32 ctl, u8 od_shift, u8 od_bits, u8 od_max,
> +			   const s8 *od_encoding)
> +{
> +	unsigned int od, od_enc =3D 0;
> +
> +	if (od_bits > 0) {
> +		od_enc =3D ctl >> od_shift;
> +		od_enc &=3D GENMASK(od_bits - 1, 0);
> +	}
> +
> +	/*
> +	 * Use the encoding table if indicated. Otherwise, use the value
> +	 * directly, interpreting an encoded value of zero as a divider
> +	 * value of one.
> +	 */
> +	if (od_encoding) {
> +		for (od =3D 0; od < od_max; od++)
> +			if (od_encoding[od] =3D=3D od_enc)
> +				break;
> +		od++;
> +	} else {
> +		od =3D od_enc ? od_enc : 1;
> +	}
> +
> +	/* if od_max =3D 0, od_bits should be 0 and od is fixed to 1. */
> +	if (od_max =3D=3D 0)
> +		WARN_ON_ONCE(od_bits !=3D 0);
> +	else
> +		WARN_ON_ONCE(od =3D=3D od_max);

[Severity: Medium]
In ingenic_pll_recalc_rate_od(), does moving od++ before
WARN_ON_ONCE(od =3D=3D od_max) cause an off-by-one regression in the bounds=
 check
when od_encoding is used?

Previously in ingenic_pll_recalc_rate(), the check against pll_info->od_max
was performed on the 0-based loop index before incrementing od:

	for (od =3D 0; od < pll_info->od_max; od++)
		if (pll_info->od_encoding[od] =3D=3D od_enc)
			break;

	if (pll_info->od_max =3D=3D 0)
		BUG_ON(pll_info->od_bits !=3D 0);
	else
		BUG_ON(od =3D=3D pll_info->od_max);
	od++;

With od++ now happening inside the if (od_encoding) branch before the check,
matching the highest valid entry at od_encoding[od_max - 1] increments od to
od_max and triggers a false WARN_ON_ONCE(od =3D=3D od_max). Conversely, if =
od_enc
is not found in od_encoding, the loop finishes with od =3D=3D od_max, od++ =
makes
it od_max + 1, and the warning does not fire.

[ ... ]

> @@ -531,7 +590,7 @@ ingenic_clk_set_rate(struct clk_hw *hw, unsigned long=
 req_rate,
>  	struct ingenic_cgu *cgu =3D ingenic_clk->cgu;
>  	unsigned long rate, flags;
>  	unsigned int hw_div, div;
> -	u32 reg, mask;
> +	u32 reg, mask, d_reg;
>  	int ret =3D 0;
> =20
>  	if (clk_info->type & CGU_CLK_DIV) {
> @@ -554,6 +613,30 @@ ingenic_clk_set_rate(struct clk_hw *hw, unsigned lon=
g req_rate,
>  		reg &=3D ~(mask << clk_info->div.shift);
>  		reg |=3D hw_div << clk_info->div.shift;
> =20
> +		/*
> +		 * NOTE: Special treatment for the I2S dividers in the X1600.
> +		 * Set the multiplier to 1, imposing an N >=3D M*2 constraint,
> +		 * also setting D to "automatic" calculation. This permits the
> +		 * treatment of these dividers as normal dividers, although
> +		 * they are configured more similarly to PLLs.
> +		 */
> +		if (clk_info->mdiv.reg) {
> +			if (div < 2) {
> +				spin_unlock_irqrestore(&cgu->lock, flags);
> +				return -EINVAL;
> +			}
> +
> +			mask =3D GENMASK(clk_info->mdiv.bits - 1, 0);
> +			reg &=3D ~(mask << clk_info->mdiv.shift);
> +			reg |=3D 1 << clk_info->mdiv.shift;

[Severity: High]
How does the div < 2 constraint here in ingenic_clk_set_rate() interact with
ingenic_clk_calc_div() and the hardware N field encoding?

In ingenic_clk_calc_div(), div is clamped to a minimum of clk_info->div.div
(which is 1 for X1600_CLK_I2S0 and X1600_CLK_I2S1) without checking
clk_info->mdiv.reg:

	div =3D clamp_t(unsigned int, div, clk_info->div.div,
		      clk_info->div.div << clk_info->div.bits);

When a rate >=3D parent_rate is requested, ingenic_clk_determine_rate() ->
ingenic_clk_calc_div() calculates div =3D=3D 1 and reports parent_rate as a=
 valid
rounded rate, but the subsequent call to ingenic_clk_set_rate() fails with
-EINVAL because div < 2.

Additionally, just before the if (clk_info->mdiv.reg) block,
ingenic_clk_set_rate() calculates:

	hw_div =3D ((div / clk_info->div.div) - 1);

and writes hw_div (which is div - 1) into the N field at clk_info->div.shif=
t,
while writing a raw 1 into the M field at clk_info->mdiv.shift. Because the
I2S fractional divider uses unoffset M and N values (f_out =3D f_in * M / N
with N >=3D 2 * M), doesn't subtracting 1 from div program N =3D div - 1 in=
stead
of N =3D div (and write N =3D 1, M =3D 1 when div =3D=3D 2, violating N >=
=3D 2 * M), while
ingenic_clk_recalc_rate() adds 1 back when reading N and ignores mdiv?

> +
> +			if (clk_info->nddiv.reg) {
> +				d_reg =3D readl(cgu->base + clk_info->nddiv.reg);
> +				d_reg &=3D ~(1 << clk_info->nddiv.explicit_d_bit);
> +				d_reg |=3D 1 << clk_info->nddiv.explicit_n_bit;
> +			}
> +		}
> +
>  		/* clear the stop bit */
>  		if (clk_info->div.stop_bit !=3D -1)
>  			reg &=3D ~BIT(clk_info->div.stop_bit);
> @@ -565,6 +648,9 @@ ingenic_clk_set_rate(struct clk_hw *hw, unsigned long=
 req_rate,
>  		/* update the hardware */
>  		writel(reg, cgu->base + clk_info->div.reg);
> =20
> +		if (clk_info->nddiv.reg)
> +			writel(d_reg, cgu->base + clk_info->nddiv.reg);

[Severity: Medium]
Can d_reg be used uninitialized here in ingenic_clk_set_rate(), and does the
explicit_n_bit shift overflow a signed 32-bit int?

d_reg is only initialized when both clk_info->mdiv.reg and clk_info->nddiv.=
reg
are non-zero, whereas writel(d_reg, cgu->base + clk_info->nddiv.reg) only
checks clk_info->nddiv.reg, which triggers a -Wmaybe-uninitialized compiler
warning when compiling cgu.c.

Also, in x1600_cgu_clocks[], X1600_CLK_I2S0 and X1600_CLK_I2S1 set
explicit_n_bit to 31:

	.nddiv =3D { CGU_REG_I2S0CDR1, 31, 30 },

Should the bit operations on explicit_d_bit and explicit_n_bit use BIT()
instead of shifting a signed int 1 << 31?

> diff --git a/drivers/clk/ingenic/x1600-cgu.c b/drivers/clk/ingenic/x1600-=
cgu.c
> new file mode 100644
> index 0000000000000..627203f5cabe8
> --- /dev/null
> +++ b/drivers/clk/ingenic/x1600-cgu.c

[ ... ]

> +static int x1600_otg_phy_enable(struct clk_hw *hw)
> +{
> +	void __iomem *reg_opcr		=3D cgu->base + CGU_REG_OPCR;
> +
> +	writel((readl(reg_opcr) & ~OPCR_GATEUSBPHYCLK) | OPCR_SPENDN0, reg_opcr=
);
> +
> +	return 0;
> +}
> +
> +static void x1600_otg_phy_disable(struct clk_hw *hw)
> +{
> +	void __iomem *reg_opcr		=3D cgu->base + CGU_REG_OPCR;
> +
> +	writel((readl(reg_opcr) & ~OPCR_SPENDN0) | OPCR_GATEUSBPHYCLK, reg_opcr=
);
> +}

[Severity: Medium]
Should x1600_otg_phy_enable() and x1600_otg_phy_disable() acquire cgu->lock
around the read-modify-write of CGU_REG_OPCR?

X1600_CLK_RTC also uses CGU_REG_OPCR (.mux =3D { CGU_REG_OPCR, 2, 1 }), and
ingenic_clk_set_parent() modifies CGU_REG_OPCR under the clock framework
prepare_lock and cgu->lock, while clk_enable() and clk_disable() invoke
x1600_otg_phy_enable() and x1600_otg_phy_disable() under enable_lock without
holding cgu->lock. Can concurrent OTG PHY enable/disable and RTC reparenting
race on CGU_REG_OPCR?

[ ... ]

> +static void
> +x1600_pll_calc_m_n_od(const struct ingenic_cgu_pll_info *pll_info,
> +		      unsigned long rate, unsigned long parent_rate,
> +		      unsigned int *pm, unsigned int *pn, unsigned int *pod,
> +		      unsigned int *pod1)
> +{
> +	const unsigned int od_max =3D pll_info->od_max - 1;
> +	const unsigned int od1_max =3D pll_info->od1_max - 1;
> +	const unsigned int m_max =3D GENMASK(pll_info->m_bits - 1, 0);
> +	const unsigned int n_max =3D GENMASK(pll_info->n_bits - 1, 0);
> +	unsigned long m, n;
> +	unsigned int od =3D 1, od1 =3D 1;
> +	const unsigned long fvco_min =3D 600000000, fvco_max =3D 2400000000;
> +	unsigned long fvco;
> +
> +	/*
> +	 * Combined output divider range:
> +	 *
> +	 * ceil(fvco_min / rate) - fvco_max / rate
> +	 */
> +	unsigned int od_combined_min =3D (fvco_min + rate) / rate;
> +	unsigned int od_combined_max =3D fvco_max / rate;
> +	unsigned int od_combined;
> +
> +	for (od_combined =3D od_combined_min; od_combined <=3D od_combined_max;=
 od_combined++) {
> +		od =3D int_sqrt(od_combined);
> +		od1 =3D od_combined / od;
> +
> +		/* od =3D=3D floor(sqrt(od_combined)); od1 >=3D od */
> +		if ((od * od1 =3D=3D od_combined) && od <=3D od_max && od1 <=3D od1_ma=
x) {
> +			fvco =3D rate * od_combined;
> +			rational_best_approximation(fvco, parent_rate, m_max, n_max, &m, &n);
> +			break;
> +		}
> +	}
> +
> +	*pm =3D m;
> +	*pn =3D n;
> +	*pod =3D od;
> +	*pod1 =3D od1;
> +}

[Severity: High]
What happens in x1600_pll_calc_m_n_od() if the loop finishes without findin=
g a
matching od_combined?

m and n are declared without initialization and are only assigned inside the
if ((od * od1 =3D=3D od_combined) && od <=3D od_max && od1 <=3D od1_max) bl=
ock. Since
od_max and od1_max are 7, the maximum valid od * od1 product is 49. If a
consumer requests a rate > fvco_max (where od_combined_min > od_combined_ma=
x),
a rate <=3D ~12.24 MHz (where od_combined_min >=3D 50), or a rate where
[od_combined_min, od_combined_max] contains no integer divisible by
int_sqrt(od_combined) with both factors <=3D 7 (such as 43..48), the loop e=
xits
without initializing m and n, and leaves od and od1 with the last tested
values (which can exceed od_max / od1_max).

When x1600_pll_calc_m_n_od() returns to ingenic_pll_calc() and
ingenic_pll_set_rate():

	return div_u64((u64)parent_rate * m * pll_info->rate_multiplier,
		n * od * od1);

can uninitialized m and n cause a division-by-zero panic if n is 0, or cause
ingenic_pll_set_rate() to write uninitialized m and n and out-of-range od a=
nd
od1 values into the PLL control register?

Also, in the od_combined_min calculation:

	unsigned int od_combined_min =3D (fvco_min + rate) / rate;

when fvco_min is an exact multiple of rate (for example, rate =3D=3D 600 MH=
z),
this computes (fvco_min / rate) + 1 instead of ceil(fvco_min / rate). Should
this use DIV_ROUND_UP(fvco_min, rate) (after guarding against rate =3D=3D 0=
)?

> +
> +static const struct ingenic_cgu_clk_info x1600_cgu_clocks[] =3D {
> +
> +	/* External clocks */
> +
> +	[X1600_CLK_EXCLK] =3D { "ext", CGU_CLK_EXT },
> +	[X1600_CLK_RTCLK] =3D { "rtc", CGU_CLK_EXT },
> +	[X1600_CLK_12M] =3D { "clk12m", CGU_CLK_EXT },

[Severity: High]
Will registering X1600_CLK_12M as CGU_CLK_EXT cause x1600_cgu_init() ->
ingenic_cgu_register_clocks() -> ingenic_register_clock() to fail with
-ENODEV on Device Trees that follow the ingenic,cgu.yaml binding?

In ingenic_register_clock(), every CGU_CLK_EXT clock is required to be
present in the CGU Device Tree node:

	if (clk_info->type =3D=3D CGU_CLK_EXT) {
		clk =3D of_clk_get_by_name(cgu->np, clk_info->name);
		if (IS_ERR(clk)) {
			pr_err("%s: no external clock '%s' provided\n",
			       __func__, clk_info->name);
			err =3D -ENODEV;
			goto out;
		}

However, Documentation/devicetree/bindings/clock/ingenic,cgu.yaml only allo=
ws
two input clocks in clock-names ("ext" and "rtc"/"osc32k") and does not
define "clk12m".

[ ... ]

> +	[X1600_CLK_CIMMCLK] =3D {
> +		"cim_mclk", CGU_CLK_MUX | CGU_CLK_DIV | CGU_CLK_GATE,
> +		.parents =3D { X1600_CLK_SCLKA, X1600_CLK_MPLL,
> +			     X1600_CLK_EPLL, -1 },
> +		.mux =3D { CGU_REG_CIMCDR, 30, 2 },
> +		.div =3D { CGU_REG_CIMCDR, 0, 1, 8, 30, 29, 28 },
> +		.gate =3D { CGU_REG_CLKGR0, 22 },
> +	},

[Severity: High]
In x1600_cgu_clocks[X1600_CLK_CIMMCLK], do the .mux and .div definitions
overlap at bit 30 of CGU_REG_CIMCDR?

.mux =3D { CGU_REG_CIMCDR, 30, 2 } occupies bits 31:30 of CGU_REG_CIMCDR, w=
hile
.div =3D { CGU_REG_CIMCDR, 0, 1, 8, 30, 29, 28 } sets ce_bit =3D 30, busy_b=
it =3D 29,
and stop_bit =3D 28. When ingenic_clk_set_rate() sets BIT(clk_info->div.ce_=
bit),
won't it overwrite bit 30 of the parent mux field in CGU_REG_CIMCDR instead=
 of
setting CE_CIM (bit 29) and polling BUSY_CIM (bit 28)?

> +
> +	[X1600_CLK_EXCLK_DIV512] =3D {
> +		"exclk_div512", CGU_CLK_FIXDIV,
> +		.parents =3D { X1600_CLK_EXCLK },
> +		.fixdiv =3D { 512 },
> +	},
> +
> +	[X1600_CLK_RTC] =3D {
> +		"rtc_ercs", CGU_CLK_MUX | CGU_CLK_GATE,
> +		.parents =3D { X1600_CLK_EXCLK_DIV512, X1600_CLK_RTCLK },
> +		.mux =3D { CGU_REG_OPCR, 2, 1},
> +	},

[Severity: High]
X1600_CLK_RTC specifies CGU_CLK_MUX | CGU_CLK_GATE, but .gate is not
initialized here.

Because .gate is zero-initialized to { .reg =3D 0, .bit =3D 0 }, won't enab=
ling or
disabling rtc_ercs (including during clk_disable_unused() or
ingenic_clk_set_parent()) call ingenic_cgu_gate_set() on register 0x00
(CGU_REG_CLOCKCONTROL) bit 0, modifying the LSB of the X1600_CLK_CPU divide=
r?

> +
> +	/* Custom (SoC-specific) OTG PHY */
> +
> +	[X1600_CLK_OTGPHY] =3D {
> +		"otg_phy", CGU_CLK_CUSTOM,
> +		.parents =3D { X1600_CLK_12M },
> +		.custom =3D { &x1600_otg_phy_ops },
> +	},

[Severity: Medium]
Should .parents for X1600_CLK_OTGPHY initialize the remaining slots to -1, =
i.e.
{ X1600_CLK_12M, -1, -1, -1 }?

In ingenic_register_clock(), clocks with CGU_CLK_CUSTOM iterate over all
ARRAY_SIZE(clk_info->parents) (4) entries and register every entry that is =
not
-1:

	if (caps & (CGU_CLK_MUX | CGU_CLK_CUSTOM)) {
		clk_init.num_parents =3D 0;

		if (caps & CGU_CLK_MUX)
			num_possible =3D 1 << clk_info->mux.bits;
		else
			num_possible =3D ARRAY_SIZE(clk_info->parents);

		for (i =3D 0; i < num_possible; i++) {
			if (clk_info->parents[i] =3D=3D -1)
				continue;

With .parents =3D { X1600_CLK_12M }, the remaining three entries are
zero-initialized to 0 (X1600_CLK_EXCLK, "ext"), registering otg_phy with fo=
ur
parents ("clk12m", "ext", "ext", "ext") instead of one.

[ ... ]

> +	[X1600_CLK_SADC] =3D {
> +		"sadc", CGU_CLK_GATE,
> +		.parents =3D { X1600_CLK_EXCLK, -1, -1, -1 },
> +		.gate =3D { CGU_REG_CLKGR0, 14 },
> +	},
> +
> +	[X1600_CLK_UART0] =3D {
> +		"uart0", CGU_CLK_GATE,
> +		.parents =3D { X1600_CLK_EXCLK, -1, -1, -1 },
> +		.gate =3D { CGU_REG_CLKGR0, 14 },
> +	},

[Severity: High]
Both X1600_CLK_SADC and X1600_CLK_UART0 use .gate =3D { CGU_REG_CLKGR0, 14 =
}.
Should X1600_CLK_SADC use bit 13 of CGU_REG_CLKGR0 instead, so that gating
unused sadc (for instance in clk_disable_unused()) does not gate uart0?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1792955907.gi=
t.hns@goldelico.com?part=3D2
