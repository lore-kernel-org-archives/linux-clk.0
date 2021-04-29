Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17AE3C433ED
	for <linux-clk@archiver.kernel.org>; Thu, 29 Apr 2021 12:15:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CBE9161449
	for <linux-clk@archiver.kernel.org>; Thu, 29 Apr 2021 12:15:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233327AbhD2MPv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 29 Apr 2021 08:15:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230148AbhD2MPu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 29 Apr 2021 08:15:50 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA7FEC06138B
        for <linux-clk@vger.kernel.org>; Thu, 29 Apr 2021 05:15:03 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id k4-20020a7bc4040000b02901331d89fb83so10666817wmi.5
        for <linux-clk@vger.kernel.org>; Thu, 29 Apr 2021 05:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=yRijLkfkG3QMx5ZZ+V2aLtoew1Ejz/66bv4l23pIpjo=;
        b=FzhLeC4gCNejTx5HoNxqezTO6fZRp9Z7mpGk1i7FcVLYC0Ps/Z0TCymd3LJOB24vsL
         c9oWNJlBC8hWdw/R4GpnNPXJ/URyvWgMETraIalCaT/NDsWHtKLHi9Z9tjUf5dlbEL+z
         GIbCK2Tbi0OkvfsN/jSIVUllehkIM55kcb4bFCRpECnzVXkLllhJ4+IYNOPG/DgQqLAG
         JG3LKj9L1f6Id6JZe7Nui687SfoS+ElcdMbQVVL1GSCX5XKeaR2C0lH+jmaWTeuPH4BO
         1RA+7lWSH/w5W8ZIxVGvvrNqEzXkLBwAdYdOBstiTmJTKydTTumFEZomRRheR+Vc9fYr
         IyUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=yRijLkfkG3QMx5ZZ+V2aLtoew1Ejz/66bv4l23pIpjo=;
        b=e2FwwYRUuzitdOrbpAii678mkGDsxfyYJ0jq//mQtOKe/07Wt38/qghcj0CHhFUUDM
         pU0uhbAZPYbIZjTWjVO/3t4bNuAxl5cmuOyBQiZwE+2+Iv5ju8RRRQuGmV8BFcnZucS2
         MbtEnP5XnI3CZBAtSpu84aeNEOvoPtSnLE0IVbZhQSPWZxJaJAnoxogLvDq/HCHRsuCa
         kGSNn2gnSZQ+kv+PQ4w3vL6VzBaYP6qFGTAYiY4aRx5Dax0do0dZuOelKk3RAHzcjM+j
         LGc8m48FadcLO8eS0NTWsQn7Kt9s8uqnpCcNPv4gJkC3gFNGRJYMvj6b4nrQ8CadjFE5
         2XGQ==
X-Gm-Message-State: AOAM532Zh7txFsyqBIuP+54S26F5lNVP/2BB1qn5c3SpLrxPSWuEsa18
        Arum7DoKPSknbI5LShQMrbmg5A==
X-Google-Smtp-Source: ABdhPJx0km615u7GvO3ILb2I5zbhnFoL+VtBtfrAqmMAmXF6hZ4vspHOx0cmiCymM4mAxpMyeDtUIw==
X-Received: by 2002:a7b:c344:: with SMTP id l4mr9906537wmj.120.1619698502370;
        Thu, 29 Apr 2021 05:15:02 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:c304:4b2b:4a79:1da9? ([2a01:e0a:90c:e290:c304:4b2b:4a79:1da9])
        by smtp.gmail.com with ESMTPSA id h10sm4993111wrt.40.2021.04.29.05.15.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Apr 2021 05:15:01 -0700 (PDT)
Subject: Re: [PATCH] clk: meson: g12a: fix gp0 and hifi ranges
To:     Jerome Brunet <jbrunet@baylibre.com>
Cc:     Kevin Hilman <khilman@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210429090325.60970-1-jbrunet@baylibre.com>
 <979eb290-6fc2-38df-0596-867b82d22226@baylibre.com>
 <1jim45juf1.fsf@starbuckisacylon.baylibre.com>
