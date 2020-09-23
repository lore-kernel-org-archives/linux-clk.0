Return-Path: <SRS0=lMr4=DA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1425C4727F
	for <linux-clk@archiver.kernel.org>; Wed, 23 Sep 2020 16:08:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AB4D9206A2
	for <linux-clk@archiver.kernel.org>; Wed, 23 Sep 2020 16:08:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=marek-ca.20150623.gappssmtp.com header.i=@marek-ca.20150623.gappssmtp.com header.b="XrJbrIo3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726850AbgIWQIp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 23 Sep 2020 12:08:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726738AbgIWQIp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 23 Sep 2020 12:08:45 -0400
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E29E4C0613D2
        for <linux-clk@vger.kernel.org>; Wed, 23 Sep 2020 09:08:44 -0700 (PDT)
Received: by mail-qt1-x844.google.com with SMTP id b2so297751qtp.8
        for <linux-clk@vger.kernel.org>; Wed, 23 Sep 2020 09:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=6AhmEhoJKFtZgkPr3wt8u+Go1C07WkmomwQKmNs/qUM=;
        b=XrJbrIo3osTb6a4fWmk3C934RubXjCWAy8d5fjuEM6+yRb8mu8iERyHearweM84CVu
         z57wm5v+OL36pSH805KtT3ttIul67kx8DzBhgbfB8sCGc7ZBuI//+e2O4xg9d3oS+Pwm
         1Cbnfx5ktVP/i75R/r+M5fHrhzAowDD8p++KmUgzimOzKpi0iTQIuoCJx/NhpiadcRXd
         7zcHKx0g25qsXbXkQEmCTFS8o6KNrwcVZ7IaudMjTfGyNRZmr95obFcS1tfit1fxDRgu
         3c8ERDeJHV51IMAsBfIYZqsx5dF1jVGrQ/kRpiPDQZgnuA5y3tTnKgOB/GtgmF90CEdH
         4pHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6AhmEhoJKFtZgkPr3wt8u+Go1C07WkmomwQKmNs/qUM=;
        b=c5ZloGf6JB5Mi87V27+1KNiULEuXF10Tu3ZDJ3ZUtFSFmDqrjfRDSw2Sr80ClXe2Cv
         jrdsfP9tXY/Z0G0AnIHPM3jF4+uJh18Z1i1+NYzW5wkKoAaye14aA/sEzWKvCQcPUb9j
         ToksnX+foPTKx9UqrvdL4C3LvhdBxM4GfIg9+psg6f+uMQNVBhQ//IwR0pPEcIm2OejH
         vA+uEBIDfRejP5NS9DKtw4WGJO9MacLYhKt6pQZEpdZrLcGXHZl5tusVq5+QhunjIZq5
         v7+tJkJoSOso3OucwW/3AWQoxngHKGT30o29dny8sj/SLuy+81qYRUeWu5IJrkhm53nH
         cKEQ==
X-Gm-Message-State: AOAM533ob34LD+tBCpCO/qWC8ASW3FeHNF1JkwdvXhTp8dHfu1tGyjc5
        lucxT/ttXfS98OT8uAh9jPSqKGRb99iQYxaPIIE=
X-Google-Smtp-Source: ABdhPJzv5bZi6mvVh+1QKpCLLY3nsq6okbRSPzCxjOjS5u0I5tRgaBkEUOfVkkHDG+42Uks/yoiZeQ==
X-Received: by 2002:ac8:60d1:: with SMTP id i17mr818976qtm.272.1600877322690;
        Wed, 23 Sep 2020 09:08:42 -0700 (PDT)
Received: from [192.168.0.189] ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id c70sm250037qkg.4.2020.09.23.09.08.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2020 09:08:42 -0700 (PDT)
Subject: Re: [PATCH v2 5/5] clk: qcom: add video clock controller driver for
 SM8250
