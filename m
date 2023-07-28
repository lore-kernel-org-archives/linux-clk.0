Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D52D2C41513
	for <linux-clk@archiver.kernel.org>; Fri, 28 Jul 2023 12:05:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234317AbjG1MFr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 28 Jul 2023 08:05:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234372AbjG1MFe (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 28 Jul 2023 08:05:34 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CF9D449A
        for <linux-clk@vger.kernel.org>; Fri, 28 Jul 2023 05:04:52 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-3fbd33a57b6so22909435e9.2
        for <linux-clk@vger.kernel.org>; Fri, 28 Jul 2023 05:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690545891; x=1691150691;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gSlNrbO1rk+xDcirdtw/sCPOvAObe1RjL0munXiM0TI=;
        b=TYAGc8gfKz/OW0msL2tWpU19Rrpb9zzQbEvwEfVYCaMxf9mhIVH1+pAcJEsQdJIpOM
         a8fAIFAoI1iDM10KfqmwXLV7uvlbB1FNhiglVqunVuwzHgAgi0ZHcGsPLg6GHOoXXnRI
         ugrnOjLkoOsEjXLgUHQlKdZZYNZULW4edGDaWo2zImtX9UtQoUtt0F8oS2yFt1SnVqq3
         /pz8Qz706MKvRhZTLoBM2GhSYuj/uAlwoCqBgXVe2sC9BbI7nNmW1UgBpa8bsl/6SsaA
         ydAN0AGxuzyzGh5shMOHMC6p/05z1ZGvjVz4MV2q6a+afLnUOsnHokQFFsAzUkSKKdFh
         ynjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690545891; x=1691150691;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gSlNrbO1rk+xDcirdtw/sCPOvAObe1RjL0munXiM0TI=;
        b=WS+HjTZaq6iU/j3xikjAZYJt2evBOuldKsnYbOXUJvlDYjIl3k4vHwt4SCSsvEHyUt
         ETVYXidS02hk7IsfY9Nv3jZVJY197Rn1c7+Ia/E/iF86Lkir860Be8Woz7f3HxUczE94
         usA/83zMPa4QvAaVYBV/9XRPCdBARuRGXAErxAl5KL7HZKGTuz6ZwHrWerVsHm9zIbi/
         q2yJnvD0Unwuc0reUTxCEvW0SUTgO03smWirrchHfbho/S+zYc/uEr5jvgyo2CurFuiW
         8FS5cw2D6rTo8HrgyB1iUYdfk3kei1EOqla50MYuiQtF4Zp787mCXs66xWVMsfO9t3yW
         Qi/Q==
X-Gm-Message-State: ABy/qLbRVujtjwssL2TQmI7OseXhNUYDYyfMW1haUVrMDRNCvWsGjRVf
        2/KWVlGNwa137nVSlm/tHSlfO30p0HlIlCpqtrU/Fg==
X-Google-Smtp-Source: APBJJlF7KNSBtqEn3YNXXxJtPliF98qe2Pe1xhZtaQNRmbDUL27Nsx5wL/sI2Y8D8rG+4ibwvdWjLQ==
X-Received: by 2002:a7b:cb97:0:b0:3fb:b280:f548 with SMTP id m23-20020a7bcb97000000b003fbb280f548mr1861877wmi.0.1690545890946;
        Fri, 28 Jul 2023 05:04:50 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id n7-20020a1c7207000000b003fbb8c7c799sm6879499wmc.30.2023.07.28.05.04.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jul 2023 05:04:50 -0700 (PDT)
Message-ID: <30c23f06-a942-a28d-d8e8-6cf98abe5a6d@linaro.org>
Date:   Fri, 28 Jul 2023 14:04:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 40/50] clk: at91: sam9x7: Allow PLLs to be exported and
 referenced in DT
Content-Language: en-US
To:     Varshini Rajendran <varshini.rajendran@microchip.com>,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
        claudiu.beznea@microchip.com, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20230728102943.267342-1-varshini.rajendran@microchip.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230728102943.267342-1-varshini.rajendran@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 28/07/2023 12:29, Varshini Rajendran wrote:
> Allow PLLADIV2 and LVDSPLL to be referenced as a PMC_TYPE_CORE
> clock from phandle in DT.
> 
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> ---
>  include/dt-bindings/clock/at91.h | 4 ++++

These are bindings, so "dt-bindings: clk:".
Please use subject prefixes matching the subsystem. You can get them for
example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
your patch is touching.

>  1 file changed, 4 insertions(+)
> 
> diff --git a/include/dt-bindings/clock/at91.h b/include/dt-bindings/clock/at91.h
> index 3e3972a814c1..6ede88c3992d 100644
> --- a/include/dt-bindings/clock/at91.h
> +++ b/include/dt-bindings/clock/at91.h


Best regards,
Krzysztof

