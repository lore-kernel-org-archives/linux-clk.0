Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BE31C7619A
	for <linux-clk@archiver.kernel.org>; Sun, 19 Mar 2023 11:06:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229980AbjCSLGW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 19 Mar 2023 07:06:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230041AbjCSLGT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 19 Mar 2023 07:06:19 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD361233F8
        for <linux-clk@vger.kernel.org>; Sun, 19 Mar 2023 04:06:16 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id ek18so36471295edb.6
        for <linux-clk@vger.kernel.org>; Sun, 19 Mar 2023 04:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679223975;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nBClyZjqzsvX4XcfHoxPbXuLX0hX3wAS1PzOKSKD6qY=;
        b=ceb14UefHIQse6qb+4nApgrCDxC15oK3YeIPm2+MmmsGD8IwI0epyP4s1DrZRVh4+z
         tDMNWO8qp2S/FF3ZEHUiYhrXpnGblatsi3NTCkdn2zlwft/GR2xbZZAmP5MKQilvO+YL
         iYMiFFzQZeMdlJBZEevViB0gbnkaXeorGwfdenxCnmIzAiu263JG/VKI5Ww2jCcSKYHS
         fOkJZBuu8JZE2tKdnGw15pq8s5nNQMcuHm+C6TEi+aJ+j3C0spIAt0wP4OQFrSNV6lV4
         atEKzpj+jSIZ35pcza41zU6NmuZ0H0qp/cakvd5pgYJJQXICgZlF4lekabXndN2ijX2H
         bGpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679223975;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nBClyZjqzsvX4XcfHoxPbXuLX0hX3wAS1PzOKSKD6qY=;
        b=u9+XXipi2o1Vr/DsXxDTrsrf+V/aLpP0HC4Dia2hMCl0OIJHlk1cZNjCkVHbXCu4ns
         OgoW0bq+3TS0Lu8Pz8OCpHFOWrOVbtq9jcm/7ZNu7IzVxnvUjgMS7QOsgm9mDTPCh6EC
         wupTdGTVwV9xLLBJCF85WIERYxMKSaGugYfAy9PqocGcmKbNRgjvJloAEcM4Ec2L6ISw
         eh8m5m6UA3Vs0B73tUFQvg8rQze1l0YwfNn/PI0rpl+FsbJBvRerKAZgrLikhbOhDGKi
         81t1atxlzaWWgI4owmVt8rPOGKeE2y43s0imO+Sz5JzpvDjmsHMp91VbI6APK3F2eVGI
         LSdg==
X-Gm-Message-State: AO0yUKU67kOVJQglFDRfuAIdDGThGaceUU7Aw5f8DJVkE2YUrK3c3dUx
        +dPKuB0LB51YDfxOgfUm0nAvbg==
X-Google-Smtp-Source: AK7set+09rHLmfBFB8O9udJ+850QNdD95CbOHTD0fZ1NophhDuk/Rlf/ZKLukSxggEy5xfDNzUMgfw==
X-Received: by 2002:a50:ff17:0:b0:4fa:b302:84d9 with SMTP id a23-20020a50ff17000000b004fab30284d9mr9364725edu.14.1679223975316;
        Sun, 19 Mar 2023 04:06:15 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:5b5f:f22b:a0b:559d? ([2a02:810d:15c0:828:5b5f:f22b:a0b:559d])
        by smtp.gmail.com with ESMTPSA id s29-20020a50d49d000000b004fc2a75c6b3sm3376851edi.23.2023.03.19.04.06.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Mar 2023 04:06:14 -0700 (PDT)
Message-ID: <87171ab8-9c6d-3978-6d34-4ae922361307@linaro.org>
Date:   Sun, 19 Mar 2023 12:06:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 11/15] arm64: dts: nuvoton: Add initial ma35d1 device tree
Content-Language: en-US
To:     Jacky Huang <ychuang570808@gmail.com>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, lee@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de,
        gregkh@linuxfoundation.org, jirislaby@kernel.org
Cc:     devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
        schung@nuvoton.com, Jacky Huang <ychuang3@nuvoton.com>
References: <20230315072902.9298-1-ychuang570808@gmail.com>
 <20230315072902.9298-12-ychuang570808@gmail.com>
 <fb4f60a7-011e-3745-cc40-631247735f2b@linaro.org>
 <c902606e-8a1b-6673-02c7-7beea5477795@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <c902606e-8a1b-6673-02c7-7beea5477795@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 18/03/2023 07:07, Jacky Huang wrote:
> 
>>
>>> +		interrupts = <GIC_PPI 9 (GIC_CPU_MASK_RAW(0x13) |
>>> +			      IRQ_TYPE_LEVEL_HIGH)>;
>>> +	};
>>> +
>>> +	uart0:serial@40700000 {
>>> +		compatible = "nuvoton,ma35d1-uart";
>>> +		reg = <0x0 0x40700000 0x0 0x100>;
>>> +		interrupts = <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>;
>>> +		clocks = <&clk UART0_GATE>;
>>> +		status = "okay";
>> Why? Drop the line... or convert it to disabled. Otherwise, why every
>> SoC has serial0 enabled? Is it used internally?
> 
> 
> uart0 is on all the way since this SoC booting from the MaskROM boot code,
> 
> load arm-trusted-firmware, load bootloader, and finally load linux  kernel.
> 
> uart0 is also the Linux console.

Are you sure? Maybe my board has UART0 disconnected.

Best regards,
Krzysztof

