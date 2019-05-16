Return-Path: <SRS0=duwI=TQ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF7CCC04AAF
	for <linux-clk@archiver.kernel.org>; Thu, 16 May 2019 14:30:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B7AE220848
	for <linux-clk@archiver.kernel.org>; Thu, 16 May 2019 14:30:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HgVWsfLY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726769AbfEPOaF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 16 May 2019 10:30:05 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:37486 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726687AbfEPOaF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 16 May 2019 10:30:05 -0400
Received: by mail-io1-f67.google.com with SMTP id u2so2753474ioc.4;
        Thu, 16 May 2019 07:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=zDMRXQtb1GSj4Gdjzq9mKRQfQ/q3AFfPO4hqQhSpupk=;
        b=HgVWsfLYSOmsqw13uMzbP7LHz5CALHc0sxb6AHROcFeXLV0h180syWKlcFt1mMcrFB
         5mOf0q3SPo2EI0vxUtCyeFo0NIc5ksqdd4NRsKbwEExe3nTaI8DDI3iMRFZTFKJbM3HV
         +6qm0s83uZEUepKHNO6jrbgNbBtzyPAAkjc2hEPRhC+h9EyIdMwRkohDjSQZbPU+WydW
         fNx69jsM1ztOIUZsKjPRRiHoFRHIw/hlgYGuDWTfY9q96LDImOs+8oCWqwx0iXbYNtsE
         ZyAXz9y4XKTl0eJKDZZI2xIl6eFQyMCydDvfeks7rB18aQ77YqJNe1v0zlQD44QMYJnb
         ks+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zDMRXQtb1GSj4Gdjzq9mKRQfQ/q3AFfPO4hqQhSpupk=;
        b=f9F17VKp6b1xAT3w49fvBsthHNbv0B0YK/qMirq/tC29GjynmG5zmT9EYHtD1hAzP9
         ugrxCMP6A8eUBReiVroUW3EQBOumElh6/mBX8mOaMwp0bd6C/zHm4DvoUg9z8suiR2JV
         AkRbqiRm6IoRJYUPso2LFgQFLF0oa1jJgLEgTlck8YaKOoWh1tJhCLaMMcYbmRICRVg2
         5TyP6ncQ7kUkNAbY3DizTGIhlXCaoSHfV8juBDTD2bNCfboQjSj8PgwFCs2cpJazcZsv
         B/RMr6BBkxM4eygV1QS/DOOPQ4boqSV3gKFi31+dLG7TwwpSuJkHJSURmagBpFN6wI63
         98Ig==
X-Gm-Message-State: APjAAAXp0LABVhuoowi6TYd/M9bPp4NOAGpd/HBVxz2xXH7JPgkTD62/
        sokpjCY7RDfeGBdTgIpCmrnjEOuP
X-Google-Smtp-Source: APXvYqwN1im0U/bG6ggXuVggmKCKF7ctL0YSpqZoE+5TkEO8LDPdDiHvHzFi5S+EZfDTaQMYFZjETw==
X-Received: by 2002:a6b:f00c:: with SMTP id w12mr1715986ioc.243.1558017003788;
        Thu, 16 May 2019 07:30:03 -0700 (PDT)
Received: from [192.168.2.145] (ppp94-29-35-107.pppoe.spdop.ru. [94.29.35.107])
        by smtp.googlemail.com with ESMTPSA id i7sm1641733iop.79.2019.05.16.07.30.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 16 May 2019 07:30:02 -0700 (PDT)
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
 <bb2ef045-7d77-02d0-79fb-06f68732c5a5@gmail.com>
 <3afd909c-5be9-370d-e21a-ec57be3b841b@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <25e11e09-fab5-4ba5-2612-6af068b21406@gmail.com>
Date:   Thu, 16 May 2019 17:29:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <3afd909c-5be9-370d-e21a-ec57be3b841b@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

