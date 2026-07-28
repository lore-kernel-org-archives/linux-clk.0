Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB77E4483AA
	for <linux-clk@vger.kernel.org>; Tue, 28 Jul 2026 14:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785247327; cv=none; b=ZtQWQPD4653HSizcy59OgKXcD7G88YbgxJLFEh76bWFS0xZDhPCCZIoqqWX0k+oIF3iZixyc1o2g4I7EPkCBkEJ+gYdrusOLmZthF9Qeaydm1MUDidAMHYgs5aoh/+YH8VB6SpXixwBl9RsPljnDfN64Ydw4MDIIqJR3kZtuJqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785247327; c=relaxed/simple;
	bh=gByZusriPrsS6Yj/fFH1n4YPMczuMaD+7HtxwdkD+Z8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=is/owKHo6PfUVIQ4+mLeR/n2W1gEcVGqY1PXUxyHt1k9Oj4fdWMnhrsKIkigZiWjirGMAEULgpOsezvD2nIq8Y95QQ2p4gMfSZkTsCiZRfMU5BSsnm1UijxbT4mA0HyX5sKfMSb3T8iqad1/xEBD0HQVsAFl1wpw+UvKakPWzwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HC2Roqld; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=etql2ixg; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HC2Roqld";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="etql2ixg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785247322;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0reqVvFM0eb7vRVz0DEiRClkuetBEbBFZj0i0gUKwf0=;
	b=HC2RoqldnWb7mq1ywQkEJvYlUoNThmYkeZpkRS/DYQjedGqIg0Bj5cU83Tv9wW7oLq7qLx
	4KZm7iZ8GYE5ck8eoH/SHuT4OUJ03MTbu5roMw5Qca0GkvkAuze+9aqXFqgjNMOuDacHU2
	JirVMcPl+L/2UlDZGcKqS4txzsscobo=
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com
 [74.125.224.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-595-QnuQEXfePdKZt744JcnSAQ-1; Tue, 28 Jul 2026 10:01:59 -0400
X-MC-Unique: QnuQEXfePdKZt744JcnSAQ-1
X-Mimecast-MFC-AGG-ID: QnuQEXfePdKZt744JcnSAQ_1785247318
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-66885e81633so2913350d50.0
        for <linux-clk@vger.kernel.org>; Tue, 28 Jul 2026 07:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785247318; x=1785852118; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=0reqVvFM0eb7vRVz0DEiRClkuetBEbBFZj0i0gUKwf0=;
        b=etql2ixg6pt9+d/uuJkUfS5slz4JK4ZFRSO5ijdhNaprr66ricQTlA0ae54WyOh34x
         Cgqzf26n2fIdESoGjPifqgXlsKSzkTiURYhmvdh8ZSxn0A/mzsYLOT3iqbIbYfF5gvw9
         TgObwiB0bIS3DCgEWb5wl+ESyS+L74O1otDmp7/pxmNMZLe/RxzOYiGKYSC2uHFwvhCN
         73DWA/opQ1ud32fdE9jdpq88I+9jlzwV9/LDrWpAtm94M0gE3kZmHC+Ju1+jhTWwyLOP
         5QsZDJWCBFNTCbBwZynqTDm7DPvqnw3ykYEZHInFyYYJEgl4at+xBOam9b9duOzPxGVM
         BIJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785247318; x=1785852118;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0reqVvFM0eb7vRVz0DEiRClkuetBEbBFZj0i0gUKwf0=;
        b=ZaHH87TQ8lzDSMtWRzWheQKdgHXZI0rQ6iohCdn3NNQgsMlRKTdI1T8dTHIQmd/ewj
         w3dwOeQnKfpoEza+BLOogSXgVqQBbIW1ESKX12xqY9XqhI3/UFjGtgiY16MeaG1G6cKs
         ruzYNLMeOIjM/bZAqe8O8OeDKB26FlDHRggso/RXxTv/8Dm2VYhsjF6kZfJcN32Furxs
         3PW4JBd6ii5vmN9Ph9oO2v82L287KaFZ5bDoDRb5+72q7keLl7Wkr/ZFx6pRrOCBVPV4
         HOfnISH4Zct0deAsmHF0TJ6oQR7rpUSMHQNvYu4WXWicgLHK0IkpbCgTWwQWnloy9YLE
         iwvg==
X-Forwarded-Encrypted: i=1; AHgh+RrieCx5MRSuiJgaLu2UDCKRQ4TyoIMxZaggFnZCJgcJMfXKr87/I7BohMpQ36yOdVeSppliFdwaC5o=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxwzSyvTuQKuVImXch3bUm2vj3q10cA6tqrkwGxXtEAGHB47FK
	vNghFm02T14rS0SCmymFOER9UT6nV39kC1U9/Sn9f4OcAOPNjiJziFR1kCo0k5p6Z/t0wzXnuJ6
	bgUAj81BrmvyQqTIOvZHSEgIFcGE4qlauHp63WqSehHdX2jEoHV0qPsFuwscr0w==
X-Gm-Gg: AR+sD12kcWVGug68kPlRxw31L4g/XxSMD7mDzw96qBfHFiL8Qt2N05bv5fFmEdgNPd6
	Z5nfrdiTeEFCXD15krdvZFYloP8WPTLfvy1CbGAx3hUd9reZVQ6aDfPmG1EbJaiH/ljorlonaLe
	YCZMKF+cjeWXnLrLjAiM5Tq5aVlOsciwSP3qhk8M/A0HBZc2G1Ho3CmnQkvCp7AEh4HjSnr62NS
	sZ8TX24HvDG/6RoMfyrOvyOtkUkBEsgw2oryeTKzpfzC+RflIF7AaDPXpZt/YAmqr6RNumODCSO
	PufHaWfMyd5mCbhM2/wYqXV7DNZmxY4w2aldm6UbhA6yS0Pm75os6+ja1ZKBIx31IJKzYAN/ORl
	eaeI8B5RdJ0iEufPOww5d0N6G2OW3nhDZbgs=
X-Received: by 2002:a53:ea06:0:b0:668:e1:628e with SMTP id 956f58d0204a3-669057e2f5cmr712339d50.29.1785247317894;
        Tue, 28 Jul 2026 07:01:57 -0700 (PDT)
X-Received: by 2002:a53:ea06:0:b0:668:e1:628e with SMTP id 956f58d0204a3-669057e2f5cmr712194d50.29.1785247316614;
        Tue, 28 Jul 2026 07:01:56 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-907e869ba73sm88474666d6.25.2026.07.28.07.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 07:01:54 -0700 (PDT)
Date: Tue, 28 Jul 2026 10:01:52 -0400
From: Brian Masney <bmasney@redhat.com>
To: Liu Changjie <liucj1228@outlook.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RESEND 3/9] clk: stm32: add STM32H7RS RCC driver
Message-ID: <ami2UOZm0VoYRmK4@redhat.com>
References: <MN0PR19MB60912FA1E75E4E55B2E27D34ACCD2@MN0PR19MB6091.namprd19.prod.outlook.com>
 <MN0PR19MB6091885F8E6F522600B25AB9ACCD2@MN0PR19MB6091.namprd19.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MN0PR19MB6091885F8E6F522600B25AB9ACCD2@MN0PR19MB6091.namprd19.prod.outlook.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

