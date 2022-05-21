Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99C52C433F5
	for <linux-clk@archiver.kernel.org>; Sat, 21 May 2022 14:37:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355257AbiEUOhK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 21 May 2022 10:37:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349812AbiEUOhJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 21 May 2022 10:37:09 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C148764BF4
        for <linux-clk@vger.kernel.org>; Sat, 21 May 2022 07:37:07 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id p4so17283498lfg.4
        for <linux-clk@vger.kernel.org>; Sat, 21 May 2022 07:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=bIY1yUbknyVqSNNQl9k49YdfHFXypUK+qkCbMASPInM=;
        b=bkX8XNMCdE00Wl+Tn3SOqnu5S2DSHFkS0ASjG8U5MvDsDWWxG2xYpmaiewaESOyMH9
         Jr96sPR86V2MdsoYbVYHF1RjoXHMG8nkEuWZMjtXGyoy0BGj3MzbtlC4diUEhIx9KJ1T
         47ExF39SYS2ZbkvQziN+Yhw62mX1WxUEdV+f9EXeQx8Y7uVfVHEG+yyTxwe8S4bN57aG
         c6mGgjv2MZitv3Ldq5aOOVEeOHNV2cz8nTWJqjKmBDbvulxCtLnvu4B7I1UMMRxI3MF6
         b2MTpJLhkW3Ri6xqVLxmBIWReGnWdQdCsjv7/AGjPMy0GF18mcQ/JrQq7AZcpk+Wwppl
         qrzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=bIY1yUbknyVqSNNQl9k49YdfHFXypUK+qkCbMASPInM=;
        b=vtQfsta81MbErPt17JeuCVwc6QjLe1u5pzjHDPeZsBivGtX4J+XgMHDxKMuYcUOEXf
         bLqtMQPsVWDD/ezDJmnPrcylzYobJlrEnv9HO6MFqi2LP6+4nPr83nSn1Wqjxal3NEd5
         gzvPHGMqxE/I/McCmpmxNMuTo6yoN79FP2IOmQwYFcl5Lls65l9sKCy3/KECYp4ZVGmx
         I7p56nSOBJz1gmv7TyLSye3x95vyk+O6B9bDMjmsHszXVcaKnEtJVPGdv77r5iNcW91D
         DIgWf33C/nZkH0Gj/oZNp+aonmeT7vIFkdFsCrS1R5bcbthdYfoh174rpAZOKtApWBd4
         /BRA==
X-Gm-Message-State: AOAM533ZhlNedckWW1sConGX2PiYBjnexO+FHeWUY+YvEEkQHsQo2MjS
        GxdNU4JdKsbONNvvpLuO3bBUZA==
X-Google-Smtp-Source: ABdhPJz0JjJvYOFloztntmHbn0+EPKW+2LhRTJ3K/wSNWtmn5A6cMfAiFRzhARHiK3HCimydCYML9A==
X-Received: by 2002:a05:6512:3d26:b0:473:a5e5:1661 with SMTP id d38-20020a0565123d2600b00473a5e51661mr11030778lfv.239.1653143826160;
        Sat, 21 May 2022 07:37:06 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id bf6-20020a056512258600b004785b0dfba4sm430276lfb.195.2022.05.21.07.37.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 May 2022 07:37:05 -0700 (PDT)
Message-ID: <1385f9b7-b8e0-4c13-63d2-48e99a97e998@linaro.org>
Date:   Sat, 21 May 2022 16:37:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 0/3] Microchip LAN966x USB device support
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
References: <20220520152335.352537-1-herve.codina@bootlin.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220520152335.352537-1-herve.codina@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 20/05/2022 17:23, Herve Codina wrote:
> Hi,
> 
> This series add support for the USB device controller available on
> the Microchip LAN966x SOCs (LAN9662 and LAN9668).
> 
> Both SOCs have the same controller and this controller is also the
> same as the one present on the SAMAD3 SOC.
> 
> Regards,
> Herve
> 
> Changes v2:
> - Avoid wildcards in the DT compatible string
> - Rename the DT node

Thanks for changes. Please mark your patches as v2. The easiest is with
`git format-patch`.


Best regards,
Krzysztof
