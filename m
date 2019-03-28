Return-Path: <SRS0=OKnm=R7=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA7AAC43381
	for <linux-clk@archiver.kernel.org>; Thu, 28 Mar 2019 14:53:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8D14E217F9
	for <linux-clk@archiver.kernel.org>; Thu, 28 Mar 2019 14:53:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726117AbfC1Ox2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 28 Mar 2019 10:53:28 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:33116 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726082AbfC1Ox2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 28 Mar 2019 10:53:28 -0400
Received: by mail-ed1-f68.google.com with SMTP id q3so17493468edg.0
        for <linux-clk@vger.kernel.org>; Thu, 28 Mar 2019 07:53:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qpiJiL5JGqH80iNVOx+om3udmU3f7Ht/4tHU19zCClA=;
        b=bPtqSxn14jJ7928bJnE4djcTWlZ1R+zUxkcT2VAXaa+Wu8xnO0FTqrQQi9/cq6e80s
         y3v2vI0NV64rwfgt6OYvxyVYYSoOYGcrXhotrOzJ4rfK+6ofufvYGRBIa8oabHymUROO
         QeXmPlDHTxUkvx+Xfg9I4UjBIjQJ80nTeNr2t8CXB5cVVnP1jM62A3EfrYtgbxLUEq8G
         7JXUOcTiXTaQDuk/byd4ayKqgc7P492EL3+isifvbs7DFoVwzRpohlmo+3rfWnHFOns1
         4dLwf51xGnxjGmU0A+XauUSZQG4xpI1qNHLA9nIyWq6GQMC1Yh1Szbb8qoIRYi08Di2o
         O7/w==
X-Gm-Message-State: APjAAAUWeVgWJef4bCiXeUZKVM35nUSK/RaGjkF5TZyDWEtI2E6sfSQM
        Xu3YdtqIho1uclxW+gkJf2th0Q==
X-Google-Smtp-Source: APXvYqxJxmxTLPY2+asPLKu/TWPZX2VLnfaqyJXv38yX1Ka7CAHWeezv2WrYMrHihTQVdg9CkQ33Ow==
X-Received: by 2002:a50:a59b:: with SMTP id a27mr28249890edc.3.1553784806473;
        Thu, 28 Mar 2019 07:53:26 -0700 (PDT)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl. [84.106.84.65])
        by smtp.gmail.com with ESMTPSA id w24sm8016988edb.72.2019.03.28.07.53.24
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Thu, 28 Mar 2019 07:53:25 -0700 (PDT)
Subject: Re: [PATCH] clk: x86: Add system specific quirk to mark clocks as
 critical
To:     =?UTF-8?Q?David_M=c3=bcller?= <dave.mueller@gmx.ch>,
        linux-clk@vger.kernel.org
Cc:     platform-driver-x86@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>
References: <20190328124939.23139-1-dave.mueller@gmx.ch>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <ad96925b-adde-e62a-76d0-8f91865a0814@redhat.com>
Date:   Thu, 28 Mar 2019 15:53:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.0
MIME-Version: 1.0
In-Reply-To: <20190328124939.23139-1-dave.mueller@gmx.ch>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi David,

