Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D34F1C433EF
	for <linux-clk@archiver.kernel.org>; Fri, 13 May 2022 12:58:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353711AbiEMM6A (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 13 May 2022 08:58:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233058AbiEMM57 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 13 May 2022 08:57:59 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86FD198590
        for <linux-clk@vger.kernel.org>; Fri, 13 May 2022 05:57:58 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id t6so11362555wra.4
        for <linux-clk@vger.kernel.org>; Fri, 13 May 2022 05:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=cU4ZtNl2vEtEVH/Lak30VWKkW5zSu+7jhI7ooziHVxo=;
        b=hY7RshcVZtZ0WoJs33dta6NDd8NbGGJgoY7ZVCt1MeX0kX/Xj3Lur613Or1JybyFNm
         1HZ68gzAyuZJ8HOhwzUYP2bCfyxQ3UjhIhkwG50UoTionya9gp2Lp4+3JXKF5s9OXTad
         rtkkhgzPeqz0KXuiSklUoKWKV7iFh885UjegJnXpUGHMq0GfXN1SzZwNVOCpUZQvmUAl
         wZVv/mwulIFZpoVx+IaJq/yTsvsiD6UHDTj6qw8PTVLML5IPn0FdBM9nRLhQC9e2aKAB
         /u01OAXzCFlE6Lf25zxbalQ7Q0ZuFUrf1H9RfwLN2zlEoQ/ShPfPWcIgEmgvSF9B8Pws
         Vwrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=cU4ZtNl2vEtEVH/Lak30VWKkW5zSu+7jhI7ooziHVxo=;
        b=XExYoXGhZNbK+9czRI6q5DMzPk7V+HN/bmBqGxSaXS/YsPV49zVdXY5lGu5Vqz3Ssi
         XAXBHUoG6XNJdZPxc/UfNHeJ3df08qBURUQ0YeR//Qp5oSHUkAGpVln4brg8ihI25dck
         8QfBXQCbZeb3UAiSegxmJutqkTKW+YkBPYDA0pZYzEu0S145FRzDLjsTfT4fIckGg9yY
         a3Zbo4NfWe31MM311p7+wPWpv2iOp/TmAPAIKii4tN/ssfd4hEgx9xMCzU6JP2n9/SDe
         MHSpXl51+McLbZnvbQ2Q6CeMnsFYoGg82w13u6lOxCxUWg0WTJG3IRghLu5GzFhrE/27
         fhOQ==
X-Gm-Message-State: AOAM533bpTRbNCXYNkEjqhqsl1XczaxZId7V90mUHaEoNsmvp96y/fcT
        zZlHkFEj3MrHelMOOph9wzszCA==
X-Google-Smtp-Source: ABdhPJzDRMdFOUy5RI8IXI6VfHQuWSfZtMpfsZMkCc8yuVYUOfKov2JEFDGTvRzp8Wcd+aX5lCvZjQ==
X-Received: by 2002:a5d:5012:0:b0:20a:d9a9:44dc with SMTP id e18-20020a5d5012000000b0020ad9a944dcmr3858584wrt.627.1652446677102;
        Fri, 13 May 2022 05:57:57 -0700 (PDT)
Received: from [192.168.0.172] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id d11-20020adfa34b000000b0020c86a9f33bsm2731239wrb.18.2022.05.13.05.57.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 May 2022 05:57:56 -0700 (PDT)
Message-ID: <8f0d4127-7e66-cf50-21c9-99680f737e30@linaro.org>
Date:   Fri, 13 May 2022 14:57:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 2/3] dt-bindings: usb: atmel: Add Microchip LAN966x
 compatible string
Content-Language: en-US
To:     Herve Codina <herve.codina@bootlin.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Horatiu Vultur <horatiu.vultur@microchip.com>
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20220513105850.310375-1-herve.codina@bootlin.com>
 <20220513105850.310375-3-herve.codina@bootlin.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220513105850.310375-3-herve.codina@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 13/05/2022 12:58, Herve Codina wrote:
> The USB device controller available in the Microchip LAN966x SOC
> is the same IP as the one present in the SAMA5D3 SOC.
> 
> Add the LAN966x compatible string and set the SAMA5D3 compatible
> string as a fallback for the LAN966x.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  Documentation/devicetree/bindings/usb/atmel-usb.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/atmel-usb.txt b/Documentation/devicetree/bindings/usb/atmel-usb.txt
> index f512f0290728..a6fab7d63f37 100644
> --- a/Documentation/devicetree/bindings/usb/atmel-usb.txt
> +++ b/Documentation/devicetree/bindings/usb/atmel-usb.txt
> @@ -87,6 +87,9 @@ Required properties:
>  	       "atmel,at91sam9g45-udc"
>  	       "atmel,sama5d3-udc"
>  	       "microchip,sam9x60-udc"
> +	       "microchip,lan996x-udc"

No wildcards please, especially that it closely fits previous wildcard
(lan996x includes lan9960 which looks a lot like sam9x60...)


Best regards,
Krzysztof
