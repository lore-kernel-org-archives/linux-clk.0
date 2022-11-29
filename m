Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A2CDC43217
	for <linux-clk@archiver.kernel.org>; Tue, 29 Nov 2022 01:54:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234926AbiK2By3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 28 Nov 2022 20:54:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234664AbiK2By2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 28 Nov 2022 20:54:28 -0500
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3087D2F659
        for <linux-clk@vger.kernel.org>; Mon, 28 Nov 2022 17:54:27 -0800 (PST)
Received: by mail-io1-xd31.google.com with SMTP id h206so9060474iof.10
        for <linux-clk@vger.kernel.org>; Mon, 28 Nov 2022 17:54:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WMM7L0hXLXFUfKlNhgYF7NOBpwKqvN6Tf5K3J+8O/Uc=;
        b=T8k72MxddQdscOHj6Io3D/OAp4GrC7Gna7f3l9dfpJ6TY7SxKZjBjnCJqc6saP9VMU
         o9fOEOkEmUtPkCzVQheZlimTTgpxuynrjQjZ/WFchxU6utIQcVcPv5EavSh8+fipxChU
         JvjBJsC2sff2IFgcv6pyDfv5+1jjnm82hTQzanFFreryRblha3TM/fuIpOoZEOjqn/51
         ppv4YxgtVMD22chsxOYlEvXrW/cJd3qaAdCidEfBTGtI58G+TpL/FAYIiMD40AgAkz7a
         jbeVLFo5yTete2IN/73QDKVOtmQjGdAWsILoddNRc9deAf5K3tYiBwYSuA/X9s0uawea
         dHXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WMM7L0hXLXFUfKlNhgYF7NOBpwKqvN6Tf5K3J+8O/Uc=;
        b=PrdM+0G5WyJ/MLOKCyO5+O6Ao8QXZf6xhO8AGHcTkWJkb4uNkZ/yH7d+MHYlbDD10o
         OjsmPxbYknhRmPC4D5/f/ip1tVjHB6kW2VNGuwswuVgly3Mx7Vj6BM+FSjH9yVt6h8Ox
         okJjyUGpTNDPb0cn4ORbfqa3eBTveVKOhNclCxwGl0FlNmfYs2bv8CyGXWpsIjyARc1S
         wnoSr1ITEkqQ7hUnZAFz+0aKwOfPkvL8A+6ONz9/VB/GFecGeMDbkikqd/4tqqvccvgv
         UNCWiHd/JIEWd7C5EtsM94LMoxXFDqMktI5Qddg7IY6usF5VfKWh+HugwC9O/f96L03S
         3uEA==
X-Gm-Message-State: ANoB5pn5uRIX5s7APrSENOWNk2ZLhLWXDlXvJA2IWvpx2c3CsmYKfVfA
        rSDmTAwWHEwzygya9tdLYfDzFg==
X-Google-Smtp-Source: AA0mqf7VzALgwv8RJk4O1iZ4K4Lr22DE+J44rlb52zwohsPukVXTnLtXFcO23Yr0xME2jVNFlMMXtA==
X-Received: by 2002:a05:6638:603:b0:389:ef1f:2ee6 with SMTP id g3-20020a056638060300b00389ef1f2ee6mr323971jar.267.1669686866493;
        Mon, 28 Nov 2022 17:54:26 -0800 (PST)
Received: from [172.22.22.4] ([98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id o17-20020a92a811000000b003030d8b3cb7sm1662850ilh.42.2022.11.28.17.54.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Nov 2022 17:54:25 -0800 (PST)
Message-ID: <35be9c2d-63d4-01cf-b8d7-de3306d50e64@linaro.org>
Date:   Mon, 28 Nov 2022 19:54:25 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] clk: qcom: rpmh: add support for SM6350 rpmh IPA clock
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     sboyd@kernel.org, mturquette@baylibre.com, andersson@kernel.org,
        konrad.dybcio@linaro.org, agross@kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221129000047.697089-1-elder@linaro.org>
 <CAA8EJpqcQaamPn=6Z0GRKVDvFu8BGQ190EYJH34dApBcC3nzdA@mail.gmail.com>
From:   Alex Elder <elder@linaro.org>
In-Reply-To: <CAA8EJpqcQaamPn=6Z0GRKVDvFu8BGQ190EYJH34dApBcC3nzdA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 11/28/22 7:35 PM, Dmitry Baryshkov wrote:
> On Tue, 29 Nov 2022 at 02:00, Alex Elder <elder@linaro.org> wrote:
>>
>> From: Luca Weiss <luca.weiss@fairphone.com>
>>
>> The IPA core clock is required for SM6350.  Define it.
>>
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>>   drivers/clk/qcom/clk-rpmh.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
>> index 0471bab824642..6a5887aae21a4 100644
>> --- a/drivers/clk/qcom/clk-rpmh.c
>> +++ b/drivers/clk/qcom/clk-rpmh.c
>> @@ -603,6 +603,7 @@ static const struct clk_rpmh_desc clk_rpmh_sc7280 = {
>>   DEFINE_CLK_RPMH_VRM(sm6350, ln_bb_clk2, ln_bb_clk2_ao, "lnbclkg2", 4);
>>   DEFINE_CLK_RPMH_VRM(sm6350, ln_bb_clk3, ln_bb_clk3_ao, "lnbclkg3", 4);
>>   DEFINE_CLK_RPMH_ARC(sm6350, qlink, qlink_ao, "qphy.lvl", 0x1, 4);
>> +DEFINE_CLK_RPMH_BCM(sm6350, ipa, "IP0");

So you're saying that the above line is unnecessary...

>>   static struct clk_hw *sm6350_rpmh_clocks[] = {
>>          [RPMH_CXO_CLK]          = &sc7280_bi_tcxo.hw,
>> @@ -613,6 +614,7 @@ static struct clk_hw *sm6350_rpmh_clocks[] = {
>>          [RPMH_LN_BB_CLK3_A]     = &sm6350_ln_bb_clk3_ao.hw,
>>          [RPMH_QLINK_CLK]        = &sm6350_qlink.hw,
>>          [RPMH_QLINK_CLK_A]      = &sm6350_qlink_ao.hw,
>> +       [RPMH_IPA_CLK]          = &sm6350_ipa.hw,

...and that this line (above) can instead look like this:

	[RPMH_IPA_CLK]		= &sdm845_ipa.hw,

Correct?

> This can use sdm845_ipa.hw instead of defining new clocks.

Your statement seems to also be true for the [RPMH_IPA_CLK]
entry in sdx55_rpmh_clocks[].  (For the record, the commit
that added that one was authored by me, and I didn't realize
what you have stated here.)

Please confirm, and I'll update.

I'll also send another patch to remove the definition of
sdx55_ipa if Mani is willing to test it for me...

Thank you Dmitry.

					-Alex

>>   };
>>
>>   static const struct clk_rpmh_desc clk_rpmh_sm6350 = {
>> --
>> 2.34.1
>>
> 
> 

