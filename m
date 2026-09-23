Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 989233382FC;
	Wed, 23 Sep 2026 11:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790162674; cv=none; b=NTd4OHn6SHkZ931//TO3kRB79fPPKQqGtTKKE84JN8JgiHjuKBTEUMbRRaXaL5jA1dKB4CaPBvkRIZiBC5PhJaAOWdNlhumGoLIiM+9rJujtcthRwSMzSlPv7DthV9tvxm5qymo1rPgncuTdXO7ytIrqAxB8vS9DK3jRUgeEOKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790162674; c=relaxed/simple;
	bh=TEEwf0OK3ASPSQ/u04eQKbrq0RLcv3gmB/qHYc3605M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CPCeTbKeKY7aBhHG5ILKr1hNjqcSpfxRoT1cVT8VHI4+oR//yV/haeOg9dEJBOOGBgCwR6yLU2fNSarl6ZUkR8DMSKo20taEu9Pq8ol7eaJNGs3syGdLE/E2ypGzfyI1eW9uYgqo5KwBmIbqGRgG+zbTi30Fv35/5Wci3bsyNbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KyJ8rRaI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KyJ8rRaI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 925B71F00893;
	Wed, 23 Sep 2026 11:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790162672;
	bh=J9g2a92wrndbH9rSV6qvGEKxGUNXcugHf6a+Io4Iz8E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KyJ8rRaILNB9t8PP3PtkE1Rg/mUv+22FzJBP2/s2DM/QQgO9rcw6ZVTaI45/Rvx8S
	 CShvtx94RNl7mBFLzM+u5VmLjpX5jf6R0kHeyJVc1XdE/18Zw3Y6uGz/VljEXmQ0z1
	 hn3FNbdFyqvt/5iBQVRP7zeREDztcINP4MLpKvstPOZtWccYCY/+vG3m0NUh3bwwp1
	 N68fSlPLtI4q1W/5+ixgndvUEPaDG3wP5+QJaJLmL2Y/7I7J/LgaySl6bJvQWoziSF
	 Gis2eTOXqphk/GMbT6eZ0aqWgegMNId+NtFKvetgr0AHlmoU+acT1NE3iEcgrYl5ox
	 2DTx3o9qgxeeg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 1/3] clk: meson: pll: Remove the dedicated n
 parameter
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jian Hu" <jian.hu@amlogic.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, linux-clk@vger.kernel.org, neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260923-meson_refactor_n-v1-1-3a8ce27121a2@amlogic.com>
References: <20260923-meson_refactor_n-v1-0-3a8ce27121a2@amlogic.com>
 <20260923-meson_refactor_n-v1-1-3a8ce27121a2@amlogic.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 11:24:31 +0000
Message-Id: <20260923112431.925B71F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Critical] clk: meson: struct meson_clk_pll_data removal of 'n' breaks co=
mpilation
- [High] clk: meson: pll unconditionally requires range, breaking table-bas=
ed PLLs
- [High] clk: meson: external pre-divider violates PLL disable/reset sequen=
cing
--

commit 9a0d9eb075576d244c161f62134109ad2353a8b7
Author: Jian Hu <jian.hu@amlogic.com>

clk: meson: pll: Remove the dedicated n parameter

The Meson PLL framework models the PLL pre-divider (N) using a dedicated
field in struct meson_clk_pll_data. Since the common clock framework already
provides a generic divider implementation, this patch removes the dedicated
n parameter from the framework and simplifies the PLL rate calculation.

> --- a/drivers/clk/meson/clk-pll.c
> +++ b/drivers/clk/meson/clk-pll.c
[ ... ]
> @@ -119,145 +107,48 @@ static unsigned int __pll_params_with_frac(unsigne=
d long rate,
[ ... ]
> -static int meson_clk_get_pll_table_index(unsigned int index,
> -					 unsigned int *m,
> -					 unsigned int *n,
> -					 struct meson_clk_pll_data *pll)
> +static int meson_clk_get_pll_multiplier(unsigned long rate,
> +					unsigned long parent_rate,
> +					unsigned int *m,
> +					struct meson_clk_pll_data *pll)
>  {
> -	if (!pll->table[index].n)
> +	if (!pll->range)
>  		return -EINVAL;

[Severity: High]
Does this unconditionally reject any PLL that lacks a .range definition?

Many table-based PLLs in Meson SoC drivers (like axg_gp0_pll_dco) leave
.range as NULL and rely strictly on .table. Without .range, rate calculatio=
ns
for these PLLs will deterministically fail at runtime.

[ ... ]
> @@ -420,7 +311,7 @@ static int meson_clk_pll_set_rate(struct clk_hw *hw, =
unsigned long rate,
[ ... ]
>  	enabled =3D meson_parm_read(clk->map, &pll->en);
>  	if (enabled)
>  		meson_clk_pll_disable(hw);
> =20
> -	meson_parm_write(clk->map, &pll->n, n);

[Severity: High]
Does stripping the write to the N pre-divider from this protected atomic
section violate the hardware requirement to place the PLL in a disabled and
reset state before its input frequency changes?

By modelling the pre-divider as an external generic CCF clk_divider,
its .set_rate will modify the hardware register immediately without
notifying the running downstream PLL. Can this cause the active PLL to
lose lock and produce an unstable clock, potentially locking up the system?

>  	meson_parm_write(clk->map, &pll->m, m);
> =20
>  	if (MESON_PARM_APPLICABLE(&pll->frac)) {
> --- a/drivers/clk/meson/clk-pll.h
> +++ b/drivers/clk/meson/clk-pll.h
> @@ -11,29 +11,17 @@
>  #include <linux/regmap.h>
>  #include "parm.h"
> =20
> -struct pll_params_table {
> -	unsigned int	m;
> -	unsigned int	n;
> -};
> -

[Severity: High]
Does removing pll_params_table also remove the framework's capability to
enforce non-contiguous PLL multiplier rules?

>  struct pll_mult_range {
>  	unsigned int	min;
>  	unsigned int	max;
>  };
[ ... ]
>  struct meson_clk_pll_data {
>  	struct parm en;
>  	struct parm m;
> -	struct parm n;

[Severity: Critical]
Does removing the n and table fields from struct meson_clk_pll_data break
the build for untouched SoC platform drivers?

Drivers such as axg.c continue to initialize these fields in their static P=
LL
definitions (like axg_sys_pll_dco):

static struct clk_regmap axg_sys_pll_dco =3D {
	.data =3D &(struct meson_clk_pll_data){
		...
		.n =3D {
			.reg_off =3D HHI_SYS_PLL_CNTL,
			.shift   =3D 9,
			.width   =3D 5,
		},

This will cause an immediate compiler error because the types have been
removed. Will this breakage persist and break git bisect?

>  	struct parm frac;
>  	struct parm l;
>  	struct parm rst;
[ ... ]
> @@ -41,7 +29,6 @@ struct meson_clk_pll_data {
>  	struct parm l_detect;
>  	const struct reg_sequence *init_regs;
>  	unsigned int init_count;
> -	const struct pll_params_table *table;
>  	const struct pll_mult_range *range;
>  	unsigned int frac_max;
>  	u8 flags;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923-meson_refa=
ctor_n-v1-0-3a8ce27121a2@amlogic.com?part=3D1
