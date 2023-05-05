Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A948C77B7C
	for <linux-clk@archiver.kernel.org>; Fri,  5 May 2023 13:25:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232507AbjEENY7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 5 May 2023 09:24:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232514AbjEENYu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 5 May 2023 09:24:50 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 477571F4BD
        for <linux-clk@vger.kernel.org>; Fri,  5 May 2023 06:24:49 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-965fc25f009so15134466b.3
        for <linux-clk@vger.kernel.org>; Fri, 05 May 2023 06:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683293088; x=1685885088;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=88pW8qWBWl/gwLo1P5APo+OBYDB/KVhHfdTYqAO9eAY=;
        b=AYnqjAD5rvuD0ZLSQ5l7Hx9KJ9x+C+/56HPgqiMC3wy3USc+lyae/7wy9iNF7t0vxb
         lvrAaaQBdc0S1YkRVHZo+0sD3UDvZNQSkuwx6CPFfAUibMm1mHqyPM3TMSp351Jn6VIt
         VrwvYV30SSKTYqbhmhusdZFioAnNVpYUwfVWEwLuG11XE9PNhZcecwjcCY9Erbtv5Uci
         FHYoc8dBhR6TNPell11XM5U3IEOj8EjSZfnQQpI5Rlzhy3y9OnheMWlcHj+ztw3baaDJ
         PIuHKw9ZbJ/toYNj6//FTWJMhfHsi3HUbmsWXGeWMBjxmNcnAfPDv5rAZ3pJvbLAKiNv
         r/cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683293088; x=1685885088;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=88pW8qWBWl/gwLo1P5APo+OBYDB/KVhHfdTYqAO9eAY=;
        b=HYlGktgju787EDfHS7Wjy3Yuzyiv+zhERH8NB5MnRpL5tQ3Wvdc/CLBPK8QegCYpUU
         yo3OTuGOUe5tVcEx3cHhSrqbcaRc4jXNvXaXmzZScQGX7pTFptrQKqKywh+oWZIS94YW
         g3Stv8uh89UnoEB0z9j7lXdO9Zr5aufg9maSBh2R0Zw7C4+Tld7YxCOGwSCRDCy1FeN3
         8P9Tqhg+i3ftEfz/V7HJzuoXZvJiBrmLFyOISHnfox7LnYVukKe+PhyXU47o1pHXz9TH
         Dok0DkPNoiNDhYkp4TZEfc5p2d0adb/3AxGs1u0AAXAnQ6Us5a23psKvfCg7+S1/VmUr
         KmkQ==
X-Gm-Message-State: AC+VfDz6CbdbxlMjPo2uQDqkLAmL9aDazNZo+bsLFt9r7WfEVX0vRv+6
        XGg135HgPElKl4ZIBfkHERg4Gg==
X-Google-Smtp-Source: ACHHUZ7tE6qiopnAwq868iND3B4v8MQrCg6KKrBzkP+dMPCgtv9gp6t7xiaJTraOtyF4Q0MGc7vvBw==
X-Received: by 2002:a17:907:7d94:b0:961:b0:3e0e with SMTP id oz20-20020a1709077d9400b0096100b03e0emr1314712ejc.30.1683293087751;
        Fri, 05 May 2023 06:24:47 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:52e:24ce:bbc1:127d? ([2a02:810d:15c0:828:52e:24ce:bbc1:127d])
        by smtp.gmail.com with ESMTPSA id i19-20020a17090685d300b0094ebc041e20sm930557ejy.46.2023.05.05.06.24.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 May 2023 06:24:47 -0700 (PDT)
Message-ID: <6582da01-03c0-77cf-9646-fc536ceb9b3d@linaro.org>
Date:   Fri, 5 May 2023 15:24:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v2 1/2] dt-bindings: reset: mt8188: add thermal reset
 control bit
To:     Runyang Chen <runyang.chen@mediatek.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
References: <20230505131308.27190-1-runyang.chen@mediatek.com>
 <20230505131308.27190-2-runyang.chen@mediatek.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230505131308.27190-2-runyang.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 05/05/2023 15:13, Runyang Chen wrote:
> To support reset of infra_ao, add the index of infra_ao reset of thermal
> for MT8188.
> 
> Signed-off-by: Runyang Chen <runyang.chen@mediatek.com>
> ---
>  include/dt-bindings/reset/mt8188-resets.h | 5 +++++
>  1 file changed, 5 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

