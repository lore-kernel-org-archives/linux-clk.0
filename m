Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87781C27C76
	for <linux-clk@archiver.kernel.org>; Sat, 28 Jan 2023 10:08:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233446AbjA1KIG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 28 Jan 2023 05:08:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233024AbjA1KIF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 28 Jan 2023 05:08:05 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59A861DBAD
        for <linux-clk@vger.kernel.org>; Sat, 28 Jan 2023 02:08:04 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id t18so7058950wro.1
        for <linux-clk@vger.kernel.org>; Sat, 28 Jan 2023 02:08:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FOUEu8oBZpye/PT3Np7iUa0KHDNdwIekwrLom/JgEd4=;
        b=TlJ69dHpibrtcOj69LxiAnK0e4psSWHxmUvB7gyQmRkJpfaPYw7mYcBthzIJpClwOn
         D0m3DY9lk8QUm7pWJFlMW4oEMdkq2qtPWf4rM6AGBkqqcqizNSsD6+AzjM22AORk4tiS
         cDmBWfAGSJZr3Vi+l2k0+lBtZyxxF14UVQ8x0wXf6wjI5sKsWIlHVdFXOimeotTd8BXR
         iAxzik//acLXej0D9Uwy/XW+F3Ii6tnvRuW8GjUpwc1PLngVdZ2hWYDqz3OFJfz7AJXm
         nFQnKNMWjh9RYzaxLc56+++9EO0tWTj8WRbqceuaUMjMFMrdWqFxXAbClBfBs48EVfIT
         umNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FOUEu8oBZpye/PT3Np7iUa0KHDNdwIekwrLom/JgEd4=;
        b=q9yoFFaqo96DUVdiSPe3wjl6KJsKo7GyyConatu7lmjmTj0lgzIujbRVieRgqb7hTD
         cQ6vU3TLr7ot5AgAUQru3HQ9r9TEz4NwHdD/l2sZuuUa62dz4mf5tQyLEf5Wm0iuFXWf
         IgUzAKSNRVF1OP5gVVP+8NTEzjDgarc4js2HTPUYlhub7Ks5djKStu/dm0+bGysd2KTL
         x0iNThMHoK2swqAc+Vpa+CZmIH4w9FtnWlZTAWCULmdGNr3NAcpUHPCbuabPyTQsLnkT
         sckot7bLANhe+566HekoE8nDqIXTRAHCyIOp7abJOxzLeMlR9fcRHsIgBlfrKuAQLc+p
         X1yg==
X-Gm-Message-State: AO0yUKUQWvPavIQKiYyROKD2wr/pilCeHki1tz4pPNQhBJ6asSWemdOC
        XiNrBNft0AlwygbF2/r1XbocsA==
X-Google-Smtp-Source: AK7set8gi5MQ7bS/tG0fPpXlve9FGvdYU7ci8KURCgRbR3IiSJ7g6ewsYorQ/6xFHp7/l/Zy0fvBZQ==
X-Received: by 2002:adf:b646:0:b0:2bf:d610:e49 with SMTP id i6-20020adfb646000000b002bfd6100e49mr3262238wre.16.1674900482926;
        Sat, 28 Jan 2023 02:08:02 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id g8-20020adfe408000000b002bdda9856b5sm6314713wrm.50.2023.01.28.02.08.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Jan 2023 02:08:02 -0800 (PST)
Message-ID: <04b409b7-0d8c-4b60-1fd5-3486f47cc04c@linaro.org>
Date:   Sat, 28 Jan 2023 11:08:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 07/15] dt-bindings: clock: Add Ambarella clock bindings
Content-Language: en-US
To:     Li Chen <me@linux.beauty>
Cc:     li chen <lchen@ambarella.com>,
        michael turquette <mturquette@baylibre.com>,
        stephen boyd <sboyd@kernel.org>,
        rob herring <robh+dt@kernel.org>,
        krzysztof kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        "moderated list:arm/ambarella soc support" 
        <linux-arm-kernel@lists.infradead.org>,
        "open list:common clk framework" <linux-clk@vger.kernel.org>,
        "open list:open firmware and flattened device tree bindings" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        arnd bergmann <arnd@arndb.de>
References: <20230123073305.149940-1-lchen@ambarella.com>
 <20230123073305.149940-8-lchen@ambarella.com>
 <0c19efb4-3bca-f500-ca24-14b9d24369ef@linaro.org>
 <87y1prgdyu.wl-me@linux.beauty>
 <b26a52ff-6b8a-8a64-7189-346cd2b0d705@linaro.org>
 <87tu0ehl88.wl-me@linux.beauty>
 <ec9fc589-2612-3315-3550-83b68bead926@linaro.org>
 <87sffyhgvw.wl-me@linux.beauty>
 <f70def8e-b148-616f-a93e-c2a8fb85be03@linaro.org>
 <185f3b3a330.11c135c37327076.6300919877819761183@linux.beauty>
 <33c2038b-5e06-4eb2-82b8-007bb735bfb1@linaro.org>
 <185f7c1c693.b1cad2b8487563.1022046142491625830@linux.beauty>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <185f7c1c693.b1cad2b8487563.1022046142491625830@linux.beauty>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 28/01/2023 10:42, Li Chen wrote:
> Got it, I will model it as:
> 
> rct_syscon(compatible include "ambarella, <SoC>-clock"...)
> | peripheral A
> | peripheral B
> | ...
> 
> 
> One more question, two driver models:
> a. compatible = "ambarella, <SoC>-clock", handle all clocks(pll, div, mux, composite) in single driver.
> b. compatible = "ambarella, <SoC>-pll-clock", "ambarella, <SoC>-composite-clock", "ambarella, <SoC>-div-clock"...... 
>     and implement a driver for each of them.
> 
> Which driver model is preferred?

We do not talk here at all about drivers. This is independent and not
really related.

Anyway, independent features mostly have separate drivers. Each separate
driver should be located in respective subsystem. But again - we do not
talk here about drivers at all, so please do not bring them into the
problem. It will make everything more complicated...

Best regards,
Krzysztof

