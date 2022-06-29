Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D921FC433EF
	for <linux-clk@archiver.kernel.org>; Wed, 29 Jun 2022 17:59:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232086AbiF2R7Z (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 29 Jun 2022 13:59:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232077AbiF2R7P (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 29 Jun 2022 13:59:15 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38B16C78
        for <linux-clk@vger.kernel.org>; Wed, 29 Jun 2022 10:59:14 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id eq6so23240324edb.6
        for <linux-clk@vger.kernel.org>; Wed, 29 Jun 2022 10:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=qLQoQNqzIX44NBq4eyXo8pb4zSiHlNiTFmIzQcS3Dno=;
        b=Mz1L28ohTu6cZ91xNTXSq6PQXSe7pEV86eueM3ccaMT7npnybQ7OsqG1zzkrZrtTjt
         YE9c+/tj9f5cATNFEOVPBbAqsw8RQ9FqxRQ055C8kabY1gNvzoLjKFoBMExzsgsZGBQs
         NMByrjLnhXz3SydxjsxGlhms159RezTVkwPw75noYwsyVgI69gnBHfbMsxoL487g9ooH
         Wcw/cX/cHNB89dZ7+9rmtLaYwoO/wVt012A7vW9Q0D2YDfdtYpUZPtP9McRMCBL40+DB
         is/IojyBhL5bugopD4xcTvondIPaL15gMOgS1WWrtAEDtgxH84bWShukCjqMwI64ug+q
         4NkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=qLQoQNqzIX44NBq4eyXo8pb4zSiHlNiTFmIzQcS3Dno=;
        b=KZi6uNvcCf8RLOodvASMZD5vVJ7okpJ46xk3JawzUrZqtXlomIPRBglNTpl2dm0AaD
         DKJcQvllntbB+AEDFA0PnZTqHDFt/YKqIqZcdBwvkyr1dvCq7gJjZuxKnCxbD7K923+E
         xoSwaIYYcfEbCO7OYazHWqL2nVzyLKDa7VBu5XpPKQgp9t/a4MGaH3eoJkR2/wDE88PA
         oT+WIt3+/0IeFtMD8MTGBo+CRWJcIm5QAirgoBme32Mur0cOIV6+g+QkpJQRH3XkqBO+
         VxyrWQr462YAx9y2KzhTcazW5lnq7aOLI0DsIY3ottHhqe5SN8NJcO7x3nb8SbrrEpNz
         WbJw==
X-Gm-Message-State: AJIora9OmOaXcezzC2Nfog+dTZGHxLRBY6BAZdGtxAmxP6ktmAm6+I/Y
        /05UKWQCNIHMDcdp3Mzrt8AzIw==
X-Google-Smtp-Source: AGRyM1t97qwz1beIrGRPTxbppC20aUggb1YzhT36TA5Umo2qx6ih3V8+jwWRhbMZVzIExLz3IbVmrA==
X-Received: by 2002:a05:6402:d05:b0:425:b7ab:776e with SMTP id eb5-20020a0564020d0500b00425b7ab776emr5998674edb.142.1656525552801;
        Wed, 29 Jun 2022 10:59:12 -0700 (PDT)
Received: from [192.168.0.187] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id bo5-20020a170906d04500b006ff0fe78cb7sm7981879ejb.133.2022.06.29.10.59.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jun 2022 10:59:12 -0700 (PDT)
Message-ID: <7560d60d-b4bb-6fcd-bfac-e9f4da911561@linaro.org>
Date:   Wed, 29 Jun 2022 19:59:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v6 07/14] dt-bindings: thermal: Add fsl,scu-thermal yaml
 file
Content-Language: en-US
To:     "Viorel Suman (OSS)" <viorel.suman@oss.nxp.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Viorel Suman <viorel.suman@nxp.com>,
        Oliver Graute <oliver.graute@kococonnector.com>,
        Liu Ying <victor.liu@nxp.com>,
        Mirela Rabulea <mirela.rabulea@nxp.com>,
        Peng Fan <peng.fan@nxp.com>, Ming Qian <ming.qian@nxp.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-input@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20220629164414.301813-1-viorel.suman@oss.nxp.com>
 <20220629164414.301813-8-viorel.suman@oss.nxp.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220629164414.301813-8-viorel.suman@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 29/06/2022 18:44, Viorel Suman (OSS) wrote:
> From: Abel Vesa <abel.vesa@nxp.com>
> 
> In order to replace the fsl,scu txt file from bindings/arm/freescale,
> we need to split it between the right subsystems. This patch documents
> separately the 'thermal' child node of the SCU main node.
> 
> Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
> Signed-off-by: Viorel Suman <viorel.suman@nxp.com>
> ---

Assuming all patches are taken independently:



Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
