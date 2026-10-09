Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846FE46AEF0;
	Fri,  9 Oct 2026 12:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791549046; cv=none; b=qv2JtQlQMIQtHDakHHFBfTYt5xIVmryhY9IJwVqIFqfCt/2hGLmyQ0fmPYCJUcOthGi6cKHASMhB6d2gYaqdH7q7sUnY+sF+dBYNe+AGKnKRhRyGSCnM+Ld67P3ZhynCsBL1VzGSCafm+hYkMXnLQI8HTN81jk0mJSc9/COrzGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791549046; c=relaxed/simple;
	bh=Zue/uP2x6TZmcbh6A1HmKxFHeB3+gUkblFTyKs3+lDg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=sqEXtw3i2oySl3FKpE5DNN4nZGI32ndGu8Ot4ONIJ8T0pf5lsp14QVLIEFqmGPDHLBZcTweat/XzwKbgBNUIHB2eGwxRmn6E+U+6N1LDVguH/n5doUUx/8qe/cxwOo2RdRxJeNEI9qmsaEr2hudQS8NE44QZpV7mWwyna6ZkeYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PHUDOERD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PHUDOERD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D55BB1F000FF;
	Fri,  9 Oct 2026 12:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791549042;
	bh=gLAvoEy0gK1BS0JyRcxf0NcRc+k21uWvSHhCDcbETNs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PHUDOERDvW/tRIbkhNMvYFjG59XTdCaW7nCkpe5dNpe3mjTlvri+vKPy/wCCDxvNz
	 f7a81tAItwGIlB/KWfJG17V7gydG4WsB1amYWlU3YhlN2sphR7CkxiR4vf482BFNW2
	 0/lBRX+3FzLbwaxcjjPHibPhNR5KrDGMYk6+TNjgcyFF8FV3eeFsi9mQSW62OBCckq
	 BnvfSQMcb+wL6VW4rPN5ewlyxQXV9vg9nuxJLVlGKP3UZEo3uQe0BxR6hxCvD1phdi
	 bssbXEmE9M92rR1slXZG2Dk9CQWQQaOm2hSGcP3bLjLGNx4WbYW4b/MR83caT4pyKL
	 eBOgZFCZlLJdQ==
Message-ID: <sashiko-outbox-165541@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 09/14] clk: samsung: exynos8855: add block hsi clock
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Raghav Sharma" <raghav.s@samsung.com>
Cc: conor+dt@kernel.org, linux-clk@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261009120137.2801911-10-raghav.s@samsung.com>
References: <20261009120137.2801911-1-raghav.s@samsung.com>
 <CGME20261009114356epcas5p3d70ea1ef357f6e05655035772c00809d@epcas5p3.samsung.com>
 <20261009120137.2801911-10-raghav.s@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 12:30:41 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] clk: samsung: exynos8855: out-of-bounds write in samsung_clk_add_l=
ookup() due to undersized CLKS_NR_HSI
- [High] clk: samsung: exynos8855: missing CLK_IS_CRITICAL on CLK_GOUT_CMU_=
HSI leading to system hang
--

commit 24ea6e22468660550351b038f08cf4b975d943f7
Author: Raghav Sharma <raghav.s@samsung.com>

clk: samsung: exynos8855: add block hsi clock support

This commit adds block HSI clock support for the Exynos 8855 SoC. It regist=
ers
compatible strings and cmu_info data for CMU_HSI, which provides clocks for
the HSI block.

> diff --git a/drivers/clk/samsung/clk-exynos8855.c b/drivers/clk/samsung/c=
lk-exynos8855.c
> index 2bf889a478bc9..16d71db11ad06 100644
> --- a/drivers/clk/samsung/clk-exynos8855.c
> +++ b/drivers/clk/samsung/clk-exynos8855.c
> @@ -19,7 +19,9 @@
>  #define CLKS_NR_TOP                     (CLKCMU_DOUT_G3D_HTU + 1)
>  #define CLKS_NR_PERIC                   (CLK_GOUT_USI_PERIC + 1)
>  #define CLKS_NR_PERIS                   (CLK_GOUT_WDT1_PERIS + 1)
> +#define CLKS_NR_HSI                     (CLK_GOUT_SYSREG_HSI  + 1)

[Severity: High]
Does this correctly calculate the maximum clock index?

If CLK_GOUT_SYSREG_HSI is 4, this sets CLKS_NR_HSI to 5. This macro
determines the .nr_clk_ids for the HSI block, sizing the
ctx->clk_data.hws array in samsung_clk_init() for 5 elements.

Later in this patch, the hsi_gate_clks array registers clocks with
higher IDs:

    GATE(CLK_GOUT_UFS_EMBD_UNIPRO_HSI, "gout_ufs_embd_unipro_hsi",
         "mout_clkcmu_hsi_ufs_embd_user",
         CMU_HSI_CLK_CON_GAT_BLK_HSI_UID_UFS_EMBD_IPCLKPORT_I_CLK_UNIPRO,
         21, 0, 0),

If CLK_GOUT_UFS_EMBD_UNIPRO_HSI is 6, will registering this clock cause
samsung_clk_add_lookup() to write past the end of the allocated flexible
array?

[ ... ]

> +static const struct samsung_gate_clock hsi_gate_clks[] __initconst =3D {
> +	/* System will hang if this critical clock is gated */
> +	GATE(CLK_GOUT_CMU_HSI, "gout_cmu_hsi",
> +	     "mout_clkcmu_hsi_noc_user",
> +	     CMU_HSI_CLK_CON_GAT_BLK_HSI_UID_CMU_HSI_IPCLKPORT_PCLK,
> +	     21, 0, 0),

[Severity: High]
Since this clock is critical to prevent a system hang, should the flags
argument be CLK_IS_CRITICAL instead of 0?

Without the critical flag, will the Common Clock Framework dynamically
disable this clock during late init if no active consumer has enabled
it?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009120137.2801=
911-1-raghav.s@samsung.com?part=3D9
