Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FBFCC7EE24
	for <linux-clk@archiver.kernel.org>; Mon,  5 Jun 2023 06:42:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230034AbjFEGmS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 5 Jun 2023 02:42:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229961AbjFEGmR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 5 Jun 2023 02:42:17 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12A9FE6B
        for <linux-clk@vger.kernel.org>; Sun,  4 Jun 2023 23:41:45 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-977e0fbd742so63595966b.2
        for <linux-clk@vger.kernel.org>; Sun, 04 Jun 2023 23:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685947301; x=1688539301;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ES4QwZGNTqaGDHkT5g+vUXHwRybmHm+v/fVuOTJ+7nY=;
        b=zvVD+Qymqy+NcNPO08oupjqv+659xgLwRbW2xE7uEMe5qvtSExF/OpeShP9JAzUcl+
         NV0nE0NP873VpH1gnyDpAVAtzyPjw1/2FE4TIw4MkMytJOXU80szSd8wX38WrUVBN1Hs
         3S2BcZfkEJ18KMmG4zUNHCTKIXZDcJIXRuqTlN3W+cHPwhVHGK6Sb9CxFJpgS0V+YImr
         pCXMu9yOzKi4fCo5Qh3nZhWuLYcX4OGbmKiFk0q9/04XFkH+znzUunADVm5q2Ap7+6Jn
         C1AR9OLDsL0IvZBrDtKlPfFrDQkfTo6Zg/ha2nhoPyNSjbQcILanOw0s10R1zekKDR8/
         7DOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685947301; x=1688539301;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ES4QwZGNTqaGDHkT5g+vUXHwRybmHm+v/fVuOTJ+7nY=;
        b=c0sSJL844u1zgwqP/aMIc0VJr0OosVNlzpvvsRTdyzPfUitTSR+68YRiKsrVCnPPPf
         /G1pBbNTiKEld9lNMD036Quj9lHhgSdKnGiyHA5Bxpm6DCTTWhn8Ny6HOXciurhokpl+
         l6FO2fU7ow/8Tlq1uilAs6aqon0KlrCdIE5armdd3y85Azg2N/1chbktfuB2iciOn6oY
         6WQT0MsaVOqdowZSNWIBTtAYLGNUj5acGOh/xViuNnMuPWXWGrDz1CtXXOsCNRLn4eFC
         zeiOVEiL0nmzhHd/GaJQ9jGnZTCyMry3eHc1+ACkM7cJTJjH2/VJaopxQElg1uT+3zIo
         y8/g==
X-Gm-Message-State: AC+VfDyNOZB3wouhg5QnROza9hjRsryEMSUYngcP9cejzXP+MhoNsQ5j
        YBgF2YsM3QQ87prnij/wMVh3cQ==
X-Google-Smtp-Source: ACHHUZ4MLkQ0TxRJYotGe0A3pkwTJOfonlJxjBPm4WV0ed3f0oPF4CbcpOdQhoL+RWTTYXC+hwB8CQ==
X-Received: by 2002:a17:907:6d28:b0:973:9337:1aac with SMTP id sa40-20020a1709076d2800b0097393371aacmr5790961ejc.60.1685947301554;
        Sun, 04 Jun 2023 23:41:41 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id jp25-20020a170906f75900b0096f675ce45csm3863114ejb.182.2023.06.04.23.41.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Jun 2023 23:41:41 -0700 (PDT)
Message-ID: <fdf5723d-802f-21c2-3808-dcdcf1869bf4@linaro.org>
Date:   Mon, 5 Jun 2023 08:41:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 04/21] ARM: dts: at91: sam9x7: add device tree for soc
Content-Language: en-US
To:     Varshini Rajendran <varshini.rajendran@microchip.com>,
        tglx@linutronix.de, maz@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
        claudiu.beznea@microchip.com, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        gregkh@linuxfoundation.org, linux@armlinux.org.uk,
        mturquette@baylibre.com, sboyd@kernel.org, sre@kernel.org,
        broonie@kernel.org, arnd@arndb.de, gregory.clement@bootlin.com,
        sudeep.holla@arm.com, balamanikandan.gunasundar@microchip.com,
        mihai.sain@microchip.com, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        netdev@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org
Cc:     Hari.PrasathGE@microchip.com, cristian.birsan@microchip.com,
        durai.manickamkr@microchip.com, manikandan.m@microchip.com,
        dharma.b@microchip.com, nayabbasha.sayed@microchip.com,
        balakrishnan.s@microchip.com
References: <20230603200243.243878-1-varshini.rajendran@microchip.com>
 <20230603200243.243878-5-varshini.rajendran@microchip.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230603200243.243878-5-varshini.rajendran@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 03/06/2023 22:02, Varshini Rajendran wrote:
> Add device tree file for SAM9X7 SoC family
> 
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> [nicolas.ferre@microchip.com: add support for gmac to sam9x7]
> Signed-off-by: Nicolas Ferre <nicolas.ferre@microchip.com>
> [balamanikandan.gunasundar@microchip.com: Add device node csi2host and isc]
> Signed-off-by: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
> ---
>  arch/arm/boot/dts/sam9x7.dtsi | 1333 +++++++++++++++++++++++++++++++++
>  1 file changed, 1333 insertions(+)
>  create mode 100644 arch/arm/boot/dts/sam9x7.dtsi

How do you even test it? Where are boards and their bindings?

Best regards,
Krzysztof

