Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 559312D5C95
	for <linux-clk@vger.kernel.org>; Wed,  4 Feb 2026 12:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770209308; cv=none; b=NyI1Lfjmnx6HNi56Pl8zC8PFluphvkDbvdE3PqGrBfZCO5fnpfgKWYj8D4FcWUxqsNXg4xrIznSarMZbl1mMycohN36Jgnd+U7fkXZYPgpJjINLQFrBrkONP5eoIRgxstlPfYjAPBKJuwSASN3ShIp7KxWWYItfDYjuetd20fig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770209308; c=relaxed/simple;
	bh=6MfjmNk8dtyaBuEQCdqrh2ZHv3QxPSfQgxQU2sWMjCE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jqIWr4MllqmfxebPZK5wws+gxIhVKnUUR19pbzLiiDhREtRCWtTpsNzsZEcTYQT2aUzC8QG1PPivifTXPxC3c4wSPnZCXRIKsLcpIJ3EowgZOlHTds3T9tZmZMti92vflRO6+YFe6+PTzfgow2owsAsm7TyAiOAVSdKgzEx7hOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=nK1RH4Xe; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="nK1RH4Xe"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b8715a4d9fdso769935166b.0
        for <linux-clk@vger.kernel.org>; Wed, 04 Feb 2026 04:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1770209307; x=1770814107; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FmsMlFS2If3FaGyK0lL7JZ89jCKyXCfusyNuSVVf17s=;
        b=nK1RH4XeYWYYFx7VMKonWyhxFjJaZt4zHbEB5ahflmiycVYOFP3SYXwVYA0VJU/UPu
         lFtBcpXYghWEbeEZiJ5z6CmMmPPzOwcaAiEitKiNCQf+M/holIQ+AF3QC3N5HFciE7U/
         iQyQscjE5+w6V+b6ahUi6B/54O7frYGWA7Yl/VEk0eOuXvMUgtt/RsvtvVDpDi1KNfhY
         httOWdUPsKDrpSSlUdwvASiaiCx3ss58HFcCoRfLuVaIElzbAxyKIo+z27PehcpxBmh9
         dSK99C96Mq0dj9+IeS9gbSjjPLbrlTGH3nuEHMKR76rFVL2fTZDPfYW4JEeQDyLuxYPf
         FFnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770209307; x=1770814107;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FmsMlFS2If3FaGyK0lL7JZ89jCKyXCfusyNuSVVf17s=;
        b=jYrJe4duLA6jfTwxnfhSZU/l8ANQGYAe+ZeDmBx8jCxYhwCGR5RsaZmjhmPkATm1F2
         59ow65a5QoKg9Vbavrhg0aLkIy0UTWNFO4Z1bE3jGOH6vee6mmgB+P2N6QtKADZaASbu
         oB1i/RM3q1YQpswDNOsgzA0mtL+LuDN6Notu9xJSNJ1jwlfuyYBJRTzIVoPCcL+Skw7u
         CmZwTy5N9hXwgTTReX+Z3k1t9mfmenM1Yi9eAARmo4AAPQYxPoXM8yWm/X7WTQ38YPUB
         iV4H9WPrr327Bx3WUY6Wqh6xIb3CgqUj2jnVQERFchdLYdFjlgklca5E/IHtXvW3H6Ml
         V2Ww==
X-Forwarded-Encrypted: i=1; AJvYcCXBeybJl9LA1Lp7QQfd2Pcf2K8lPkxtHgVPS3KGbaRLKslgIlcA4VnG4Wb42pzjr46P4vg12RxFdzA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2wNAgO5PWrTp6bgxL2ELNCogP0angBQXUxAUWMUhLD4IcjWJ4
	lDgNNZ0yCihEgCnVrz2KpCLyOp7OtC7kmFxFkKOw5Mwmj4z8XZTHJdsB71ZZBdjKxRA=
X-Gm-Gg: AZuq6aKvRJyfPwSknIBhk2YyFjRijXXeFiVRsAO72+uLqqO7JuqFRyL83EGsS2aJvYT
	aZcm3m7sR4ca/s45LYPSwZ65r9+SZtk6gC54rpTya1w50uoAHR31DbNRQoOTJu5scXYIOa5AyKL
	9q4KO3y3G28e3WgpFZwijqUGCSFwMt5/gFHUTPK2sBQnHQB6tdl6/erCYWBF58Skc+oTmR6epmm
	bZ1/P0X2RMAX74u4jT0s6CoumxhacDacsNhfDiOAlL0MDCshFIRxtaADWOaFtXpqTcCTYzVWfac
	3Xh6tygaaNAxzDVe037dcNPqHxARrwtSqcENCGKC0jKPJL7QpEvOaKpYvPO9OxisTo5SIUk2bCf
	PG4CEUnfCrwqVmcXeO2Bv3zh8bQaQHYHsKOCDwzfHNbt3C9iUhf3fJXRCshMkwDQu/7H+BY4k/p
	Shw2Gfs0+NvW/gnFWyUq8=
X-Received: by 2002:a17:907:971a:b0:b73:544d:b963 with SMTP id a640c23a62f3a-b8e9f04c8ecmr184780066b.13.1770209306435;
        Wed, 04 Feb 2026 04:48:26 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.215])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8e9feeff67sm118439166b.36.2026.02.04.04.48.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Feb 2026 04:48:25 -0800 (PST)
