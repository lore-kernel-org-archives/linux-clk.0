Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26183C433FE
	for <linux-clk@archiver.kernel.org>; Wed, 15 Dec 2021 22:17:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231249AbhLOWRt (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 15 Dec 2021 17:17:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231233AbhLOWRp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 15 Dec 2021 17:17:45 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B02D0C061574
        for <linux-clk@vger.kernel.org>; Wed, 15 Dec 2021 14:17:43 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id cf39so33741361lfb.8
        for <linux-clk@vger.kernel.org>; Wed, 15 Dec 2021 14:17:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=2YGK1SC+xWb+9Z9L9UEJlhFA9/RdQekg4puqfKk8Z1I=;
        b=ct3Q/vOfcHMM1bDY/loexbKo8ySotM3UPz2U++MTiII8XcM6hzGFQxGZ62pKdF8I+D
         pgXILP91HRFBrMETswjFER37UuVzgBIOj5vjZZNVGsGa5xgMQx8F3oHarHEiaDvwTI3s
         WHsIg0yvphvuHj1eZ7sU4CMTEjCw5+vn5k6wt2BTl1ZmS9/P3aefNU+e4ITNXcOYH17y
         FgCP2+qBIOUUUth4THllN4Uxm0C8S7nnnZX3AlXs9sP2iURUCM/cokpadJNiiarvV8Ep
         KxWup+8b7xgUOPFTrkC7wiMP/VfFZzipcSf4tZz0pRrRgd6zvhE0g0OaCjtHs4v5MVXD
         FnVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=2YGK1SC+xWb+9Z9L9UEJlhFA9/RdQekg4puqfKk8Z1I=;
        b=uaKlzgw4yduh4HS7uGphSfXmxL8FPN6BDw9jCkSwjRmGAiKds/e4keKgYAGkZQow9+
         wf10uqV95+4cvjeN8xcpqoZwdtXkr3kIG7lSThQb8UclBRxILzgkwkA+5eNhAWvttk9G
         hgQWsJLKAJEIKDzKfiXRPm/lOEHiy/C4privuqIgv06YP9QhhOf7gsh464xX9coXMz+N
         KKBsXiqOBmu2zXavCsL071zwnY1Ttc5WvT/ym9dyk0N5soUHgzY9bBrfVpUABKs5K26q
         A1jH0ZYljO2f7UScKcJjIF6XgGycuqYYENoE7YKfxqOcWmCNFeeScH1yl9Y265IIIN1b
         v0Ng==
X-Gm-Message-State: AOAM532wAe1S2bZLCJws0XLawieesypKBdiIAAOpGtoBsSe7E+Atpo+P
        N/LqCYI1kw7vx8KhhpoVZKRMM4dhf8fvYtup
X-Google-Smtp-Source: ABdhPJwDNVUsqxySfVM/vXdnbEjyDNTC0XxHA8RRJsBQ13TG3+QC5k7jVhVgWfeLLHwz4OQx1LEz3g==
X-Received: by 2002:ac2:55b7:: with SMTP id y23mr894959lfg.251.1639606661960;
        Wed, 15 Dec 2021 14:17:41 -0800 (PST)
Received: from ?IPV6:2001:470:dd84:abc0::8a5? ([2001:470:dd84:abc0::8a5])
        by smtp.gmail.com with ESMTPSA id m20sm515220lfu.241.2021.12.15.14.17.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Dec 2021 14:17:41 -0800 (PST)
Message-ID: <a4f7d300-90c2-7dda-5cda-5e2763a94912@linaro.org>
Date:   Thu, 16 Dec 2021 01:17:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 2/2] clk: qcom: dispcc-sdm845: park
 disp_cc_mdss_mdp_clk_src
Content-Language: en-GB
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20211208022210.1300773-1-dmitry.baryshkov@linaro.org>
 <20211208022210.1300773-3-dmitry.baryshkov@linaro.org>
 <YbJNp+tnD6kEQAzt@ripper>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <YbJNp+tnD6kEQAzt@ripper>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 09/12/2021 21:40, Bjorn Andersson wrote:
