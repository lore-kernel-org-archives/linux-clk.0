Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74E31C77B73
	for <linux-clk@archiver.kernel.org>; Sun, 16 Apr 2023 18:09:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229647AbjDPSI7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 16 Apr 2023 14:08:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229598AbjDPSI7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 16 Apr 2023 14:08:59 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F54BE47
        for <linux-clk@vger.kernel.org>; Sun, 16 Apr 2023 11:08:57 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id xi5so58526041ejb.13
        for <linux-clk@vger.kernel.org>; Sun, 16 Apr 2023 11:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681668536; x=1684260536;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kxB9zxzWLE5n5MSYnySx6Z8ocqYMh1ED0/HN+v6ZZWs=;
        b=YbLI0sQ9bbw3+6CBqR/PcHUlMDJpNITpQ40dX93qLp4ZAurcmDYr05rb5MOKUNzucA
         SDoIqpTACjxY4HIdIlfUWRNPkYNCHuloErydK6uCKPtOeBPFzzeaLMSYNyx2okCXsnIR
         sF8yZ+SP6RSUvT7i4K8WZTNdEnhl4oxlIGa0BPviPceC1GjoqgI18vysk1VRBusULlpF
         unqFYmKb7VxFLGsvQPwuQd2Goa+uRADPxRdYX8aBgAgLd5MYXayqKIUXIZq3AxtaIEeo
         WtNHzPLKPQ0vOPXxY1jRCqZbQtkOc0rX3qVLxBA42AGqI+/lWnojEr4xtK+/U8IJDmrL
         IRwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681668536; x=1684260536;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kxB9zxzWLE5n5MSYnySx6Z8ocqYMh1ED0/HN+v6ZZWs=;
        b=iooXr9mkJRErMgc2Aw1K8LNfS0znRZ5EgRZBj07Fg5zGkEw9GxJmrodoRhTo7QG/LK
         GmQYgmeQ+y5xqvuOkCOH6sxKZQNMDa5jOBMBnMdMWUHw3xBMfhPFneyVrw54RdFabF0s
         q7+8xnncDhgjYMUjji6ASv6siGI99y6k8vlXAPg9BIR3TV5TQHWM42KAuI4tVn/6rNUR
         /FIHA8criJmLU7w7fKTwILOK24MW7o3NKr/JLGOlFlx8oUK0WzbJRmOYE8crX/4MTGzI
         oSpHAQaB2FOoA58lBvdLo1HwWekWSto/UQttY1+HAxJF7g+6tDaRCxxRN/t8KYtwS6Jf
         EsVw==
X-Gm-Message-State: AAQBX9eE69p71sdKE1N08vi/dQcyS23i6vbSP/2lci8ExjafaLuQJtX5
        imC2viz+TIJ2Ncm7yu8DEiJ8Ow==
X-Google-Smtp-Source: AKy350YqQnlZ2zVfjEKsAm/m6no/T65ytxxsJ+qKSxgm1A9nbbbXmXwrfibKAVj9yboN2+/Dg1+1KQ==
X-Received: by 2002:a17:906:e282:b0:94a:9470:577e with SMTP id gg2-20020a170906e28200b0094a9470577emr4625964ejb.44.1681668536102;
        Sun, 16 Apr 2023 11:08:56 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:f9e3:1d38:66a7:ae92? ([2a02:810d:15c0:828:f9e3:1d38:66a7:ae92])
        by smtp.gmail.com with ESMTPSA id sc22-20020a1709078a1600b0094f75d6e974sm386565ejc.42.2023.04.16.11.08.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Apr 2023 11:08:55 -0700 (PDT)
Message-ID: <4fbf6436-406a-9158-08f3-7319fbb8c034@linaro.org>
Date:   Sun, 16 Apr 2023 20:08:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 09/12] ARM: dts: Move common Exynos4x12 definitions to
 exynos4x12.dtsi
Content-Language: en-US
To:     Artur Weber <aweber.kernel@gmail.com>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>, soc@kernel.org,
        Russell King <linux@armlinux.org.uk>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Kukjin Kim <kgene@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        linux-phy@lists.infradead.org,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20230416133422.1949-1-aweber.kernel@gmail.com>
 <20230416133422.1949-10-aweber.kernel@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230416133422.1949-10-aweber.kernel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 16/04/2023 15:34, Artur Weber wrote:
> In preparation for the re-introduction of the Exynos4212, move
> their shared definitions to a separate file. Rename the pinctrl
> definitions accordingly, and adapt the Exynos4412 DTSI to these
> changes.

This should be actually revert of the commit you are referencing in all
other patches. Why is it not?

> 
> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
> ---
>  arch/arm/boot/dts/exynos4412.dtsi             | 645 +----------------
>  ...2-pinctrl.dtsi => exynos4x12-pinctrl.dtsi} |   4 +-
>  arch/arm/boot/dts/exynos4x12.dtsi             | 665 ++++++++++++++++++

Copy should be detected. Play with -M/-B/-C arguments to format-patch.

Best regards,
Krzysztof

