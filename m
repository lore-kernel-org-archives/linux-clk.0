Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF06A3BED66
	for <linux-clk@vger.kernel.org>; Thu, 15 Oct 2026 07:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792049091; cv=none; b=PsN4fOmoCm2kOvE+SUFPZ0KnCQNRD08ANNzsAbvOJu2n5Y7jgNb5oe884s2g+FoA1o4lLVPanDoPZRSPbgxBpXQvsOhagyrm7P8bfDt4z5Zx0iHHkdDd3QBzRP6IN8uxRE9oa5bLq0XBzXN20u/r9suYPyQ8HZXvnsZWTU928X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792049091; c=relaxed/simple;
	bh=NMo3LNVSZr0pIVU8lFjUqS5mXLUNUh+t6PwkXJwpzOk=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=cD6wF3oRNZNoD2cQ8NutK+VaTKVqfmd98+h1dYdoPyRgtp2YYLuckOSOL2ZIGQnJrNmnQIQ/jz/zjswz3Elji6ZR//YNa7BHKWbB3aDe+SL2xDvtxjd8fF5Bzc8tHIUPbVwXywubqLR0vzet4swfcQoG5z6N0LxKjTBQDsVdo+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m1D5TfYA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m1D5TfYA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ED7B1F000C6;
	Thu, 15 Oct 2026 07:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792049079;
	bh=Qw15lQXogcLzLFXwoce5XJrxeXxO+jXJTFCSMsvoS5Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=m1D5TfYAQJU564UfsemPlAy7NcmoZqYpdZlgumdyljQGc3vYluPeMUcc4eAP/VSKV
	 YHIRWEnWMzxSDaCqS9JOQ2ZGpKbPPGBlXX1FYGtx087MwgaZB8f/tKba3t3TeoS/hV
	 z0k8tW4pee1KbASLJ8mIL5Lly+kLpE//9NX6FvGIiJp3yj/R/WBYQTop6han12HtFS
	 BSj5AeLkf7h8EfQIVakc9Sb0K8lvx6xeRQv5noEfFwZrH4Kh1qjbt3AlM7g/8EDyY6
	 kLbPCNsLcE8zfvdIKz0u2s2IZ39AKHccj9HOptokUKcbt/S2rcrbhD1sOLFd49dlJO
	 wxsD7vLKRmARQ==
Message-ID: <sashiko-outbox-172399@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 06/24] clk: zte: Add ZX279128S CRM clock and reset
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Navid Ghahremani" <ghahramani.navid@gmail.com>
Cc: linux-clk@vger.kernel.org
In-Reply-To: <20261014072109.1759502-7-ghahramani.navid@gmail.com>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
 <20261014072109.1759502-7-ghahramani.navid@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 07:24:38 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] clk: zte: boot failure when external oscillator is an orphan
- [Medium] clk: zte: incomplete disable and is_enabled implementation for C=
RM2 clocks
- [Low] clk: zte: unmet dependency risk from unconditional select of RESET_=
SIMPLE
--

commit 46157610926015842fd1aee202e8fff3cbf39169
Author: Navid Ghahremani <ghahramani.navid@gmail.com>

clk: zte: Add ZX279128S CRM clock and reset driver

This commit adds support for the top CRM and low-speed peripheral clock
controllers for the ZTE ZX279128S SoC. It implements custom reset controller
operations and provides CRM2 clock gating along with reset controller suppo=
rt
for PCIe.

> diff --git a/drivers/clk/zte/Kconfig b/drivers/clk/zte/Kconfig
> new file mode 100644
> index 0000000000000..92fd27ea42b2f
> --- /dev/null
> +++ b/drivers/clk/zte/Kconfig
> @@ -0,0 +1,14 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +config CLK_ZX279128S
> +	bool "ZTE zx279128s clock driver"
> +	depends on SOC_ZX279128S || COMPILE_TEST
> +	depends on OF
> +	default SOC_ZX279128S
> +	select RESET_CONTROLLER
> +	select RESET_SIMPLE

