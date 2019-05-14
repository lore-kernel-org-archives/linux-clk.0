Return-Path: <SRS0=Uhbp=TO=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7BCAC04AB4
	for <linux-clk@archiver.kernel.org>; Tue, 14 May 2019 17:04:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8ABD120862
	for <linux-clk@archiver.kernel.org>; Tue, 14 May 2019 17:04:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pIzl+dGW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726638AbfENRE4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 14 May 2019 13:04:56 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:43046 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726622AbfENRE4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 14 May 2019 13:04:56 -0400
Received: by mail-pg1-f193.google.com with SMTP id t22so8924881pgi.10;
        Tue, 14 May 2019 10:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=6qyTbtX00jJkaKvcEeyt6DaUNQBAW+C2V91ibbK+07c=;
        b=pIzl+dGWEVetUKdSSf7V8WX/1HmmaLI20y97fW7tkjVbcbGmyoglkXhhIwdeBBMDvY
         kb4oiDQARgWhe1X4gg1kYu29m4WAwz08XVffD+jvZRSPiHH2LLTjeNCrFM6derOsflxT
         KH9jzvQeTphhbz2T2FHJ8XivQGdg1oLZlHTu4RJTyLIwDBFvTzIZzEyZMZyHrMufmu+8
         JFPeV1x9c/C3VwwuploSx7V7cLVRGIxyT/9k+dR93LB5iEX7IRLM4zf1in7IhOu+xmTF
         AXkXWWfJnmgpeQDrhkni5+BWnWG6dj2aIqzA03WMdPNEeyVNumqVzykJSwTja41SgjCz
         gJFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6qyTbtX00jJkaKvcEeyt6DaUNQBAW+C2V91ibbK+07c=;
        b=L//h45gJYHfaHvCVFYT1WIknXPYq0S4nZcpIqtAHOaoOyYj/rWf5Ew/HcYHRhP4reP
         UrbGU9jifXazAXmzIoFeU3jOF4jMjnL4f9qf+nzQxjg2GmKB2YYfIN3BGIYwsWVah9Xu
         y0g6YGm2jLb8K5YDswOxZ515F2JA6KGDc3m576uUrRAFETmv8rrSHkHm1SdxeyHrzmDs
         SYpnaQIsxh70qAYrB58HUQm5xNeTZaclqt+kytLdPcncHInGgOLzRwlwXQMwM4ZKVGHb
         H7KTuq7liucGEabDOEI505bk6c61iZ/VBepgNJlcKawhkEIFykj9Eoq11A1hHZac1xTF
         APsw==
X-Gm-Message-State: APjAAAX35zU/w0N5CVNQ6HPq6x7hF82If/UTWjjZdDMINni6YJfxhB9o
        yn76/RYh5yfSPvK9JMyKwOI=
X-Google-Smtp-Source: APXvYqx+9/SFt10AYj6o9OFmKb078xpVvM1S13Kgzeo+rpmpvm+BPzMHfBsubEYFLjxiLyH1vvbOlQ==
X-Received: by 2002:a63:1b65:: with SMTP id b37mr39525909pgm.408.1557853494921;
        Tue, 14 May 2019 10:04:54 -0700 (PDT)
Received: from [192.168.2.145] (ppp94-29-35-107.pppoe.spdop.ru. [94.29.35.107])
        by smtp.googlemail.com with ESMTPSA id q27sm14998201pfg.49.2019.05.14.10.04.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 14 May 2019 10:04:54 -0700 (PDT)
Subject: Re: [PATCH V3 4/8] memory: tegra: Add Tegra210 EMC clock driver
To:     Joseph Lo <josephl@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20190510084719.18902-1-josephl@nvidia.com>
 <20190510084719.18902-5-josephl@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <74fad66b-a6e9-ffc9-c1c9-e88b841e9209@gmail.com>
Date:   Tue, 14 May 2019 20:04:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190510084719.18902-5-josephl@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

