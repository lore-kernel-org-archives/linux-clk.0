Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B97B9C433F5
	for <linux-clk@archiver.kernel.org>; Mon, 11 Apr 2022 07:40:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245543AbiDKHmS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 11 Apr 2022 03:42:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245534AbiDKHmR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 11 Apr 2022 03:42:17 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CC0F2EE
        for <linux-clk@vger.kernel.org>; Mon, 11 Apr 2022 00:40:03 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id r206-20020a1c44d7000000b0038ccb70e239so3949039wma.3
        for <linux-clk@vger.kernel.org>; Mon, 11 Apr 2022 00:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=eHUhpESnzNrGTrdol6SHskKb8YtH0zD8DXuSZXY3nFQ=;
        b=B8ocYA2FHy37eAiQiOTxXukXWYA7y1hSezwXzYjjrjZxTF+7m+C4cNRYbAEdldK3U4
         hfNac3N+qMu9zdYz67QA3nLGb7Iu4QO4Mv92Ds4y8mQhaaPXEio68y1stGFG+Wo73QYE
         ezPGDD359Zn4ZF6sVjs5ZNZP6Floxh7ljwuBeLCQE0v6V5ds4zVQmKPigdtCH9ri4M6C
         Rjix7Xe5x9za4Kt85aDTj3Kt95VIShSzP9i1qHyjLR6dw+I3rNxYDyLWC65wmLcO7090
         So8zNQAIyZAq1hYDcag5pDLI9CwYpAuvNwfE2d2Fl6JxHa/L1NSlSXtYFwyd4hG50/xa
         Fumw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=eHUhpESnzNrGTrdol6SHskKb8YtH0zD8DXuSZXY3nFQ=;
        b=jAPlZM4NEFNLbjc+utZsOEWJm/MVB6dQOK9hjhj6CsqwiA6f8q2JE5Jx6azbijKny8
         TonSeHsAHsBYBS9+kF0gvK9tZ5dkfJ9xztWm+6ZMyN/mccmh3FnbpHCs5ZPMlcQJsppn
         vQ+vkKtUBZdxrW91H5Ff48N50rB0h5XukM2GTBKdf/aTewGo3QRdEKL3ZfK6UL5iSZb2
         +y5radQBs10btTHqAe52Jhu5yfXJqyEgPtaDSlEIYSHBysZGt1ripKEISC6fLy4QaQeK
         SyP92pmq74SSeFzeX+k+ogte/4wev6E5yYbN0vJwiiybVDCR+06iGn59ycLcG1zF7Iis
         TIAQ==
X-Gm-Message-State: AOAM533ibvWyyt5GTuy6zv9FUcG4DoLJRvLTris8E37/Q95Wc1YeJ6jM
        X5TaK27ApU0UbDj5cE4/C+6ouw==
X-Google-Smtp-Source: ABdhPJzYS3McMRlRNCe9OR3mwf2Y21wZUzDdGoZo75TAVLcqZh3/02lsDmd5hFFImqXzuHsMvEb9ew==
X-Received: by 2002:a05:600c:358d:b0:38c:6d54:bf40 with SMTP id p13-20020a05600c358d00b0038c6d54bf40mr27651607wmq.203.1649662801896;
        Mon, 11 Apr 2022 00:40:01 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:d1:e096:d183:1bc5? ([2001:861:44c0:66c0:d1:e096:d183:1bc5])
        by smtp.gmail.com with ESMTPSA id i7-20020a5d5587000000b00207a8cde900sm1174470wrv.19.2022.04.11.00.40.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Apr 2022 00:40:01 -0700 (PDT)
Message-ID: <a30e6471-eb1d-cf41-9ca9-cf33fd570c6a@baylibre.com>
Date:   Mon, 11 Apr 2022 09:40:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 22/22] clk: Prevent a clock without a rate to register
Content-Language: en-US
To:     Maxime Ripard <maxime@cerno.tech>,
        Jerome Brunet <jbrunet@baylibre.com>
Cc:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tony Lindgren <tony@atomide.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>
References: <20220408091037.2041955-1-maxime@cerno.tech>
 <20220408091037.2041955-23-maxime@cerno.tech>
 <1jwnfzlxx1.fsf@starbuckisacylon.baylibre.com>
 <20220408104127.ilmcntbhvktr2fbh@houat>
 <1jpmlrlq0h.fsf@starbuckisacylon.baylibre.com>
 <20220408125526.ykk5ktix52mnwvh2@houat>
 <1jlewflizh.fsf@starbuckisacylon.baylibre.com>
 <20220408153625.ugodcmfwtanr75gu@houat>
