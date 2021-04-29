Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA37BC433ED
	for <linux-clk@archiver.kernel.org>; Thu, 29 Apr 2021 12:16:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A820661040
	for <linux-clk@archiver.kernel.org>; Thu, 29 Apr 2021 12:16:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233922AbhD2MRj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 29 Apr 2021 08:17:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231921AbhD2MRi (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 29 Apr 2021 08:17:38 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F262C06138B
        for <linux-clk@vger.kernel.org>; Thu, 29 Apr 2021 05:16:52 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id n2so99519824ejy.7
        for <linux-clk@vger.kernel.org>; Thu, 29 Apr 2021 05:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:in-reply-to:message-id
         :date:mime-version;
        bh=RHDNDn67MN6JLEq0pltz7iYeAGgFoGfE9CmM1nSQbiM=;
        b=VLz3BHKdI7dakRFv9mmsbfTllD7WadxqdT21O1FF3zjQHR/N6QaVylRXAFuabctKcP
         S1bsSYCBhQP2msbddEU8aX4hizq6OualaavABgrpoFGQQZHebEb5d5OAO4FuTh/aWLG/
         u9ySRd6UmiGk9zNRwGeDJ6U/9b8vNd8F0XzKbW2YZkB314aLxEQ3YSvkRH6JoysyEBVr
         sEYVf58VIKpdKkjoOUS7PHRybE4+2r7m7GpRNrT6lid9ZsfBuGyrLKVmufnpcvzsIzm2
         W0yAHRx6boAsSZIN9OA882VkKLiQz7SMzoikULGcw7/GDvEz4oaGPwFnYVg37Imh8xzl
         Z0Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:message-id:date:mime-version;
        bh=RHDNDn67MN6JLEq0pltz7iYeAGgFoGfE9CmM1nSQbiM=;
        b=WgNIMhWpeNpuhIpvBVUqP8Vcer+SGh6tMFquOtX9AxrvjFM2JR+E+phOk+qlyllMvz
         B/CQGePi282IRU7Vh+WKWtcRxRTK4x6PC/kSiyOxkrEmSci1v4O/sL7Fj+2A+h8jPZTN
         i9gUuHQD6sIVP3mtoGjxzGPHZWM+ADk6ojwA5GJ4J0cUujjYXQAcQUVzE4CxYjEnYMPv
         DsyuAj1BzosSjug3Wr6Rc9/H4kLuaU/O4B/zkOI5RA+gk0nje9eNJhSk4bSih2oesm/s
         h8cpjOfcjOUt/s5sw2tVxZ6grLKzWFm25VtiWSXwJDvFN9LN7LDfk1X7g1vnV1Q97E59
         GGQQ==
X-Gm-Message-State: AOAM5312P+qY+Pcw4kl8T9c0hVOBGsINiKOnQmdPuQbcHc2lWm7/GFy7
        e8u71zKYKFigAXZoZ1uoqFR9gA==
X-Google-Smtp-Source: ABdhPJyjKXaQJOX+hYp1411iGB1TL2HQfK+4JZ8HKBK8KqippD9mSpc/mnctO78Xqo7k5gSPI5tCkg==
X-Received: by 2002:a17:906:b5b:: with SMTP id v27mr11944783ejg.40.1619698610904;
        Thu, 29 Apr 2021 05:16:50 -0700 (PDT)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
        by smtp.gmail.com with ESMTPSA id k5sm2441081edk.46.2021.04.29.05.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Apr 2021 05:16:50 -0700 (PDT)
References: <20210429090325.60970-1-jbrunet@baylibre.com>
 <979eb290-6fc2-38df-0596-867b82d22226@baylibre.com>
 <1jim45juf1.fsf@starbuckisacylon.baylibre.com>
 <0cfc7286-7be6-57ec-8040-a4370d0b4204@baylibre.com>
User-agent: mu4e 1.4.15; emacs 27.1
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     Kevin Hilman <khilman@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: meson: g12a: fix gp0 and hifi ranges
In-reply-to: <0cfc7286-7be6-57ec-8040-a4370d0b4204@baylibre.com>
Message-ID: <1jfsz9jnf2.fsf@starbuckisacylon.baylibre.com>
Date:   Thu, 29 Apr 2021 14:16:49 +0200
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Thu 29 Apr 2021 at 14:15, Neil Armstrong <narmstrong@baylibre.com> wrote:

> On 29/04/2021 11:45, Jerome Brunet wrote:
>> 
>> On Thu 29 Apr 2021 at 11:20, Neil Armstrong <narmstrong@baylibre.com> wrote:
>> 
>>> On 29/04/2021 11:03, Jerome Brunet wrote:
>>>> While some SoC samples are able to lock with a PLL factor of 55, others
>>>> samples can't. ATM, a minimum of 60 appears to work on all the samples
>>>> I have tried.
>>>>
>>>> Even with 60, it sometimes takes a long time for the PLL to eventually
>>>> lock. The documentation says that the minimum rate of these PLLs DCO
>>>> should be 3GHz, a factor of 125. Let's use that to be on the safe side.
>>>>
>>>> With factor range changed, the PLL seems to lock quickly (enough) so far.
>>>> It is still unclear if the range was the only reason for the delay.
>>>>
>>>> Fixes: 085a4ea93d54 ("clk: meson: g12a: add peripheral clock controller")
>>>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>>>> ---
>>>>  drivers/clk/meson/g12a.c | 2 +-
>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
>>>> index b080359b4645..a805bac93c11 100644
>>>> --- a/drivers/clk/meson/g12a.c
>>>> +++ b/drivers/clk/meson/g12a.c
>>>> @@ -1603,7 +1603,7 @@ static struct clk_regmap g12b_cpub_clk_trace = {
>>>>  };
>>>>  
>>>>  static const struct pll_mult_range g12a_gp0_pll_mult_range = {
>>>> -	.min = 55,
>>>> +	.min = 125,
>>>>  	.max = 255,
>>>>  };
>>>>  
>>>>
>>>
>>> I got other issues with GP0 when trying to use it for DSI on VIM3 & VIM3L.
>>>
>>> I had to do change the following to have it lock correctly and achieve rates usable for MIPI-DSI requested bandwidth:
>>>
>>> diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
>>> index cde07f7ebad6..897cd6db5c0f 100644
>>> --- a/drivers/clk/meson/clk-pll.c
>>> +++ b/drivers/clk/meson/clk-pll.c
>>> @@ -391,9 +391,9 @@ static int meson_clk_pll_set_rate(struct clk_hw *hw, unsigned long rate,
>>>                 meson_parm_write(clk->map, &pll->frac, frac);
>>>         }
>>>
>>> -       /* If the pll is stopped, bail out now */
>>> +       /* If the pll is stopped, bail out now * /
>>>         if (!enabled)
>>> -               return 0;
>>> +               return 0;*/
>> 
>> This enables the PLL everytime set_rate() is called :/
>> 
>>>
>>>         if (meson_clk_pll_enable(hw)) {
>>>                 pr_warn("%s: pll did not lock, trying to restore old rate %lu\n",
>>>
>>> This one is tricky, for DSI the clock rate is set with assigned-clock-rates in DT, but
>>> then the GP0 is seen as stopped and then the rate is never set.
>> 
>> Audio does the same - PLL is set and enabled afterward. This has been
>> working so far.
>> 
>>>
>>> When afterwards we enable the PLL, the rate set in the registers is invalid and never locks,
>>> this permits setting the rate in the registers even if the PLL is
>>> stopped.
>> 
>> There something to be explained here cause the register have been set
>> before bailing out. What is happening ? The pokes before have no effect
>> or are the value being reset at another point ?
>> 
>> I understand this need to address this concern but it does not seems
>> related to this particular patch.
>> 
>>>
>>> diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
>>> index 1b0167b8de3b..08174724a115 100644
>>> --- a/drivers/clk/meson/g12a.c
>>> +++ b/drivers/clk/meson/g12a.c
>>> @@ -1602,8 +1602,8 @@ static struct clk_regmap g12b_cpub_clk_trace = {
>>>  };
>>>
>>>  static const struct pll_mult_range g12a_gp0_pll_mult_range = {
>>> -       .min = 55,
>>> -       .max = 255,
>>> +       .min = 120,
>>> +       .max = 168,
>>>  };
>>>
>>> I had to change the min/max to achieve a stable and functional rate of 720MHz after the ODs.
>>>
>> 
>> How about the range provided in here ? This is range documented by AML
>> (3GHz < DCO < 6GHz). 168 limits would limit the rate to ~4GHz which is
>> way below spec and would negatively impact audio clocks.
>
> For hifi pll right, not for GP0 ?
>

Both have the same spec.

>>> Neil
>> 