> On Tue 07 Dec 18:22 PST 2021, Dmitry Baryshkov wrote:
> 
>> To stop disp_cc_mdss_mdp_clk_src from getting stuck during boot if it
>> was enabled by the bootloader, part it to the TCXO clock source.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/clk/qcom/dispcc-sdm845.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/clk/qcom/dispcc-sdm845.c b/drivers/clk/qcom/dispcc-sdm845.c
>> index 735adfefc379..f2afbba7bc72 100644
>> --- a/drivers/clk/qcom/dispcc-sdm845.c
>> +++ b/drivers/clk/qcom/dispcc-sdm845.c
>> @@ -858,6 +858,9 @@ static int disp_cc_sdm845_probe(struct platform_device *pdev)
>>   
>>   	clk_fabia_pll_configure(&disp_cc_pll0, regmap, &disp_cc_pll0_config);
>>   
>> +	/* Park disp_cc_mdss_mdp_clk_src */
>> +	clk_rcg2_park_safely(regmap, 0x2088, 0);
> 
> Today booting the system with "clk_ignore_unused" will give you a
> working efifb up until the point where the display driver kicks in and
> reinitializes the hardware state - which during development might be
> indefinite.

During development one can introduce a dispcc parameter. Maybe we should 
add qcom-common parameter telling dispcc drivers to skip parking these 
clocks.

> 
> If we blindly cut the mdp_clk_src here that will no longer be possible.

I think we have several separate tasks here:

1) Support developing code. This is what you have in mind with EFIFB + 
clk_ignore_unused.

2) Get display to work stable and rock solid. This can include 
completely tearing down the display pipeline for the sake of getting 
MDP/MDSS/DSI to work with as few hacks as possible.

3) Gracious handover of display/framebuffer from bootloader to the Linux 
kernel.

For the task #1, you can hack the dispcc as you wish or set any 
additional parameters, as you are already passing clk_ignore_unused. 
This will all end up as #1 transitions to #2.

I was targetting task#2. Disable everything to let dpu/dsi/dp start from 
the scratch. If I understand correctly, this approach would also help 
you with your boot-clock-too-high-for-the-minimum-opp issue. Is my 
assumption correct?

For the task #3 we need collaboration between dispcc, clock core and 
dpu/dsi drivers. Just marking the clocks for the clk_disable_unused() is 
the least of the problems that we have here. I think [1] is a bit closer 
to what I'd expect.

I have a similar but slightly different idea of how this can be made to 
work. I'd do the following (excuse me for the hand waving, no code at hand):

- Add clk_ops->inherit_state callback, which can check if the clock is 
enabled already or not. If it is, set the enable_count to 1, set special 
CLOCK_INHERITED flag, read back the state, etc.

- Make of_clk_set_defaults() ignore clocks with CLOCK_INHERITED flag. 
Maybe it should return special status telling that some of the clocks 
were not updated.

- Add clk_get_inherit() call, which would drop the CLOCK_INHERITED flag 
and return previous flag state to calling driver. The driver now assumes 
ownership of this clock with the enable_count of 1. This way the driver 
can adjust itself to the current clock state (e.g. drop the frequency, 
disable the clock and then call of_clk_set_defaults() again to 
reparent/reclock clocks as necessary, etc). If the parent chain is not 
fully available, clk_get_inherit must return an error for INHERITED 
clocks, so that the driver will not cause reparenting of the orphaned 
clocks.

- If the driver decides for some reason to abandon the device for some 
reason (because of the probe() failure or because of the remove() 
callback being called) it will disable all clocks as expected, 
effectively parking them (but not marking them as inherited). This way 
next driver probe() attempt will start from the scratch, without 
inherited state.

But as this is a complex solution and will take several iterations, I 
suggest teaching dispcc to park clocks at boot.


[1] 
https://lore.kernel.org/linux-arm-msm/20190630150230.7878-1-robdclark@gmail.com/

-- 
With best wishes
Dmitry
