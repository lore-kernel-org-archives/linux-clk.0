Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 130CFC4332F
	for <linux-clk@archiver.kernel.org>; Mon, 10 Oct 2022 14:56:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229982AbiJJO4B (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 10 Oct 2022 10:56:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230022AbiJJOzw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 10 Oct 2022 10:55:52 -0400
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8CC926490
        for <linux-clk@vger.kernel.org>; Mon, 10 Oct 2022 07:55:16 -0700 (PDT)
Received: by mail-qk1-x734.google.com with SMTP id x13so4251727qkg.11
        for <linux-clk@vger.kernel.org>; Mon, 10 Oct 2022 07:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oZbLB4JCRD9eMPrz6hZDO0DGi49LxoO2ksZ24HFdMXE=;
        b=Az8N6bWO/eiut7c+UDPy5gPlcSL4FZPXFgWCJe2LaqDwWujMdxCX/ZD2MmMwHGUKUY
         NY7EmBcxMvzb82Yo6vI/iDPXUaQcQHH2aukKZnEsJaqPGcnu/06YIYZrMSxUwIU8wm+Y
         47mASZsLd5TZ4X/6oH87EEHhhEZ5pHWD2ETH4SSPW7PHBOQPQIfTbEoetlauO7x2OVlz
         L2OEycu4OziI6m33Sp+DS2RcSRbugoxdikbyNmUHJ2VhanKaHxVcIDl1DEcHddBxpM20
         n3rB/Y7nZh1fHaudAcwonu1paU49Y+WnsbdKniUifzad1wEQXt/7UOAskXH+tIYlpIgv
         1fUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oZbLB4JCRD9eMPrz6hZDO0DGi49LxoO2ksZ24HFdMXE=;
        b=DKOEYjoyQ8EyYoQXCAfw9ORlub78OqdZlJ6ZznbswK/ZnOpMIUqFAhHMJJJ+WfL6dZ
         SFJfjemrT4dFk+G1pvMC6a9IlnQbeBt3o5CsuUhmoxFE5qB7cr2D8UNDva4Mm2FjPdBp
         eRPLJPBAQefoBrgnZ+N2ORtdvo1fWHjosU9wcUBQN6zARQd9BnVODGA2ei4AjuiM0Xtv
         1Mes/+Zx2mwQBMC02VLZ98j9HJrnLKA4l9NjVzzlFml1ekerIFbQ8iWPmhSlc8v+JWOk
         wzHP7oqTRhyXE64FL9X6dNDxBh1pxL+Mk8SQPXuATBru+xWKaXk3V3SGFWsJok54WeXU
         4+8g==
X-Gm-Message-State: ACrzQf2URELxU2gHxQZ3juP8jdS5BxIKIIlvxfG1AyAFDL1P9SMBnJLC
        +EYWEFUQtKZN+n4HjwM3pSGDHw==
X-Google-Smtp-Source: AMsMyM72FXX/gmvm1GIWKH7GJ5BuHjnNd8tECzXDhUfrvSe8aAejLL/3rhQIHb4O5m2pR5KfpYpVbg==
X-Received: by 2002:a05:620a:34e:b0:6ce:43ea:89b0 with SMTP id t14-20020a05620a034e00b006ce43ea89b0mr12941414qkm.30.1665413715416;
        Mon, 10 Oct 2022 07:55:15 -0700 (PDT)
Received: from [192.168.1.57] (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id h7-20020ac87447000000b0039a372fbaa5sm2495397qtr.69.2022.10.10.07.55.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Oct 2022 07:55:14 -0700 (PDT)
Message-ID: <84b6dae0-d503-bbd2-d483-80462917afa4@linaro.org>
Date:   Mon, 10 Oct 2022 10:53:02 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH 1/8] dt-bindings: ingenic: Add support for the JZ4755 SoC
To:     Siarhei Volkau <lis8215@gmail.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jiri Slaby <jirislaby@kernel.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20221009181338.2896660-1-lis8215@gmail.com>
 <20221009181338.2896660-2-lis8215@gmail.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221009181338.2896660-2-lis8215@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 09/10/2022 14:13, Siarhei Volkau wrote:
> JZ4755 is a low-power SoC similar to JZ4725B which is already here.
> 
> The patch adds compatibles for parts which aren't implemented yet and
> they are subject of this patch serie.
> 
> Signed-off-by: Siarhei Volkau <lis8215@gmail.com>
> ---
>  Documentation/devicetree/bindings/clock/ingenic,cgu.yaml   | 2 ++
>  Documentation/devicetree/bindings/dma/ingenic,dma.yaml     | 1 +
>  Documentation/devicetree/bindings/serial/ingenic,uart.yaml | 4 ++++

How do you plan to merge it? Usually these go via subsystem trees...


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

