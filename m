Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B002C636D7
	for <linux-clk@archiver.kernel.org>; Thu, 23 Feb 2023 10:18:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233412AbjBWKSn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 23 Feb 2023 05:18:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234103AbjBWKSn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 23 Feb 2023 05:18:43 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97B29460A2
        for <linux-clk@vger.kernel.org>; Thu, 23 Feb 2023 02:18:40 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id b12so40239109edd.4
        for <linux-clk@vger.kernel.org>; Thu, 23 Feb 2023 02:18:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3/aXgtpRAAmBlOXzSkXhzdZkmLPBehTIrS5g09JIRzo=;
        b=RR/sD/ukR85nWBQeNICDAifane3oP+7Bybn5qjnm19TgMnsrsto6pCq9Pt+E3r13jT
         /P33bRNSNAWwKjnNcsW6fC/qtxrrpIGPOSrGnGIOIPLXAEV1mMSqf4V65f9t1N/tJJvi
         zYpEMUCtAC/DeUFJ9H26EmKrfC1vcBCL1mtGV1E0zOLx/8vGcdRDc/4GaftPQSLkXg5k
         atRKjrpbdKdEG3ljIXHnHMNCAiVnoTnEawL0jNuzzEKBakgXAAtvAb0h38oej3Lepgox
         17UopHUpoBz7rlcmZIh51n1D2eBedl7ret75IOupB17G1j8ueN5xpqjYS4fVjwGgXOoD
         xXEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3/aXgtpRAAmBlOXzSkXhzdZkmLPBehTIrS5g09JIRzo=;
        b=A0kYNM9jOegMDvWF/ys8OWT5C6AdJUzSlwMQVfR5Mrug5p58vDIAjLrfZ/r+U0xvG/
         Yrf9Ww4Z6swHSEj4Hnwb83muLF2u9T0VOrtmtlGKPzbozmOTznI9SaXVdhd1rvi3d7aB
         IzD2etQ/wDccle8T2iUv5OdwSwOmxiVTbrBgp1YjIT6uAKf2yBpooIp6KE+gamDkuZSw
         VTdcrly2wZ0K0wa/GId/o1zKt4dbNfpIk7pL66m0zINMF+2yg5j5S17g4Ri75mFBWRsP
         3waOgpwkGCFZ/Ky+1YFeRpVTUdh24PXpI8/045yDYETF2Z3jL9D4PmDyUj4aqwKPgTSZ
         M12g==
X-Gm-Message-State: AO0yUKVMGL5lKSsmC0scVvTp46IaYjcHWs1anp38KufAIFi5snhab3gb
        DeprDCgPSHaCWM8XN1dEJxTS9w==
X-Google-Smtp-Source: AK7set+auc5RST/uYYMVLzBpn9BjsWrPQ8Bb/2gvNFfSEYyoeQt+g8Sqq38q4SabwCeG1Q4hXbGabw==
X-Received: by 2002:aa7:d88c:0:b0:4aa:a4e8:8d5a with SMTP id u12-20020aa7d88c000000b004aaa4e88d5amr11193144edq.33.1677147519115;
        Thu, 23 Feb 2023 02:18:39 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id g9-20020a170906348900b008b11ba87bf4sm8288218ejb.209.2023.02.23.02.18.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Feb 2023 02:18:38 -0800 (PST)
Message-ID: <ace28a97-b43e-4b24-52d0-93bc21263aff@linaro.org>
Date:   Thu, 23 Feb 2023 11:18:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH RFC 1/4] dt-bindings: clock: rename mt7986-clk.h to
 mediatek,mt7986-clk.h
Content-Language: en-US
To:     Daniel Golle <daniel@makrotopia.org>, linux-clk@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Chen-Yu Tsai <wenst@chromium.org>,
        Edward-JW Yang <edward-jw.yang@mediatek.com>,
        Johnson Wang <johnson.wang@mediatek.com>,
        Chun-Jie Chen <chun-jie.chen@mediatek.com>,
        Miles Chen <miles.chen@mediatek.com>,
        Sam Shih <sam.shih@mediatek.com>
References: <cover.1677089171.git.daniel@makrotopia.org>
 <15d718a2d696d29b48668b9ab5531369c537a1e6.1677089171.git.daniel@makrotopia.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <15d718a2d696d29b48668b9ab5531369c537a1e6.1677089171.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22/02/2023 19:09, Daniel Golle wrote:
> Rename dt-bindings header file mt7986-clk.h to mediatek,mt7986-clk.h,
> propagate this change also to mt7986a.dtsi which is the only user.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>  arch/arm64/boot/dts/mediatek/mt7986a.dtsi                       | 2 +-
>  drivers/clk/mediatek/clk-mt7986-infracfg.c                      | 2 +-
>  drivers/clk/mediatek/clk-mt7986-topckgen.c                      | 2 +-
>  .../dt-bindings/clock/{mt7986-clk.h => mediatek,mt7986-clk.h}   | 0

You cannot have bindings and DTS and drivers mixed together. Which
points to fact - you cannot make such change... Also your commit msg
does not justify "why" you are doing it.

Best regards,
Krzysztof

