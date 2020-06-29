Return-Path: <SRS0=5xJ2=AK=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C0A8C433DF
	for <linux-clk@archiver.kernel.org>; Mon, 29 Jun 2020 18:43:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 06A42206C0
	for <linux-clk@archiver.kernel.org>; Mon, 29 Jun 2020 18:43:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=marek-ca.20150623.gappssmtp.com header.i=@marek-ca.20150623.gappssmtp.com header.b="USGV60Zz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727101AbgF2SnP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 29 Jun 2020 14:43:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729151AbgF2Smx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 29 Jun 2020 14:42:53 -0400
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com [IPv6:2607:f8b0:4864:20::741])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCE27C031C49
        for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2020 10:27:09 -0700 (PDT)
Received: by mail-qk1-x741.google.com with SMTP id j80so15999682qke.0
        for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2020 10:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=pqe14MaPsMfgtT/LBcuvaSN2cytXk1SleFgshIkTKVM=;
        b=USGV60ZzR1pxKQN2xImazAMTEN9Qly93rcztD+sYyGT3yq/2h+C2ZfM6tWNpO2TSuW
         sI+F0KtJIs/Rz04s9xPFkJ6DTpB5pPPAprIj3AnIMP4sEaqqcurmdjYTdABfIZZ40Awr
         ck9UYLevqJHyUS4oEHxtxwTJ6+9/xo1gykYlCpdGmF+khLkasVMr0e8eMjVr7eSur2Hl
         zCQK8g35HbE5WDa5bKhJmyaMG+KMygFxJkSi6qYWbZsQ3Cms7DeKU2Du8peGOUpdqvEH
         7h199ie9F89cNHIX9BXnlcW832fl9cx4Yo0HLEglG8PnZM5iD1OX6Sbr1P9Jnusg65cJ
         bQ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pqe14MaPsMfgtT/LBcuvaSN2cytXk1SleFgshIkTKVM=;
        b=a8Ylvd3al4HRl7yjDgr5KIS0N1Fn7VV0xApbwQFF/CWsBxLYnnZfQU4aGFBcsiCycT
         8+Ee/8BiArsX+oSRNyryKEODPOrg4EAwyJtrSMnE/nTRjBf9hlGsLRK2zFlvmzj12HpC
         HgIPmPu2vJF9Sn4/fdAu5bwY+M9WzP+KIYtiGPUyAQVzmE1txbGgKOCQYrepeIVeBDJN
         Wx9UZUYywU+iS8N2PO9cgpxnN7rpBMnFXc7dKEEs1vlP/F3czx6DZuuu44ggrbEsmGuu
         KM3kPdUCzvF268GIV3G9hii7qxHweyIhII6ZPIpj5lY4qzK3vtUNMNpxTqC74PeYGB2k
         MKLw==
X-Gm-Message-State: AOAM532+7JRCsIcQYDXp+Rkk+OhXMlm1ONjC4uCEqCIgFWhOgTwMhz7J
        b2TR+Jvzt339mlvehbRYpwqTaTAToxA=
X-Google-Smtp-Source: ABdhPJz6/7Q13mZzwNNVBWoMSVx5buOlaqi44+cTUPkY+oXRmbqWOckeIL2jAiQfaU3iBb439UfzvA==
X-Received: by 2002:a37:7741:: with SMTP id s62mr4110200qkc.263.1593451628633;
        Mon, 29 Jun 2020 10:27:08 -0700 (PDT)
Received: from [192.168.0.189] ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id x19sm372668qtc.36.2020.06.29.10.27.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2020 10:27:08 -0700 (PDT)
Subject: Re: [PATCH 07/10] clk: qcom: Add graphics clock controller driver for
 SM8150
To:     Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <20200524210615.17035-1-jonathan@marek.ca>
 <20200524210615.17035-8-jonathan@marek.ca>
 <159056904079.88029.16161248455546031414@swboyd.mtv.corp.google.com>