Hi Liu,

On Thu, Jul 23, 2026 at 11:48:58PM +0800, Liu Changjie wrote:
> Register the active STM32H7RS system, bus and selected peripheral
> clocks without reprogramming the PLLs used for execute-in-place.
> Decode the PLL2 S and T outputs used by SDMMC from PLL2DIVR2.
> Expose gates for TIM5, UART4, GPIO banks A-H and M-P, and SDMMC1.
> 
> Signed-off-by: Liu Changjie <liucj1228@outlook.com>
> ---
>  drivers/clk/Kconfig         |   5 +
>  drivers/clk/Makefile        |   1 +
>  drivers/clk/clk-stm32h7rs.c | 466 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 472 insertions(+)
>  create mode 100644 drivers/clk/clk-stm32h7rs.c
> 
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index 1717ce75a..5d1562a8a 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -448,6 +448,11 @@ config COMMON_CLK_STM32H7
>  	help
>  	  Support for stm32h7 SoC family clocks
>  
> +config COMMON_CLK_STM32H7RS
> +	def_bool COMMON_CLK && MACH_STM32H7R7
> +	help
> +	  Support for STM32H7RS SoC family clocks
> +
>  config COMMON_CLK_MMP2
>  	def_bool COMMON_CLK && (MACH_MMP2_DT || MACH_MMP3_DT)
>  	help
> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index cc108a75a..3dcb2f525 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -98,6 +98,7 @@ obj-$(CONFIG_COMMON_CLK_SI570)		+= clk-si570.o
>  obj-$(CONFIG_COMMON_CLK_SP7021)		+= clk-sp7021.o
>  obj-$(CONFIG_COMMON_CLK_STM32F)		+= clk-stm32f4.o
>  obj-$(CONFIG_COMMON_CLK_STM32H7)	+= clk-stm32h7.o
> +obj-$(CONFIG_COMMON_CLK_STM32H7RS)	+= clk-stm32h7rs.o
>  obj-$(CONFIG_COMMON_CLK_TPS68470)      += clk-tps68470.o
>  obj-$(CONFIG_CLK_TWL6040)		+= clk-twl6040.o
>  obj-$(CONFIG_CLK_TWL)			+= clk-twl.o
> diff --git a/drivers/clk/clk-stm32h7rs.c b/drivers/clk/clk-stm32h7rs.c
> new file mode 100644
> index 000000000..b82a24822
> --- /dev/null
> +++ b/drivers/clk/clk-stm32h7rs.c
> @@ -0,0 +1,466 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Clock driver for the STM32H7RS Reset and Clock Controller.
> + *
> + * The first-stage firmware configures the oscillators and PLLs before Linux
> + * starts executing from external NOR.  The driver reconstructs that running
> + * clock tree from RCC registers and gives Linux ownership of peripheral clock
> + * gates without disturbing the XIP-critical PLL configuration.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>
> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/math64.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/of_clk.h>
> +#include <linux/slab.h>

