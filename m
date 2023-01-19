Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2681C00A5A
	for <linux-clk@archiver.kernel.org>; Thu, 19 Jan 2023 11:04:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230021AbjASLEo (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 19 Jan 2023 06:04:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230352AbjASLEZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 19 Jan 2023 06:04:25 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B766C62D33
        for <linux-clk@vger.kernel.org>; Thu, 19 Jan 2023 03:04:19 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id iv8-20020a05600c548800b003db04a0a46bso2801310wmb.0
        for <linux-clk@vger.kernel.org>; Thu, 19 Jan 2023 03:04:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WFPCHnH4BLHfsWKrLXL/kRkVribIQYKCD+0tbIu1RlY=;
        b=ORycp9/f4UvnbRnieWYiheKRbz4dQRj6ZCKMBB8oUeU+Id+izspyrbe1d8SJD4TDnv
         MXQTkk087qeT27gM+1xw+eOBqCKd02Xkc/Z8OfZsov0zJlEmRy7p7LqiE1SuxWvkPvy+
         /xn5/67z4Q7Xwm7frblc0U8DMCXVz21egKc2CWa6TfS/0R7KPah5ytNYmzdU2GPcl2YW
         bLnPTu/qFioJ6YsjbOfJVtskoEMEJnnG6Glg/XClwEDAFGE8WnFgNvr0sC4W/OMYq2A9
         af/fsFHT3N1QQDnMANHrF1SmKqmfQDYzqcZQzrCE0lUxazmex15ivd+DmNH84RsP5iW2
         TXvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WFPCHnH4BLHfsWKrLXL/kRkVribIQYKCD+0tbIu1RlY=;
        b=QGHSOSEwDE+nzAXHcCajUAHFg3IPEsXe4zmPIU63NBkvCTi+cHMzy90ESfhlLMcYmK
         WETAkUqph0mSHjt5EkGs+aKZZ9HTgKOxNHhdY/klJ6pSMIMN6VIEAFO5we7oRp3iWyQN
         BWeqHoGSNoA8x2nMpblyqbP8HXGCb8+ywX1TkkNWqNyWfvtHYcFzI1Jwi4AkDfUlD9SZ
         92/UlEzagIg3H8pBllVnmUE2mmWPgvR5KUqSInR7yGp7DWcuxuIqXSdrouOiMTykiIVF
         Y+e6Ob0D6Zk8MG9+pwjBMSj1mfqGff8dvzrjYbyFzflkd7zjUVIMDukBP8VRKVwkL2ng
         Qf9A==
X-Gm-Message-State: AFqh2kr6CVNvtL5MN7qR0797J4R/zlQvfaPfH0DmvOnU6Sew4RJj2ABW
        B+xy3xZ7fk/2wWKEKC+GlMMyMw==
X-Google-Smtp-Source: AMrXdXv1b/NdkFoUj8MkBo3cwBpSRggisPj59zoDU29d9SSgAJdooDC4XRMfufn4i6dLoRwq4xM07Q==
X-Received: by 2002:a05:600c:3b17:b0:3cf:7397:c768 with SMTP id m23-20020a05600c3b1700b003cf7397c768mr9770538wms.30.1674126258288;
        Thu, 19 Jan 2023 03:04:18 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id a10-20020adfdd0a000000b002bb6b45ab57sm31533210wrm.85.2023.01.19.03.04.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jan 2023 03:04:17 -0800 (PST)
Message-ID: <b6dae46b-7dd4-f731-aa26-f4ea3e4f3118@linaro.org>
Date:   Thu, 19 Jan 2023 12:04:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH] dt-bindings: clock: qcom,a53pll: drop operating-points-v2
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, fabien.parent@linaro.org
References: <20230113145859.82868-1-krzysztof.kozlowski@linaro.org>
 <e73ad320fafa1365e3506bbd4cc77d8d.sboyd@kernel.org>
 <063c5516-417d-7c21-b58f-a6552779a621@linaro.org>
 <705c78c1d0da18089419b064832d5fed.sboyd@kernel.org>
 <20230119031136.27vson2awemt3nkt@builder.lan>
 <776b67b2-2405-36f5-f072-78f33ae59fcc@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <776b67b2-2405-36f5-f072-78f33ae59fcc@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 19/01/2023 11:55, Bryan O'Donoghue wrote:
> On 19/01/2023 03:11, Bjorn Andersson wrote:
>> On Wed, Jan 18, 2023 at 11:11:00AM -0800, Stephen Boyd wrote:
>>> Quoting Krzysztof Kozlowski (2023-01-15 06:35:23)
>>>> On 13/01/2023 21:28, Stephen Boyd wrote:
>>>>> Quoting Krzysztof Kozlowski (2023-01-13 06:58:59)
>>>>>> The CPU PLL clock node does not use OPP tables (neither driver).
>>>>>
>>>>> What device is qcom_a53pll_get_freq_tbl() operating on?
>>>>
>>>> On its own, internal table. While of course driver could be converted to
>>>> operating-points-v2, no one did it within last 5 years, so why it should
>>>> happen now?
>>>>
>>>
>>> The property was added mid 2021 by Shawn[1], that's not 5 years ago. I
>>> guess there were plans to add an OPP table that never happened[2]? Is
>>> Shawn still working on this? If not, we should revert the OPP code out
>>> of the driver.
>>>
>>
>> @Bryan, what do you think about this?
> 
> I'd be in favour of starting the CPR patchset instead, which depends on 
> the opps.
> 
> I think @Fabien has been waiting on the core 8939 dtsi, I also think the 
> dtsi is close enough to merge that we could reasonably initiate the CPR 
> stuff.

So you would make use of operating-points-v2 property? Then probably we
also miss opp-table, but anyway this patch can be dropped then.

Best regards,
Krzysztof

