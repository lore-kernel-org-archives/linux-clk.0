Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 078D1C25B4E
	for <linux-clk@archiver.kernel.org>; Sun, 22 Jan 2023 13:49:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229917AbjAVNtu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 22 Jan 2023 08:49:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229944AbjAVNtt (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 22 Jan 2023 08:49:49 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76EE11DBB2
        for <linux-clk@vger.kernel.org>; Sun, 22 Jan 2023 05:49:45 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id c10-20020a05600c0a4a00b003db0636ff84so6784626wmq.0
        for <linux-clk@vger.kernel.org>; Sun, 22 Jan 2023 05:49:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n4HC6qouSeVZQItRIxIIESZp16atoc5adtJd1Q2QlF4=;
        b=qt075DMCqQcWv5lP/Xxgv/hcseDrBbg4U34aA9gISFu1+SS3LcRFB8hXYMFh9ypZJl
         rTMG8CPT4091NvRdr+mXFgP0ysUKBy264h0a+bGcsXMdJ556LaB9F/ilC0rzPs3Rbj5e
         xFPu498zf2ZIFr5B6FPeuNurawFk9/s61rUNj1FNIJeuv46YfZSAujb84SL8vcTOGR0T
         rhyGZt69TPFalqeowYPKCsLCAkzptu2HlnFJV8KzoZz5i96qrLK9b58m411uLK9CPmBA
         PgsyZ25xFan4dcbH63A6hbnglAIxnEhxCkr5TftyVFOfxTA5jGnuWz9125yYnTCHNK/+
         Kgwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n4HC6qouSeVZQItRIxIIESZp16atoc5adtJd1Q2QlF4=;
        b=eC0xKg4ONJEnxi8Tqi7+MyRN3FgwqXliEN3sRUTChg8sbyy4S/P7U8xbB0VV9jaC4b
         P4vM9RPxnTorvaSvS6qxhI2x1nL9Wp7AHjdlGD5j1IxAwY9Ym+cL0ESVXtQDPMguwIzE
         FFTo6S/53hX2jKI8mO8lFaxKK9b8YYC1L1u3YjWIP0vCOg6nWYTwwXvaw6FAa97PZxDZ
         jA5OaxKRX4uZ2EbMb5kDzO6K4J0bBweFOSSGXj56OlxvjFWdKg5obBIyKR4T38eatho9
         JrJo7/mjHKywd0x8Bp9Rn6FoOzv+Uy/6ImJF9F7vqctKHbrTM5R4RFNm8EhniX6Hzp8h
         0WOw==
X-Gm-Message-State: AFqh2ko4HQQv/ornVsI3H3Kv6Jk+mJd4OBp7jgC2E/AYNEwMCD6neSYn
        eM/ijaVEUCt5lKNXDJr90B7dvA==
X-Google-Smtp-Source: AMrXdXtWzk4h7L0/T2hQcONOtPAv9+Zq8uAXQpraPYwgNWCeiMl3ld1ZvI9Y0ZWGaO3EmBiDSjkd5Q==
X-Received: by 2002:a05:600c:539a:b0:3d9:ef72:190d with SMTP id hg26-20020a05600c539a00b003d9ef72190dmr20265304wmb.19.1674395384068;
        Sun, 22 Jan 2023 05:49:44 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id c2-20020a05600c0a4200b003daf6e3bc2fsm18894274wmq.1.2023.01.22.05.49.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Jan 2023 05:49:43 -0800 (PST)
Message-ID: <25410783-17e5-35de-3be9-930f50584196@linaro.org>
Date:   Sun, 22 Jan 2023 14:49:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v3 2/3] dt-bindings: clock: mediatek: add mt7981 clock IDs
Content-Language: en-US
To:     Daniel Golle <daniel@makrotopia.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     Chen-Yu Tsai <wenst@chromium.org>,
        Miles Chen <miles.chen@mediatek.com>,
        Edward-JW Yang <edward-jw.yang@mediatek.com>,
        Johnson Wang <johnson.wang@mediatek.com>,
        Fabien Parent <fparent@baylibre.com>,
        Chun-Jie Chen <chun-jie.chen@mediatek.com>,
        Sam Shih <sam.shih@mediatek.com>,
        Jianhui Zhao <zhaojh329@gmail.com>
References: <cover.1674233728.git.daniel@makrotopia.org>
 <367c21c111458abf35170b37d51d023a04a04510.1674233728.git.daniel@makrotopia.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <367c21c111458abf35170b37d51d023a04a04510.1674233728.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 20/01/2023 18:24, Daniel Golle wrote:
> Add MT7981 clock dt-bindings, include topckgen, apmixedsys,
> infracfg, and ethernet subsystem clocks.
> 
> Signed-off-by: Jianhui Zhao <zhaojh329@gmail.com>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

