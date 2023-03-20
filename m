Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA3B3C761A6
	for <linux-clk@archiver.kernel.org>; Mon, 20 Mar 2023 18:08:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229844AbjCTSIu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 20 Mar 2023 14:08:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230289AbjCTSI3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 20 Mar 2023 14:08:29 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D32F1A644
        for <linux-clk@vger.kernel.org>; Mon, 20 Mar 2023 11:02:22 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id t5so13353893edd.7
        for <linux-clk@vger.kernel.org>; Mon, 20 Mar 2023 11:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679335291;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JM+VTccTgKKJhcpvDtZyUzpHTVkC1zUM89tHGOsd2Eg=;
        b=MdWkwWoq7eQtYUJNjtH28Ms0rmVkvJlQH+jCn9GbablKI+9IejS9SYyUE3lKQjrh88
         pmOECRjw/ekd353EZ1btInyv/ZVibh75SGpYYOsQDzCd0ysKAD3psQ4yAqAR3cbdgXSy
         7+cNpyuxIESUl8AZzNif7ebGe6Oqjs+CksesgJe3tasud+kgSbi/JDEZ6/T2qaaMU/5r
         GO8YaT8bMrPH0CBptDjHyRRfJFOtNR00YGFYzsOQbDf3/7MVXa/dUZqR5GE4sUBNByx4
         knrqxc+HqwfvGeLM5TGRd5h5JqatjiNsvAYyufZ+t2O8zpZ8/lJYmJCR7aKnD4kAwO4l
         Y57g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679335291;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JM+VTccTgKKJhcpvDtZyUzpHTVkC1zUM89tHGOsd2Eg=;
        b=P8FUgB/aHD7AL0Q1HbHRxoA/rzpiZSmnhJzDI6ABJCtodfLyv8jQihu9rCpn+fAJHQ
         AYEQijfwh1xsyxQWE4L99LvE27GchJW/yTbIOj1biOcFBZzp34Ry6RropEuIvyQAur71
         MYUGtTUrEqQQ2rXgybsmlBhj0SUxWW22Y4zLdhtouSmY+rwONaKIZT1rB9Co5ykio3nZ
         cRHTEhiVwVDbXkSLR06axBdKw1MEzDMjyBo6x9cHTYrk3Ob2gWSqGIMkeerzu0NwcE+w
         0Rv9NzUrrKqQS1aQzk5AZpspMLEIT8IM4OkSqNnFPUozCaS4ENf4JsrGtaFHtvsmuTBt
         Kmhg==
X-Gm-Message-State: AO0yUKUcOoOKNtiy8W4Z/9GclM5R8X8eRRfoMQVA0jJQyRXZp2j6cWsq
        J94L+4xiqOwkWPwNCoYRBc1Q1A==
X-Google-Smtp-Source: AK7set+eCZFLAqmq1uV0YjgWysTK6Ve+/pjp/6F8eiwl8cl3hKzNoCy1TIr7y87uTAkPVVkY4oZiVQ==
X-Received: by 2002:a17:906:3bd1:b0:931:cac0:60ef with SMTP id v17-20020a1709063bd100b00931cac060efmr9813235ejf.50.1679335291656;
        Mon, 20 Mar 2023 11:01:31 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:458e:64e7:8cf1:78b0? ([2a02:810d:15c0:828:458e:64e7:8cf1:78b0])
        by smtp.gmail.com with ESMTPSA id jj19-20020a170907985300b008c327bef167sm4710779ejc.7.2023.03.20.11.01.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Mar 2023 11:01:31 -0700 (PDT)
Message-ID: <5109c01b-48bd-2854-3f42-bf8ef8b4a821@linaro.org>
Date:   Mon, 20 Mar 2023 19:01:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 01/10] dt: bindings: clock: add mtmips SoCs clock device
 tree binding documentation
Content-Language: en-US
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>,
        linux-clk@vger.kernel.org
Cc:     linux-mips@vger.kernel.org, tsbogend@alpha.franken.de,
        john@phrozen.org, linux-kernel@vger.kernel.org,
        p.zabel@pengutronix.de, mturquette@baylibre.com, sboyd@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        matthias.bgg@gmail.com, devicetree@vger.kernel.org,
        arinc.unal@arinc9.com
References: <20230320161823.1424278-1-sergio.paracuellos@gmail.com>
 <20230320161823.1424278-2-sergio.paracuellos@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230320161823.1424278-2-sergio.paracuellos@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 20/03/2023 17:18, Sergio Paracuellos wrote:
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - ralink,rt2880-sysc
> +          - ralink,rt3050-sysc
> +          - ralink,rt3052-sysc
> +          - ralink,rt3352-sysc
> +          - ralink,rt3883-sysc
> +          - ralink,rt5350-sysc
> +          - ralink,mt7620-sysc
> +          - ralink,mt7620a-sysc
> +          - ralink,mt7628-sysc
> +          - ralink,mt7688-sysc

One more comment - this and maybe other compatibles - have wrong vendor
prefix. This is mediatek, not ralink.


Best regards,
Krzysztof

