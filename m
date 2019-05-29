Return-Path: <SRS0=s3ie=T5=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38916C28CC0
	for <linux-clk@archiver.kernel.org>; Wed, 29 May 2019 13:27:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0154C205ED
	for <linux-clk@archiver.kernel.org>; Wed, 29 May 2019 13:27:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f7wlgllN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726921AbfE2N1V (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 29 May 2019 09:27:21 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:43085 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726104AbfE2N1V (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 29 May 2019 09:27:21 -0400
Received: by mail-lf1-f68.google.com with SMTP id u27so2049860lfg.10;
        Wed, 29 May 2019 06:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=+/2WSWJF0nzKdfRfipKKpaoRbkteTbzPHcN6l0Js1K8=;
        b=f7wlgllNtj1vYHdNor850nqU07pRTXnixaxigG5xlmWmMku0jRD20CC8xWv08ljITD
         vc0TGQTVFKu+Ax+BnW519KXabMgmo7b6aKsbN/b30Fkdj+87oC/vQyXzBx1xHZGNjMze
         0xFvZjHjXfHXzB/39wNNmRv8+bgVaZ4MkR1GajiMRrqi7y1lPPlD7rupJOj6aTQjlxJC
         p5dFWgXg4+akaFz4gdipt/X0E1CDzPns08D+AV2WtSMJBrn+O/E9EKgTa/OJ3/dUOTCr
         LF1NIKE/hnM90Lqkus41UcaLvjPHdePlBlIFjJA+vT0IibmoOt9HSfzqOsjdhHY0mKp+
         U3tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+/2WSWJF0nzKdfRfipKKpaoRbkteTbzPHcN6l0Js1K8=;
        b=mkIEdqHNp+wgbA7s9z6PtQv2RuR1QI2YVZhW14j2UZUL6VS+c6B+GwRILnRSDjDZ8h
         RFomyg/QYe7zYC3gMj47HmGbUwh0O8wjAVmkNwXcQTQHhgDqS2mNVSgqC/q2rlO1iEEN
         Q5hLEY0FIt4I99mJGIzg5UBa1FfnTlCqkbOUFFNht7ATDbFTPxjdLM3YIb9D6VKXJMYt
         YkXt+7hzdC6tKAXt4bOhhOMUQb/SjGC9bO+lv0dek4Q6vXefYw7a1S08tyN6ox/Rdf+z
         09GQQK/+40LJIgDSGPhQvhysgfpOi138ycHB6mKOO+cX9lvHtzwsl0rIZcDvbD2Qq1Bf
         o6xA==
X-Gm-Message-State: APjAAAUqDjrrRXV22gIwQ6TdFSnWUppb1GdpSpgHPLuG4GXlK83Nlhfs
        4p4Pqxt91sSd+MB5vrCn+NA=
X-Google-Smtp-Source: APXvYqz8uqI/qSC/gbneI5jMj9NJAf0lIFSnzqF6Ju7MAMzxNLGpvxcenmxIHDwf7QcBbkImYqbZFg==
X-Received: by 2002:a19:7110:: with SMTP id m16mr3037749lfc.4.1559136437992;
        Wed, 29 May 2019 06:27:17 -0700 (PDT)
Received: from [192.168.2.145] ([94.29.35.141])
        by smtp.googlemail.com with ESMTPSA id q65sm3566520lje.42.2019.05.29.06.27.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 May 2019 06:27:17 -0700 (PDT)
Subject: Re: [PATCH V4 4/8] memory: tegra: Add Tegra210 EMC clock driver
To:     Joseph Lo <josephl@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20190529082139.5581-1-josephl@nvidia.com>
 <20190529082139.5581-5-josephl@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <403181d4-100b-679e-b1d8-c052c6d1f3ac@gmail.com>
Date:   Wed, 29 May 2019 16:26:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190529082139.5581-5-josephl@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

29.05.2019 11:21, Joseph Lo пишет:
> This is the initial patch for Tegra210 EMC clock driver, which doesn't
> include the support code and detail sequence for clock scaling yet.
> 
> The driver is designed to support LPDDR4 SDRAM. Because of the LPDDR4
> devices need to do initial time training before it can be used, the
> firmware will help to do that at early boot stage. Then, the trained
> table of the rates we support will pass to the kernel via DT. So the
> driver can get the trained table for clock scaling support.
> 
> For the higher rate support (above 800MHz), the periodic training is
> needed for the timing compensation. So basically, two methodologies for
> clock scaling are supported, one is following the clock changing
> sequence to update the EMC table to EMC registers and another is if the
> rate needs periodic training, then we will start a timer to do that
> periodically until it scales to the lower rate.
> 
> Based on the work of Peter De Schrijver <pdeschrijver@nvidia.com>.
> 
> Signed-off-by: Joseph Lo <josephl@nvidia.com>
> ---
> v4:
> - remove the statistic data in debugfs
> - add tegra210_clk_register_emc API to make it compatible with the case
>   if the kernel still uses the older DTB which doesn't have EMC node.
>   And the MC and EMC clock can still be registered successfully.
> v3:
> - address almost all the comments from the previous version
> - remove the DT parser of EMC table
> - The EMC table is passing as a binary blob now.
> ---
>  drivers/memory/tegra/Kconfig        |  10 +
>  drivers/memory/tegra/Makefile       |   1 +
>  drivers/memory/tegra/tegra210-emc.c | 671 ++++++++++++++++++++++++++++
>  drivers/memory/tegra/tegra210-emc.h | 156 +++++++
>  include/soc/tegra/emc.h             |   2 +
>  5 files changed, 840 insertions(+)
>  create mode 100644 drivers/memory/tegra/tegra210-emc.c
>  create mode 100644 drivers/memory/tegra/tegra210-emc.h
> 
> diff --git a/drivers/memory/tegra/Kconfig b/drivers/memory/tegra/Kconfig
> index 4680124ddcab..9d051bcdbee3 100644
> --- a/drivers/memory/tegra/Kconfig
> +++ b/drivers/memory/tegra/Kconfig
> @@ -26,3 +26,13 @@ config TEGRA124_EMC
>  	  Tegra124 chips. The EMC controls the external DRAM on the board.
>  	  This driver is required to change memory timings / clock rate for
>  	  external memory.
> +
> +config TEGRA210_EMC
> +	bool "NVIDIA Tegra210 External Memory Controller driver"
> +	default y

This is not enough since you're leaving possibility to disable
compilation of the driver, but the compilation will fail because of the
unresolved symbol (tegra210_clk_register_emc).

> +	depends on TEGRA_MC && ARCH_TEGRA_210_SOC
> +	help
> +	  This driver is for the External Memory Controller (EMC) found on
> +	  Tegra210 chips. The EMC controls the external DRAM on the board.
> +	  This driver is required to change memory timings / clock rate for
> +	  external memory.

Either TEGRA210_EMC Kconfig option shall be always force-selected for
T210 or you should move all the clk-related code into drivers/clk/tegra/.

Could you please give a rationale for having EMC clock code within the
EMC driver?

[snip]

> +static int tegra210_emc_probe(struct platform_device *pdev)
> +{
> +	int i;
> +	unsigned long table_rate;
> +	unsigned long current_rate;
> +	struct clk *emc_clk;
> +	struct device_node *np;
> +	struct platform_device *mc;
> +	struct resource res;
> +	struct tegra_emc *emc;
> +	void *table_addr;
> +
> +	emc_clk = devm_clk_get(&pdev->dev, "emc");
> +	if (IS_ERR(emc_clk))
> +		return PTR_ERR(emc_clk);

Please add newline in a such places in the code to make it more readable.

> +	emc = clk_hw_to_emc(__clk_get_hw(emc_clk));
> +
> +	np = of_parse_phandle(pdev->dev.of_node, "nvidia,memory-controller", 0);
> +	if (!np) {
> +		dev_err(&pdev->dev, "could not get memory controller\n");
> +		return -ENOENT;
> +	}
> +
> +	mc = of_find_device_by_node(np);
> +	of_node_put(np);
> +	if (!mc)
> +		return -ENOENT;
> +
> +	emc->mc = platform_get_drvdata(mc);
> +	if (!emc->mc)
> +		return -EPROBE_DEFER;
> +
> +	emc->emc_base[REG_EMC] = devm_platform_ioremap_resource(pdev, 0);
> +	emc->emc_base[REG_EMC0] = devm_platform_ioremap_resource(pdev, 1);
> +	emc->emc_base[REG_EMC1] = devm_platform_ioremap_resource(pdev, 2);
> +
> +	for (i = 0; i < TEGRA_EMC_SRC_COUNT; i++) {
> +		if (!IS_ERR(emc_src[i]))
> +			clk_put(emc_src[i]);
> +
> +		emc_src[i] = devm_clk_get(&pdev->dev, emc_src_names[i]);
> +		if (IS_ERR(emc_src[i])) {
> +			dev_err(&pdev->dev, "Can not find EMC source clock\n");
> +			return -ENODATA;
> +		}
> +	}
> +
> +	np = of_parse_phandle(pdev->dev.of_node, "memory-region", 0);
> +	if (!np) {
> +		dev_err(&pdev->dev, "could not find EMC table\n");
> +		return -ENODATA;
> +	}
> +
> +	if (!of_device_is_compatible(np, "nvidia,tegra210-emc-table") ||
> +	    !of_device_is_available(np)) {
> +		dev_err(&pdev->dev, "EMC table is invalid\n");
> +		return -ENODATA;
> +	}
> +
> +	of_address_to_resource(np, 0, &res);
> +	table_addr = memremap(res.start, resource_size(&res), MEMREMAP_WB);
> +	of_node_put(np);
> +	if (!table_addr) {
> +		dev_err(&pdev->dev, "could not map EMC table\n");
> +		return -ENOMEM;
> +	}
> +	emc->emc_table = (struct emc_table *)table_addr;

There is no need to cast a void. Please make sure that you don't have
any non-upstream patches applied that are changing compiler flags, also
make sure that you're using proper compiler (GCC) if you're getting a
warning here.

> +
> +	for (i = 0; i < TEGRA_EMC_MAX_FREQS; i++)
> +		if (emc->emc_table[i].rev != 0)
> +			emc->emc_table_size++;
> +		else
> +			break;
> +
> +	/* check the supported sequence */
> +	while (seq->table_rev) {
> +		if (seq->table_rev == emc->emc_table[0].rev)
> +			break;
> +		seq++;
> +	}
> +	if (!seq->set_clock) {
> +		seq = NULL;
> +		dev_err(&pdev->dev, "Invalid EMC sequence for table Rev. %d\n",
> +			emc->emc_table[0].rev);
> +		return -ENODATA;
> +	}
> +
> +	emc_clk_sel = devm_kcalloc(&pdev->dev,
> +				   emc->emc_table_size,
> +				   sizeof(struct emc_sel),
> +				   GFP_KERNEL);
> +
> +	/* calculate the rate from source clock */
> +	current_rate = emc_get_src_clk_rate() / 1000;
> +
> +	/* validate the table */
> +	for (i = 0; i < emc->emc_table_size; i++) {
> +		table_rate = emc->emc_table[i].rate;
> +		if (!table_rate)
> +			continue;
> +
> +		if (i && ((table_rate <= emc->emc_table[i-1].rate) ||
> +		   (emc->emc_table[i].min_volt <
> +		    emc->emc_table[i-1].min_volt)))
> +			continue;
> +
> +		if (emc->emc_table[i].rev != emc->emc_table[0].rev)
> +			continue;
> +
> +		if (find_matching_input(&emc->emc_table[i], &emc_clk_sel[i]))
> +			continue;
> +
> +		if (table_rate == current_rate)
> +			emc->current_timing = &emc->emc_table[i];
> +	}

I'm suggesting to factor out all the validations into a separate
function for clarity.

-- 
Dmitry
