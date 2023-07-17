Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0081FEB64DC
	for <linux-clk@archiver.kernel.org>; Mon, 17 Jul 2023 08:00:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230496AbjGQIAn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 17 Jul 2023 04:00:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229634AbjGQIAm (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 17 Jul 2023 04:00:42 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5006EC7
        for <linux-clk@vger.kernel.org>; Mon, 17 Jul 2023 01:00:40 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-51e5e4c6026so5911083a12.0
        for <linux-clk@vger.kernel.org>; Mon, 17 Jul 2023 01:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689580839; x=1692172839;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=THHFMED/jbOMH1YRv1UObCpRHTU3JeymiO4m4VH30UI=;
        b=JVkc2lCRmJaOr1H3tOGjczXY4e7+wGGkwH424uoSMLfFGyuQwfYbf4VVztm+wtgQM0
         k1KtafwTOYyffgHZqwXgnXqmN/FS/nZoRG/s35hkxZhxG7kmcdaFzKRh8AaFyR/a1NuR
         k2F86TuPe/XBLIQCP4C9q5pNTZwGAbUXCxhp6qGgLgk6As+S4h0Dnn7Yj6/b7fKzZqFU
         X/6GxUUmkSa2tiVLlllntz4up8imTnP0JF2PT+gSW8419n/qIEoMN19TOD7ycyJPtznc
         BePOJ2L+o8VSMPAG/YkbLjdpoHKFvNwtllz8JMTEjJ+pLam/MhEs4jW2d+NcahMHyYMn
         1efA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689580839; x=1692172839;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=THHFMED/jbOMH1YRv1UObCpRHTU3JeymiO4m4VH30UI=;
        b=DljmRnd66C8QFZV/7ohJ0YBJEY11wEWX7FcyfkuW4n/mQ5aSO03cFmjSPoxWHtpuiS
         DFbFR37QVAK7Vc1kp79y1ePaGv4arhISjnnqy29Er48ARoYm/n1awZ27BFCjEgX5NxZq
         y5IH1UzCt+55qbwKCKPXuFOtgtmzeC9J6FH1rBFAUR5IjaqgAILCxlAypxEx6S4uuueJ
         2TQiHCxk4tWn4MjN56Me+FkAke/JZs0413KkxfPa8F1rdRgaKfgH/R2IaW21F1JojuJZ
         9tQFx7+yaQbcjgcC5cBxr+gDEZP3ypmx/eZnoJ8SpaS/YC7BFBpVhVKPkCSPJ5/Z2Dwo
         jxEA==
X-Gm-Message-State: ABy/qLbdhTH0JDhu5YW8RWeu8ac4OntrtktqCmriBZUAuFOeZ0VwdmkV
        PopAVGEBtk7J+gHTwXEZJ2T1tg==
X-Google-Smtp-Source: APBJJlE6vsMf+xJHq0O08ELQG4D+gllwRFuPlzUBGX6jzdz35fNbMZ5xU3jC0NMYESeFySVfqn8/vw==
X-Received: by 2002:a17:907:8a11:b0:993:e691:6dd5 with SMTP id sc17-20020a1709078a1100b00993e6916dd5mr12922667ejc.7.1689580838733;
        Mon, 17 Jul 2023 01:00:38 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id j8-20020a1709064b4800b009929c09abdfsm8914264ejv.70.2023.07.17.01.00.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jul 2023 01:00:38 -0700 (PDT)
Message-ID: <6dbf7628-da4e-6be6-27ed-b0bafa15d8bb@linaro.org>
Date:   Mon, 17 Jul 2023 10:00:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 RESEND] dt-bindings: clock: ast2600: Add I3C and MAC
 reset definitions
Content-Language: en-US
To:     Dylan Hung <kobedylan@gmail.com>, mturquette@baylibre.com,
        sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     BMC-SW@aspeedtech.com, Dylan Hung <dylan_hung@aspeedtech.com>
References: <20230717075123.1597977-1-dylan_hung@aspeedtech.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230717075123.1597977-1-dylan_hung@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 17/07/2023 09:51, Dylan Hung wrote:
> Add reset definitions of AST2600 I3C and MAC controllers.
> 
> Signed-off-by: Dylan Hung <dylan_hung@aspeedtech.com>
> ---
> 
> Resend v2 patch through my gmail account as the aspeedtech.com domain is blocked by gmail.com

Where is the changelog?

> 
>  include/dt-bindings/clock/ast2600-clock.h | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/include/dt-bindings/clock/ast2600-clock.h b/include/dt-bindings/clock/ast2600-clock.h
> index e149eee61588..712782177c90 100644
> --- a/include/dt-bindings/clock/ast2600-clock.h
> +++ b/include/dt-bindings/clock/ast2600-clock.h
> @@ -90,7 +90,19 @@
>  /* Only list resets here that are not part of a clock gate + reset pair */
>  #define ASPEED_RESET_ADC		55
>  #define ASPEED_RESET_JTAG_MASTER2	54
> +
> +#define ASPEED_RESET_MAC4		53
> +#define ASPEED_RESET_MAC3		52
> +
> +#define ASPEED_RESET_I3C5		45
> +#define ASPEED_RESET_I3C4		44
> +#define ASPEED_RESET_I3C3		43
> +#define ASPEED_RESET_I3C2		42
> +#define ASPEED_RESET_I3C1		41
> +#define ASPEED_RESET_I3C0		40
> +#define ASPEED_RESET_I3C		39
>  #define ASPEED_RESET_I3C_DMA		39

Why adding duplicate ID? Your commit msg or a comment here should
explain this.

Best regards,
Krzysztof

