Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E090FC433F5
	for <linux-clk@archiver.kernel.org>; Tue, 19 Apr 2022 12:02:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351976AbiDSMF3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 19 Apr 2022 08:05:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351971AbiDSMD0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 19 Apr 2022 08:03:26 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF73428981
        for <linux-clk@vger.kernel.org>; Tue, 19 Apr 2022 04:59:09 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id g20so20921250edw.6
        for <linux-clk@vger.kernel.org>; Tue, 19 Apr 2022 04:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=6oA1XojTBV3oA9r/HKQ3Tl1fWWX+00CTBT2nxTWPymY=;
        b=hDR9Sem7MlKGIbYOPdZKzDLQQoA1Ps1MPKQgOl4DfL9ZhR6uk4ow7cmRujEgHca4+z
         LHrJQUqfAnG+GYinLCxhNo021USDj7Ay+o6y0eMUirw3v0TDkylvC1rrYu3R7sew6U7T
         VtcSna4j2XI0YFrEtXDsTUt4V2Wk+cKcq0laOt/lrz/5RB+epAI9zeWa+5t83oL5XEdp
         ejNyYqxtaDaInpvPZUufRCcnRaAx7mYhj2rVmbty5tG9Ez4ZjDArimtgstQTFnThs2PK
         qkEowriCnuaEJzFjB25g2rYeXlCrryjPVUyCzonmIymb09b/1bJhE5oHJOxkH4jQTQFC
         09mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=6oA1XojTBV3oA9r/HKQ3Tl1fWWX+00CTBT2nxTWPymY=;
        b=3tGHMQFscR51ukbeOh1KAsyZw0yrI42msXywzhcIvQ2QOAH5qPAScfInnle+9LmZZe
         5lvopHGCjQu1jr1SCxMvz3RmD31xax6YwyZFrUhulxqvtOdGKtw//YnazJeAjyT1vW7V
         1oQJrM+WuS4ba1HksUd4o1FPXN5oNzbuC/BCFpHV1IPnfHO3PKtk2QPmZ3epwFADhqoE
         rilFz3PUUXgifL9xVwfWy39Rapx3aO+I/4fKWeDsEedKwl64xMgYCGU0gK0idn3VPAjY
         Pp1NZKmsk49OIOKE8UNJWJMludrkmbVYB7MSy4heRv8k0HaUWUMWvgPgJnrQRwVhi+AZ
         tLXw==
X-Gm-Message-State: AOAM533luBboSeuicZ7lBOIPsBQ9sfsdmJbR62HzaUdsYBZztmXOCGRd
        m1OMKff0jPuQWVAaQtUHdcMxPQ==
X-Google-Smtp-Source: ABdhPJxS7yTBdB7NfvlxHjWxaLfiWZFzcz7EPz+lZ+OBcndTA1+SohbMymqQSLWiLrTaqWI7UtT/Lg==
X-Received: by 2002:aa7:c489:0:b0:41d:78a0:5b32 with SMTP id m9-20020aa7c489000000b0041d78a05b32mr16985415edq.305.1650369548476;
        Tue, 19 Apr 2022 04:59:08 -0700 (PDT)
Received: from [192.168.0.217] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id p9-20020a05640243c900b0041facb9ac9esm8111757edc.1.2022.04.19.04.59.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Apr 2022 04:59:07 -0700 (PDT)
Message-ID: <4f31fc70-c227-f69f-8fbe-6fa8a1113258@linaro.org>
Date:   Tue, 19 Apr 2022 13:59:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3 5/9] dt-bindings: clk: mpfs: add defines for two new
 clocks
Content-Language: en-US
To:     Conor Dooley <conor.dooley@microchip.com>, mturquette@baylibre.com,
        sboyd@kernel.org, aou@eecs.berkeley.edu, paul.walmsley@sifive.com,
        palmer@rivosinc.com, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, robh+dt@kernel.org,
        krzk+dt@kernel.org
Cc:     daire.mcnamara@microchip.com, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-riscv@lists.infradead.org
References: <20220413075835.3354193-1-conor.dooley@microchip.com>
 <20220413075835.3354193-6-conor.dooley@microchip.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220413075835.3354193-6-conor.dooley@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 13/04/2022 09:58, Conor Dooley wrote:
> The RTC reference and MSSPLL were previously not documented or defined,
> as they were unused. Add their defines to the PolarFire SoC header.
> 
> Fixes: 2145bb687e3f ("dt-bindings: clk: microchip: Add Microchip PolarFire host binding")
> Reviewed-by: Daire McNamara <daire.mcnamara@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
