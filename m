Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 107D5C433FE
	for <linux-clk@archiver.kernel.org>; Mon, 10 Oct 2022 14:58:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230042AbiJJO6B (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 10 Oct 2022 10:58:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230087AbiJJO5a (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 10 Oct 2022 10:57:30 -0400
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com [IPv6:2607:f8b0:4864:20::82b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A06013B73D
        for <linux-clk@vger.kernel.org>; Mon, 10 Oct 2022 07:57:16 -0700 (PDT)
Received: by mail-qt1-x82b.google.com with SMTP id g11so1962877qts.1
        for <linux-clk@vger.kernel.org>; Mon, 10 Oct 2022 07:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/TqmOJgo5WeQh0yrg49gDDHKn/XdEuTDlUHCBrMIYvg=;
        b=DWeVbGlurVIlmFpRkDglTwWvoCPyX6C2yepr7RJq2skttu3h/Y3Vcf6aYCk8ovS+xl
         /iC4ty4wXUBchVGftaQVR7E8StAW75HzqNHJd7jQ9sQpi4VuYOF/8LLuvwTOACa6b0CA
         cUo4unE4ktaLiMUPDSC0v8VLHasfsQZM6HS3gfDoHXPk2y9NqJtQ/DN6j4orFCfKafC0
         5iZqYgicR7Paun72B3mLCTliv6t6b5fEX0M48PYp2x7ljBxLb54e4wQiUHOPAWpT+Zg1
         IS4pTX+A0f6XkrM5Ab+mu/Dwo3tVpyemagfJ7gV5XXLT14F5Wod348D1/zwydx0Myt0L
         cEGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/TqmOJgo5WeQh0yrg49gDDHKn/XdEuTDlUHCBrMIYvg=;
        b=eGAJusLNMypKYwGwrSUDPT6HY5OU2u57sno+Js5TuGA5tOipuLvBwt6yHlT9I36coL
         GYf70ChHw9WmeodpPx24ZF1Y9LxAc9EAcZffEUtP7mqiBF3VvOCn5eu5M6ujUWhtu6+o
         mYJfut820YcsEjnjdY18ur4riHFm/fO6bxeE5OMcRcjtCh+I0LahqzQ7LhY0RrV+bEkl
         e/3Oo1DlWTgx609kmArPW/XEgTG7Emf0bjiKHf9ig/6/ZJmrc0OcJc9Alg1j28QSLvp3
         OwO0evBIut0qEqyj+AEsZawhp8yDlB8lcGp3qCB4EIwU6dZ+uCdPQ51TShbbJc160Dqk
         jDOw==
X-Gm-Message-State: ACrzQf28C32SzAeTkRN500u9Dz8jdOIqRwEi8Hgik+m/aaNo10iJBL/M
        VmKG5ZFLOKZ1pdovL+cF0JMG/w==
X-Google-Smtp-Source: AMsMyM7HpA4Y/zi55GTte5bpmkf2QgWTmHeH3+E6fKGv5WzzlEH5yQGtbUDRMpQqUEvklfWPcPL1Rg==
X-Received: by 2002:a05:622a:547:b0:399:b22a:de4d with SMTP id m7-20020a05622a054700b00399b22ade4dmr5191285qtx.115.1665413815789;
        Mon, 10 Oct 2022 07:56:55 -0700 (PDT)
Received: from [192.168.1.57] (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id s187-20020ae9dec4000000b006ce76811a07sm9952409qkf.75.2022.10.10.07.56.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Oct 2022 07:56:54 -0700 (PDT)
Message-ID: <2e89fc3a-bc54-17e7-d352-25db877172ff@linaro.org>
Date:   Mon, 10 Oct 2022 10:54:43 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH 8/8] MIPS: DTS: Ingenic: Add support for the JZ4755 SoC
Content-Language: en-US
To:     Siarhei Volkau <lis8215@gmail.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jiri Slaby <jirislaby@kernel.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20221009181338.2896660-1-lis8215@gmail.com>
 <20221009181338.2896660-9-lis8215@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221009181338.2896660-9-lis8215@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 09/10/2022 14:13, Siarhei Volkau wrote:
> Add preliminary support for boards based on the JZ4755 SoC from
> Ingenic.
> 
> It is a low-power SoC with a MIPS32r1 SoC running at ~432 MHz, and no
> FPU.
> 
> The JZ4755 SoC is supposed to be newer than the JZ4725B SoC, but its
> internals are very close to each other. So JZ4755 DT is reusing many
> JZ4725b drivers because JZ4725b support in the kernel appears earlier.
> 
> Signed-off-by: Siarhei Volkau <lis8215@gmail.com>
> ---
>  arch/mips/boot/dts/ingenic/jz4755.dtsi | 439 +++++++++++++++++++++++++

How do you build it? How do you test it? It's basically non-compillable,
dead code. You need a board.

Best regards,
Krzysztof

