Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5F4CC54EE9
	for <linux-clk@archiver.kernel.org>; Tue, 13 Sep 2022 15:27:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236151AbiIMP1o (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 13 Sep 2022 11:27:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236299AbiIMPZ4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 13 Sep 2022 11:25:56 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEE5D7D1E1
        for <linux-clk@vger.kernel.org>; Tue, 13 Sep 2022 07:38:35 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id l12so14636675ljg.9
        for <linux-clk@vger.kernel.org>; Tue, 13 Sep 2022 07:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=xEmsNDf40gec/YYynqTjtMwBV+qe6g+v810gZnB2/yY=;
        b=n/VnNf+ICwVhsuuGRhFgokLQJs3XEMncu36QVLE3azT5YhnbnSmpQOE9CTuLNWloDt
         UotvmVpIm4dXJeAFmeXtTj3VsSifIyT0Dn1ESPl8eunw5TILf3SXiL06KMnG1EStkB6+
         PiXBXM3pxzv+7/oSbhKqETtoKIHT1My9+FWlEDQIsOfnn1ikv9sCNyPk8kd9jjSiNEDo
         Qy0Bq3YiCk3UlTtklTb7rpxLjp7qtxssNT7HldVuQZ244KKxCFXMFLmJQPsAhkFTnTrn
         +reZO90IKa8Gf9nYn6+T2VO1g8mSOWxQBXe0ulkQLvlMPKnmqeJXvGUa2IAHAuZ0AKos
         gmSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=xEmsNDf40gec/YYynqTjtMwBV+qe6g+v810gZnB2/yY=;
        b=uBG1A6FmZvPtexSCDT/Ra2za6VeYehZmkooy5RpwjAngPwxRZnmDnK5ZD8jtmm4ohg
         e8oR8oS11m4YrprGXRWSKF2JVyzFEtcnhWilVdIe1Q8rOlD8KjTopmsd8Ei+tgkuvm3N
         HmyJpjd1FZm/H3odInESZCDp6nOJfV3B0EEBas51lsXpI3NtPATwMOb1n25wfvW8AYcP
         Xghg/rDTusy/fXLPl4m/EkvXNRm+S62AbxMFmlWet7we8PZgW/WkGbNW0LkfDUsHBK/I
         SYcSr+AmJ/Q/WmFDmtR2hemW1Ta+TLJPSU2QGcFicuZ6nXAyROdtTp4K1nOsiH8+VAYd
         l4HQ==
X-Gm-Message-State: ACgBeo0FAUSTMHo2pvwH55iWcVXy6h2DkTI+pDPvoH/3rWQPA5PjDPSU
        Zhm2ftaV1q8CNbAupgo+RnDKEo+FUlG5oXOQ
X-Google-Smtp-Source: AA6agR6Enox1pD56Uvibw4ec6gcVUjGoXNOSfHNSakSnkzP5QwlTMpiCjnemyEW1vyX0Dl/lIAU9ZQ==
X-Received: by 2002:adf:fc02:0:b0:22a:43e8:d205 with SMTP id i2-20020adffc02000000b0022a43e8d205mr11154078wrr.420.1663079316589;
        Tue, 13 Sep 2022 07:28:36 -0700 (PDT)
Received: from [10.119.22.201] ([89.101.193.67])
        by smtp.gmail.com with ESMTPSA id l4-20020a5d4104000000b0022584c82c80sm10849099wrp.19.2022.09.13.07.28.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Sep 2022 07:28:36 -0700 (PDT)
Message-ID: <3372cb82-22be-a916-372c-292231ab74d9@linaro.org>
Date:   Tue, 13 Sep 2022 16:28:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 07/14] dt-bindings: serial: atmel,at91-usart: Add
 SAM9260 compatibles to SAM9X60
Content-Language: en-US
To:     Sergiu Moga <sergiu.moga@microchip.com>, lee@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
        claudiu.beznea@microchip.com, radu_nicolae.pirea@upb.ro,
        richard.genoud@gmail.com, gregkh@linuxfoundation.org,
        broonie@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        jirislaby@kernel.org, admin@hifiphile.com,
        kavyasree.kotagiri@microchip.com, tudor.ambarus@microchip.com
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-clk@vger.kernel.org
References: <20220913142205.162399-1-sergiu.moga@microchip.com>
 <20220913142205.162399-8-sergiu.moga@microchip.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220913142205.162399-8-sergiu.moga@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 13/09/2022 16:21, Sergiu Moga wrote:
> Require SAM9260 fallback compatible for SAM9X60, because SAM9X60 is
> fully compatible with SAM9260 and Linux driver requires the latter.
> 
> Signed-off-by: Sergiu Moga <sergiu.moga@microchip.com>
> ---
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
