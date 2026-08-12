Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12DEE36402D;
	Wed, 12 Aug 2026 02:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786500969; cv=none; b=HMcuvW2nlHz36YsLiisp3PBgMDOU21tEzoQcYulwxbDFc8mlcfps+kXjSxGU7KQQ7GV09c+P8HVL5OJViy89qKTtvlZxfOc5YFqJy+Z+/ryCXEcnMLz8abTys1aDG0d+Z+u4XkRbdkzJYss2XkXTDL62erFn3YtvtEUtyME4V/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786500969; c=relaxed/simple;
	bh=fMJe797QiUMRmtcHyVH/v78tVTm9/3c/8x6SIoWXHVI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VvPyaZLn5T/IvYJxDPgMDbWvPBkLBZYJLhC2csEO40oq6wqJkSsqDAEycmk5lFFWgc2VUFJ5dMBXlU6pDPU9MKDUprup1asHzsLCaTEtaHX86qd/SDrVOPXzq0pjXgtjAtmtJ7ApXgsVkVRCsL5GKn21olsAf0ymKyCEJGmqMsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=koIFpom9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="koIFpom9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34CEF1F000E9;
	Wed, 12 Aug 2026 02:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786500967;
	bh=NARQe5lXMTePgHVYoZbHKucpPihUoV5Kbf/fPptPJSM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=koIFpom9uK4hqHzktL/RNfSsffznbP/1B1FIpeUiUTTJWRIu53FycJDLlwF0Kobqk
	 ZtBRhlebKHNcflPKQNYP0csUTs3D8NROfRBaiI0Ys5+GQeZIzJWLQVviNCt0/y9mc5
	 rt6k26Od0/SmmVvhgDs2PdndPRUuj+LaKFQ+Nt/FkvupVroQTXbXn0tgSExSJM5df0
	 E41hKIwQcWEKrEZbgBzr0oWPIv39OLCQRtrUXG85XRcEL6b4NLDrS4V1KzJyg/i8Vc
	 MOWdUUewbS3DpQHkHjNuIcOLIG8j25M+3Wa5IR8D2idgXGzFIOuCvUXxFwNQKfO7dy
	 IgodASxB3cp1A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 09/11] clk: realtek: Add RTD1625-CRT clock
 controller driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yu-Chun Lin" <eleanor.lin@realtek.com>
Cc: linux-clk@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260812020009.3480538-10-eleanor.lin@realtek.com>
References: <20260812020009.3480538-1-eleanor.lin@realtek.com>
 <20260812020009.3480538-10-eleanor.lin@realtek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 02:16:06 +0000
Message-Id: <20260812021607.34CEF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Sleeping in atomic context due to `fsleep()` in `regmap_multi_reg_=
write()` called under a spinlock.
--

--- Patch [9]: [PATCH v13 09/11] clk: realtek: Add RTD1625-CRT clock contro=
ller driver ---
commit 94dc67c9ada3ad3a78ad1cf0f8ae4674b5f69224
Author: Cheng-Yu Lee <cylee12@realtek.com>

clk: realtek: Add RTD1625-CRT clock controller driver
   =20
Add support for the CRT (Clock, Reset, and Test) domain clock controller
on the Realtek RTD1625 SoC. This driver provides essential clock sources
(including PLLs), gating, and multiplexing functionalities.

> diff --git a/drivers/clk/realtek/clk-rtd1625-crt.c b/drivers/clk/realtek/=
clk-rtd1625-crt.c
> new file mode 100644
> index 0000000000000..3da88d3cf0dd2
> --- /dev/null
> +++ b/drivers/clk/realtek/clk-rtd1625-crt.c

[ ... ]

> +static const struct reg_sequence pll_acpu_seq_power_on[] =3D {
> +	{RTD1625_REG_PLL_ACPU2,         0x5},
> +	{RTD1625_REG_PLL_ACPU2,         0x7},
> +	{RTD1625_REG_PLL_ACPU1,         0x54000},
> +	{RTD1625_REG_PLL_SSC_DIG_ACPU2, 0x1e1f8e},
> +	{RTD1625_REG_PLL_SSC_DIG_ACPU0, 0x4},
> +	{RTD1625_REG_PLL_SSC_DIG_ACPU0, 0x5, 200},

[Severity: High]
Does this 200us delay cause a "scheduling while atomic" bug when enabling t=
he
clock?

Looking at rtk_clk_regmap_pll_enable() in drivers/clk/realtek/clk-pll.c, it
acquires an irq-disabled spinlock before processing this power-on sequence:

	spin_lock_irqsave(&clkp->lock, flags);

	if (is_power_on(clkp))
		goto unlock;

	ret =3D regmap_multi_reg_write(clkp->clkr.regmap, clkp->seq_power_on,
				     clkp->num_seq_power_on);

When regmap_multi_reg_write() encounters the 200us delay in this sequence,
it calls fsleep(200), which delegates to usleep_range() and sleeps.

Since this is called while holding the spinlock, could it trigger a BUG or
panic? Could the power-on sequence be moved to a .prepare callback which is
allowed to sleep, or perhaps use a custom delay implementation that safely
spins using udelay()?

This also applies to the other power-on sequences introduced in this file
(pll_ve1_seq_power_on, pll_gpu_seq_power_on, pll_npu_seq_power_on,
pll_ve2_seq_power_on, and pll_hifi_seq_power_on).

> +	{RTD1625_REG_PLL_ACPU2,         0x3},
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812020009.3480=
538-1-eleanor.lin@realtek.com?part=3D9
