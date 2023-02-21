Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 693E3C64EC4
	for <linux-clk@archiver.kernel.org>; Tue, 21 Feb 2023 11:26:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233460AbjBUL0f (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 21 Feb 2023 06:26:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234099AbjBUL0e (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 21 Feb 2023 06:26:34 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC15E24111
        for <linux-clk@vger.kernel.org>; Tue, 21 Feb 2023 03:26:32 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id ck15so17025653edb.0
        for <linux-clk@vger.kernel.org>; Tue, 21 Feb 2023 03:26:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aHbKR2m+ywXpCXnZM0exqgvtcPw2O6ABggPWu9BvoN4=;
        b=R9+walYXq2Y7zxrm+gnrtxKExw8KYaNL7+C4BwJDnbYDDjPma+voio4V7IMVLXdiRm
         msWk6RRgDsA2bI2SCd0H2bB0uG35IvH0WaHmTpxlIJP7bHrOQN2vx6/Z/XnNv8X79rN4
         ZYCjJJO853MVKF7i8uIzEI19GNlB7DSWsVJn7xjcB3cd/I5dJFQYL152BUZoDqCAmHTR
         kwUrnihYMiXFooHccoQErA/l/rDhn5x/hLQ6x8u4pQlM9ECV0WgyHAQZO0D67z1XbEwG
         409hqVjpwmtzCZv/0OYP2Gh1uBDPS5hzFrgX1de6FTBgB88T76olZTyhZnIqsn/1CaLT
         DxfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aHbKR2m+ywXpCXnZM0exqgvtcPw2O6ABggPWu9BvoN4=;
        b=GheXjIlVWsO2WYyVtJyvSv/hqfhfb1qnLC5HGuZnaE7dMHWNBsIIIhPCukfJNF4JBF
         rH/9LinP/jMCV05c11S6BADAvEHH9MsCmbUN2fIpBDkRww9YeRDg4PinUUAar1X0F/by
         dsHsbx7HvF4ptMBp/x3ZEz88RaxGEGEXucBYJK56xsw1BKSRNfETCpsVtOEcd2UHku27
         wOiwm0ssOkzwgfmsAHC1+8AzTKNcB2dMmmaIPYzGC6hDSaW5aJSJRr5zcUD5KUW40zQ6
         +6PZz3z05lSLpbMzchy5pimcXKF/RX6aCf+xfL1yV8IREZzo6Dt5xhv5RAin1RIBRSl0
         5GOA==
X-Gm-Message-State: AO0yUKXvhqA7ux70qbM2eD2sdkC2caczgFbKtxJpURNB5QcFc3aTQhdH
        0RD11vpeQmtyU0EfFlWQcc3g3A==
X-Google-Smtp-Source: AK7set/hoEeKJdNyqDj9X+vez8ZgBQcuREJn5JynOD5+WGwCyXxjQ19wOr8kdZ1bzXKag3dBWsvrHA==
X-Received: by 2002:a17:906:1c56:b0:877:ef84:c7de with SMTP id l22-20020a1709061c5600b00877ef84c7demr11356772ejg.61.1676978791367;
        Tue, 21 Feb 2023 03:26:31 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id wq12-20020a170907064c00b008b17ed98d05sm5975803ejb.120.2023.02.21.03.26.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Feb 2023 03:26:31 -0800 (PST)
Message-ID: <3fb23e7c-aad2-bec1-01e5-299c9b515d6f@linaro.org>
Date:   Tue, 21 Feb 2023 12:26:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 04/11] dt-bindings: clock: Add StarFive JH7110
 Image-Signal-Process clock and reset generator
Content-Language: en-US
To:     Xingyu Wu <xingyu.wu@starfivetech.com>,
        linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Emil Renner Berthing <kernel@esmil.dk>
Cc:     Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Hal Feng <hal.feng@starfivetech.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <20230221083323.302471-1-xingyu.wu@starfivetech.com>
 <20230221083323.302471-5-xingyu.wu@starfivetech.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230221083323.302471-5-xingyu.wu@starfivetech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 21/02/2023 09:33, Xingyu Wu wrote:
> Add bindings for the Image-Signal-Process clock and reset
> generator (ISPCRG) on the JH7110 RISC-V SoC by StarFive Ltd.
> 
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

