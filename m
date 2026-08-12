Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E7732989B5;
	Wed, 12 Aug 2026 02:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786500677; cv=none; b=Fs5/aSSCdailbSj1bqrnIyorbAvQrBl+AXzLsDiWiy9BBBrpSf8Z31weUt6mvxxNcu8LBCamjvJPqIYpL3iqJBlI/yYvoVUmCuNlTLDlFK0QS62mO2ZIa8CjZgJEDZZ3Pgtk0ys39sttM7xqF97jlfs1uoghXBP+YMDsv6h69xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786500677; c=relaxed/simple;
	bh=RDkVrU46qfbezplnf34lnL8JdN5YKm4gGE8ELdbqDv8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gw+5t8VKIGOMZGuHQRCQtl00I+4AsK6m4JpMKrVRSeZMOc+QavGDrdCK8MrEFdCWJnUsR7gmC+KKW2K1LfeVmX771IjUyB2J0D5WYep7/+wgBI3an05ibDW9Fk06mt6OhJA6P26yu5UGVQieqxvzwyodLfSnwsfzklWh9xJBIWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZkcJAR6I; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZkcJAR6I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DCFC1F000E9;
	Wed, 12 Aug 2026 02:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786500675;
	bh=p7hWHzo9I5jbN7ixDuyzEfWCZkxWYEDnokTrTpDYiUk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZkcJAR6IJGDDg5ohJ6CoeZ+fSCUDzHCeFDIO4xB0HGQmhOXJFgWwd3hISPW0NgPfL
	 KafxIKePOUlL7I6OwL8sdAStQoD5gAHFq8L/J2osXSdYEhp87GPZ1JhplnvtZBrl4q
	 iyXzKHJNlPJ4nJLbKG2NDGQHPNh7ER2Oub/ItBaBC089gRnrHkgm2yy+wGFNAeq1Dr
	 5hCZItKp5BJ5MOSsIt+BJmuXfQLyYm2UFHcZ4CXOv80OuW6xinVNQWjr5QXiXtxE/C
	 QFm/+K/0eVpO7NEcv9P/XfW14F23BTYccqg/9+AUOZSxTtZ11FYqB/cvC+CHxFE1X7
	 f0PdYxZim2baw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 05/11] clk: realtek: Add support for phase locked
 loops (PLLs)
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yu-Chun Lin" <eleanor.lin@realtek.com>
Cc: robh@kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260812020009.3480538-6-eleanor.lin@realtek.com>
References: <20260812020009.3480538-1-eleanor.lin@realtek.com>
 <20260812020009.3480538-6-eleanor.lin@realtek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 02:11:15 +0000
Message-Id: <20260812021115.7DCFC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Asymmetry in power sequence execution for PLLs without a power sta=
tus register will lead to permanently disabled clocks.
--

--- Patch [5]: [PATCH v13 05/11] clk: realtek: Add support for phase locked=
 loops (PLLs) ---
commit e50b49e7f53401294ef59626cc76a96ba5a0781e
Author: Cheng-Yu Lee <cylee12@realtek.com>

clk: realtek: Add support for phase locked loops (PLLs)

This commit provides a full set of PLL operations for programmable PLLs and=
 a
read-only variant for fixed or hardware-managed PLLs.

> diff --git a/drivers/clk/realtek/clk-pll.c b/drivers/clk/realtek/clk-pll.c
> new file mode 100644
> index 0000000000000..31670b8316cd5
> --- /dev/null
> +++ b/drivers/clk/realtek/clk-pll.c

[ ... ]

> +static bool is_power_on(struct rtk_clk_regmap_pll *clkp)
> +{
> +	u32 val;
> +
> +	/* reg =3D=3D 0 means not configured (assume always on).
> +	 * Register offset 0 is never a valid address on Realtek SoCs.
> +	 */
> +	if (!clkp->power_reg)
> +		return true;

[Severity: High]
Could this result in a permanently disabled clock for write-only PLLs?

If a PLL is configured with power-on and power-off sequences but lacks a po=
wer
status register (power_reg =3D=3D 0), is_power_on() will always return true.

[ ... ]

> +static void rtk_clk_regmap_pll_disable(struct clk_hw *hw)
> +{
> +	struct rtk_clk_regmap_pll *clkp =3D to_rtk_clk_regmap_pll(hw);
> +	unsigned long flags;
> +
> +	if (!clkp->seq_power_off)
> +		return;
> +
> +	spin_lock_irqsave(&clkp->lock, flags);
> +
> +	regmap_multi_reg_write(clkp->clkr.regmap, clkp->seq_power_off,
> +			       clkp->num_seq_power_off);

If such a clock is disabled (e.g., by clk_disable_unused during init), this
power-off sequence will execute successfully.

[ ... ]

> +static int rtk_clk_regmap_pll_enable(struct clk_hw *hw)
> +{
> +	struct rtk_clk_regmap_pll *clkp =3D to_rtk_clk_regmap_pll(hw);
> +	unsigned long flags;
> +	int ret =3D 0;
> +
> +	if (!clkp->seq_power_on)
> +		return ret;
> +
> +	spin_lock_irqsave(&clkp->lock, flags);
> +
> +	if (is_power_on(clkp))
> +		goto unlock;
> +
> +	ret =3D regmap_multi_reg_write(clkp->clkr.regmap, clkp->seq_power_on,
> +				     clkp->num_seq_power_on);

However, a subsequent call to rtk_clk_regmap_pll_enable() will hit the
is_power_on() check above, returning true and jumping to unlock before the
power-on sequence can be written.

Does this cause the clock to remain silently disabled in hardware, while the
clock framework considers it enabled?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812020009.3480=
538-1-eleanor.lin@realtek.com?part=3D5