10.05.2019 11:47, Joseph Lo пишет:
> This is the initial patch for Tegra210 EMC clock driver, which doesn't
> include the support code and detail sequence for clock scaling yet.
> 
> The driver is designed to support LPDDR4 SDRAM. Because of the LPDDR4
> devices need to do initial time training before it can be used, the
> firmware will help to do that at early boot stage. Then, the trained
> table for the rates we support will pass to the kernel via DT. So the
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

[snip]

> +static int tegra210_emc_probe(struct platform_device *pdev)
> +{
> +	int i;
> +	unsigned long table_rate;
> +	unsigned long current_rate;
> +	struct device_node *np;
> +	struct platform_device *mc;
> +	struct tegra_emc *emc;
> +	struct clk_init_data init;
> +	struct clk *clk;
> +	struct resource *r, res;
> +	void *table_addr;
> +
> +	emc = devm_kzalloc(&pdev->dev, sizeof(*emc), GFP_KERNEL);
> +	if (!emc)
> +		return -ENOMEM;
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
> +	emc->ram_code = tegra_read_ram_code();

emc->ram_code isn't used anywhere in the code.

I haven't checked other fields. Please remove everything that is unused.

> +	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	emc->emc_base[REG_EMC] = devm_ioremap_resource(&pdev->dev, r);
> +	r = platform_get_resource(pdev, IORESOURCE_MEM, 1);
> +	emc->emc_base[REG_EMC0] = devm_ioremap_resource(&pdev->dev, r);
> +	r = platform_get_resource(pdev, IORESOURCE_MEM, 2);
> +	emc->emc_base[REG_EMC1] = devm_ioremap_resource(&pdev->dev, r);

Use devm_platform_ioremap_resource().

> +	for (i = 0; i < TEGRA_EMC_SRC_COUNT; i++) {
> +		emc_src[i] = devm_clk_get(&pdev->dev,
> +						emc_src_names[i]);
> +		if (IS_ERR(emc_src[i])) {
> +			dev_err(&pdev->dev, "Can not find EMC source clock\n");
> +			return -ENODATA;
> +		}
> +	}
> +
> +	np = of_parse_phandle(pdev->dev.of_node, "memory-region", 0);
> +	if (!np) {
> +		dev_err(&pdev->dev, "could not find EMC table\n");
> +		goto emc_clk_register;
> +	}
> +
> +	if (!of_device_is_compatible(np, "nvidia,tegra210-emc-table") ||
> +	    !of_device_is_available(np)) {
> +		dev_err(&pdev->dev, "EMC table is invalid\n");
> +		goto emc_clk_register;
> +	}
> +
> +	of_address_to_resource(np, 0, &res);
> +	table_addr = memremap(res.start, resource_size(&res), MEMREMAP_WB);
> +	of_node_put(np);
> +	if (!table_addr) {
> +		dev_err(&pdev->dev, "could not map EMC table\n");
> +		goto emc_clk_register;
> +	}
> +	emc->emc_table = (struct emc_table *)table_addr;
> +
> +	for (i = 0; i < TEGRA_EMC_MAX_FREQS; i++)
> +		if (emc->emc_table[i].rev != 0)
> +			emc->emc_table_size++;
> +		else
> +			break;
> +
> +	/* Init EMC rate statistic data */
> +	emc_stats.clkchange_count = 0;
> +	spin_lock_init(&emc_stats.spinlock);
> +	emc_stats.last_update = get_jiffies_64();
> +	emc_stats.last_sel = TEGRA_EMC_MAX_FREQS;
> +
> +	/* Check the supported sequence */
> +	while (seq->table_rev) {
> +		if (seq->table_rev == emc->emc_table[0].rev)
> +			break;
> +		seq++;
> +	}
> +	if (!seq->set_clock) {
> +		seq = NULL;
> +		dev_err(&pdev->dev, "Invalid EMC sequence for table Rev. %d\n",
> +			emc->emc_table[0].rev);
> +		goto emc_clk_register;

Why do you want to register EMC clock if something fails? KMSG will be
flooded with errors coming from clk_set_rate.

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

Please be consistent and start all of the one-line comments with a
lowercase letter.

-- 
Dmitry
