Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10307C433F5
	for <linux-clk@archiver.kernel.org>; Sat, 23 Apr 2022 10:27:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230032AbiDWKak (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 23 Apr 2022 06:30:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234964AbiDWKai (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 23 Apr 2022 06:30:38 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 008D763BCC
        for <linux-clk@vger.kernel.org>; Sat, 23 Apr 2022 03:27:41 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id i27so20735365ejd.9
        for <linux-clk@vger.kernel.org>; Sat, 23 Apr 2022 03:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=AOUrFgUwEuSpl6hTV/7bP18cU2LpXkIHI0vQtR+kpsQ=;
        b=JEiQJmqMDGCqggdXD4BezkGTOz5F3qCD4m3GAg3ePRWI/RRoT0QSNSX95ctQ6kzQut
         g5jOVBWpjAJQGAqOkOL9aAZ9FuROaxU8HqphApfcAHxn09TJYnKuX0T4ZWI7H7HygJrD
         jPAtxY5q7Vx3zUWF6S3ukoN9CvGB9gwwbBomJMWE0GxpD6px1TiPDWuXietPy/j/Wsaa
         jcx4ZrTbocsJazpmAiUVUPLSXLl/1esrBNdqF6DKTM5VPpknkrindHs3GSoBsJ9t7l3o
         xQSfCp8xVQujmjj5k2dhjKJRr4UxR/ODPnRViMKXhvShPxO5HfYoMhdp9BTbE4CQvZst
         b0Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=AOUrFgUwEuSpl6hTV/7bP18cU2LpXkIHI0vQtR+kpsQ=;
        b=FczdYxxdYQGJt8OL4771c4VClFnMErBz9Y9afzc4IXFqaNM3F6uHDx6iJh/6CnFGpn
         CzFHK2a+FxAObUwKgNp6HZSWwyNVCcpFajFBwKLk+muGL7cgFzidIL3u7EKmpIiIZ9H8
         e0+R9HxZdIl1B5nC41ec9RArt9Dnh8Ige/yqDYfcva9IIrWprW7+//03Y9Kq7YzdzHsD
         3ZHTEL4zGFdzuuxuVVzivrTYtNzyJt3gwIAg0Cw/ztcy8UdfWV5ZLVUxrjovzwOq+8CT
         XoIOBQCcZcvrN/JUVdNxv4SZUL2GgdPsfn8tOpvvIZuSDcJkLpXjtzZzzM6w0iLgPKYg
         n2dw==
X-Gm-Message-State: AOAM530D6iLU46jMovaNCO+vNQGpNIYDgVKqIvAZIhco3SQZ4ZL4nKvT
        Lr1tLM52iA2JdgXRpze/DBr6MA==
X-Google-Smtp-Source: ABdhPJyi1WNeP7McWIYi/L5chkoHfrjRyvJMkmxFVMT6CRqoVF5RVabad+9jTEezRQLCDdaaSzi2KA==
X-Received: by 2002:a17:907:2d08:b0:6f0:2c6b:df52 with SMTP id gs8-20020a1709072d0800b006f02c6bdf52mr7411533ejc.210.1650709660435;
        Sat, 23 Apr 2022 03:27:40 -0700 (PDT)
Received: from [192.168.0.234] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id n13-20020a170906724d00b006cedd6d7e24sm1545928ejk.119.2022.04.23.03.27.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 Apr 2022 03:27:40 -0700 (PDT)
Message-ID: <288f55f3-b3ed-32b8-9a44-652f3d53617d@linaro.org>
Date:   Sat, 23 Apr 2022 12:27:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH V3 11/17] dt-bindings: arm: mediatek: Add #reset-cells
 property for MT8192-sys-clock
Content-Language: en-US
To:     Rex-BC Chen <rex-bc.chen@mediatek.com>, mturquette@baylibre.com,
        sboyd@kernel.org, matthias.bgg@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     p.zabel@pengutronix.de, angelogioacchino.delregno@collabora.com,
        chun-jie.chen@mediatek.com, wenst@chromium.org,
        runyang.chen@mediatek.com, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220422060152.13534-1-rex-bc.chen@mediatek.com>
 <20220422060152.13534-12-rex-bc.chen@mediatek.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220422060152.13534-12-rex-bc.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22/04/2022 08:01, Rex-BC Chen wrote:
> We will use the infra_ao reset which is defined in mt8192-sys-clock.
> The maximum value of reset-cells is 2. Therefore, we add this patch to
> define it.

Remove entire last sentence, does not make sense in the commit.

> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> ---
>  .../bindings/arm/mediatek/mediatek,mt8192-sys-clock.yaml       | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-sys-clock.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-sys-clock.yaml
> index 5705bcf1fe47..28ebcecc8258 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-sys-clock.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-sys-clock.yaml
> @@ -29,6 +29,9 @@ properties:
>    '#clock-cells':
>      const: 1
>  
> +  '#reset-cells':
> +    maximum: 2

Why this is a maximum? Usually this is const, so how do you use it (with
what values)?

> +
>  required:
>    - compatible
>    - reg


Best regards,
Krzysztof
