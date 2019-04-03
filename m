Return-Path: <SRS0=fESv=SF=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0941CC4360F
	for <linux-clk@archiver.kernel.org>; Wed,  3 Apr 2019 15:30:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BEA68206DD
	for <linux-clk@archiver.kernel.org>; Wed,  3 Apr 2019 15:30:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726099AbfDCPaw (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 3 Apr 2019 11:30:52 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:33852 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726084AbfDCPaw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 3 Apr 2019 11:30:52 -0400
Received: by mail-ed1-f68.google.com with SMTP id x14so15327726eds.1
        for <linux-clk@vger.kernel.org>; Wed, 03 Apr 2019 08:30:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=u7fqSiZnbOkbB/D4NXg1Bs5hY9Hu1+HzFaL0oZ0r6AU=;
        b=QFx8Y1d7H9DpUXIofC1nJ17YJd9a2PVtMODl1QU/H7Ajz8sGiyXszBjqaGf4woTCVj
         TGsg6DLQhKEMB3wbPD9Cj1FWVxJtFC5h01deIlJpWAsQp3tGUiTkhD++ks/38uhcYMuo
         JvC7uBAE6Gejye9tdvVa4acO7IxvEoR35kECCbi2+bCqNPY9j0DiyGWGJitT7x1zQ+ks
         7edPgfRaeEEqHVHiaUIdyDvDulE+p1D566WjhMwvmyztoO4MkaSbfwB2U5Qqq3Pw9qk9
         BFx3H1LoLQM8czp3jG4RIfQMg9qQcSVeWHKCbOlgNzeUOVp8GZzLUYdLgeYuNiBN0biZ
         ELbg==
X-Gm-Message-State: APjAAAVIeQSj3kHFVjGRF9tdplshKXwRLxmqie0Fgsh+7FI/2i7iQEJj
        pWd4JcljCvAbHIJsJoe/ku5s+kbK3zA=
X-Google-Smtp-Source: APXvYqzoeLu2skl96ze9V3TI+MWAx5fnGfea5ersWcIdV4H5Gf/2z1vcr+WdTW2cdSNU7m4VGY2yfQ==
X-Received: by 2002:a50:b113:: with SMTP id k19mr167661edd.31.1554305450072;
        Wed, 03 Apr 2019 08:30:50 -0700 (PDT)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl. [84.106.84.65])
        by smtp.gmail.com with ESMTPSA id k8sm4934579edr.85.2019.04.03.08.30.48
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Apr 2019 08:30:49 -0700 (PDT)
Subject: Re: [PATCH v2] clk: x86: Add system specific quirk to mark clocks as
 critical
To:     =?UTF-8?Q?David_M=c3=bcller?= <dave.mueller@gmx.ch>,
        linux-clk@vger.kernel.org
Cc:     platform-driver-x86@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>
References: <20190328124939.23139-1-dave.mueller@gmx.ch>
 <20190403140857.1130-1-dave.mueller@gmx.ch>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <ed8c07ff-5719-9179-424c-13b0891605f7@redhat.com>
Date:   Wed, 3 Apr 2019 17:30:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190403140857.1130-1-dave.mueller@gmx.ch>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi David,

Thank you for v2 of your patch, I'm afraid there is a small but nasty
bug in there, so we are going to need a v3, see comments inline.

(this might be something which existed in v1 and I missed, sorry)