From:   Jonathan Marek <jonathan@marek.ca>
Message-ID: <231bd673-aa99-6223-fa74-54e9a488833e@marek.ca>
Date:   Mon, 29 Jun 2020 13:27:21 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <159056904079.88029.16161248455546031414@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 5/27/20 4:44 AM, Stephen Boyd wrote:
> Quoting Jonathan Marek (2020-05-24 14:06:08)
>> diff --git a/drivers/clk/qcom/gpucc-sm8150.c b/drivers/clk/qcom/gpucc-sm8150.c
>> new file mode 100644
>> index 000000000000..6e1fff0cde75
>> --- /dev/null
>> +++ b/drivers/clk/qcom/gpucc-sm8150.c
>> @@ -0,0 +1,429 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (c) 2017-2020, The Linux Foundation. All rights reserved.
>> + */
>> +
>> +#include <linux/clk-provider.h>
>> +#include <linux/module.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/regmap.h>
>> +
>> +#include <dt-bindings/clock/qcom,gpucc-sm8150.h>
> [..]
>> +
>> +static struct clk_rcg2 gpu_cc_gmu_clk_src = {
>> +       .cmd_rcgr = 0x1120,
>> +       .mnd_width = 0,
>> +       .hid_width = 5,
>> +       .parent_map = gpu_cc_parent_map_0,
>> +       .freq_tbl = ftbl_gpu_cc_gmu_clk_src,
>> +       .clkr.hw.init = &(struct clk_init_data){
>> +               .name = "gpu_cc_gmu_clk_src",
>> +               .parent_names = gpu_cc_parent_names_0,
>> +               .num_parents = 6,
>> +               .flags = CLK_SET_RATE_PARENT,
>> +               .ops = &clk_rcg2_ops,
>> +       },
>> +};
>> +
>> +static struct clk_branch gpu_cc_ahb_clk = {
>> +       .halt_reg = 0x1078,
>> +       .halt_check = BRANCH_HALT_DELAY,
>> +       .clkr = {
>> +               .enable_reg = 0x1078,
>> +               .enable_mask = BIT(0),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gpu_cc_ahb_clk",
>> +                       .flags = CLK_IS_CRITICAL,
> 
> Why is this CLK_IS_CRITICAL? Why not just enable the clk manually with
> a register write in probe and then remove this clk from the system? We
> can save some memory that way.
> 

I copied this from downstream, so I don't know why. It works without it, 
so I removed the CLK_IS_CRITICAL in my v2 (from both sm8150 and sm8250).

>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
> [...]
>> +
>> +static struct gdsc gpu_cx_gdsc = {
>> +       .gdscr = 0x106c,
>> +       .gds_hw_ctrl = 0x1540,
>> +       .pd = {
>> +               .name = "gpu_cx_gdsc",
>> +       },
>> +       .pwrsts = PWRSTS_OFF_ON,
>> +       .flags = VOTABLE,
>> +};
>> +
>> +/* see comment in gpucc-sdm845 about this */
>> +static int gx_gdsc_enable(struct generic_pm_domain *domain)
>> +{
>> +       /* Do nothing but give genpd the impression that we were successful */
>> +       return 0;
>> +}
> 
> Maybe we should export a helper from gdsc.c for this with the comment
> and it named something obvious? gx_gdsc_do_nothing_enable()?
> 

Made this change in my v2.

>> +
>> +static struct gdsc gpu_gx_gdsc = {
>> +       .gdscr = 0x100c,
>> +       .clamp_io_ctrl = 0x1508,
>> +       .pd = {
>> +               .name = "gpu_gx_gdsc",
>> +               .power_on = gx_gdsc_enable,
>> +       },
>> +       .pwrsts = PWRSTS_OFF_ON,
>> +       .flags = CLAMP_IO | AON_RESET | POLL_CFG_GDSCR,
>> +};
>> +
