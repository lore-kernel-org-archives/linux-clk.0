Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8B6EC7EE24
	for <linux-clk@archiver.kernel.org>; Mon,  5 Jun 2023 06:41:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229999AbjFEGl0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 5 Jun 2023 02:41:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229677AbjFEGlZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 5 Jun 2023 02:41:25 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24B57E42
        for <linux-clk@vger.kernel.org>; Sun,  4 Jun 2023 23:41:02 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-51480d3e161so6539963a12.3
        for <linux-clk@vger.kernel.org>; Sun, 04 Jun 2023 23:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685947255; x=1688539255;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WKyJTEWAr2/bbgJ4qj5g0DH+qXUa8fA/In0KtxR+hDE=;
        b=j9sEsVQGcZI0ww4pUAZR4LvJgzBAxv+VHBf2ykJK4FV2Paspea3UMvQUD1Hat0/DK6
         C1ZtBMO0d3gCnu84BBRsvmgPvqeZWNbC0SiDrn8YrEbCDKDVrsHe+EKYYeg3fsAUF7vi
         DSMcugAkDnGFX/wvFCMlCWIAp3F4e5CINRNi6nZC2wLz/C8EA3k6ePtwqvAgx/SHDbsx
         wfXBw4epXXiMf3xILHbRp5rHLLAKMgzGSyhjm08P6v4i92CM2NgMsCPyX5CKBUVqB6Qx
         VLFd208uwr6/GMyOws242w3aXkOsKtMtTh4F1pwluQ09WVNCwATda+lT649Ol+DlX3Mf
         Hidg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685947255; x=1688539255;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WKyJTEWAr2/bbgJ4qj5g0DH+qXUa8fA/In0KtxR+hDE=;
        b=j/p8oHPrDJy7V9BtvFa51yXSv2URZVmRbYa71UxGbEH0qqGEQOwJdCPwenv0/IjTwn
         tyM9QNfhiLYN+YZLnwhkPZrYxYVFXMZIFXvHXuC12pRFrt5zHXZ2asNIeDn5HQK2HOjK
         1s+pkxaEViKdGdO+qk+JE3s1VBz2RL5IDhH99DG+GUlCxMf2BWD+Mc8Wx0gf0iDiKTGk
         NNcJCecOr4bgH453KkQmAXYE78vxplZWuLK/7MOBdR3aqgpSUdoi6UWYlCUH9fNMFM8k
         qNm7qKm8JgX5NGy376R7Vb4RTgt/3f7lw5zmod5VvFF/7ffzBKwTI+Jw+i5Ra8KmiyA6
         /gJw==
X-Gm-Message-State: AC+VfDzliQlX65D31NMs4VyOlTgsl/hrDxah2DzxsTyjFBYvEXEnP8t3
        EIHiFmxtiv6GS9AqQpYwRE+eng==
X-Google-Smtp-Source: ACHHUZ5rD9LvlGRhmhSXQ6m7PkXkbDSH3OreIA9ygN8V+18zsEuiGBcHP+HOLFbqCky2LbZl2Bq7Kg==
X-Received: by 2002:a17:907:6d19:b0:973:ea73:b883 with SMTP id sa25-20020a1709076d1900b00973ea73b883mr5710250ejc.66.1685947255077;
        Sun, 04 Jun 2023 23:40:55 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id qt23-20020a170906ecf700b00977ca5de275sm2220115ejb.13.2023.06.04.23.40.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Jun 2023 23:40:54 -0700 (PDT)
Message-ID: <cb6db583-fec9-f20c-23b3-6fda437e65a7@linaro.org>
Date:   Mon, 5 Jun 2023 08:40:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 06/21] ARM: configs: at91: add mcan support
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
 <20230603200243.243878-7-varshini.rajendran@microchip.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230603200243.243878-7-varshini.rajendran@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 03/06/2023 22:02, Varshini Rajendran wrote:
> Enable MCAN configs to support sam9x7 soc family
> 

There is no need to enable config items one by one. Squash these.

Best regards,
Krzysztof

