Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795353628;
	b=liHdOpBLYeqRtfzyoe/3hUuRMXP0J48nQhCiwcCga/tQn6lewNMO+01oRX3eG4tjlwcO
	 GIYVzQt1bar5OSK1emgfgu8bF/hvHb7kYGI6eKbQ5TMFrixWR6K9QEFohf+HQxHBWA7nJ
	 GfnDKmNw8qoyqsePrmjrccl+QWzwbZfqV02aMDwOkX0WAcJOVmPXjeqhHhWGFGEQgcJbM
	 YVw0B8NwWNI8dyQB6g38Vq1KpMqRVo8RQu6Lrp1XYoZTnU8Rnoefi808HQ3K911as90C5
	 CJpXReQH50Qe7+ecgSLVJT2aeLAvQ8exaFnhZtPaEdBTMysnnvWc8jxdqJL8NY8MLJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795353628;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=e2RFkXo2BXCeopZrOTm3/CtaMX/2WzJGs7dDqSxhO3s=;
	b=RHEt17TeBfqs9vJNhzIk9N/a/jCbsec69JxxKSezcyitsRXjAlGgXmUzinmI5YynJ27u
	 8bj0mKEXtHjc0bkvfOfoFch8FPJC/wWBz1Ybr/j8z/jjPCZG2qg9RT/E82nWFYgYD2I/s
	 MTPISI8DIXiDavq7bs2JEQS4OBLyt++t4Xpqc8/P2hvP1y1aipWq3GbLwMVJ1l96MHHtg
	 6A/5Beu3KggKiPuJkZV1QlHJPstnaN1z4HOMYvl7FBGnnGQN96uQv2P8gzFqI1nIAGj2+
	 kLni7SWkKvetT4EvFjNsNf5c2S6ESvaCJUlz0SUGC5nAeN/HbnIQaVMd6t3EQXnccFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F00lTpwk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 885AF606A338
	for <linux-clk@vger.kernel.org>; Sun, 22 Nov 2026 13:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F00lTpwk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B60991F000C6;
	Sun, 22 Nov 2026 13:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795353627;
	bh=e2RFkXo2BXCeopZrOTm3/CtaMX/2WzJGs7dDqSxhO3s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=F00lTpwkg1/3zRITq7NrAnFdQ19oXpEtPSurQOmmRbj0E07ZRzJH4rU+abD9ySP8D
	 ndQLGDtok15JslpIo874rGs1YD3IRgwc/2LN5rBVRF5y6mSPiVbw6Xnq1MBZW8nbLP
	 Y6W5A53MN14h98kGdIPnGrtVNwJGGgQfjbn834gYsjM8Cy4hZ4urfuvawCxb5rQr8i
	 LUBGDweut7uAftaBELkd2/SXf+yTn8qCWwgMi5/toDlEgrTlfSCfUtYP4oKjdTXHSl
	 IFhpnMnfYg/ap1sAq4f93TVRrjYlfE14zSfzo0MV4GYXPD+/WCJ+qlhRIdmSWZ0GfY
	 1ijI/mpOL4oSA==
Message-ID: <sashiko-outbox-227960@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/4] clk: qcom: Consistently enable MSM8939, MDM9615,
 SAR2130P and SDX65
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org
In-Reply-To: <20261122-qcom-kconfig-unify-v1-2-6abaa7faf1c9@oss.qualcomm.com>
References: <20261122-qcom-kconfig-unify-v1-0-6abaa7faf1c9@oss.qualcomm.com>
 <20261122-qcom-kconfig-unify-v1-2-6abaa7faf1c9@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 22 Nov 2026 13:20:27 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] clk: qcom: SAR_GCC_2130P and SAR_GPUCC_2130P enabled by
  default on 32-bit ARM
--

commit 26558b027ddd75e632c3e98cf03a0b97873008a1
Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

clk: qcom: Consistently enable MSM8939, MDM9615, SAR2130P and SDX65

This commit enables the MSM8939, MDM9615, SAR2130P, and SDX65 clock
controller drivers by default when ARCH_QCOM is selected.

> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index 125831121696e..9f994042bc0a8 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig

[ ... ]

> @@ -1167,6 +1169,7 @@ config SAR_GCC_2130P
>  	tristate "SAR2130P Global Clock Controller"
>  	select QCOM_GDSC
>  	depends on COMMON_CLK_QCOM
> +	default ARCH_QCOM
>  	help
>  	  Support for the global clock controller on SAR2130P devices.
>  	  Say Y if you want to use peripheral devices such as UART, SPI,
> @@ -1176,6 +1179,7 @@ config SAR_GPUCC_2130P
>  	tristate "SAR2130P Graphics clock controller"
>  	select QCOM_GDSC
>  	select SAR_GCC_2130P
> +	default m if ARCH_QCOM

[Severity: Medium]
Should SAR_GCC_2130P and SAR_GPUCC_2130P only default to enabled on
ARM64?

SAR2130P is an ARM64 platform, and neither entry has a "depends on ARM64
|| COMPILE_TEST" line here, so these defaults enable both drivers on
32-bit ARM builds with CONFIG_ARCH_QCOM=3Dy.  Later in the series, commit
"clk: qcom: Consistently handle MSM8996 and SAR2130P" adds "depends on
ARM64 || COMPILE_TEST" to SAR_GCC_2130P but not to SAR_GPUCC_2130P,
which leaves SAR_GPUCC_2130P=3Dm by default on 32-bit ARM and selects
SAR_GCC_2130P with unmet direct dependencies.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261122-qcom-kconf=
ig-unify-v1-0-6abaa7faf1c9@oss.qualcomm.com?part=3D2