16.05.2019 10:52, Joseph Lo пишет:
> On 5/15/19 11:25 PM, Dmitry Osipenko wrote:
>> 15.05.2019 11:42, Joseph Lo пишет:
>>> On 5/15/19 1:04 AM, Dmitry Osipenko wrote:
>>>> 10.05.2019 11:47, Joseph Lo пишет:
>>>>> This is the initial patch for Tegra210 EMC clock driver, which doesn't
>>>>> include the support code and detail sequence for clock scaling yet.
>>>>>
>>>>> The driver is designed to support LPDDR4 SDRAM. Because of the LPDDR4
>>>>> devices need to do initial time training before it can be used, the
>>>>> firmware will help to do that at early boot stage. Then, the trained
>>>>> table for the rates we support will pass to the kernel via DT. So the
>>>>> driver can get the trained table for clock scaling support.
>>>>>
>>>>> For the higher rate support (above 800MHz), the periodic training is
>>>>> needed for the timing compensation. So basically, two methodologies
>>>>> for
>>>>> clock scaling are supported, one is following the clock changing
>>>>> sequence to update the EMC table to EMC registers and another is if
>>>>> the
>>>>> rate needs periodic training, then we will start a timer to do that
>>>>> periodically until it scales to the lower rate.
>>>>>
>>>>> Based on the work of Peter De Schrijver <pdeschrijver@nvidia.com>.
>>>>>
>>>>> Signed-off-by: Joseph Lo <josephl@nvidia.com>
>>>>> ---
> snip.
>>>>> +    if (!seq->set_clock) {
>>>>> +        seq = NULL;
>>>>> +        dev_err(&pdev->dev, "Invalid EMC sequence for table Rev.
>>>>> %d\n",
>>>>> +            emc->emc_table[0].rev);
>>>>> +        goto emc_clk_register;
>>>>
>>>> Why do you want to register EMC clock if something fails? KMSG will be
>>>> flooded with errors coming from clk_set_rate.
>>>>
>>>
>>> See patch 7 in the series, the legacy EMC clock will be removed later,
>>> so we need to register the EMC clock whether the table is ready or
>>> not> In that case, I mean if the table is not available, it will still
>>> register EMC clock at the rate that boot loader configured before kernel
>>> booting. So the MC clock can still work as expected, which is under EMC
>>> clock.
>>>
>>> And I did test that, couldn't observe any KMSG in that case.
>>
>> Looks like it kinda should work in the end.
>>
>> Although it's not good that now MC driver relies on the EMC driver
>> presence. Maybe it's not the best variant with moving the clock stuff
>> into the EMC driver?
>>
>> What about the backwards compatibility for DT that doesn't have the EMC
>> node?
>>
>> What if EMC driver is disabled in the kernel's config?
> 
> The three questions above are actually one problem here. It's not about
> MC clock, because it's still available after these changes. And MC
> driver can still get it in the probe function even the EMC driver isn't
> there.

No, these are separate problems. MC driver queries the clock rate during
the probe to configure memory arbitration. In your case the clock rate
is always zero for MC.

> The problem is that without EMC driver after these changes. The PLLM
> will have no client under it, which will cause the PLLM to be disabled
> in the late init call of "clk_disable_unused". So the system will be stuck.

This and the above are very compelling reasons to *NOT* register the
clock from the EMC driver. You shall move all the clock stuff into the
clock driver. Please see T124 EMC driver and what is done for the
upcoming T30 EMC driver [1] for the example, borrow parts that fit best
for T210.

[1] https://patchwork.ozlabs.org/project/linux-tegra/list/?series=102688

>>
>> And lastly.. what stops the MC driver to probe before the EMC? Looks
>> like MC driver is already in trouble because it's on arch level and the
>> EMC is on subsys, hence MC will get the orphaned clock and won't
>> initialize hardware properly on probe.
> 
> After this moving, the EMC driver will be always enabled by default. And
> the DT change is necessary as well. The blob of EMC table is not
> necessary, because it needs a firmware update. We will update the
> firmware accordingly after the review settled and release it later.
> 
> In case of no EMC table blob, the driver can still be registered, but no
> scaling function provided.

Anyone could change the default kernel configuration. Kernel shall boot
and work fine with older device-tree's and any custom config after
update. You should not break someones established setup without a good
reason and you don't have one here.

>>
>> BTW, how are you testing the EMC driver? Is there T210 devfreq patches
>> in works? Or what's the user of the EMC on T210?
>>
> 
> 1. Currently, via debugfs.
> 2. No, we prefer to use Interconnect framework for that. The evaluation
> is ongoing.
> 3. With Interconnect, the devices or peripherals can register on it to
> request the BW. So we can fine-tune the BW requirements with the latency
> allowance registers altogether to get better efficiency.

Devfreq is the driver for the ACTMON hardware unit. This unit tells the
driver when memory clock rate need to go higher or lower, depending on
overall memory clients activity. Currently the tegra-devfreq driver
supports T124 only, it will support T30 starting with v5.3. AFAIK, it
shouldn't be difficult to add support for T210 as well.

IIRC, the new Interconnect API is another away of conveying different
requirements between devices. All Tegra's have knobs for memory
configuration tuning, but there is no real need to change the default
good-enough configuration for the time being in upstream.

AFAIK, there is only one memory client that is really very sensitive to
available memory bandwidth - Display Controller. The PM QoS memory
bandwidth API is more than enough for the easy start and it's all
internal to kernel, hence it will be possible to replace the PM API with
something more advanced later on by as-needed basis. That's what I'm
currently targeting for T20-T124. The PM QoS API could coexist with the
Interconnect API (or whatever else) without any troubles, so it won't be
a problem if you'll decide to pull into other direction for T210.

AFAIK, the latency allowance config should be similar on all Tegra's
starting from T30. Will be awesome if you'll do all the hard job of
bringing up the fresh new API for T210, it always easier to follow by
example.