Is slab.h needed here?

> +#include <linux/spinlock.h>
> +
> +#include <dt-bindings/clock/stm32h7rs-clks.h>
> +
> +#define RCC_CR			0x000
> +#define RCC_CFGR		0x010
> +#define RCC_CDCFGR		0x018
> +#define RCC_BMCFGR		0x01c
> +#define RCC_APBCFGR		0x020
> +#define RCC_PLLCKSELR		0x028
> +#define RCC_PLLCFGR		0x02c
> +#define RCC_PLL1DIVR1		0x030
> +#define RCC_PLL1FRACR		0x034
> +#define RCC_PLL2DIVR1		0x038
> +#define RCC_PLL2FRACR		0x03c
> +#define RCC_PLL3DIVR1		0x040
> +#define RCC_PLL3FRACR		0x044
> +#define RCC_CCIPR1		0x04c
> +#define RCC_CCIPR2		0x050
> +#define RCC_PLL2DIVR2		0x0c4
> +#define RCC_AHB5ENR		0x134
> +#define RCC_AHB4ENR		0x140
> +#define RCC_APB1ENR1		0x148
> +
> +#define RCC_CR_HSIDIV_SHIFT	3
> +#define RCC_CFGR_SWS_SHIFT	3
> +#define RCC_CFGR_TIMPRE		BIT(15)
> +#define RCC_PLLCFGR_FRACEN(_pll)	BIT(((_pll) - 1) * 11)
> +#define RCC_PLL_ON(_pll)	BIT(24 + (((_pll) - 1) * 2))
> +
> +#define RCC_CDCFGR_CPRE_SHIFT	0
> +#define RCC_BMCFGR_BMPRE_SHIFT	0
> +#define RCC_APBCFGR_PPRE1_SHIFT	0
> +#define RCC_APBCFGR_PPRE2_SHIFT	4
> +#define RCC_APBCFGR_PPRE4_SHIFT	8
> +#define RCC_APBCFGR_PPRE5_SHIFT	12
> +
> +#define RCC_CCIPR1_SDMMC12SEL	BIT(2)
> +#define RCC_CCIPR2_UARTSEL_MASK	GENMASK(2, 0)
> +
> +#define HSI_RATE		64000000UL
> +#define CSI_RATE		4000000UL
> +
> +static DEFINE_SPINLOCK(stm32h7rs_rcc_lock);
> +
> +static const u16 pll_divr_offset[] = {
> +	RCC_PLL1DIVR1, RCC_PLL2DIVR1, RCC_PLL3DIVR1,
> +};
> +
> +static const u16 pll_fracr_offset[] = {
> +	RCC_PLL1FRACR, RCC_PLL2FRACR, RCC_PLL3FRACR,
> +};
> +
> +static const u8 pll_m_shift[] = { 4, 12, 20 };
> +
> +enum stm32h7rs_pll_output {
> +	PLL_P,
> +	PLL_Q,
> +	PLL_R,
> +	PLL_S,
> +	PLL_T,
> +};
> +
> +static unsigned long stm32h7rs_hsi_rate(void __iomem *base)
> +{
> +	u32 div = (readl_relaxed(base + RCC_CR) >> RCC_CR_HSIDIV_SHIFT) & 0x3;
> +
> +	return HSI_RATE >> div;
> +}
> +
> +static unsigned long stm32h7rs_pll_rate(void __iomem *base, unsigned int pll,
> +					unsigned int output,
> +					unsigned long hse_rate)
> +{
> +	static const u8 output_shift[] = { 9, 16, 24 };
> +	u64 numerator;
> +	unsigned long parent_rate;
> +	u32 divr1, frac = 0, m, n, out_div, source;

Reverse Christmas tree order.

> +
> +	if (pll < 1 || pll > ARRAY_SIZE(pll_divr_offset) || output > PLL_T)
> +		return 0;
> +
> +	if (output > PLL_R && pll != 2)
> +		return 0;
> +
> +	if (!(readl_relaxed(base + RCC_CR) & RCC_PLL_ON(pll)))
> +		return 0;
> +
> +	source = readl_relaxed(base + RCC_PLLCKSELR) & GENMASK(1, 0);
> +	switch (source) {
> +	case 0:
> +		parent_rate = stm32h7rs_hsi_rate(base);
> +		break;
> +	case 1:
> +		parent_rate = CSI_RATE;
> +		break;
> +	case 2:
> +		parent_rate = hse_rate;
> +		break;
> +	default:
> +		return 0;
> +	}
> +
> +	m = (readl_relaxed(base + RCC_PLLCKSELR) >> pll_m_shift[pll - 1]) & 0x3f;
> +	if (!m || !parent_rate)
> +		return 0;
> +
> +	divr1 = readl_relaxed(base + pll_divr_offset[pll - 1]);
> +	n = (divr1 & GENMASK(8, 0)) + 1;
> +	if (readl_relaxed(base + RCC_PLLCFGR) & RCC_PLLCFGR_FRACEN(pll))
> +		frac = (readl_relaxed(base + pll_fracr_offset[pll - 1]) >> 3) &
> +			GENMASK(12, 0);
> +
> +	if (output <= PLL_R) {
> +		out_div = ((divr1 >> output_shift[output]) &
> +			   GENMASK(6, 0)) + 1;
> +	} else {
> +		u32 divr2 = readl_relaxed(base + RCC_PLL2DIVR2);
> +		u8 shift = output == PLL_S ? 0 : 8;
> +
> +		out_div = ((divr2 >> shift) & GENMASK(2, 0)) + 1;
> +	}
> +
> +	numerator = (u64)parent_rate * (n * 8192ULL + frac);
> +	return div64_u64(numerator, (u64)m * 8192ULL * out_div);

Newline before the return

> +}
> +
> +static unsigned long stm32h7rs_ahb_rate(unsigned long parent_rate, u32 val)
> +{
> +	static const u16 div_table[] = { 2, 4, 8, 16, 64, 128, 256, 512 };
> +
> +	if (val < 8)
> +		return parent_rate;
> +
> +	return parent_rate / div_table[val - 8];
> +}
> +
> +static unsigned long stm32h7rs_sys_rate(void __iomem *base,
> +					unsigned long hse_rate)
> +{
> +	unsigned long rate;
> +	u32 cpre, source;
> +
> +	source = (readl_relaxed(base + RCC_CFGR) >> RCC_CFGR_SWS_SHIFT) & 0x7;
> +	switch (source) {
> +	case 0:
> +		rate = stm32h7rs_hsi_rate(base);
> +		break;
> +	case 1:
> +		rate = CSI_RATE;
> +		break;
> +	case 2:
> +		rate = hse_rate;
> +		break;
> +	case 3:
> +		rate = stm32h7rs_pll_rate(base, 1, PLL_P, hse_rate);
> +		break;
> +	default:
> +		return 0;
> +	}
> +
> +	cpre = (readl_relaxed(base + RCC_CDCFGR) >> RCC_CDCFGR_CPRE_SHIFT) & 0xf;
> +	return stm32h7rs_ahb_rate(rate, cpre);
> +}
> +
> +static unsigned long stm32h7rs_apb_rate(void __iomem *base,
> +					unsigned long hclk_rate, u8 shift)
> +{
> +	u32 prescaler = (readl_relaxed(base + RCC_APBCFGR) >> shift) & 0x7;
> +
> +	if (prescaler < 4)
> +		return hclk_rate;
> +
> +	return hclk_rate >> (prescaler - 3);
> +}
> +
> +static unsigned long stm32h7rs_timer_rate(void __iomem *base,
> +					  unsigned long hclk_rate,
> +					  unsigned long pclk_rate)
> +{
> +	u32 prescaler = (readl_relaxed(base + RCC_APBCFGR) >>
> +			 RCC_APBCFGR_PPRE1_SHIFT) & 0x7;
> +
> +	if (prescaler < 4)
> +		return pclk_rate;
> +
> +	if (!(readl_relaxed(base + RCC_CFGR) & RCC_CFGR_TIMPRE))
> +		return pclk_rate * 2;
> +
> +	return prescaler < 6 ? hclk_rate : pclk_rate * 4;
> +}
> +
> +static unsigned long stm32h7rs_uart4_rate(void __iomem *base,
> +					  unsigned long hse_rate,
> +					  unsigned long lse_rate,
> +					  unsigned long pclk1_rate)
> +{
> +	u32 source = readl_relaxed(base + RCC_CCIPR2) & RCC_CCIPR2_UARTSEL_MASK;
> +
> +	switch (source) {
> +	case 0:
> +		return pclk1_rate;
> +	case 1:
> +		return stm32h7rs_pll_rate(base, 2, PLL_Q, hse_rate);
> +	case 2:
> +		return stm32h7rs_pll_rate(base, 3, PLL_Q, hse_rate);
> +	case 3:
> +		return stm32h7rs_hsi_rate(base);
> +	case 4:
> +		return CSI_RATE;
> +	case 5:
> +		return lse_rate;
> +	default:
> +		return 0;
> +	}
> +}
> +
> +static unsigned long stm32h7rs_sdmmc1_rate(void __iomem *base,
> +					   unsigned long hse_rate)
> +{
> +	if (readl_relaxed(base + RCC_CCIPR1) & RCC_CCIPR1_SDMMC12SEL)
> +		return stm32h7rs_pll_rate(base, 2, PLL_T, hse_rate);
> +
> +	return stm32h7rs_pll_rate(base, 2, PLL_S, hse_rate);
> +}
> +
> +static int __init h7rs_register_fixed(struct clk_hw_onecell_data *data,
> +				      unsigned int id, const char *name,
> +				       unsigned long rate)
> +{
> +	struct clk_hw *hw;
> +
> +	hw = clk_hw_register_fixed_rate(NULL, name, NULL, CLK_IS_CRITICAL, rate);
> +	if (IS_ERR(hw))
> +		return PTR_ERR(hw);
> +
> +	data->hws[id] = hw;
> +	return 0;
> +}
> +
> +static int __init h7rs_register_gate(struct clk_hw_onecell_data *data,
> +				     unsigned int id, const char *name,
> +				      const char *parent_name,
> +				      void __iomem *base, u16 offset,
> +				      u8 bit_idx)
> +{
> +	struct clk_hw *hw;
> +
> +	hw = clk_hw_register_gate(NULL, name, parent_name, CLK_IGNORE_UNUSED,

Use parent_data instead of parent_name. You can use
clk_hw_register_gate_parent_data() here.

> +				  base + offset, bit_idx, 0,
> +				  &stm32h7rs_rcc_lock);
> +	if (IS_ERR(hw))
> +		return PTR_ERR(hw);
> +
> +	data->hws[id] = hw;
> +	return 0;
> +}
> +
> +struct stm32h7rs_gate {
> +	u8 id;
> +	u8 bit_idx;
> +	u16 offset;
> +	const char *name;
> +	const char *parent_name;
> +};
> +
> +static const struct stm32h7rs_gate stm32h7rs_gates[] __initconst = {
> +	{ STM32H7RS_TIM5_CK, 3, RCC_APB1ENR1, "tim5", "tim5_ker" },
> +	{ STM32H7RS_UART4_CK, 19, RCC_APB1ENR1, "uart4", "uart4_ker" },
> +	{ STM32H7RS_GPIOA_CK, 0, RCC_AHB4ENR, "gpioa", "h7rs_hclk" },
> +	{ STM32H7RS_GPIOB_CK, 1, RCC_AHB4ENR, "gpiob", "h7rs_hclk" },
> +	{ STM32H7RS_GPIOC_CK, 2, RCC_AHB4ENR, "gpioc", "h7rs_hclk" },
> +	{ STM32H7RS_GPIOD_CK, 3, RCC_AHB4ENR, "gpiod", "h7rs_hclk" },
> +	{ STM32H7RS_GPIOE_CK, 4, RCC_AHB4ENR, "gpioe", "h7rs_hclk" },
> +	{ STM32H7RS_GPIOF_CK, 5, RCC_AHB4ENR, "gpiof", "h7rs_hclk" },
> +	{ STM32H7RS_GPIOG_CK, 6, RCC_AHB4ENR, "gpiog", "h7rs_hclk" },
> +	{ STM32H7RS_GPIOH_CK, 7, RCC_AHB4ENR, "gpioh", "h7rs_hclk" },
> +	{ STM32H7RS_GPIOM_CK, 12, RCC_AHB4ENR, "gpiom", "h7rs_hclk" },
> +	{ STM32H7RS_GPION_CK, 13, RCC_AHB4ENR, "gpion", "h7rs_hclk" },
> +	{ STM32H7RS_GPIOO_CK, 14, RCC_AHB4ENR, "gpioo", "h7rs_hclk" },
> +	{ STM32H7RS_GPIOP_CK, 15, RCC_AHB4ENR, "gpiop", "h7rs_hclk" },
> +	{ STM32H7RS_SDMMC1_CK, 8, RCC_AHB5ENR, "sdmmc1", "sdmmc1_ker" },
> +};
> +
> +static void __init stm32h7rs_rcc_init(struct device_node *np)
> +{
> +	struct clk_hw_onecell_data *clk_data;
> +	unsigned long hse_rate, lse_rate;
> +	unsigned long sys_rate, hclk_rate;
> +	unsigned long pclk1_rate, pclk2_rate, pclk4_rate, pclk5_rate;
> +	unsigned long timer_rate, uart4_rate, sdmmc1_rate;
> +	struct clk_hw *timer_hw = NULL, *uart4_hw = NULL, *sdmmc1_hw = NULL;
> +	struct clk *input;
> +	void __iomem *base;
> +	unsigned int fixed_count = 0, gate_count = 0;
> +	unsigned int i;
> +	u32 bmpre;
> +	int ret;
> +
> +	base = of_iomap(np, 0);

devm_of_iomap

> +	if (!base) {
> +		pr_err("%pOF: unable to map RCC registers\n", np);
> +		return;
> +	}
> +
> +	input = of_clk_get(np, 0);
> +	if (IS_ERR(input)) {
> +		pr_err("%pOF: unable to get HSE input clock\n", np);
> +		goto err_unmap;
> +	}
> +	hse_rate = clk_get_rate(input);
> +	clk_put(input);
> +
> +	input = of_clk_get(np, 1);
> +	if (IS_ERR(input)) {
> +		pr_err("%pOF: unable to get LSE input clock\n", np);
> +		goto err_unmap;
> +	}
> +	lse_rate = clk_get_rate(input);
> +	clk_put(input);
> +
> +	clk_data = kzalloc(struct_size(clk_data, hws, STM32H7RS_MAX_CLKS),
> +			   GFP_KERNEL);
> +	if (!clk_data)
> +		goto err_unmap;
> +	clk_data->num = STM32H7RS_MAX_CLKS;
> +
> +	sys_rate = stm32h7rs_sys_rate(base, hse_rate);
> +	bmpre = (readl_relaxed(base + RCC_BMCFGR) >>
> +		  RCC_BMCFGR_BMPRE_SHIFT) & 0xf;
> +	hclk_rate = stm32h7rs_ahb_rate(sys_rate, bmpre);
> +	pclk1_rate = stm32h7rs_apb_rate(base, hclk_rate, RCC_APBCFGR_PPRE1_SHIFT);
> +	pclk2_rate = stm32h7rs_apb_rate(base, hclk_rate, RCC_APBCFGR_PPRE2_SHIFT);
> +	pclk4_rate = stm32h7rs_apb_rate(base, hclk_rate, RCC_APBCFGR_PPRE4_SHIFT);
> +	pclk5_rate = stm32h7rs_apb_rate(base, hclk_rate, RCC_APBCFGR_PPRE5_SHIFT);
> +	timer_rate = stm32h7rs_timer_rate(base, hclk_rate, pclk1_rate);
> +	uart4_rate = stm32h7rs_uart4_rate(base, hse_rate, lse_rate, pclk1_rate);
> +	sdmmc1_rate = stm32h7rs_sdmmc1_rate(base, hse_rate);
> +
> +	if (!sys_rate || !hclk_rate || !pclk1_rate || !pclk2_rate ||
> +	    !pclk4_rate || !pclk5_rate || !timer_rate || !uart4_rate ||
> +	    !sdmmc1_rate) {
> +		pr_err("%pOF: invalid boot clock configuration\n", np);
> +		goto err_free;
> +	}
> +
> +	ret = h7rs_register_fixed(clk_data, STM32H7RS_SYS_CK,
> +				  "h7rs_sys_ck", sys_rate);
> +	if (ret)
> +		goto err_register;
> +	fixed_count++;
> +	ret = h7rs_register_fixed(clk_data, STM32H7RS_HCLK,
> +				  "h7rs_hclk", hclk_rate);
> +	if (ret)
> +		goto err_register;
> +	fixed_count++;
> +	ret = h7rs_register_fixed(clk_data, STM32H7RS_PCLK1,
> +				  "h7rs_pclk1", pclk1_rate);
> +	if (ret)
> +		goto err_register;
> +	fixed_count++;
> +	ret = h7rs_register_fixed(clk_data, STM32H7RS_PCLK2,
> +				  "h7rs_pclk2", pclk2_rate);
> +	if (ret)
> +		goto err_register;
> +	fixed_count++;
> +	ret = h7rs_register_fixed(clk_data, STM32H7RS_PCLK4,
> +				  "h7rs_pclk4", pclk4_rate);
> +	if (ret)
> +		goto err_register;
> +	fixed_count++;
> +	ret = h7rs_register_fixed(clk_data, STM32H7RS_PCLK5,
> +				  "h7rs_pclk5", pclk5_rate);
> +	if (ret)
> +		goto err_register;
> +	fixed_count++;
> +
> +	timer_hw = clk_hw_register_fixed_rate(NULL, "tim5_ker", NULL,
> +					      CLK_IS_CRITICAL, timer_rate);
> +	if (IS_ERR(timer_hw)) {
> +		ret = PTR_ERR(timer_hw);
> +		timer_hw = NULL;
> +		goto err_register;
> +	}
> +	uart4_hw = clk_hw_register_fixed_rate(NULL, "uart4_ker", NULL,
> +					      CLK_IS_CRITICAL, uart4_rate);
> +	if (IS_ERR(uart4_hw)) {
> +		ret = PTR_ERR(uart4_hw);
> +		uart4_hw = NULL;
> +		goto err_register;
> +	}
> +	sdmmc1_hw = clk_hw_register_fixed_rate(NULL, "sdmmc1_ker", NULL,
> +					       CLK_IS_CRITICAL, sdmmc1_rate);
> +	if (IS_ERR(sdmmc1_hw)) {
> +		ret = PTR_ERR(sdmmc1_hw);
> +		sdmmc1_hw = NULL;
> +		goto err_register;
> +	}
> +
> +	for (i = 0; i < ARRAY_SIZE(stm32h7rs_gates); i++) {
> +		const struct stm32h7rs_gate *gate = &stm32h7rs_gates[i];
> +
> +		ret = h7rs_register_gate(clk_data, gate->id, gate->name,
> +					 gate->parent_name, base,
> +					   gate->offset, gate->bit_idx);
> +		if (ret) {
> +			pr_err("%pOF: failed to register %s clock: %d\n",
> +			       np, gate->name, ret);
> +			goto err_register;
> +		}
> +		gate_count++;
> +	}
> +
> +	ret = of_clk_add_hw_provider(np, of_clk_hw_onecell_get, clk_data);
> +	if (ret) {
> +		pr_err("%pOF: failed to add clock provider: %d\n", np, ret);
> +		goto err_register;
> +	}
> +
> +	pr_info("STM32H7RS RCC: sys=%lu hclk=%lu pclk1=%lu tim5=%lu uart4=%lu sdmmc1=%lu\n",
> +		sys_rate, hclk_rate, pclk1_rate, timer_rate, uart4_rate,
> +		sdmmc1_rate);
> +	return;
> +
> +err_register:
> +	while (gate_count) {
> +		const struct stm32h7rs_gate *gate;
> +
> +		gate = &stm32h7rs_gates[--gate_count];
> +		clk_hw_unregister_gate(clk_data->hws[gate->id]);
> +	}
> +	if (sdmmc1_hw)
> +		clk_hw_unregister_fixed_rate(sdmmc1_hw);
> +	if (uart4_hw)
> +		clk_hw_unregister_fixed_rate(uart4_hw);
> +	if (timer_hw)
> +		clk_hw_unregister_fixed_rate(timer_hw);
> +	while (fixed_count)
> +		clk_hw_unregister_fixed_rate(clk_data->hws[--fixed_count]);
> +	pr_err("%pOF: failed to register clocks: %d\n", np, ret);
> +err_free:
> +	kfree(clk_data);
> +err_unmap:
> +	iounmap(base);
> +}
> +
> +CLK_OF_DECLARE_DRIVER(stm32h7rs_rcc, "st,stm32h7rs-rcc", stm32h7rs_rcc_init);

Can this be registered as a platform device instead of using CLK_OF_DECLARE_DRIVER?

Brian