From:   Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220408153625.ugodcmfwtanr75gu@houat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 08/04/2022 17:36, Maxime Ripard wrote:
> On Fri, Apr 08, 2022 at 04:48:08PM +0200, Jerome Brunet wrote:
>>>>> and hdmi_pll_dco because it will always return 0,
>>>>
>>>> It is a read-only clock - whatever we do in CCF, it is not going to
>>>> change. CCF has always supported RO clocks.
>>>
>>> Yes, if a clock has a rate of 0Hz it's entirely useless. And if it's
>>> useful in anyway, it should report its current rate. Read-only or not.
>>>
>>
>> It does report its rate, it does not have any.
>> ... and It would pretty weird to initialize a read-only clock.
> 
> The KMS driver doesn't seem to have a problem with that.
> 
>>>>> unless the display driver comes around and updates it. If it never does,
>>>>> or if it's not compiled in, then you're out of luck.
>>>>
>>>> I'm all for managing the display clocks from CCF but it has proved tricky
>>>> so far. Maybe it will someday.
>>>>
>>>> Being a read-only clock, the value is what it is and CCF should
>>>> deal with it gracefully. It has so far.
>>>>
>>>> If the driver actually managing the clock is not compiled in, then the
>>>> clock will never be set, and it should not be a problem either.
>>>
>>> Again, it depends on what you expect from clk_get_rate(). If it can only
>>> report a rate of 0 on error, then it's definitely a problem.
>>
>> Agreed, it depends on what you expect from clk_get_rate().
>> Still when something does not oscillate, the rate is 0.
>>
>> If a driver call clk_get_rate() on an uninitialized, unlocked PLL, I
>> think returning 0 makes sense.
> 
> You're confusing two things: the rate output by the hardware, and what
> the CCF needs to return. We're discussing the latter here, a software
> construct. It models the hardware, but it doesn't have to be true to the
> hardware.
> 
> And even the meson driver doesn't follow what you're claiming to the
> letter and is inconsistent with what you're saying. Any disabled gate
> will also have a hardware rate of 0. Yet, it doesn't return 0 in such a
> case. And no one does, because clk_get_rate() isn't supposed to return
> the actual rate in hardware at the moment. It's supposed to return what
> would be the rate if it was enabled.

You're pointing a real issue, what should we return as a rate then ?

The rate is not only the rate output by the HW but is also used by the whole
subtree of the PLL to calculate the rates.

If we return a fake or dummy rate instead of 0 (which is the physical reality),
the clock subtree will be populated from a fake rate and if we did set a clock
rate using assigned-clock, eventually this fake rate would match and no set_rate()
would be called on the PLL.

This is why we return the true physical rate, it's the software to adapt in order
to handle the possible HW states.

> 
>>> And it's not because it was done before that it wasn't just as
>>> problematic then.
>>>
>>>>>> IMO, whenever possible we should not put default values in the clocks
>>>>>> which is why I chose to leave it like that.
>>>>>>
>>>>>> The PLL being unlocked, it has no rate. It is not set to have any rate.
>>>>>> IMO a returning a rate of 0 is valid here.
>>>>>
>>>>> If there's not a sensible default in the hardware already, I don't see
>>>>> what the big issue is to be honest. You already kind of do that for all
>>>>> the other PLL parameters with init_regs
>>>>
>>>> Those initial parameters are "magic" analog setting which don't have an
>>>> impact on the rate setting. The initial rate of the clock is never set
>>>> by the clock driver on purpose.
>>>
>>> It's still fundamentally the same: whatever is there at boot isn't good
>>> enough, so you change it to have a somewhat sensible default.
>>
>> If you don't need it, no.
> 
> I mean, I provided multiple examples that the meson driver is being
> inconsistent with both the CCF documentation and the expected usage of
> the CCF consumers. And I suggested solutions to fix this inconsistency
> both here and on IRC to Neil and you.

It's not that we don't like it, we only care the actual HW state is correctly
reported in the clock tree, nothing else.

If a new flag like CLK_INVALID_RATE existed then we would use it.

But so far a zero rate never was problematic, and iMX8mp HDMI PLL and MSM mmpll2
also return a 0 rate as init because it's probably the default PLL state at
HW startup.

> 
> The only argument you provided so far is that you don't like or want it.
> I'm sorry you feel this way, but it doesn't change either the consensus
> or the documentation that every other driver and consumer is following.
> Nor does it provide any solution.
> 
> In the grand scheme of things, I don't care, if you want to have your
> own conventions a policies, go ahead. Just don't expect me to debug
> whatever is going on next time it falls apart.
> 
> Maxime

Neil
