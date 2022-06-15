Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 062FEC433EF
	for <linux-clk@archiver.kernel.org>; Wed, 15 Jun 2022 17:03:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349368AbiFORDw (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 15 Jun 2022 13:03:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237198AbiFORDv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 15 Jun 2022 13:03:51 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 827F24B86C
        for <linux-clk@vger.kernel.org>; Wed, 15 Jun 2022 10:03:49 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id h192so11933654pgc.4
        for <linux-clk@vger.kernel.org>; Wed, 15 Jun 2022 10:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=jm8MXeLlqii/5FydlD1v6Lz5nQdsR6MGCoUfpwdjuNk=;
        b=nJ7IBklLOjSLfSLdY4vTZXUDIYuZj/tb2ZQ6grZIWomT9q+Y0cfAHg8MuwR1zW66Di
         9sWtqG8qOKOpNHtF5fFCqEgdehoqdQYcjEkuoMRk28hhxdGcVk5NTSTlTpiPwsubMzE3
         xJuHLjAtQXc+MP/UEBzdS+0u18cszg5Q2NIrTUxm+2JSckbgTGvyCxGgW55/s+NObRcf
         +gg2jvj8mdR1Kjm+kitaTa2wqMrstENtJ3xcAR8eBEe4/TwfI57AtUzWFKtQDRATq3KS
         PGfLU9F8i/ygnIIluwOQjLi88kopb048g6yzFYgSMrqw8tl/lsfUu/CV8jp3Jrj7vjH9
         p7xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=jm8MXeLlqii/5FydlD1v6Lz5nQdsR6MGCoUfpwdjuNk=;
        b=3K5rjQFjVLvw70JrTeGJF0q90H5YboGxM3HPGjFCiUhQPSC0QE5Dv0TQuhoXgpvi0j
         tFcCSNgy9Fq2jbxowuIaRfmQ13QB1uhASj3Te0u5BIB7ZKZURQP8xvr2Kk0kSAX/99hS
         Tf43fXxJnic06JVuS7E6j1vzwLMxIv3f9WkirCvOHbsp5ceEkrVDDSsObVG6b0TF7kGW
         vekZUqsLKjtiiAXy1RriMFRF/AlWG+n9dnY1OkRY9JeWJGWnHuK0v/n9DoJ35QguUCZI
         vsG3sbIhveSSEWc8CLG3ibQ4GDcib9YkXxHmCL1YVnR1EPNjbrPAYPukDGSqf0WKqje+
         DA+g==
X-Gm-Message-State: AJIora+jaJe7Z6VNtvfPZsnQHEWZB+UVjmkJ6Ju/71RPSllZbKtWXVQ6
        /yTyQA0tdsC87dbzfas8QTE46A==
X-Google-Smtp-Source: AGRyM1seg5navj/ZgOXJ4HUS+Haip8l+eCz7SNp77yxaZukUbdDEw7wI4SvjvZRO87I5ID1vQOtNQA==
X-Received: by 2002:a05:6a00:1344:b0:51b:e3b5:54e2 with SMTP id k4-20020a056a00134400b0051be3b554e2mr588044pfu.6.1655312628981;
        Wed, 15 Jun 2022 10:03:48 -0700 (PDT)
Received: from [172.22.33.138] ([192.77.111.2])
        by smtp.gmail.com with ESMTPSA id v8-20020a17090a778800b001eab0a27d92sm2002742pjk.51.2022.06.15.10.03.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jun 2022 10:03:48 -0700 (PDT)
Message-ID: <e6e478a5-9080-fb2f-9ccd-2490cdfab4c7@linaro.org>
Date:   Wed, 15 Jun 2022 10:03:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 12/20] dt-bindings: reset: npcm: Add support for
 NPCM8XX
Content-Language: en-US
To:     Tomer Maimon <tmaimon77@gmail.com>
Cc:     Avi Fishman <avifishman70@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Joel Stanley <joel@jms.id.au>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Greg KH <gregkh@linuxfoundation.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Jiri Slaby <jirislaby@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Marcel Ziswiler <marcel.ziswiler@toradex.com>,
        Vinod Koul <vkoul@kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        Robert Hancock <robert.hancock@calian.com>,
        =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>,
        Lubomir Rintel <lkundrak@v3.sk>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        LINUXWATCHDOG <linux-watchdog@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
References: <20220608095623.22327-1-tmaimon77@gmail.com>
 <20220608095623.22327-13-tmaimon77@gmail.com>
 <add025b6-c622-b204-d39e-67b31878d37f@linaro.org>
 <CAP6Zq1iDbB+X5QPE4Nsqk4nV41bZiVzQZExS1pQTuKEBz-iYew@mail.gmail.com>
 <381ff739-e898-8812-d549-df7101f0eaa2@linaro.org>
 <CAP6Zq1j=x3OcOPSOjJJmOcze7ziM=oWcKdbYzoHhGnvZipu_UQ@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAP6Zq1j=x3OcOPSOjJJmOcze7ziM=oWcKdbYzoHhGnvZipu_UQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 13/06/2022 02:25, Tomer Maimon wrote:
> Hi Krzysztof,
> 
> Thanks for your clarification.
> 
> We can remove the dt-binding file and use numbers in the DTS,
> appreciate if you can answer few additional questions:
> 1. Do you suggest adding all NPCM reset values to the NPCM reset
> document or the reset values should describe in the module
> documentation that uses it?

What is "NPCM reset document"? Are these reset values anyhow different
than interrupts or pins?

> 2. Some of the NPCM7XX document modules describe the reset value they
> use from the dt-binding for example:
> https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/iio/adc/nuvoton%2Cnpcm750-adc.yaml#L61

This is NPCM750

> If we remove the NPCM8XX dt-binding file should we describe the
> NPCM8XX values in the NPCM-ADC document file?

What is NPCM-ADC document file? What do you want to describe there?
Again - how is it different than interrupts?



Best regards,
Krzysztof