On 03-04-19 16:08, David Müller wrote:
> Since commit 648e921888ad ("clk: x86: Stop marking clocks as
> CLK_IS_CRITICAL"), the pmc_plt_clocks of the Bay Trail SoC are
> unconditionally gated off. Unfortunately this will break systems where these
> clocks are used for external purposes beyond the kernel's knowledge. Fix it
> by implementing a system specific quirk to mark the necessary pmc_plt_clks as
> critical.
> 
> Fixes: 648e921888ad ("clk: x86: Stop marking clocks as CLK_IS_CRITICAL")
> Signed-off-by: David Müller <dave.mueller@gmx.ch>
> ---
> Changes in v2:
> - restore previous clk detection logic as suggested by Hans de Goede
> 
>   drivers/clk/x86/clk-pmc-atom.c                | 14 ++++++++++---
>   drivers/platform/x86/pmc_atom.c               | 20 +++++++++++++++++++
>   .../linux/platform_data/x86/clk-pmc-atom.h    |  7 +++++--
>   3 files changed, 36 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/clk/x86/clk-pmc-atom.c b/drivers/clk/x86/clk-pmc-atom.c
> index d977193842df..e909720cc2e3 100644
> --- a/drivers/clk/x86/clk-pmc-atom.c
> +++ b/drivers/clk/x86/clk-pmc-atom.c
> @@ -165,7 +165,7 @@ static const struct clk_ops plt_clk_ops = {
>   };
> 
>   static struct clk_plt *plt_clk_register(struct platform_device *pdev, int id,
> -					void __iomem *base,
> +					const struct pmc_clk_data *pmc_data,
>   					const char **parent_names,
>   					int num_parents)
>   {
> @@ -184,9 +184,17 @@ static struct clk_plt *plt_clk_register(struct platform_device *pdev, int id,
>   	init.num_parents = num_parents;
> 
>   	pclk->hw.init = &init;
> -	pclk->reg = base + PMC_CLK_CTL_OFFSET + id * PMC_CLK_CTL_SIZE;
> +	pclk->reg = pmc_data->base + PMC_CLK_CTL_OFFSET + id * PMC_CLK_CTL_SIZE;
>   	spin_lock_init(&pclk->lock);
> 
> +	/*
> +	 * On some systems, the pmc_plt_clocks already enabled by the
> +	 * firmware are being marked as critical to avoid them being
> +	 * gated by the clock framework
> +	 */
> +	if (pmc_data->chk_critclks && plt_clk_is_enabled(&pclk->hw))
> +		init.flags |= CLK_IS_CRITICAL;
> +
>   	ret = devm_clk_hw_register(&pdev->dev, &pclk->hw);
>   	if (ret) {
>   		pclk = ERR_PTR(ret);
> @@ -332,7 +340,7 @@ static int plt_clk_probe(struct platform_device *pdev)
>   		return PTR_ERR(parent_names);
> 
>   	for (i = 0; i < PMC_CLK_NUM; i++) {
> -		data->clks[i] = plt_clk_register(pdev, i, pmc_data->base,
> +		data->clks[i] = plt_clk_register(pdev, i, pmc_data,
>   						 parent_names, data->nparents);
>   		if (IS_ERR(data->clks[i])) {
>   			err = PTR_ERR(data->clks[i]);
> diff --git a/drivers/platform/x86/pmc_atom.c b/drivers/platform/x86/pmc_atom.c
> index 8f018b3f3cd4..559b2fdf1419 100644
> --- a/drivers/platform/x86/pmc_atom.c
> +++ b/drivers/platform/x86/pmc_atom.c
> @@ -17,6 +17,7 @@
> 
>   #include <linux/debugfs.h>
>   #include <linux/device.h>
> +#include <linux/dmi.h>
>   #include <linux/init.h>
>   #include <linux/io.h>
>   #include <linux/platform_data/x86/clk-pmc-atom.h>
> @@ -391,11 +392,26 @@ static int pmc_dbgfs_register(struct pmc_dev *pmc)
>   }
>   #endif /* CONFIG_DEBUG_FS */
> 
> +/*
> + * Some systems need one or more of their pmc_plt_clks to be
> + * marked as critical
> + */
> +static const struct dmi_system_id critclk_systems[] __initconst = {
> +	{
> +		.ident = "MPL CEC1x",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "MPL AG"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "CEC10 Family"),
> +		},
> +	},

You need an empty terminating entry here, otherwise the dmi functions
will keep walking the array, so you need to add:

	{}

here.

> +};
> +
>   static int pmc_setup_clks(struct pci_dev *pdev, void __iomem *pmc_regmap,
>   			  const struct pmc_data *pmc_data)
>   {
>   	struct platform_device *clkdev;
>   	struct pmc_clk_data *clk_data;
> +	const struct dmi_system_id *d = dmi_first_match(critclk_systems);
> 
>   	clk_data = kzalloc(sizeof(*clk_data), GFP_KERNEL);
>   	if (!clk_data)
> @@ -403,6 +419,10 @@ static int pmc_setup_clks(struct pci_dev *pdev, void __iomem *pmc_regmap,
> 
>   	clk_data->base = pmc_regmap; /* offset is added by client */
>   	clk_data->clks = pmc_data->clks;
> +	if (d) {
> +		clk_data->chk_critclks = true;
> +		pr_info("%s critclks quirk enabled\n", d->ident);
> +	}
> 
>   	clkdev = platform_device_register_data(&pdev->dev, "clk-pmc-atom",
>   					       PLATFORM_DEVID_NONE,

Normally I would be fine with your choice to use dmi_first_match(), but since
you need to respin anyway, can you change this to:

	if (dmi_check_system(critclk_systems)) {
		clk_data->chk_critclks = true;
		pr_info("%s critclks quirk enabled\n", d->ident);
	}

That will allow you to drop the 'd' variable declaration all together and is
somewhat cleaner IMHO.

Regards,

Hans




> diff --git a/include/linux/platform_data/x86/clk-pmc-atom.h b/include/linux/platform_data/x86/clk-pmc-atom.h
> index 3ab892208343..497575a42353 100644
> --- a/include/linux/platform_data/x86/clk-pmc-atom.h
> +++ b/include/linux/platform_data/x86/clk-pmc-atom.h
> @@ -33,12 +33,15 @@ struct pmc_clk {
>   /**
>    * struct pmc_clk_data - common PMC clock configuration
>    *
> - * @base:	PMC clock register base offset
> - * @clks:	pointer to set of registered clocks, typically 0..5
> + * @base:		PMC clock register base offset
> + * @clks:		pointer to set of registered clocks, typically 0..5
> + * @chk_critclks:	flag to indicate if firmware enabled pmc_plt_clks
> + *			should be marked as critial or not
>    */
>   struct pmc_clk_data {
>   	void __iomem *base;
>   	const struct pmc_clk *clks;
> +	bool chk_critclks;
>   };
> 
>   #endif /* __PLATFORM_DATA_X86_CLK_PMC_ATOM_H */
> --
> 2.20.1
> 
