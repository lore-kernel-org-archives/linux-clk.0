Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794275967;
	b=BCNCGZLNelvQApyelDYG47KwLdBt8ywmcrghwotS+2ulpisKib8h4PjT7pUnyETmNUUx
	 fLGRPQi8+7JLfuXVW+oXze/F2E+EbsazqR3SE0Ex+wUuViFC5V1Wq47oTQXVpmzR/M+sZ
	 B2g/MVV6o1IvULaep31HkPYg9duFQE1cGKtrweDxbI0aLoIOwNixWodov6jvk5riRFGvd
	 zf0sAu5H07rAv2Taovz8krINyRCVHi3vEf7ij5/H1VwsDPWdK3ExFD22pPNm6ys/qqp5f
	 Efnx1anlenq1VdJUqzTuYGjqZl6MkFL+8qeaIGIgs6jF9J19iPRxA73u3GcXWyKhbfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794275967;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=9gnhEzYRhkSWThK5I4vfKZHko7AoMbBdeTpNxs74zk8=;
	b=GHYwXCN0IrGTa0CFN8Rw/60iAnbvGeB8KDTevSH8aDL5iP9Psaw+yUPxJzVBWVVequu6
	 XrB/DV+MwBPvQ/mmB8mWjff2U7greupBw9ZP5tLdPYJ7/zrE4BNXw6o93XD08WLT2nXRK
	 rnr3NhsV1SvI+rs1NVwz7jfTuhWtgvPbOBQMrBWmqZxVOyGfr4MXqCFKPPL5+sPjHu2CX
	 ybewlDZUZ2/uqi6KmYXpnyC1Xhl7axYWowJ1SVmIsjpiSqB8J+d+w0+YL1KKisxzAqhnt
	 sbE/PPTYhjJQ02LysM+/XnccCqNhR2hsY3Re+qQTBfEhMDNy595BSIgRu6MdsUlip6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IvYsK06B;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C44C606A321;
	Tue, 10 Nov 2026 01:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IvYsK06B
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0C461F0089F;
	Tue, 10 Nov 2026 01:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794275967;
	bh=9gnhEzYRhkSWThK5I4vfKZHko7AoMbBdeTpNxs74zk8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IvYsK06Bj15UlKhHXmE/EWcD7l3uAaSeAIRLt6syQJiAITofCfDYVgp06tZTb3CB1
	 6/QPatqFukI9nS3ZW+KpDgGH7ib92YP1hiZ7ZQ8U1HuhziC0/OCB6FmFCGUtXCljb/
	 MzN5FLncTp9t15+sPiRD/fuQblEbKXYx0KcuS3SVEhi7NyQyxKO7xoV9h6zmTbRmZO
	 6TliaGfWXQ8voo2YhPPfHweAuwrlqcTzKjHbmf3d2BTFnTAoaz7QDB16uVZKdvvSLk
	 NdF+ydnR3LrBNJr75bBK+RVcRAp99w3pEpzRggEfBy2cEWGNzCtVpkmecE9OYUk5qh
	 cnjl4gtHR1NFw==
Message-ID: <sashiko-outbox-206010@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 5/6] clk: add a driver for the Atheros/Qualcomm ath79
 PLL controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261110013646.1582970-6-rosenp@gmail.com>
References: <20261110013646.1582970-1-rosenp@gmail.com>
 <20261110013646.1582970-6-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 01:59:26 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] clk: ath79: fw_devlink blocks ath79_clk_probe() when ref
  lacks clock-frequency
- [Medium] clk: ath79: missing UPDATING wait in
  ath79_pcie_pll_unprepare()
--

commit dd79c08de0fc1914f23e0beb52d8e93809a55692
Author: Rosen Penev <rosenp@gmail.com>

clk: add a driver for the Atheros/Qualcomm ath79 PLL controller

This commit adds a common clock driver for the Atheros/Qualcomm ath79 PLL
controller, registering the reference and CPU clocks early via
CLK_OF_DECLARE_DRIVER() and the remaining clocks from a platform driver.

> diff --git a/drivers/clk/clk-ath79.c b/drivers/clk/clk-ath79.c
> new file mode 100644
> index 0000000000000..3ddbd020afb12
> --- /dev/null
> +++ b/drivers/clk/clk-ath79.c
> @@ -0,0 +1,778 @@

[ ... ]

> +static int ath79_pcie_pll_prepare(struct clk_hw *hw)
> +{
> +	struct ath79_pcie_pll *pll =3D to_ath79_pcie_pll(hw);
> +	u32 t;
> +	int ret;
> +
> +	/*
> +	 * Every write freezes the high speed clocks for about 60 us, so
> +	 * leave a PLL that the bootloader already started alone.
> +	 */
> +	if (ath79_pcie_pll_is_prepared(hw))
> +		return 0;
> +
> +	t =3D readl(pll->reg) & ~pll->pwd;
> +	writel(t, pll->reg);
> +	ret =3D ath79_pcie_pll_wait(pll);
> +	if (ret)
> +		return ret;
> +
> +	writel(t & ~pll->bypass, pll->reg);
> +	return ath79_pcie_pll_wait(pll);
> +}
> +
> +static void ath79_pcie_pll_unprepare(struct clk_hw *hw)
> +{
> +	struct ath79_pcie_pll *pll =3D to_ath79_pcie_pll(hw);
> +	u32 t;
> +
> +	t =3D readl(pll->reg) | pll->bypass;
> +	writel(t, pll->reg);
> +	writel(t | pll->pwd, pll->reg);
> +}

[Severity: Medium]
Should ath79_pcie_pll_unprepare() call ath79_pcie_pll_wait(pll) after each
write to pll->reg, like ath79_pcie_pll_prepare() does?  Without waiting
for pll->updating to clear, the second write is issued while the ~60 us
update from setting pll->bypass is still in progress, and the function
returns before the PLL finishes powering down.

[ ... ]

> +static void __init ath79_clk_early_init(struct device_node *np)
> +{
> +	const struct ath79_clk_soc_data *soc;
> +	unsigned long rates[ATH79_OUT_NUM];
> +	struct ath79_clk_regs regs =3D {};
> +	struct clk_hw *ref, *cpu;
> +	struct clk *ref_clk;
> +	int ret, i;
> +
> +	soc =3D of_match_node(ath79_clk_of_match, np)->data;
> +
> +	/*
> +	 * The board's crystal. Old device trees leave its rate out, and the
> +	 * arch code then registers it from the bootstrap pins as "ref".
> +	 */
> +	ref_clk =3D of_clk_get_by_name(np, "ref");
> +	if (IS_ERR(ref_clk))
> +		ref_clk =3D clk_get_sys(NULL, "ref");

[ ... ]

> +static int ath79_clk_probe(struct platform_device *pdev)
> +{

[Severity: Medium]
Does fw_devlink permanently block ath79_clk_probe() with -EPROBE_DEFER on
device trees where the "ref" fixed-clock node omits clock-frequency?

When the "ref" node has no clock-frequency property, _of_fixed_clk_setup()
fails with -EIO before of_clk_add_hw_provider() can mark its fwnode
initialized, while of_clk_init() still sets OF_POPULATED on the node so no
platform device is created for it.  Because the PLL node has clocks =3D
<&ref>, fw_devlink creates a fwnode_link to the uninitialized "ref" node,
and device_links_check_suppliers() rejects probing ath79_clk_driver with
-EPROBE_DEFER, leaving the DDR, AHB, MDIO, UART1 and PCIe clocks
permanently at ERR_PTR(-EPROBE_DEFER).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110013646.1582=
970-1-rosenp@gmail.com?part=3D5
