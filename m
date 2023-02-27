Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3F52C64ED6
	for <linux-clk@archiver.kernel.org>; Mon, 27 Feb 2023 08:17:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230085AbjB0IRb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 27 Feb 2023 03:17:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229953AbjB0IRa (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 27 Feb 2023 03:17:30 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 687941C5B0
        for <linux-clk@vger.kernel.org>; Mon, 27 Feb 2023 00:17:28 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id bw19so5190688wrb.13
        for <linux-clk@vger.kernel.org>; Mon, 27 Feb 2023 00:17:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SXjvdSe0Xoy2F99alaan33seTEDoFO78h4PoWaqWgOY=;
        b=Lz4+9beKVbWGlNZ6JCP58x/xj/5GDQnJ5jCtQqyk+1Udl9BuMfMaqAUXJVrX2gGAWA
         H22mr9hUSs6gxP/dkX1KUIEXR3e6LG214vFsWVbuboi5zufMdpFYmshF4cwGF2NV4H0z
         qvRYWIvNKBbfobB6eeUdLDOkT0LAjGmu4KvfNxDHTvEse8d28/WUysicQIdl0aApCADF
         7J5mfxUFaThBrPciFhRLWq5t5tVGNN5vOglz34rOh4yJx5jBo9GxMZZyWytU9fihJRsn
         kOaZr0OIMAaAjnSkR9viY0q+ix5LePgu5IImhO7Rk0mYSW/eBZNbsSAZBts88SH9xCWR
         xHnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SXjvdSe0Xoy2F99alaan33seTEDoFO78h4PoWaqWgOY=;
        b=eaYt8b554Pc4cyFlwHNecoie9LEGl4vTYRTxxm5wR4DSdqzMfP23/mqv1lUyDyzfCW
         0jdomo1im1yEAoqR5pqYAWdWsNFyIhr+aIWJxWMvb6iUii50rjXzUSSKguA2GNXX5erO
         pPEYwYcj793bEw/rm0dyWU75RaHpNozJH0497f39bCIEHkLNg0DftaU6qik3JlIwoxds
         yMcp66sGpEG3hyOt2ntfCsEHVU3nXmi/8MbjgQHRq4/tfqKAnuufFvVYAJSCGmiRdPEz
         nIsGOsnjzCjrg4TiyXWMoR1EP3otQB/+X1lBE4kYaD5BySGe2hGSApFzQ29eFQX2EogG
         kH/Q==
X-Gm-Message-State: AO0yUKUL4aYK530yjryqWb9l3ialR+UvuTi0gf/TYj5djzKYzWvpFnmh
        YoS8vukVK3Z81dYPbs8LCPzZ0g==
X-Google-Smtp-Source: AK7set+LGhJeW/YV/Plyh6BkEVwsi5ztKVwgCyYUJRw0gktnM8wdTkBmFtmQU+S6gcfBUUuXp8EDLg==
X-Received: by 2002:a5d:58ea:0:b0:2c7:d56:7d72 with SMTP id f10-20020a5d58ea000000b002c70d567d72mr13130426wrd.19.1677485846867;
        Mon, 27 Feb 2023 00:17:26 -0800 (PST)
Received: from [192.168.1.20] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id c4-20020adffb04000000b002c70bfe505esm6324326wrr.82.2023.02.27.00.17.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Feb 2023 00:17:26 -0800 (PST)
Message-ID: <481a732d-8867-b811-e96c-caf43d08e9f9@linaro.org>
Date:   Mon, 27 Feb 2023 09:17:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 2/4] dt-bindings: reset: Add MediaTek MT6735 reset
 bindings
Content-Language: en-US
To:     Yassine Oudjana <yassine.oudjana@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Daniel Golle <daniel@makrotopia.org>,
        Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
        Tinghan Shen <tinghan.shen@mediatek.com>,
        Chen-Yu Tsai <wenst@chromium.org>,
        Edward-JW Yang <edward-jw.yang@mediatek.com>,
        Johnson Wang <johnson.wang@mediatek.com>,
        Fabien Parent <fparent@baylibre.com>,
        Chun-Jie Chen <chun-jie.chen@mediatek.com>,
        Miles Chen <miles.chen@mediatek.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Yassine Oudjana <y.oudjana@protonmail.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>
References: <20230225094246.261697-1-y.oudjana@protonmail.com>
 <20230225094246.261697-3-y.oudjana@protonmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230225094246.261697-3-y.oudjana@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 25/02/2023 10:42, Yassine Oudjana wrote:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> Add reset definitions for the main reset controllers of MT6735 (infracfg
> and pericfg).
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
>  MAINTAINERS                                   |  4 ++-
>  .../reset/mediatek,mt6735-infracfg.h          | 31 +++++++++++++++++++
>  .../reset/mediatek,mt6735-pericfg.h           | 31 +++++++++++++++++++
>  3 files changed, 65 insertions(+), 1 deletion(-)
>  create mode 100644 include/dt-bindings/reset/mediatek,mt6735-infracfg.h
>  create mode 100644 include/dt-bindings/reset/mediatek,mt6735-pericfg.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5323f71c48fb..f617042790ee 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13101,7 +13101,7 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/mmc/mtk-sd.yaml
>  F:	drivers/mmc/host/mtk-sd.c
>  
> -MEDIATEK MT6735 CLOCK DRIVERS
> +MEDIATEK MT6735 CLOCK & RESET DRIVERS

You just added this line in previous patch. Don't add code which
immediately you fix.



Best regards,
Krzysztof