Message-ID: <d024e1f1-ab7e-4b90-9be3-a55e130c2b67@tuxon.dev>
Date: Wed, 4 Feb 2026 14:48:24 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: renesas: rzg2l: Drop DMA driver dependency for
 system boot
To: Biju <biju.das.au@gmail.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260130143456.256813-1-biju.das.jz@bp.renesas.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260130143456.256813-1-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi, Biju,

On 1/30/26 16:34, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
> 
> As per section 4.6.1.7.1 of the RZ/G3L hardware manual "Precaution when
> use the peripheral modules which can initiate DMA Controller", it is
> stated that it needs the below register settings even if DMA controller
> is not used:
>   - Set CPG_CLKON_DMAC_REG register to supply a clock for DMA Controller.
>   - Set CPG_RST_DMAC register to release a reset for DMA Controller.
> 
> Currently, the serial IRQ is not routed to the CPU if the DMA ACLK is off,
> or if DMA resets being in the asserted state result in not getting serial
> IRQs for the console. Fix the issue by explicitly deasserting the DMA
> resets during probe, and since the DMA clk is a critical clock, it will be
> turned on forever. This will allow booting system without DMA driver.
> 
> RZ/G2L SoC loses power during s2ram. Explicitly turn on clk/deassert
> resets to get the console during wakeup.
> 
> The DMA driver is used by both RZ/G2L and RZ/V2H family SoCs. The latter
> does not have any issue related to serial IRQ routing. The reset assert
> in DMA driver will impact wakeup using serial IRQ on RZ/G2L SoCs. The
> cpg_suspend() is suspend-no-irq which suspends later than DMA driver. So,
> deassert thereset in cpg_suspend() for making available the serial IRQ
> as a wakeup source for s2idle.
> 
> With these changes, the RZ/G2L-based systems:
>   1) can boot without the DMA driver
>   2) get serial IRQ available as wakeup source for s2idle
>   3) get serial console prompt during wakeup of s2ram.
>   4) has no dependency on bootloaders for turning on DMA clks/releasing
>      the resets.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>   drivers/clk/renesas/rzg2l-cpg.c | 35 ++++++++++++++++++++++++++++++++-
>   1 file changed, 34 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
> index f4deb5d3b837..16771a0101bd 100644
> --- a/drivers/clk/renesas/rzg2l-cpg.c
> +++ b/drivers/clk/renesas/rzg2l-cpg.c
> @@ -86,6 +86,12 @@
>   #define PLL5_HSCLK_MIN		10000000
>   #define PLL5_HSCLK_MAX		187500000
>   
> +/* Critical clk/resets to route serial IRQ to CPU by default */
> +#define CPG_CLKON_DMAC_REG	0x52c
> +#define CPG_RST_DMAC		0x82c
> +#define CPG_CLKON_DMAC_REG_ACLK_ON	((BIT(0) << 16) | BIT(0))
> +#define CPG_RST_DMAC_DEASSERTED_ALL	((GENMASK(1, 0) << 16) | GENMASK(1, 0))
> +
>   /**
>    * struct clk_hw_data - clock hardware data
>    * @hw: clock hw
> @@ -2051,21 +2057,48 @@ static int __init rzg2l_cpg_probe(struct platform_device *pdev)
>   	if (error)
>   		return error;
>   
> +	/*
> +	 * Deassert DMA resets to route the serial IRQ to CPU for serial
> +	 * console during boot. DMA clk is critical clk and it will be
> +	 * turned on forever.
> +	 */
> +	writel(CPG_RST_DMAC_DEASSERTED_ALL, priv->base + CPG_RST_DMAC);
> +
>   	debugfs_create_file("mstop", 0444, NULL, priv, &rzg2l_mod_clock_mstop_fops);
>   	return 0;
>   }
>   
> +static int rzg2l_cpg_suspend(struct device *dev)
> +{
> +	struct rzg2l_cpg_priv *priv = dev_get_drvdata(dev);
> +
> +	/*
> +	 * Deassert DMA resets to route the serial IRQ to CPU for making
> +	 * serial IRQ available as wakeup source for s2idle.
> +	 */
> +	writel(CPG_RST_DMAC_DEASSERTED_ALL, priv->base + CPG_RST_DMAC);

Instead of this, you can mark these resets as critical from the SoC specific 
drivers and based on that, don't ever assert them in __rzg2l_cpg_assert(), to 
avoid any potential window when this can be asserted by the user and then 
de-asserted back here.

> +	return 0;
> +}
> +
>   static int rzg2l_cpg_resume(struct device *dev)
>   {
>   	struct rzg2l_cpg_priv *priv = dev_get_drvdata(dev);
>   
>   	rzg2l_mod_clock_init_mstop(priv);
>   
> +	/*
> +	 * Deassert DMA resets and enable clk to route serial IRQ to CPU for
> +	 * serial console during wakeup from s2ram as the SoC is in DDR
> +	 * retention mode.
> +	 */
> +	writel(CPG_CLKON_DMAC_REG_ACLK_ON, priv->base + CPG_CLKON_DMAC_REG);

This need to be set before MSTOP to follow the MSTOP and clock configuration 
sequence described in the HW manual (section 42.2.2. in RZ/G2L HW manual, rev.1.30).

Thank you,
Claudiu
