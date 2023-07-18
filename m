Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAB3BEB64DA
	for <linux-clk@archiver.kernel.org>; Tue, 18 Jul 2023 08:37:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231787AbjGRIhW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 18 Jul 2023 04:37:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229579AbjGRIhV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 18 Jul 2023 04:37:21 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38F9410C
        for <linux-clk@vger.kernel.org>; Tue, 18 Jul 2023 01:37:19 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3fbc5d5742bso53921795e9.2
        for <linux-clk@vger.kernel.org>; Tue, 18 Jul 2023 01:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689669438; x=1692261438;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K6bRLOVfSwW0qn3SMzPfFP/67dSzOtG9jDmNa7DKFhQ=;
        b=sSX6dRkYE95JM6tA4E+4JXuPwzYm/8iu/2yxvLVU+PoHPAhUq36r+qNyoqcryZUF6s
         9QI2OR2B2GTBPE9LPS6ISOc+UnvJHIqWKepy4sB7QUHYfUIbRSqtAy6crsi0r1PLrrSQ
         zxU9CqmorIZX6iVyoMKwrv/YRa+rA596+MeaLCtsMX+qB1BPAKA4fni4E1XBo5Mkv5Ri
         IS2A81ThAQwHFbmppOgki2wF7933Oa6eXp/3eZ9GW1t7CNANosZinxJg9rh6XtdUXDwa
         CqK/V2IoknmmVBp52EUbuC8kp6TgrlOIS7mW/A+g27VtDnfeMH8CX29545o3Z+exdRYn
         oCng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689669438; x=1692261438;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K6bRLOVfSwW0qn3SMzPfFP/67dSzOtG9jDmNa7DKFhQ=;
        b=SnbIULPNDpgo7gim1tLUvBznTmsFTH4kEhRodGr9cKXtvQSUb+QsyOqwuCgzbKrnLM
         qLspL7IfKWQZpKaAkqtUgUEetB2Q1GrhLos9CsvaoW2mdnw1e6/Lqk1avXGK2VcDx0NL
         EFTSQvsXZ/uaohg8hNXTDk72KzVuy1JeIOM2XjqZqd9jXvS00NJc3M1Rzy9qn5wUoqSH
         j9QOgV/pE5Rrg1vff69S/VACTaxMWm3og9oxGBC3NXKwbLtdD9GzsgA+Cobe/A8ibTU2
         XrB3UTa/ktwNbmYfPkS0M+FI5FsoaIDZLa8waC9zPEIrcXZnWtpOG0KUCEvNa7EHBO3P
         bPhA==
X-Gm-Message-State: ABy/qLbnOydJxxE0tsOv4gQNiiLeOSa5E38CUWbbamigMGOeoaqvSG82
        HSHvGEu6/MvB9jy9vaumnhes/Q==
X-Google-Smtp-Source: APBJJlEooqOWwehp95jYwVjhyi4es64yaNnAecI+7w58zjvmoB3sjpzHREGowtUoSx5lAf04Ecvhdg==
X-Received: by 2002:a7b:cd0a:0:b0:3fb:a1d9:ede8 with SMTP id f10-20020a7bcd0a000000b003fba1d9ede8mr1172225wmj.10.1689669437674;
        Tue, 18 Jul 2023 01:37:17 -0700 (PDT)
Received: from [10.101.1.6] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id p1-20020adff201000000b003141f3843e6sm1677348wro.90.2023.07.18.01.37.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jul 2023 01:37:17 -0700 (PDT)
Message-ID: <59a88e00-0758-32b8-7ce4-8dea84a9b0f7@baylibre.com>
Date:   Tue, 18 Jul 2023 10:37:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/2] clk: mediatek: mt8195-topckgen: Refactor parents for
 top_dp/edp muxes
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Maxime Ripard <mripard@kernel.org>
Cc:     Chen-Yu Tsai <wenst@chromium.org>, sboyd@kernel.org,
        mturquette@baylibre.com, matthias.bgg@gmail.com, msp@baylibre.com,
        yangyingliang@huawei.com, u.kleine-koenig@pengutronix.de,
        miles.chen@mediatek.com, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, kernel@collabora.com
References: <20230713072138.84117-1-angelogioacchino.delregno@collabora.com>
 <20230713072138.84117-3-angelogioacchino.delregno@collabora.com>
 <9a0817c2-4101-5c21-977d-77ac0d83a067@baylibre.com>
 <CAGXv+5E7YYdkG7GtxG90KzdAG8Kke+74Amtbw4mmyVNZgDZHRA@mail.gmail.com>
 <jv6daj2w3pwjtde3m3m26yg4wyxbbio4zqra5yqc4gb32ri5ub@noinbbkjovwm>
 <25724ee3-858a-01eb-352b-3edbfad31c8e@collabora.com>
 <jxgy2pvns4ri2aj5nmdhb4zbluseuzdejbplh2avwz63df2cfx@grrrdm6ujzi4>
 <24d17b07-1e8d-05f6-46b7-9da1ff1bed7a@collabora.com>
Content-Language: en-US
From:   Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <24d17b07-1e8d-05f6-46b7-9da1ff1bed7a@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 17/07/2023 16:30, AngeloGioacchino Del Regno wrote:
>>>>> However I'm not sure if that works for parents. It should, given the
>>>>> original use case was for the sunxi platforms, which like the MediaTek
>>>>> platform here has 2 PLLs for video related consumers, but I couldn't
>>>>> find code verifying it.
>>>>
>>>> If you want to prevent clocks from ever being reparented, you can use
>>>> the new clk_hw_determine_rate_no_reparent() determine_rate
>>>> implementation.
>>>>
>>>
>>> We want the clocks to be reparented, as we need them to switch 
>>> parents as
>>> explained before... that's more or less how the tree looks:
>>>
>>> TVDPLL(x) -> PLL Divider (fixed) -> MUX -> Gate -> Controller
>>>
>>> Besides, I think that forcing *one* parent to the dp/edp mux would 
>>> produce a
>>> loss of the flexibility that the clock framework provides.
>>>
>>> I again want to emphasize on the fact that TVDPLL1 and TVDPLL2 are 
>>> *identical*
>>> in specs, and on that there will never be a MT8195 SoC that has only 
>>> one of
>>> the two PLLs, for obvious reasons...
>>>
>>> P.S.: If you need more context, I'll be glad to answer to any other 
>>> question!
>>
>> Then I have no idea what the question is :)
>>
>> What are you trying to achieve / fix, and how can I help you ? :)
>>
> 
> Chen-Yu, Alexandre had/have questions about if there was any other 
> solution instead
> of using the solution of *this* commit, so, if there's any other better 
> solution
> than the one that I've sent as this commit.
> 
> I'm the one saying that this commit is the best solution :-P

Hi Angelo,

My solution is based on PLL static allocation, because I missed it could 
be reparented actually. I think I've a better understanding of this 
commit now, thanks to your explanations. Looks fine for me.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre
