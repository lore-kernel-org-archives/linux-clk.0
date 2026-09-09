Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FABC569F3B
	for <linux-clk@vger.kernel.org>; Wed,  9 Sep 2026 14:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788963740; cv=none; b=vEtAcg49Rr+UZKGXpW2f7Wdb5foRWfCyQ5ne+pZJ/TwSBqjNjY1UcGEKwep2Ae8EtCKMr3qHeDvys/ImMX00NgLjRERaBGw5wzNOdiZaD19xjeYQMihyyORCoJVSoQGtCM1/SVWvDkcu5vMWHE/220U5vdGbYojPi630YH38o4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788963740; c=relaxed/simple;
	bh=46wQs05IiOhRXEDZAh19EdbLDphaaqJjsGMJOqjOYKc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OU1RtKGFZRUeUBSwXeva0tVE2358I15xPQRGj8o8RcBhG/zwWJZO1U40NbF7zjGL3kplUfqKbn+nG2CzrucvoTpOGIdlblmvi+LmBc1vxGhCIyRt9wneWeQj9lvLHS6JjSucHuBRZpgEDDHlCai/MPArVjqgJ5tAzEJQKvJ41qM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ncDMy3xr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ncDMy3xr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF89E1F00A3A;
	Wed,  9 Sep 2026 14:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788963739;
	bh=0gEVlDOMKjyBSxOcp+yDqsqEzv0eFouRSvaHO3/Uu/g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ncDMy3xrd6lAklfzLQP35WmoNL1Re6rCmAzDxZ4dl5mF4tZBSABcA4gfRMQEev28n
	 u+J0pV7k70PNjCe9KrKsKi2UIiy9m1lIVmI75/2RW9g3MYQmIfojKMJbW36TcOkt/R
	 fXvo6gCKFE75NyAPMpVrVM1XWxh6HsN3dlNL3EpT8ozSYiLKvf/pAK4dULncXGSyzy
	 P9ucVvRGWZbdzeZxtHecky4UDD0R3qxfgAsu22j+udDELEIc23gwEXFW5w9DI+uUKI
	 1elkmEmLDOQAJdbq/zWZS2u69ZzZIG8ti/PK9vvlEF5MNJbx1ja8fJO7BzNLtMPRFL
	 txCmAZD52QMcA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/5] clk: spacemit: reject rate changes to running
 firmware PLLs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
Cc: linux-clk@vger.kernel.org
In-Reply-To: <20260909-spacemit-pll-init-v1-4-b3065ad5a4ac@linux.spacemit.com>
References: <20260909-spacemit-pll-init-v1-0-b3065ad5a4ac@linux.spacemit.com>
 <20260909-spacemit-pll-init-v1-4-b3065ad5a4ac@linux.spacemit.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 14:22:18 +0000
Message-Id: <20260909142218.BF89E1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Calling clk_set_rate() immediately after clk_disable() may intermi=
ttently fail with -EBUSY because the hardware PLL lock bit is checked witho=
ut polling.
--

commit a90cd779d21914719856a7e102c5e63e9892f73b
Author: Troy Mitchell <troy.mitchell@linux.spacemit.com>

clk: spacemit: reject rate changes to running firmware PLLs

CLK_SET_RATE_GATE only protects clocks prepared through CCF. A PLL left
running by firmware can have a zero prepare count, so this flag alone
cannot prevent set_rate() from reprogramming a live PLL.

> diff --git a/drivers/clk/spacemit/ccu_pll.c b/drivers/clk/spacemit/ccu_pl=
l.c
> index c9852fed31017..2573b8396cefa 100644
> --- a/drivers/clk/spacemit/ccu_pll.c
> +++ b/drivers/clk/spacemit/ccu_pll.c

[ ... ]

> @@ -113,6 +122,17 @@ static void ccu_pll_disable(struct clk_hw *hw)
>  	ccu_update(common, swcr3, PLL_SWCR3_EN, 0);
>  }
> =20
> +static int ccu_pll_check_stopped(struct ccu_pll *pll)
> +{
> +	u32 val;
> +	int ret;
> +
> +	ret =3D regmap_read(pll->common.lock_regmap, pll->config.reg_lock, &val=
);
> +	if (ret)
> +		return ret;
> +	return val & pll->config.mask_lock ? -EBUSY : 0;
> +}

[Severity: High]
Can this cause clk_set_rate() to spuriously fail with -EBUSY?

If a driver calls clk_disable_unprepare() followed immediately by
clk_set_rate(), the .disable callback will clear the software enable bit
and return instantly.

When .set_rate calls ccu_pll_check_stopped(), it performs a single
non-blocking read of the hardware PLL lock bit here. Since the analog
PLL requires time to lose lock, wouldn't the lock bit often still be
set, causing the valid rate change to be rejected?

A follow-up patch "clk: spacemit: safely synchronize PLL parameters during
init" seems to acknowledge this behavior by adding a ccu_pll_stop() function
with a polling timeout. Should a similar polling mechanism be used here
instead of a single read?

> +
>  /*
>   * PLLs must be gated before changing rate, which is ensured by
>   * flag CLK_SET_RATE_GATE.
> @@ -122,11 +142,20 @@ static int ccu_pll_set_rate(struct clk_hw *hw, unsi=
gned long rate,
>  {
>  	struct ccu_pll *pll =3D hw_to_ccu_pll(hw);
>  	const struct ccu_pll_rate_tbl *entry;
> +	int ret;
> =20
> -	entry =3D ccu_pll_lookup_best_rate(pll, rate);
> -	ccu_pll_update_param(pll, entry);
> +	/* CLK_SET_RATE_GATE does not account for firmware-only users. */
> +	ret =3D ccu_pll_is_enabled(hw);
> +	if (ret)
> +		return ret < 0 ? ret : -EBUSY;
> +	ret =3D ccu_pll_check_stopped(pll);
> +	if (ret)
> +		return ret;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909-spacemit-p=
ll-init-v1-0-b3065ad5a4ac@linux.spacemit.com?part=3D4
