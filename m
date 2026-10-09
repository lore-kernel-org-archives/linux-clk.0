Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C82C24C10E3;
	Fri,  9 Oct 2026 12:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791547975; cv=none; b=SRGrpvh1cfVEyRJV1z5T2r/KKkNtc1An77ZPFWgSZU+A6GcU8NQRnFDN3aGMm1Xf4WoZDEOu43aeFaOGeHJkKEgcUqRD2FWeyhxeAB0YVb4C35iHTvd0qUw5Q1a7I8D/uybUp6oE6xLC3q9cogSbK0ifJUYJc4PKnzLhXVLqJ0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791547975; c=relaxed/simple;
	bh=03vyNESQaSrlmpA0FpJsaSI0pjsUeu0uiDJQvkXh+Y8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=REy9hf3n7n6+WrMGq/dT6NJzZkyuzHJMHcBg8N555sphUf3HT23vJjVD4kSW08CoxDbHTLzwo96A7RPbCXahtoQMkHex3xNYNA55kfY+iEM1saTlDNujIQSiVx6/kbe/UO95CJ2TQR5A0OypCcvNfQYydD7M+6Cebh9Te36viho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hlviz2HG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hlviz2HG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D83871F000FF;
	Fri,  9 Oct 2026 12:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791547961;
	bh=NirnCqkCGstOYMpeqSjhmzAN8Gky9HjQaseG4owxf4Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Hlviz2HGnXx8Qi+4m2xgunk5+9aboFIRLgKYsIT9h8lMMkJcJ7xSwXf21CBhrrDU3
	 QZmH/jK/qm90Wd2lx/ulYH+3ChG+NW1FDdaXrjuZFMEKEeOTrDgtr0ZjAfhUPRYzjC
	 qGT6e92NO/w8cX83NfYueetZEhWVchtRxD5aaTjmZeEiecbCQ9h/MCNsyddaHpW4G/
	 SnFeTdISK7H7hP0C63RlhNTidTBPFSLM74iY3d2gzyGp0PdXm9mmJtpAzIjAZ5jfER
	 pjygbhxb6HWyjNu2NvCKrPlxB7qpgZtW+HZy7ADFtoFc7EsX4JvZ9S2JU77uYUQD42
	 QB4c3aIcip5SA==
Message-ID: <sashiko-outbox-165494@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 07/14] clk: samsung: exynos8855: add block top and
 peric clock support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Raghav Sharma" <raghav.s@samsung.com>
Cc: linux-clk@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20261009120137.2801911-8-raghav.s@samsung.com>
References: <20261009120137.2801911-1-raghav.s@samsung.com>
 <CGME20261009114351epcas5p355e4aa12c80eb6eb664fbc88e72140fe@epcas5p3.samsung.com>
 <20261009120137.2801911-8-raghav.s@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 12:12:40 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] clk: samsung: missing CLK_IS_CRITICAL flag on critical clocks caus=
es system hang
- [High] clk: samsung: platform_driver_register() used with __init probe fu=
nction
--

commit a53c705d96b4a86686927f8b6b05c07feca713d6
Author: Raghav Sharma <raghav.s@samsung.com>

clk: samsung: exynos8855: add block top and peric clock support

This commit registers the compatible and cmu_info data to support CMU_TOP
and CMU_PERIC clocks for the Exynos 8855 SoC.

> diff --git a/drivers/clk/samsung/clk-exynos8855.c b/drivers/clk/samsung/c=
lk-exynos8855.c
> new file mode 100644
> index 0000000000000..5394706d214c9
> --- /dev/null
> +++ b/drivers/clk/samsung/clk-exynos8855.c

[ ... ]

> +static const struct samsung_gate_clock peric_gate_clks[] __initconst =3D=
 {
> +	/* System will hang if this critical clock is gated */
> +	GATE(CLK_GOUT_CMU_PERIC, "gout_cmu_peric",
> +	     "dout_clkcmu_peric_nocp",
> +	     CMU_PERIC_CLK_CON_GAT_BLK_PERIC_UID_CMU_PERIC_IPCLKPORT_PCLK,
> +	     21, 0, 0),

[Severity: High]
Does this code inadvertently allow the clock to be gated despite the commen=
t?

The GATE macro passes 0 as the 6th argument (flags). During the late
initialization phase, the Common Clock Framework's clk_disable_unused()
routine automatically disables all clocks that do not have active consumers.
Without the CLK_IS_CRITICAL or CLK_IGNORE_UNUSED flag, couldn't this cause
the exact system hang the comment warns about?

> +	GATE(CLK_GOUT_SYSREG_PERIC, "gout_sysreg_peric",
> +	     "dout_clkcmu_peric_nocp",
> +	     CMU_PERIC_CLK_CON_GAT_BLK_PERIC_UID_SYSREG_PERIC_IPCLKPORT_PCLK,
> +	     21, 0, 0),
> +	/* System will hang if this critical clock is gated */
> +	GATE(CLK_GOUT_UART_DBG_PERIC, "gout_uart_dbg_peric",
> +	     "dout_clkcmu_peric_uart_dbg",
> +	     CMU_PERIC_CLK_CON_GAT_BLK_PERIC_UID_UART_DBG_IPCLKPORT_PCLK,
> +	     21, 0, 0),

[Severity: High]
Similarly, could this clock also be disabled by the framework since it lacks
the CLK_IS_CRITICAL flag?

[ ... ]

> +static int __init exynos8855_cmu_probe(struct platform_device *pdev)
> +{
> +	const struct samsung_cmu_info *info;
> +	struct device *dev =3D &pdev->dev;
> +
> +	info =3D of_device_get_match_data(dev);
> +	exynos_arm64_register_cmu(dev, dev->of_node, info);
> +
> +	return 0;
> +}

[ ... ]

> +static struct platform_driver exynos8855_cmu_driver __refdata =3D {
> +	.driver =3D {
> +		.name =3D "exynos8855-cmu",
> +		.of_match_table =3D exynos8855_cmu_of_match,
> +		.suppress_bind_attrs =3D true,
> +	},
> +	.probe =3D exynos8855_cmu_probe,
> +};
> +
> +static int __init exynos8855_cmu_init(void)
> +{
> +	return platform_driver_register(&exynos8855_cmu_driver);
> +}

[Severity: High]
Can this cause a use-after-free regression if the driver is probed after bo=
ot?

Because exynos8855_cmu_probe() is marked __init, its memory is freed after
the early boot phase. The driver uses platform_driver_register() which does
not clear the .probe pointer, unlike platform_driver_probe().

Even with suppress_bind_attrs =3D true preventing sysfs binding, couldn't a
late device instantiation (such as through a device tree overlay) trigger a
call to the reclaimed exynos8855_cmu_probe() memory? Also, the __refdata
annotation on the driver struct hides the section mismatch warning rather
than fixing the underlying lifetime issue.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009120137.2801=
911-1-raghav.s@samsung.com?part=3D7
