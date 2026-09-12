Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692072F617C
	for <linux-clk@vger.kernel.org>; Sat, 12 Sep 2026 18:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789238697; cv=none; b=G6mdqR/v4pUC+wsXvPFreHMX9+2L00i5ZkSD3rN+nbkzG0vVoPzDMN+zxyLgve0bn5IEn2AjN4jovP+JyVuUlGaPmNR4cLnOvcvI7dEDtQTYkrb4B3z/MS/tKHdPerUZcfqu97RNb7qwhFOD5DwpaMUDbZhr3/f87g/P+d4FUgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789238697; c=relaxed/simple;
	bh=ib8LS2jZ2VKifOb21eRu7Y4j6KPhYVHnXfDeEHrkxJo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=idfANKPPUqQ5FH7hqctohxo9nRzreCFUXpM4my4xiQ6dCslS8Q3mHeTrbnna3lUNrY9EuRo2Lfxan15W5VxAvYc13FeD3r+hUpR5XzTwu0bL7adO+a0RKmRM5S41Pax3L98r2kE82chEjU78fWTOIRkLJ2EbWwz+QaB3zB6Vvm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oaG+YyOy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oaG+YyOy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DB0D1F000FF;
	Sat, 12 Sep 2026 18:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789238696;
	bh=ZVr0QMous/YR6vpzsWT7lHWwV7EP0cF8951SxAaUkWc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oaG+YyOyzsQxBRvEsGNCIXR2cwAk2eCGAAM6mWrd1fnQUv9n3yjEZytmeR5lAOieH
	 C+mqMgc7c5q0hh7I1u47oVt0MLBrpsI1n3tkOjUGEFtrSJbhTMmWnQND7lSpdMlKij
	 lH3PekYTnvbsJrRmx4Y80O5rhSTAXEDulv6eNzxcH8/0Jmq4Hp48fu6qKObc9+hZSL
	 HF10IYQBeU1m1vhtyDLPYJn0GRbc84YvPoZ3wwnIOdO12rvYNz7WdJcNdNZyo2PMhM
	 X9FRFrc3tbOWU6b4hakcPPtuZ4nwM7FJT0wEJMFKT0AWLIQeu+4pA8fct/TPhrX2MV
	 Vr5LaJQCX3a1w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] clk: mediatek: mt8173-mfgtop: do not use the clk API
 from power_on
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ryan Brue" <ryanbrue.dev@gmail.com>
Cc: linux-clk@vger.kernel.org
In-Reply-To: <20260912-mfgtop-no-clk-api-power-on-v1-1-def157ad1277@gmail.com>
References: <20260912-mfgtop-no-clk-api-power-on-v1-1-def157ad1277@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 12 Sep 2026 18:44:55 +0000
Message-Id: <20260912184456.1DB0D1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Bypassing the clock framework for mfg_26m with raw regmap writes l=
eaves its enable_count at 0, causing clk_disable_unused() to erroneously ga=
te the active clock during late init.
--

commit 21d85aa137f918a11f3303672477f1a831e84a33
Author: Ryan Brue <ryanbrue.dev@gmail.com>

clk: mediatek: mt8173-mfgtop: do not use the clk API from power_on

This commit replaces clk_prepare_enable() and clk_disable_unprepare() calls
for mfg_26m with raw regmap writes to the clock gate registers in the
power_on and power_off callbacks. This is done to avoid a layering inversion
during _noirq system suspend/resume transitions where runtime PM is disabled
and calling the clk API fails.

> diff --git a/drivers/clk/mediatek/clk-mt8173-mfgtop.c b/drivers/clk/media=
tek/clk-mt8173-mfgtop.c
> index 5669ca9954dc0..fed6fa6100dc5 100644
> --- a/drivers/clk/mediatek/clk-mt8173-mfgtop.c
> +++ b/drivers/clk/mediatek/clk-mt8173-mfgtop.c

[ ... ]

> @@ -66,12 +71,16 @@ struct mt8173_mfgtop_data {
>  static int clk_mt8173_mfgtop_power_on(struct generic_pm_domain *domain)
>  {
>  	struct mt8173_mfgtop_data *data =3D container_of(domain, struct mt8173_=
mfgtop_data, genpd);
> -	int ret;
> =20
> -	/* drives internal power management */
> -	ret =3D clk_prepare_enable(data->clk_26m);
> -	if (ret)
> -		return ret;
> +	/*
> +	 * Ungate the 26 MHz clock, which drives the block's internal power
> +	 * management. This is a raw write to the gate's CG register, not
> +	 * clk_prepare_enable() on the mfg_26m gate this driver provides: that
> +	 * would call clk_pm_runtime_get() on our own device, and genpd power
> +	 * transitions run at _noirq time, where runtime PM is disabled and
> +	 * that returns -EACCES. mfg_26m stays registered for any consumer.
> +	 */
> +	regmap_write(data->regmap, mfg_cg_regs.clr_ofs, MFG_CG_26M);

[Severity: High]
Since this raw regmap write in clk_mt8173_mfgtop_power_on() in
drivers/clk/mediatek/clk-mt8173-mfgtop.c directly asserts the gate in
hardware, bypassing the Common Clock Framework (CCF) state tracking, the
clock's enable_count remains 0.

Because the mfg_26m clock is still fully registered via mfg_clks without the
CLK_IGNORE_UNUSED flag, won't clk_disable_unused() forcibly disable this
clock during late init?

If a consumer has probed and powered on the domain before or during
late_initcall_sync, clk_disable_unused() will check the hardware state, see
that the bit is active while enable_count is 0, and turn it off by writing
to set_ofs.

This abruptly shuts off the internal power management clock while the genpd
is still active, potentially leading to hardware hangs and failure of
subsequent power-off operations.

[ ... ]

> @@ -102,8 +111,11 @@ static int clk_mt8173_mfgtop_power_off(struct generi=
c_pm_domain *domain)
>  	/* Magic numbers related to core switch sequence and delays */
>  	regmap_write(data->regmap, 0xec, 0);
> =20
> -	/* drives internal power management */
> -	clk_disable_unprepare(data->clk_26m);
> +	/*
> +	 * Gate the 26 MHz clock again; see power_on() for why this is a raw
> +	 * register write and not clk_disable_unprepare().
> +	 */
> +	regmap_write(data->regmap, mfg_cg_regs.set_ofs, MFG_CG_26M);

[Severity: High]
This raw regmap write in clk_mt8173_mfgtop_power_off() deasserts the gate
directly, overriding any state assumed by CCF, which is part of the same
framework bypass issue described above.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260912-mfgtop-no-=
clk-api-power-on-v1-1-def157ad1277@gmail.com?part=3D1
