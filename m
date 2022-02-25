Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FE4EC433EF
	for <linux-clk@archiver.kernel.org>; Fri, 25 Feb 2022 09:28:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239087AbiBYJ25 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 25 Feb 2022 04:28:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239078AbiBYJ24 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 25 Feb 2022 04:28:56 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9F541795C6
        for <linux-clk@vger.kernel.org>; Fri, 25 Feb 2022 01:28:24 -0800 (PST)
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 299153FCAC
        for <linux-clk@vger.kernel.org>; Fri, 25 Feb 2022 09:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1645781303;
        bh=kGwkKU8L/fn7aVH4SNRnVpay291DKpyh1Xqm8qPEDW0=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=u9uI0FeEI+nougT15+fBtZ/gs9REL/PNcYi0pXWGm5BgBJq0W0BYcB/M+wimVDIej
         KFE2bnrTgkpLn/kCDvd75nkXtRbG+NdHqR1AntoD8WWGlJywbx7J6lr/2Q8CFu+3R5
         RQzYVKRYwRd5Rxurkoq2UTEjNBRLhYc98HkPEe/e6XZW0eB0lYXs+I5hyIDW9u5RpL
         Cwtrn8UbbNx9i2cKMtL32JZho2rLjbK2q0k68wvNsE2mZcMWMPKttKl/ybL+U5I8Ti
         sKFEbro4RM6yKLZV90hjtqIxOrpiaHUICe7RIc4rDnwbmUiooxBwQJfC+y6dRhP3pD
         Me9m6HlULn4mg==
Received: by mail-ej1-f71.google.com with SMTP id k21-20020a1709063e1500b006d0777c06d6so2409306eji.1
        for <linux-clk@vger.kernel.org>; Fri, 25 Feb 2022 01:28:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=kGwkKU8L/fn7aVH4SNRnVpay291DKpyh1Xqm8qPEDW0=;
        b=MakUa42ZCTpj8NlK63JA4R1Ia30oStqTnuqL53uv0vLEXvu+xHbKnDza4+LxSfyvR5
         5/gWt4xNwRz+h15ImvE0zQepZ2lZc6UFUw02Ey3DAIsz7yoT0PgF3NOGFfBPjGpvp3NB
         Ec2ardLOrxTfv+5TvG/TooaVv0ZP7HvNn8YnyssaUnzX1Ji2SUazO5TOax6SfG5uYIQm
         j1G901IEd1LldSlbPNe0A+RDq62np7RcQ2HhJ//nAbqNcPxqkiPX6CyVsP+ChE+Msg74
         7YuXIX1UXUOwM6k3m0rd8P+8YsX1WKdMifNB5J7AS/T6alxcOnebPxX8463Rem7moL1u
         MbGA==
X-Gm-Message-State: AOAM532T5R1oI3sJDAlL/FSjSTKcp79IaWDiMwVaa9kqpxMO/CpB6vIT
        cTUjt6UtWRttRQlBN8ZMg8YWMVR3Tb5eVmL5W4QOJ97t5OcispW8ml6VNASIz6zoL8vgcEDhis2
        eUQ8A2WnimR2aRDtQAySXk9xcMsJ/tF58Wk5fOA==
X-Received: by 2002:a17:906:4d51:b0:6b8:78e0:565a with SMTP id b17-20020a1709064d5100b006b878e0565amr5351323ejv.587.1645781302265;
        Fri, 25 Feb 2022 01:28:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz8c3ZhY7jr+/X0AvJodZEzeopQeOKXYiLB34QdycL3m21MYR4q1dg62gQBFvoYHXY7gyalew==
X-Received: by 2002:a17:906:4d51:b0:6b8:78e0:565a with SMTP id b17-20020a1709064d5100b006b878e0565amr5351308ejv.587.1645781302107;
        Fri, 25 Feb 2022 01:28:22 -0800 (PST)
Received: from [192.168.0.130] (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id d8-20020a170906304800b006cdf8a1e146sm770803ejd.217.2022.02.25.01.28.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Feb 2022 01:28:21 -0800 (PST)
Message-ID: <f77b2f7d-9a22-3e1f-a5f4-90766bdc232f@canonical.com>
Date:   Fri, 25 Feb 2022 10:28:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 01/13] dt-bindings: rcc: stm32: add new compatible for
 STM32MP13 SoC
Content-Language: en-US
To:     gabriel.fernandez@foss.st.com,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220224160141.455881-1-gabriel.fernandez@foss.st.com>
 <20220224160141.455881-2-gabriel.fernandez@foss.st.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220224160141.455881-2-gabriel.fernandez@foss.st.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 24/02/2022 17:01, gabriel.fernandez@foss.st.com wrote:
> From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> 
> New compatible to manage clock and reset of STM32MP13 SoC.
> 
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> ---
>  .../bindings/clock/st,stm32mp1-rcc.yaml       |   2 +
>  include/dt-bindings/clock/stm32mp13-clks.h    | 229 ++++++++++++++++++
>  include/dt-bindings/reset/stm32mp13-resets.h  | 100 ++++++++
>  3 files changed, 331 insertions(+)
>  create mode 100644 include/dt-bindings/clock/stm32mp13-clks.h
>  create mode 100644 include/dt-bindings/reset/stm32mp13-resets.h
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
