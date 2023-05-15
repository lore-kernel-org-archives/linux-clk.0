Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 310B9C7EE23
	for <linux-clk@archiver.kernel.org>; Mon, 15 May 2023 16:06:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242421AbjEOQGv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 15 May 2023 12:06:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242471AbjEOQGt (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 15 May 2023 12:06:49 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93C15268A
        for <linux-clk@vger.kernel.org>; Mon, 15 May 2023 09:06:31 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3f50020e0f8so58720935e9.0
        for <linux-clk@vger.kernel.org>; Mon, 15 May 2023 09:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684166789; x=1686758789;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lWOCuNPc2Qhm23nE7fOQTHAU+RRC9bg5RSfsC5uCndw=;
        b=CAUxT2wohMzyPhNhiBK32M6vlIx8hjwrVFS/n+Ot/KTQtHRMY3fI6QG2sJREE1OTod
         q0kxQyT51lSIWKyeNrkRGWvXmM6VYcnE/shvjL4QQ4S/Ff4WEwb01lHxi3kURR4jje9q
         yv2/BxYGfvDvqMI2RPSrnPcYwtM7HmfKOr/IYEnmvKwFcPM2CuyqyquUQzVkKRjTpaKS
         4pHa2UrqLiNvuuDBv5dY0qoYXayT+6jQV7Kf56962q/E1fkquwmzEZ0fxvYAJ9PXlxKG
         h9ALmY7IRxNx1ck0lxQ0q1sJua1B/292RKS3TRum9Xg4Ad2WPIGs06g30e6Xa33ZqHKf
         xnLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684166789; x=1686758789;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lWOCuNPc2Qhm23nE7fOQTHAU+RRC9bg5RSfsC5uCndw=;
        b=WugOZWSzlqHJ9hX+gFQL9mmlmy0VWop3LdvmIgJI5aSHXrE6mmilGVWCGY8kl/lQ5i
         fnWe1/+hDSqM+x4OlAAHIxgIri4iEREkESCn5PwWXUiY1KVp2Vf2iC+Z7wVSmbJ6x9HH
         OZbB4WW3n0yVuZ5T1EfeFngCW3mgyLCAYSW00/JXv7FdfvFybHujRn8jDqzwq3103r0Y
         UIsE7+qE7FQmxAcRU8kFt1k0AK/owjhssiP4RtS7lHDXZW58unFiZaHWBaKdqyWP6MrU
         ceFjTlUfSnov+eSRd3VjsFZY4m4lcT44XaUnb4HX7qNcGvlMHjcNNu4eOl5Y8JwaULE0
         shuw==
X-Gm-Message-State: AC+VfDxvTsohkn+bwyMjZOcCOpFPnO4+O4OhDvJ+Gep3MlzBIQBRULCq
        ibWa7U09FHGj9rt08KN65oDFBg==
X-Google-Smtp-Source: ACHHUZ5y+S1cl668Cm09EQ1NgXHqr+j/kjOw7Ds31xnaNEbo1aQsxXOF8pRWNpL+J37Gpkvap2Ec/A==
X-Received: by 2002:a05:600c:4444:b0:3f3:284d:8cec with SMTP id v4-20020a05600c444400b003f3284d8cecmr24800387wmn.2.1684166789290;
        Mon, 15 May 2023 09:06:29 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:ee7:a396:6195:bb56? ([2a01:e0a:982:cbb0:ee7:a396:6195:bb56])
        by smtp.gmail.com with ESMTPSA id c3-20020a7bc843000000b003f42314832fsm25497766wml.18.2023.05.15.09.06.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 May 2023 09:06:28 -0700 (PDT)
Message-ID: <9fa0662e-8854-05f9-da7f-ec8e08d2badf@linaro.org>
Date:   Mon, 15 May 2023 18:06:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
From:   Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v4 01/13] dt-bindings: clk: g12a-clkc: export VCLK2_SEL
 and add CTS_ENCL clock ids
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     Nicolas Belin <nbelin@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-phy@lists.infradead.org
References: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v4-0-2592c29ea263@linaro.org>
 <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v4-1-2592c29ea263@linaro.org>
 <5cb38be4-a27f-dc1a-cbb9-c195505a9e7c@linaro.org>
Content-Language: en-US
Organization: Linaro Developer Services
In-Reply-To: <5cb38be4-a27f-dc1a-cbb9-c195505a9e7c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 13/05/2023 20:28, Krzysztof Kozlowski wrote:
> On 12/05/2023 15:11, Neil Armstrong wrote:
>> Expose VCLK2_SEL clock id and add new ids for the CTS_ENCL and CTS_ENCL_SEL
>> clocks on G12A compatible SoCs.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   drivers/clk/meson/g12a.h              | 1 -
>>   include/dt-bindings/clock/g12a-clkc.h | 3 +++
>>   2 files changed, 3 insertions(+), 1 deletion(-)
> 
> Bindings must be a separate patch from the driver changes. If this
> causes bisectability issues, this means entire solution breaks ABI and
> is not appropriate anyway...

This is basically how we handled CLK IDs on Amlogic clk bindings for the
last years, the amount of changes is very low and rather exceptional
compared to early development stage.

Neil

> 
> Best regards,
> Krzysztof
> 