On 28-03-19 13:49, David Müller wrote:
> Since commit 648e921888ad ("clk: x86: Stop marking clocks as
> CLK_IS_CRITICAL"), the pmc_plt_clocks of the Bay Trail SoC are
> unconditionally gated off. Unfortunately this will break systems
> where these clocks are used for external purposes beyond the kernel's
> knowledge.
> Fix it by implementing a system specific quirk to mark the necessary
> pmc_plt_clks as critical.

The original CLK_IS_CRITICAL patch marked all clocks as critical which
where enabled by the BIOS at boot time. I would prefer that approach
over the code the mask in the quirk method you are now using.

The reason for this is that for example on the embedded pc using 4
igb ethernet controllers we only know that marking the clocks enabled
at boot as CLK_IS_CRITICAL fixes things, we do not know without extra
debugging which clocks are involved.

We can spend some time on figuring this out, but this means that each
time we get a similar bug-report, where we decide a dmi quirk is the
best / only solution, we need to do this. I would prefer for the code
to figure it out itself as it did before.

Can you respin the patch to use the old method of looking at which
clocks are enabled by the BIOS? (note you may want to wait with
this till Andy and I have reached an agreement on how to solve this)

Regards,

Hans




> 
> Fixes: 648e921888ad ("clk: x86: Stop marking clocks as CLK_IS_CRITICAL")
> Signed-off-by: David Müller <dave.mueller@gmx.ch>
> ---
>   drivers/clk/x86/clk-pmc-atom.c                |  9 +++++---
>   drivers/platform/x86/pmc_atom.c               | 22 +++++++++++++++++++
>   .../linux/platform_data/x86/clk-pmc-atom.h    |  2 ++
>   3 files changed, 30 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/x86/clk-pmc-atom.c b/drivers/clk/x86/clk-pmc-atom.c
> index d977193842df..882ea0c4c050 100644
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
> @@ -183,8 +183,11 @@ static struct clk_plt *plt_clk_register(struct platform_device *pdev, int id,
>   	init.parent_names = parent_names;
>   	init.num_parents = num_parents;
> 
> +	if (test_bit(id, &pmc_data->critclk))
> +		init.flags |= CLK_IS_CRITICAL;
> +
>   	pclk->hw.init = &init;
> -	pclk->reg = base + PMC_CLK_CTL_OFFSET + id * PMC_CLK_CTL_SIZE;
> +	pclk->reg = pmc_data->base + PMC_CLK_CTL_OFFSET + id * PMC_CLK_CTL_SIZE;
>   	spin_lock_init(&pclk->lock);
> 
>   	ret = devm_clk_hw_register(&pdev->dev, &pclk->hw);
> @@ -332,7 +335,7 @@ static int plt_clk_probe(struct platform_device *pdev)
>   		return PTR_ERR(parent_names);
> 
>   	for (i = 0; i < PMC_CLK_NUM; i++) {
> -		data->clks[i] = plt_clk_register(pdev, i, pmc_data->base,
> +		data->clks[i] = plt_clk_register(pdev, i, pmc_data,
>   						 parent_names, data->nparents);
>   		if (IS_ERR(data->clks[i])) {
>   			err = PTR_ERR(data->clks[i]);
> diff --git a/drivers/platform/x86/pmc_atom.c b/drivers/platform/x86/pmc_atom.c
> index 8f018b3f3cd4..d25b2423afe0 100644
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
> @@ -391,11 +392,28 @@ static int pmc_dbgfs_register(struct pmc_dev *pmc)
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
> +		/* on this platform, pmc_plt_clk_0 is a critical clock */
> +		.driver_data = (void *)BIT(0),
> +	},
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
> @@ -403,6 +421,10 @@ static int pmc_setup_clks(struct pci_dev *pdev, void __iomem *pmc_regmap,
> 
>   	clk_data->base = pmc_regmap; /* offset is added by client */
>   	clk_data->clks = pmc_data->clks;
> +	if (d) {
> +		clk_data->critclk = (uintptr_t)d->driver_data;
> +		pr_info("%s critclk quirk enabled\n", d->ident);
> +	}
> 
>   	clkdev = platform_device_register_data(&pdev->dev, "clk-pmc-atom",
>   					       PLATFORM_DEVID_NONE,
> diff --git a/include/linux/platform_data/x86/clk-pmc-atom.h b/include/linux/platform_data/x86/clk-pmc-atom.h
> index 3ab892208343..8d00b6bd83b4 100644
> --- a/include/linux/platform_data/x86/clk-pmc-atom.h
> +++ b/include/linux/platform_data/x86/clk-pmc-atom.h
> @@ -35,10 +35,12 @@ struct pmc_clk {
>    *
>    * @base:	PMC clock register base offset
>    * @clks:	pointer to set of registered clocks, typically 0..5
> + * @clkcrit:	bit mask of pmc_plt_clks which are to be marked as critical
>    */
>   struct pmc_clk_data {
>   	void __iomem *base;
>   	const struct pmc_clk *clks;
> +	unsigned long critclk;
>   };
> 
>   #endif /* __PLATFORM_DATA_X86_CLK_PMC_ATOM_H */
> --
> 2.20.1
> 