From:   Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <0cfc7286-7be6-57ec-8040-a4370d0b4204@baylibre.com>
Date:   Thu, 29 Apr 2021 14:15:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1jim45juf1.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 29/04/2021 11:45, Jerome Brunet wrote:
> 
> On Thu 29 Apr 2021 at 11:20, Neil Armstrong <narmstrong@baylibre.com> wrote:
> 
>> On 29/04/2021 11:03, Jerome Brunet wrote:
>>> While some SoC samples are able to lock with a PLL factor of 55, others
>>> samples can't. ATM, a minimum of 60 appears to work on all the samples
>>> I have tried.
>>>
>>> Even with 60, it sometimes takes a long time for the PLL to eventually
>>> lock. The documentation says that the minimum rate of these PLLs DCO
>>> should be 3GHz, a factor of 125. Let's use that to be on the safe side.
>>>
>>> With factor range changed, the PLL seems to lock quickly (enough) so far.
>>> It is still unclear if the range was the only reason for the delay.
>>>
>>> Fixes: 085a4ea93d54 ("clk: meson: g12a: add peripheral clock controller")
>>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>>> ---
>>>  drivers/clk/meson/g12a.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
>>> index b080359b4645..a805bac93c11 100644
>>> --- a/drivers/clk/meson/g12a.c
>>> +++ b/drivers/clk/meson/g12a.c
>>> @@ -1603,7 +1603,7 @@ static struct clk_regmap g12b_cpub_clk_trace = {
>>>  };
>>>  
>>>  static const struct pll_mult_range g12a_gp0_pll_mult_range = {
>>> -	.min = 55,
>>> +	.min = 125,
>>>  	.max = 255,
>>>  };
>>>  
>>>
>>
>> I got other issues with GP0 when trying to use it for DSI on VIM3 & VIM3L.
>>
>> I had to do change the following to have it lock correctly and achieve rates usable for MIPI-DSI requested bandwidth:
>>
>> diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
>> index cde07f7ebad6..897cd6db5c0f 100644
>> --- a/drivers/clk/meson/clk-pll.c
>> +++ b/drivers/clk/meson/clk-pll.c
>> @@ -391,9 +391,9 @@ static int meson_clk_pll_set_rate(struct clk_hw *hw, unsigned long rate,
>>                 meson_parm_write(clk->map, &pll->frac, frac);
>>         }
>>
>> -       /* If the pll is stopped, bail out now */
>> +       /* If the pll is stopped, bail out now * /
>>         if (!enabled)
>> -               return 0;
>> +               return 0;*/
> 
> This enables the PLL everytime set_rate() is called :/
> 
>>
>>         if (meson_clk_pll_enable(hw)) {
>>                 pr_warn("%s: pll did not lock, trying to restore old rate %lu\n",
>>
>> This one is tricky, for DSI the clock rate is set with assigned-clock-rates in DT, but
>> then the GP0 is seen as stopped and then the rate is never set.
> 
> Audio does the same - PLL is set and enabled afterward. This has been
> working so far.
> 
>>
>> When afterwards we enable the PLL, the rate set in the registers is invalid and never locks,
>> this permits setting the rate in the registers even if the PLL is
>> stopped.
> 
> There something to be explained here cause the register have been set
> before bailing out. What is happening ? The pokes before have no effect
> or are the value being reset at another point ?
> 
> I understand this need to address this concern but it does not seems
> related to this particular patch.
> 
>>
>> diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
>> index 1b0167b8de3b..08174724a115 100644
>> --- a/drivers/clk/meson/g12a.c
>> +++ b/drivers/clk/meson/g12a.c
>> @@ -1602,8 +1602,8 @@ static struct clk_regmap g12b_cpub_clk_trace = {
>>  };
>>
>>  static const struct pll_mult_range g12a_gp0_pll_mult_range = {
>> -       .min = 55,
>> -       .max = 255,
>> +       .min = 120,
>> +       .max = 168,
>>  };
>>
>> I had to change the min/max to achieve a stable and functional rate of 720MHz after the ODs.
>>
> 
> How about the range provided in here ? This is range documented by AML
> (3GHz < DCO < 6GHz). 168 limits would limit the rate to ~4GHz which is
> way below spec and would negatively impact audio clocks.

For hifi pll right, not for GP0 ?

>> Neil
> 

