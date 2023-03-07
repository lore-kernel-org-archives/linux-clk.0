Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 449A7C678D5
	for <linux-clk@archiver.kernel.org>; Tue,  7 Mar 2023 12:48:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229527AbjCGMsE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 7 Mar 2023 07:48:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229556AbjCGMrp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 7 Mar 2023 07:47:45 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2ECE579B01
        for <linux-clk@vger.kernel.org>; Tue,  7 Mar 2023 04:47:44 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id s11so51714094edy.8
        for <linux-clk@vger.kernel.org>; Tue, 07 Mar 2023 04:47:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678193262;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MiOMw3LK/5OLzUtn41VD8A10+TPR+DMf9b3It0y1guw=;
        b=GfvhCA4Tlxl2L4aX/6Sh6y/b6EtasmFOro5keWY86lAZ8++Xzo7zyqoqYHVHbsqAbE
         HCw+aujjmrHB2hQHnb/dwbJFQPgbqy5MZMwtzcqnZJzYep5I23Vgep4oc6E8yOvcvg/c
         /uqA1aDHO9KOeaEfa9G2pfPXZnIlgcAJuAUCt9H4ttYJyGfmvRubtqtAcleTbXZrHiD2
         2kKhBmW4MoRUAQQ52RDzV//ERmEO7pdTWRW0ppS4SiWYyqpqnpdqYVYXoTshH9BhIK8j
         qa/zfDeLY8nbuU4ZVbkOp7oNTz8wtYaauLFDZEZsihPBk4dNy2OJi/74Ef+xYbOkUI9N
         X0wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678193262;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MiOMw3LK/5OLzUtn41VD8A10+TPR+DMf9b3It0y1guw=;
        b=VFkjuAagpsCDnuCKcWNSPUTr8B/J9tVcuYBZCO450WXmxKSmt1hOHzbv+igLqjblHw
         TL4kIzy+r1XUP9l2OFQqeP5Ut++KPNerIxtty3e0lcqNA54NEr4wdJlHzpaLtQ6nDl5L
         68LlqU6tDxDSDxKt0XEry3+Qf9VvR2vQ/yO39ENQZ7nRlEnTvJqX7JBJzt0vCUsaZio7
         jMv400S3Ty2HOvbW+WE6KYTMwzG996GzLA/6TmcpaqFuyLuY9OVgyidllyo23toPgcQs
         JDbDOq0sGlFMXH0WWmvvKioNhiLYnQdVMZfaNbnwLhN7pdA/1EAGiuHq2UUFyimBMRGG
         St4w==
X-Gm-Message-State: AO0yUKWkSPhsLPKF4Zo8DEec3Jasjm5ThmI9YuLfpdooW4FnYY3XDQqI
        xosrozhnoUw3FA3/Sl8eCPOrqw==
X-Google-Smtp-Source: AK7set+YuJPZN+mtGN0+4Lu5lpIp2vpZ1xwMAygXesjgftRMUQnfjD9C9uBPunnWrkl0dV+LGfhlaA==
X-Received: by 2002:a05:6402:350:b0:4c0:eab4:af12 with SMTP id r16-20020a056402035000b004c0eab4af12mr12941292edw.12.1678193262693;
        Tue, 07 Mar 2023 04:47:42 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:a60f:e604:c252:1f3d? ([2a02:810d:15c0:828:a60f:e604:c252:1f3d])
        by smtp.gmail.com with ESMTPSA id x33-20020a50baa4000000b004af7191fe35sm6669195ede.22.2023.03.07.04.47.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Mar 2023 04:47:42 -0800 (PST)
Message-ID: <692a62da-a9a1-fa23-6e24-723d73c3a423@linaro.org>
Date:   Tue, 7 Mar 2023 13:47:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v13 1/2] dt-bindings: clock: add loongson-2 boot clock
 index
Content-Language: en-US
To:     Yinbo Zhu <zhuyinbo@loongson.cn>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     Jianmin Lv <lvjianmin@loongson.cn>,
        Liu Peibao <liupeibao@loongson.cn>, wanghongliang@loongson.cn,
        loongson-kernel@lists.loongnix.cn
References: <20230307115022.12846-1-zhuyinbo@loongson.cn>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230307115022.12846-1-zhuyinbo@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 07/03/2023 12:50, Yinbo Zhu wrote:
> The Loongson-2 boot clock was used to spi and lio peripheral and
> this patch was to add boot clock index number.
> 
> Signed-off-by: Yinbo Zhu <zhuyinbo@loongson.cn>
> ---

This is v13? Where is the changelog then?


>  include/dt-bindings/clock/loongson,ls2k-clk.h | 25 ++++++++++---------
>  1 file changed, 13 insertions(+), 12 deletions(-)
> 
> diff --git a/include/dt-bindings/clock/loongson,ls2k-clk.h b/include/dt-bindings/clock/loongson,ls2k-clk.h
> index db1e27e792ff1..e86804365e506 100644
> --- a/include/dt-bindings/clock/loongson,ls2k-clk.h
> +++ b/include/dt-bindings/clock/loongson,ls2k-clk.h
> @@ -13,17 +13,18 @@
>  #define LOONGSON2_DC_PLL				3
>  #define LOONGSON2_PIX0_PLL				4
>  #define LOONGSON2_PIX1_PLL				5
> -#define LOONGSON2_NODE_CLK				6
> -#define LOONGSON2_HDA_CLK				7
> -#define LOONGSON2_GPU_CLK				8
> -#define LOONGSON2_DDR_CLK				9
> -#define LOONGSON2_GMAC_CLK				10
> -#define LOONGSON2_DC_CLK				11
> -#define LOONGSON2_APB_CLK				12
> -#define LOONGSON2_USB_CLK				13
> -#define LOONGSON2_SATA_CLK				14
> -#define LOONGSON2_PIX0_CLK				15
> -#define LOONGSON2_PIX1_CLK				16
> -#define LOONGSON2_CLK_END				17
> +#define LOONGSON2_BOOT_CLK				6

That's an ABI break and commit msg does not explain it.

> +#define LOONGSON2_NODE_CLK				7



Best regards,
Krzysztof