To:     Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <20200904030958.13325-1-jonathan@marek.ca>
 <20200904030958.13325-6-jonathan@marek.ca>
 <160080040123.310579.8471841951357841843@swboyd.mtv.corp.google.com>
From:   Jonathan Marek <jonathan@marek.ca>
Message-ID: <0ce9fdb6-e224-ced7-ec32-fe67b2ca6127@marek.ca>
Date:   Wed, 23 Sep 2020 12:07:16 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <160080040123.310579.8471841951357841843@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 9/22/20 2:46 PM, Stephen Boyd wrote:
> Quoting Jonathan Marek (2020-09-03 20:09:54)
>> Add support for the video clock controller found on SM8250 based devices.
>>
>> Derived from the downstream driver.
>>
>> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
>> ---
>>   drivers/clk/qcom/Kconfig          |   9 +
>>   drivers/clk/qcom/Makefile         |   1 +
>>   drivers/clk/qcom/videocc-sm8250.c | 518 ++++++++++++++++++++++++++++++
>>   3 files changed, 528 insertions(+)
>>   create mode 100644 drivers/clk/qcom/videocc-sm8250.c
>>
>> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
>> index 40d7ee9886c9..95efa38211d5 100644
>> --- a/drivers/clk/qcom/Kconfig
>> +++ b/drivers/clk/qcom/Kconfig
>> @@ -453,6 +453,15 @@ config SM_VIDEOCC_8150
>>            Say Y if you want to support video devices and functionality such as
>>            video encode and decode.
>>   
>> +config SM_VIDEOCC_8250
>> +       tristate "SM8250 Video Clock Controller"
>> +       select SDM_GCC_8250
>> +       select QCOM_GDSC
>> +       help
>> +         Support for the video clock controller on SM8250 devices.
>> +         Say Y if you want to support video devices and functionality such as
>> +         video encode and decode.
>> +
>>   config SPMI_PMIC_CLKDIV
>>          tristate "SPMI PMIC clkdiv Support"
>>          depends on SPMI || COMPILE_TEST
>> diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
>> index 6f4c580d2728..55fb20800b66 100644
>> --- a/drivers/clk/qcom/Makefile
>> +++ b/drivers/clk/qcom/Makefile
>> @@ -69,6 +69,7 @@ obj-$(CONFIG_SM_GCC_8250) += gcc-sm8250.o
>>   obj-$(CONFIG_SM_GPUCC_8150) += gpucc-sm8150.o
>>   obj-$(CONFIG_SM_GPUCC_8250) += gpucc-sm8250.o
>>   obj-$(CONFIG_SM_VIDEOCC_8150) += videocc-sm8150.o
>> +obj-$(CONFIG_SM_VIDEOCC_8250) += videocc-sm8250.o
>>   obj-$(CONFIG_SPMI_PMIC_CLKDIV) += clk-spmi-pmic-div.o
>>   obj-$(CONFIG_KPSS_XCC) += kpss-xcc.o
>>   obj-$(CONFIG_QCOM_HFPLL) += hfpll.o
>> diff --git a/drivers/clk/qcom/videocc-sm8250.c b/drivers/clk/qcom/videocc-sm8250.c
>> new file mode 100644
>> index 000000000000..a814d10945c4
>> --- /dev/null
>> +++ b/drivers/clk/qcom/videocc-sm8250.c
>> @@ -0,0 +1,518 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2018-2020, The Linux Foundation. All rights reserved.
>> + */
>> +
>> +#include <linux/clk-provider.h>
>> +#include <linux/module.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/regmap.h>
>> +
>> +#include <dt-bindings/clock/qcom,videocc-sm8250.h>
>> +
> [...]
>> +static struct clk_rcg2 video_cc_ahb_clk_src = {
>> +       .cmd_rcgr = 0xbd4,
>> +       .mnd_width = 0,
>> +       .hid_width = 5,
>> +       .parent_map = video_cc_parent_map_0,
>> +       .freq_tbl = ftbl_video_cc_ahb_clk_src,
>> +       .clkr.hw.init = &(struct clk_init_data){
>> +               .name = "video_cc_ahb_clk_src",
>> +               .parent_data = video_cc_parent_data_0,
>> +               .num_parents = ARRAY_SIZE(video_cc_parent_data_0),
>> +               .flags = CLK_SET_RATE_PARENT,
>> +               .ops = &clk_rcg2_shared_ops,
>> +       },
>> +};
>> +
>> +static struct clk_rcg2 video_cc_xo_clk_src = {
>> +       .cmd_rcgr = 0xecc,
>> +       .mnd_width = 0,
>> +       .hid_width = 5,
>> +       .parent_map = video_cc_parent_map_0,
>> +       .freq_tbl = ftbl_video_cc_ahb_clk_src,
>> +       .clkr.hw.init = &(struct clk_init_data){
>> +               .name = "video_cc_xo_clk_src",
>> +               .parent_data = video_cc_parent_data_0,
>> +               .num_parents = ARRAY_SIZE(video_cc_parent_data_0),
>> +               .flags = CLK_IS_CRITICAL | CLK_SET_RATE_PARENT,
> 
> Similar critical clk comment, see below.
> 
>> +               .ops = &clk_rcg2_ops,
>> +       },
>> +};
>> +
>> +static struct clk_branch video_cc_ahb_clk = {
>> +       .halt_reg = 0xe58,
>> +       .halt_check = BRANCH_HALT,
>> +       .clkr = {
>> +               .enable_reg = 0xe58,
>> +               .enable_mask = BIT(0),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "video_cc_ahb_clk",
>> +                       .parent_data = &(const struct clk_parent_data){
>> +                               .hw = &video_cc_ahb_clk_src.clkr.hw,
>> +                       },
>> +                       .num_parents = 1,
>> +                       .flags = CLK_IS_CRITICAL | CLK_SET_RATE_PARENT,
> 
> Similar critical clk comment, see below.
> 
>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
>> +static struct clk_branch video_cc_mvs0_clk = {
>> +       .halt_reg = 0xd34,
>> +       .halt_check = BRANCH_HALT_SKIP, /* TODO: hw gated ? */
> 
> Is this resolved?
> 

Downstream has this clock as BRANCH_HALT_VOTED, but with the upstream 
venus driver (with patches to enable sm8250), that results in a 
"video_cc_mvs0_clk status stuck at 'off" error. AFAIK venus 
enables/disables this clock on its own (venus still works without 
touching this clock), but I didn't want to remove this in case it might 
be needed. I removed these clocks in the v3 I just sent.

>> +       .clkr = {
>> +               .enable_reg = 0xd34,
>> +               .enable_mask = BIT(0),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "video_cc_mvs0_clk",
>> +                       .parent_data = &(const struct clk_parent_data){
>> +                               .hw = &video_cc_mvs0_div_clk_src.clkr.hw,
>> +                       },
>> +                       .num_parents = 1,
>> +                       .flags = CLK_SET_RATE_PARENT,
>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
> [...]
>> +
>> +static struct clk_branch video_cc_xo_clk = {
>> +       .halt_reg = 0xeec,
>> +       .halt_check = BRANCH_HALT,
>> +       .clkr = {
>> +               .enable_reg = 0xeec,
>> +               .enable_mask = BIT(0),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "video_cc_xo_clk",
>> +                       .parent_data = &(const struct clk_parent_data){
>> +                               .hw = &video_cc_xo_clk_src.clkr.hw,
>> +                       },
>> +                       .num_parents = 1,
>> +                       .flags = CLK_IS_CRITICAL | CLK_SET_RATE_PARENT,
> 
> Please add a coment why it's critical. If no consumer of this clk exists
> it's preferred to move the enabling to probe and not waste memory
> modeling it in software.
> 
>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
