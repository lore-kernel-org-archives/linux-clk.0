Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59D9FC77B7A
	for <linux-clk@archiver.kernel.org>; Sat, 13 May 2023 18:28:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230006AbjEMS2a (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 13 May 2023 14:28:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231578AbjEMS23 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 13 May 2023 14:28:29 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A11231BF9
        for <linux-clk@vger.kernel.org>; Sat, 13 May 2023 11:28:27 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-50bd2d7ba74so99161097a12.1
        for <linux-clk@vger.kernel.org>; Sat, 13 May 2023 11:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684002506; x=1686594506;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/skyL1sLWdeVWQOTLH4B/eNUzzrc9hV+v4n2aX70iXk=;
        b=G0WSmFIDrbVpJnxA9vpq/+boMjF9sbPpuRcq/wRTF+rvSiPClVefSbA/Jm14QEe6PX
         BXt+NA2Bbavm3P/r6lUp+m42FltmWO2O2Eo+W9Y2YjVaObvHtfcVQeKMGEkhMIP1EvHr
         RxYaVGxah6XG4y7V8ffKGPej4l7rM/TxK2jSHEWLR6AIplNAhqjjLptXJAfQnbBd6ooD
         dk71FI55LsAlOFey7nU7iP4DPulUDmZiLTi9pfMSkcXAZ4VYcABlBQM1RiXRIfEy0JJN
         snHoVzbzI6sxKlgJO4SlWsiBWaJXpjiaSjNi02viIIhOjY7O9QniU+IXRz7CDIAVh2c1
         n5vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684002506; x=1686594506;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/skyL1sLWdeVWQOTLH4B/eNUzzrc9hV+v4n2aX70iXk=;
        b=graogOQIIZvhCQLGZFUNRghYkeU7Mv2UCqUR/CAK8gf0p2j1t2Oyw6F1xILAPMGqjX
         rm49LZXO+POdQwtS2dig5VKuwA8hML2ud/QprEFmmSQ0WO7xewdvwk+ICWx72QBJEi6m
         rMRxaeu6gQjWYwn0JJAgAPs05djMl9lWu4RVKdD9D8qVF7kFdv88L25i7W+Nflkll4dQ
         yIAcqqsADItSaCgjlYDkrhgpW4E7IefNzf53pjnzqXRri2rDvVz6MQWyjPPgluxSojbD
         641hBOTrXq/x9/xhTg5pKl3PqjyrPS2Di+1vjXZbJDb/jE/exzuv2NylDMqSB3EazpPX
         97Zg==
X-Gm-Message-State: AC+VfDy5SCCXQICO4BZU/8hrVqjBnuAYSNVt64tnwllxWGgPCW8kBgH8
        u58gEvnTxwnWmwS0h/1e7jO2Yg==
X-Google-Smtp-Source: ACHHUZ6BZjAGfoNRaV4SZYpzLVlE5wxvvxIlWnwclnXWyUvW+KjYeL4jTHPXBIuhzNmNzRxBc6Fsmw==
X-Received: by 2002:a17:907:1c8c:b0:965:cac1:53ad with SMTP id nb12-20020a1709071c8c00b00965cac153admr28615039ejc.8.1684002506136;
        Sat, 13 May 2023 11:28:26 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:ba68:e5c9:694e:c6e4? ([2a02:810d:15c0:828:ba68:e5c9:694e:c6e4])
        by smtp.gmail.com with ESMTPSA id de9-20020a1709069bc900b0094e6a9c1d24sm7172177ejc.12.2023.05.13.11.28.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 May 2023 11:28:25 -0700 (PDT)
Message-ID: <5cb38be4-a27f-dc1a-cbb9-c195505a9e7c@linaro.org>
Date:   Sat, 13 May 2023 20:28:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 01/13] dt-bindings: clk: g12a-clkc: export VCLK2_SEL
 and add CTS_ENCL clock ids
Content-Language: en-US
To:     Neil Armstrong <neil.armstrong@linaro.org>,
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
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v4-1-2592c29ea263@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 12/05/2023 15:11, Neil Armstrong wrote:
> Expose VCLK2_SEL clock id and add new ids for the CTS_ENCL and CTS_ENCL_SEL
> clocks on G12A compatible SoCs.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/clk/meson/g12a.h              | 1 -
>  include/dt-bindings/clock/g12a-clkc.h | 3 +++
>  2 files changed, 3 insertions(+), 1 deletion(-)

Bindings must be a separate patch from the driver changes. If this
causes bisectability issues, this means entire solution breaks ABI and
is not appropriate anyway...

Best regards,
Krzysztof

