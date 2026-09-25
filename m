Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC5450AC35;
	Fri, 25 Sep 2026 23:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790377569; cv=none; b=XW7K1GFf8b6Cr6epDwds99bbJgaOfQSI//9NlI8es/zdSizwMkgzz7OQcYIVOBIogewj7ZaaEJgSmRe9i7eBO4UkZ30lnfx+AMJ2DOO1eTMt5iAGLO4NHQMiIkMniwiLdbUGIXc52U7MtI9ZQ+ajn4BtSsu0QjnkPVC+d/K3Xyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790377569; c=relaxed/simple;
	bh=82b+Zff3GkRRTkmgR+x9dU+EVX9oxH0Zz0tM+Id74Kc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fKC08JBimFvjOWLN3Y4730jSetb1WkoKvKHMFtVuJ0LKE1B9Q4n47kxtSmsp0ZQeH8JmImeBkfDab38OTYbZAs55h9apiZ51wHbpyYBk9nOp0WmItqA2KJ0dWOR61YBjLkzZGubZ7pqq0pKKVQuQS2Tuz4+vP+G0p3x8WS/+R9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y5LVGEtu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y5LVGEtu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 343D71F000FF;
	Fri, 25 Sep 2026 23:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790377567;
	bh=Y1JXEVRbYtjKcvqgyHEoilnTMmmCNLzDyspuKu8v46A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Y5LVGEtu9z8JQAiqUivazN8tjccvA4+Lc/HDCtBFBgIlriKkzHnq+OzHSNF/KSq/3
	 WjOmvq2DTBzCm27duzJdWQtOKBsmcR2gpwUQL5a2hRVS5DxDBYe5Rd72fOhc0fk8UI
	 VDAlkWVreHrDjZa2vT81JLjtW/sTTWUIj7KnABPVSzdhLSCHoPNw1JNu4mkJtovSoV
	 vtxS0sQ71NoGQv9SIe6MUd2mlEmA0GXP4wD1pr4y6bi0otB1aCSkERMv3jgbPWglYR
	 daTy1ddXBcG8KYT1GoeaCjUzNjmnc3zVsqBnqVSPLlSTeEbWRBlZEDe+CYo0V1iE0c
	 vayi3nocl2gGg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/4] clk: sunxi-ng: add support for the A523/T527 CPU
 CCU
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andre Przywara" <andre.przywara@arm.com>
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, linux-clk@vger.kernel.org
In-Reply-To: <20260925225112.14081-4-andre.przywara@arm.com>
References: <20260925225112.14081-1-andre.przywara@arm.com>
 <20260925225112.14081-4-andre.przywara@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 25 Sep 2026 23:06:06 +0000
Message-Id: <20260925230607.343D71F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] clk: sunxi-ng: race condition exposes clock provider before noti=
fiers are active
--

commit a788d9f9856e477a2e6af810c839fb77ae3d033e
Author: Andre Przywara <andre.przywara@arm.com>

clk: sunxi-ng: add support for the A523/T527 CPU CCU
   =20
The A523 contains a separate CCU block for the CPU PLLs. This includes
one CPU clock per cluster, plus the DSU PLL, which clocks the part that
connects the two clusters. There is also a "backup" PLL, which can be used
to clock the cores when the main PLLs are reprogrammed.
Those PLLs are then connected via MUXes to the two clusters and the DSU.

Describe those clocks and their relationship, to allow the kernel to
adjust the core frequency.

> diff --git a/drivers/clk/sunxi-ng/ccu-sun55i-a523-cpu.c b/drivers/clk/sun=
xi-ng/ccu-sun55i-a523-cpu.c
> new file mode 100644
> index 0000000000000..ef1b05b2a9b58
> --- /dev/null
> +++ b/drivers/clk/sunxi-ng/ccu-sun55i-a523-cpu.c
> @@ -0,0 +1,378 @@

[ ... ]

> +static int sun55i_a523_cpu_ccu_probe(struct platform_device *pdev)
> +{
> +	const struct sunxi_ccu_desc *desc;
> +	void __iomem *reg;
> +	int i, ret;

[ ... ]

> +	ret =3D devm_sunxi_ccu_probe(&pdev->dev, reg, desc);
> +	if (ret)
> +		return ret;
> +
> +	/* Reparent CPUs/DSU during PLL rate changes */
> +	ccu_mux_notifier_register(pll_cpu_l_clk.common.hw.clk,
> +				  &sun55i_a523_cpu_l_nb);

[Severity: Medium]
Could this expose the clock provider before the notifiers are registered?

If devm_sunxi_ccu_probe() publishes the clock provider globally, and the
thread is preempted immediately after it returns, could deferred probe
workqueues run asynchronously and probe a consumer?

If a consumer like cpufreq then calls clk_set_rate() before the subsequent
ccu_mux_notifier_register() calls are executed, would the PLL relock
without reparenting the CPU, potentially leading to a system crash?

> +	ccu_mux_notifier_register(pll_cpu_b_clk.common.hw.clk,
> +				  &sun55i_a523_cpu_b_nb);
> +	ccu_mux_notifier_register(pll_cpu_dsu_clk.common.hw.clk,
> +				  &sun55i_a523_cpu_dsu_nb);
> +
> +	return ret;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260925225112.1408=
1-1-andre.przywara@arm.com?part=3D3