[Severity: Low]
Does unconditionally selecting RESET_SIMPLE cause an unmet dependency
warning on platforms without HAS_IOMEM (like UML)?

Since the driver implements its own custom reset operations (zx_reset_ops,
zx_crm2_reset_ops) and doesn't use the reset-simple framework, is it possib=
le
to drop the select RESET_SIMPLE entirely?

[ ... ]

> diff --git a/drivers/clk/zte/clk-zx279128s.c b/drivers/clk/zte/clk-zx2791=
28s.c
> new file mode 100644
> index 0000000000000..892e0c22e5f26
> --- /dev/null
> +++ b/drivers/clk/zte/clk-zx279128s.c

[ ... ]

> +static void __init zx279128s_topcrm_init(struct device_node *np)
> +{
> +	const struct clk_hw *cpu_parents[4], *matrix_parents[4];
> +	struct clk_hw *osc, *lsp, *lsp_500m, *lsp_250m, *lsp_125m, *lsp_100m;
> +	struct clk_hw *audio, *audio_32k, *matrix, *hclk, *pclk, *m200, *m20;
> +	struct clk_hw_onecell_data *data;
> +	struct clk_hw **hws;
> +	void __iomem *base, *en;
> +	int i;
> +
> +	base =3D of_iomap(np, 0);
> +	if (!base) {
> +		pr_err("%pOF: no registers\n", np);
> +		return;
> +	}
> +
> +	data =3D kzalloc(struct_size(data, hws, TOP_NUM_CLKS), GFP_KERNEL);
> +	if (!data)
> +		return;
> +	data->num =3D TOP_NUM_CLKS;
> +	hws =3D data->hws;
> +
> +	hws[ZX279128S_TOP_PLL_A9] =3D zx_top_pll(np, "pll_a9", base + TOP_PLL_A=
9);
> +	if (IS_ERR(hws[ZX279128S_TOP_PLL_A9]))
> +		goto err;
> +	osc =3D clk_hw_get_parent(hws[ZX279128S_TOP_PLL_A9]);
> +	if (!osc)
> +		goto err;

[Severity: High]
Does treating a missing parent as a fatal error here break the boot process
if the external "osc" clock is not yet registered?

If the external "osc" clock is an orphan due to probe sequence or driver
loading order, clk_hw_get_parent() will return NULL. Treating this as an er=
ror
silently aborts the initialization of all CRM clocks.

Could we instead use fw_name =3D "osc" (or other suitable clk_parent_data
constructs) for downstream clocks, allowing the Common Clock Framework
to handle orphan resolution naturally?

[ ... ]

> +static void zx_crm2_clk_disable(struct clk_hw *hw)
> +{
> +	struct zx_crm2_gate *gate =3D to_zx_crm2_gate(hw);
> +	unsigned long flags;
> +	u32 val;
> +
> +	spin_lock_irqsave(gate->lock, flags);
> +	val =3D readl(gate->reg);
> +	val &=3D ~gate->clk_on;
> +	writel(val, gate->reg);

[Severity: Medium]
In zx_crm2_clk_enable(), the gate->clk_off bits are cleared to enable the
clock. Should zx_crm2_clk_disable() restore those clk_off bits when disabli=
ng?

By only clearing the clk_on bits, this might leave the hardware partially
active or fail to properly isolate the clock domain.

> +	spin_unlock_irqrestore(gate->lock, flags);
> +}
> +
> +static int zx_crm2_clk_is_enabled(struct clk_hw *hw)
> +{
> +	struct zx_crm2_gate *gate =3D to_zx_crm2_gate(hw);
> +	u32 val =3D readl(gate->reg);
> +
> +	return (val & gate->clk_on) =3D=3D gate->clk_on;

[Severity: Medium]
Does this status check need to account for the gate->clk_off bits as well?

If the clock is currently in a disabled state (e.g., clk_off bits set by the
bootloader), this function will report it as enabled if the clk_on bits hap=
pen
to be set. This would prevent the Common Clock Framework from ever calling
enable() to clear those isolation bits.

> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014072109.1759=
502-1-ghahramani.navid@gmail.com?part=3D6
