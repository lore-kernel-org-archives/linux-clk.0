Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68764C63797
	for <linux-clk@archiver.kernel.org>; Mon,  6 Feb 2023 08:14:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229479AbjBFIOP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 6 Feb 2023 03:14:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229919AbjBFIOO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 6 Feb 2023 03:14:14 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0EDDDBEA
        for <linux-clk@vger.kernel.org>; Mon,  6 Feb 2023 00:14:12 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id bg13-20020a05600c3c8d00b003d9712b29d2so10135707wmb.2
        for <linux-clk@vger.kernel.org>; Mon, 06 Feb 2023 00:14:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ePDxyT/u8Kqhxr/nFXRB6Y/lsRv/qmX+1Ra2K4W1UZ4=;
        b=yDTjJTaniLkFNHN/Va60zE9me5I/ocX+6hNKokbNuE4RkW0gEmmJFyBtLjmEatcdZs
         pVRYdKDLcbCQoehiv9zbCMpg+RTNlZZWHk8uzqDbegwVwGzrdDTvMQLg7Mv+BJFa5TnD
         WIzfhYjc4FfoXHUek4MYMyLxQsy9EgkIzF+RpuFLpZt64PYht+M/B7nbMdD3jQgf0zoP
         4j/N/tTBnOipJGohZqo9NOuc9fn8X0kOmm8rjNnIhLAIwbPtO1p7wr2f1J3DIvzjHl6I
         p0cZEmCmLrl9aMmgOGhzlkkeOnM3SQqH4HNNERExXO/4rfNySeSqrM31rlkcC/NpKyEX
         CHFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ePDxyT/u8Kqhxr/nFXRB6Y/lsRv/qmX+1Ra2K4W1UZ4=;
        b=SmH8WMPLPrncpvg3u3o3nazdxAnqzq8sLNb/K/UQtgxctB1lBHVW6GrMH2iP5Q4T1H
         GWpWGOkKD6SwEw9aqfGYGl0wKpVcyCWMO5Fd646vTKzwUo5ZML5Na8xV702ZGOaAh8Ua
         ogrdbX8kH76ukIIlb1oW5dhjwFRdl411s4bJKcEo84WpWNT/yVwueMsFoaBtpIVk4HK2
         0Ns0T5U6OQ1Xx8Hh5wGVxCEwhUdMJUIQAfVB3AfjGeYzcZTv/a8iUtiNPxcI1dcYX78q
         auW2wOhnzUznRZdxKAXjJrnyrGvJFdcEPZA8+PXLda0zOrY319XkRK2xcw4XDcBsscdM
         qZxA==
X-Gm-Message-State: AO0yUKV10SItR+vzths/vMs871drQdmg7hMcys2+ikcI35h3OKYQX/UB
        QW5pVwdeE0RQHQo7K9S9riXbcw==
X-Google-Smtp-Source: AK7set9ZBm8SdWkWa32GKfeHe2SwoK5HaBJJIOMo9SK5Ix2kwtX6TBMZUllvfY5y7kAZEycJOyXqfw==
X-Received: by 2002:a05:600c:35c6:b0:3df:9858:c034 with SMTP id r6-20020a05600c35c600b003df9858c034mr10770454wmq.9.1675671251319;
        Mon, 06 Feb 2023 00:14:11 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id v16-20020a05600c471000b003dd1bd66e0dsm11185749wmo.3.2023.02.06.00.14.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Feb 2023 00:14:10 -0800 (PST)
Message-ID: <a8a2ee18-7160-bf03-6f8f-43f39141742e@linaro.org>
Date:   Mon, 6 Feb 2023 09:14:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 1/2] dt-bindings: clock: Add SM7150 GCC clocks
Content-Language: en-US
To:     Danila Tikhonov <danila@jiaxyga.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        David Wronek <davidwronek@gmail.com>
References: <20230205211257.285997-1-danila@jiaxyga.com>
 <20230205211257.285997-2-danila@jiaxyga.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230205211257.285997-2-danila@jiaxyga.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 05/02/2023 22:12, Danila Tikhonov wrote:
> Add device tree bindings for global clock subsystem clock
> controller for Qualcomm Technology Inc's SM7150 SoCs.
> 
> Co-developed-by: David Wronek <davidwronek@gmail.com>
> Signed-off-by: David Wronek <davidwronek@gmail.com>
> Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

