Return-Path: <SRS0=g5s0=TP=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA926C04E53
	for <linux-clk@archiver.kernel.org>; Wed, 15 May 2019 15:25:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 80A6220873
	for <linux-clk@archiver.kernel.org>; Wed, 15 May 2019 15:25:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZvsXAHJ6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726501AbfEOPZc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 15 May 2019 11:25:32 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:39968 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726911AbfEOPZa (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 15 May 2019 11:25:30 -0400
Received: by mail-lj1-f193.google.com with SMTP id d15so163243ljc.7;
        Wed, 15 May 2019 08:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=sMlLgcaq1xxBQl224h03ntyiIbH0fac9zIQagoD0aes=;
        b=ZvsXAHJ6P6t134KzxqTxYWXhCsOYmI+kz5z+9y6cVPf46RpGpYXkd+fdwvTGXk0QQR
         mrLViIokJ8dHiddQMyqEJ1W5gbLqkHZqcoxlg22Q/fDdb8/mTIr9j0oG3uZ8O9hzHKM+
         99KcmLbejkJowrOqzx9fV/hJrc8SJRjzYPHubtX7CJ8kkE+r99OJv4DdH1xuAGPq3C1o
         KJ9ybYMoWNQEOVRWPtjHlj9UwkzHKFXgvYHoQ4xazgw+uSspHHVzlqMzXqYyEG/6Kibd
         i0MFL9XRQ10RdLmWoqr8VgJb2C9VCHMbGob7k7JsE72uX7MI4GlEbUMBnnnskudJ2JEn
         qs0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=sMlLgcaq1xxBQl224h03ntyiIbH0fac9zIQagoD0aes=;
        b=C79NGCq6FQex34Dbw7z5a9lieCO3+kldrdm5fcCoZmWUNDeqzv2vvAZd6mrnwYvqoD
         Ck0z+ZpUpY3VI5jn0zZrtW+muGtNaowphwawVKlR04PkIL397SLxIUBSjfpT0Ombf3Fa
         0rKLVgi60RefF51aGc0uxqKCbKuWpUNE6H069BrSMHLWThnwxWXayDs/6lySMcJIchXE
         MQjP01E0qlIAksUkyAIFa2TM90go0a96BqC1ZYJnCP1vadr4+S+IkD7tlSnCum8eLQN2
         KDUpCAHDMtKUv7octdhctHQRYG3H+o88ALLAvQk9oBVFdPRPAXyKHkK7HCdCUAJDEINd
         W75Q==
X-Gm-Message-State: APjAAAXOe0U7JhG9eKXKQYs7DBoiX4oHTptG2mmRFwrjEGDMfadigtdE
        XKYig629kbaq+VLgkHvIIRs=
X-Google-Smtp-Source: APXvYqzwg4JX00s0BS9VpSC/qUxP4nEv670beipyYVIkPmIKjNaIBlLisZTDx7/Zgkbd3wrugpVdJg==
X-Received: by 2002:a2e:41c:: with SMTP id 28mr18282233lje.69.1557933927043;
        Wed, 15 May 2019 08:25:27 -0700 (PDT)
Received: from [192.168.2.145] (ppp94-29-35-107.pppoe.spdop.ru. [94.29.35.107])
        by smtp.googlemail.com with ESMTPSA id v3sm434759lfi.44.2019.05.15.08.25.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 May 2019 08:25:26 -0700 (PDT)
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
 <74fad66b-a6e9-ffc9-c1c9-e88b841e9209@gmail.com>
 <648df201-eb63-6d26-3f90-02eba7624921@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <bb2ef045-7d77-02d0-79fb-06f68732c5a5@gmail.com>
Date:   Wed, 15 May 2019 18:25:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <648df201-eb63-6d26-3f90-02eba7624921@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

15.05.2019 11:42, Joseph Lo пишет:
> On 5/15/19 1:04 AM, Dmitry Osipenko wrote:
>> 10.05.2019 11:47, Joseph Lo пишет:
>>> This is the initial patch for Tegra210 EMC clock driver, which doesn't
>>> include the support code and detail sequence for clock scaling yet.
>>>
>>> The driver is designed to support LPDDR4 SDRAM. Because of the LPDDR4
>>> devices need to do initial time training before it can be used, the
>>> firmware will help to do that at early boot stage. Then, the trained
>>> table for the rates we support will pass to the kernel via DT. So the
>>> driver can get the trained table for clock scaling support.
>>>
>>> For the higher rate support (above 800MHz), the periodic training is
>>> needed for the timing compensation. So basically, two methodologies for
>>> clock scaling are supported, one is following the clock changing
>>> sequence to update the EMC table to EMC registers and another is if the
>>> rate needs periodic training, then we will start a timer to do that
>>> periodically until it scales to the lower rate.
>>>
>>> Based on the work of Peter De Schrijver <pdeschrijver@nvidia.com>.
>>>
>>> Signed-off-by: Joseph Lo <josephl@nvidia.com>
>>> ---
>>
>> [snip]
>>
>>> +static int tegra210_emc_probe(struct platform_device *pdev)
>>> +{
>>> +    int i;
>>> +    unsigned long table_rate;
>>> +    unsigned long current_rate;
>>> +    struct device_node *np;
>>> +    struct platform_device *mc;
>>> +    struct tegra_emc *emc;
>>> +    struct clk_init_data init;
>>> +    struct clk *clk;
>>> +    struct resource *r, res;
>>> +    void *table_addr;
>>> +
>>> +    emc = devm_kzalloc(&pdev->dev, sizeof(*emc), GFP_KERNEL);
>>> +    if (!emc)
>>> +        return -ENOMEM;
>>> +
>>> +    np = of_parse_phandle(pdev->dev.of_node,
>>> "nvidia,memory-controller", 0);
>>> +    if (!np) {
>>> +        dev_err(&pdev->dev, "could not get memory controller\n");
>>> +        return -ENOENT;
>>> +    }
>>> +
>>> +    mc = of_find_device_by_node(np);
>>> +    of_node_put(np);
>>> +    if (!mc)
>>> +        return -ENOENT;
>>> +
>>> +    emc->mc = platform_get_drvdata(mc);
>>> +    if (!emc->mc)
>>> +        return -EPROBE_DEFER;
>>> +
>>> +    emc->ram_code = tegra_read_ram_code();
>>
>> emc->ram_code isn't used anywhere in the code.
>>
>> I haven't checked other fields. Please remove everything that is unused.
> 
> Good catch, I missed this when clean up the code for V3.
> 
>>
>>> +    r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>>> +    emc->emc_base[REG_EMC] = devm_ioremap_resource(&pdev->dev, r);
>>> +    r = platform_get_resource(pdev, IORESOURCE_MEM, 1);
>>> +    emc->emc_base[REG_EMC0] = devm_ioremap_resource(&pdev->dev, r);
>>> +    r = platform_get_resource(pdev, IORESOURCE_MEM, 2);
>>> +    emc->emc_base[REG_EMC1] = devm_ioremap_resource(&pdev->dev, r);
>>
>> Use devm_platform_ioremap_resource().
>>
>>> +    for (i = 0; i < TEGRA_EMC_SRC_COUNT; i++) {
>>> +        emc_src[i] = devm_clk_get(&pdev->dev,
>>> +                        emc_src_names[i]);
>>> +        if (IS_ERR(emc_src[i])) {
>>> +            dev_err(&pdev->dev, "Can not find EMC source clock\n");
>>> +            return -ENODATA;
>>> +        }
>>> +    }
>>> +
>>> +    np = of_parse_phandle(pdev->dev.of_node, "memory-region", 0);
>>> +    if (!np) {
>>> +        dev_err(&pdev->dev, "could not find EMC table\n");
>>> +        goto emc_clk_register;
>>> +    }
>>> +
>>> +    if (!of_device_is_compatible(np, "nvidia,tegra210-emc-table") ||
>>> +        !of_device_is_available(np)) {
>>> +        dev_err(&pdev->dev, "EMC table is invalid\n");
>>> +        goto emc_clk_register;
>>> +    }
>>> +
>>> +    of_address_to_resource(np, 0, &res);
>>> +    table_addr = memremap(res.start, resource_size(&res), MEMREMAP_WB);
>>> +    of_node_put(np);
>>> +    if (!table_addr) {
>>> +        dev_err(&pdev->dev, "could not map EMC table\n");
>>> +        goto emc_clk_register;
>>> +    }
>>> +    emc->emc_table = (struct emc_table *)table_addr;
>>> +
>>> +    for (i = 0; i < TEGRA_EMC_MAX_FREQS; i++)
>>> +        if (emc->emc_table[i].rev != 0)
>>> +            emc->emc_table_size++;
>>> +        else
>>> +            break;
>>> +
>>> +    /* Init EMC rate statistic data */
>>> +    emc_stats.clkchange_count = 0;
>>> +    spin_lock_init(&emc_stats.spinlock);
>>> +    emc_stats.last_update = get_jiffies_64();
>>> +    emc_stats.last_sel = TEGRA_EMC_MAX_FREQS;
>>> +
>>> +    /* Check the supported sequence */
>>> +    while (seq->table_rev) {
>>> +        if (seq->table_rev == emc->emc_table[0].rev)
>>> +            break;
>>> +        seq++;
>>> +    }
>>> +    if (!seq->set_clock) {
>>> +        seq = NULL;
>>> +        dev_err(&pdev->dev, "Invalid EMC sequence for table Rev. %d\n",
>>> +            emc->emc_table[0].rev);
>>> +        goto emc_clk_register;
>>
>> Why do you want to register EMC clock if something fails? KMSG will be
>> flooded with errors coming from clk_set_rate.
>>
> 
> See patch 7 in the series, the legacy EMC clock will be removed later,
> so we need to register the EMC clock whether the table is ready or not> In that case, I mean if the table is not available, it will still
> register EMC clock at the rate that boot loader configured before kernel
> booting. So the MC clock can still work as expected, which is under EMC
> clock.
> 
> And I did test that, couldn't observe any KMSG in that case.

Looks like it kinda should work in the end.

Although it's not good that now MC driver relies on the EMC driver
presence. Maybe it's not the best variant with moving the clock stuff
into the EMC driver?

What about the backwards compatibility for DT that doesn't have the EMC
node?

What if EMC driver is disabled in the kernel's config?

And lastly.. what stops the MC driver to probe before the EMC? Looks
like MC driver is already in trouble because it's on arch level and the
EMC is on subsys, hence MC will get the orphaned clock and won't
initialize hardware properly on probe.

BTW, how are you testing the EMC driver? Is there T210 devfreq patches
in works? Or what's the user of the EMC on T210?
