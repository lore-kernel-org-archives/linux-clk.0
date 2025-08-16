Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220CC849C
	for <linux-clk@vger.kernel.org>; Sat, 16 Aug 2025 08:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755331331; cv=none; b=nnJhtHkd98Jv6YbO06236/wTcrt2dMCAKx2gCNvxG3ZSjnsl9P7az+UyCF9zqRqjswT92sOfZxOwS25eQvLWdQBNIIHm4kczvXUDludW/LGWUNxvN4ny2t1CIJCO6VNB6l8v1pNDND9x34YKT2YcYsoj9zEyun0dasgMBQe0IaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755331331; c=relaxed/simple;
	bh=xeZB0/MV2mRIdGtensK7l2hpViEnBkI48t/wlVNfDAc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iIknzQIB6TS8E2+eqtrVRR9B6PGaA4IV1TtLIhLbVxSKyX+IEy/iuJvDusS31z4Vh3MyAxE54WgX4iXSEpiThcNYUOIsmF90sdbGBNY2SjYkB0lo3p17HxiYhgahg776yDBY6ruF8jphMEThoroGS9V/vlRnCJmrEESK55x76Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=mAiimklo; arc=none smtp.client-ip=91.218.175.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="mAiimklo"
Date: Sat, 16 Aug 2025 16:01:37 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1755331316;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EOo8GB7o2DUvLMEWO0WKIusOz/pycPiItGuieZ5F3Os=;
	b=mAiimklowZnC4ncMq5D5aWLLDUqkRnWsS0Zb8uiLFJk6xsZlYeQwpzLnQlJLWAvu5qZPZZ
	hApNxZdJ7X7JaX91swUNSvOpWLb5HikunvI7RwMKSSQs5HXU41sqIy4nt1GNQIa3dpCLEb
	l8jepjAqxubbQp6bzKtRojk+3g2IF6g=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Troy Mitchell <troy.mitchell@linux.dev>
To: Icenowy Zheng <uwu@icenowy.me>, Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Michal Wilczynski <m.wilczynski@samsung.com>,
	Yao Zi <ziyao@disroot.org>, Han Gao <rabenda.cn@gmail.com>,
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Troy Mitchell <troy.mitchell@linux.dev>
Subject: Re: [PATCH 2/2] clk: thead: th1520-ap: fix parent of padctrl0 clock
Message-ID: <aKA64Xj-2GCCVRgg@troy-wujie14pro-arch>
References: <20250813171136.2213309-1-uwu@icenowy.me>
 <20250813171136.2213309-3-uwu@icenowy.me>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250813171136.2213309-3-uwu@icenowy.me>
X-Migadu-Flow: FLOW_OUT

On Thu, Aug 14, 2025 at 01:11:36AM +0800, Icenowy Zheng wrote:
> The padctrl0 clock seems to be a child of the perisys_apb4_hclk clock,
> gating the later makes padctrl0 registers stuck too.
> 
> Fix this relationship.
> 
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> ---
>  drivers/clk/thead/clk-th1520-ap.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
With fixing what Drew said, feel free to add:

Reviewed-by: Troy Mitchell <troy.mitchell@linux.dev>
> 
> diff --git a/drivers/clk/thead/clk-th1520-ap.c b/drivers/clk/thead/clk-th1520-ap.c
> index d08e7fb387e50..f6f3d63d53353 100644
> --- a/drivers/clk/thead/clk-th1520-ap.c
> +++ b/drivers/clk/thead/clk-th1520-ap.c
> @@ -888,13 +888,16 @@ static CCU_GATE(CLK_PERISYS_APB3_HCLK, perisys_apb3_hclk, "perisys-apb3-hclk", p
>  		0x150, 11, CLK_IS_CRITICAL);
>  static CCU_GATE(CLK_PERISYS_APB4_HCLK, perisys_apb4_hclk, "perisys-apb4-hclk", perisys_ahb_hclk_pd,
>  		0x150, 12, 0);
> +static const struct clk_parent_data perisys_apb4_hclk_pd[] = {
> +	{ .hw = &perisys_apb4_hclk.gate.hw },
> +};
>  static CCU_GATE(CLK_NPU_AXI, npu_axi_clk, "npu-axi", axi_aclk_pd, 0x1c8, 5, CLK_IS_CRITICAL);
>  static CCU_GATE(CLK_CPU2VP, cpu2vp_clk, "cpu2vp", axi_aclk_pd, 0x1e0, 13, CLK_IS_CRITICAL);
>  static CCU_GATE(CLK_EMMC_SDIO, emmc_sdio_clk, "emmc-sdio", emmc_sdio_ref_clk_pd, 0x204, 30, 0);
>  static CCU_GATE(CLK_GMAC1, gmac1_clk, "gmac1", gmac_pll_clk_pd, 0x204, 26, 0);
>  static CCU_GATE(CLK_PADCTRL1, padctrl1_clk, "padctrl1", perisys_apb_pclk_pd, 0x204, 24, 0);
>  static CCU_GATE(CLK_DSMART, dsmart_clk, "dsmart", perisys_apb_pclk_pd, 0x204, 23, 0);
> -static CCU_GATE(CLK_PADCTRL0, padctrl0_clk, "padctrl0", perisys_apb_pclk_pd, 0x204, 22, 0);
> +static CCU_GATE(CLK_PADCTRL0, padctrl0_clk, "padctrl0", perisys_apb4_hclk_pd, 0x204, 22, 0);
>  static CCU_GATE(CLK_GMAC_AXI, gmac_axi_clk, "gmac-axi", axi4_cpusys2_aclk_pd, 0x204, 21, 0);
>  static CCU_GATE(CLK_GPIO3, gpio3_clk, "gpio3-clk", peri2sys_apb_pclk_pd, 0x204, 20, 0);
>  static CCU_GATE(CLK_GMAC0, gmac0_clk, "gmac0", gmac_pll_clk_pd, 0x204, 19, 0);
> -- 
> 2.50.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
