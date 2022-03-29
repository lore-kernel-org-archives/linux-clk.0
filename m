Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADD47C433F5
	for <linux-clk@archiver.kernel.org>; Tue, 29 Mar 2022 19:06:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240822AbiC2TIE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 29 Mar 2022 15:08:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240841AbiC2TH4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 29 Mar 2022 15:07:56 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C27551403E8
        for <linux-clk@vger.kernel.org>; Tue, 29 Mar 2022 12:06:12 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id c10so18650344ejs.13
        for <linux-clk@vger.kernel.org>; Tue, 29 Mar 2022 12:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=R4sUD/h50Bf43vOXljayxbaTzrnkE01kcRyo4ru/wmE=;
        b=dCHc12WonPl6079dcHq+ZOly+/rYb0WPhWVaW6uIMntiA3fSfeCfEgE1dLYF7YlsIw
         fFJDXnoMDTFZoWfnZ+6Db1MZBFQuJEORc/aKf+HuWVMFxMnP1JAXXhg9bR18DccS9e9K
         P16oZnRCBSMXFsP6jmDv33TIG8sogxezhfe3hiNFk1F4c7vcCV4P9yysaYkDPXyG45lD
         XYVFXnugodx50wXw6cndXonIZ7rKmo0gZ1iI0FxsbePnKo6dvvHObMtUlmDxrIIOhnj8
         MHBFszLv4oOpT6ssux6c7vd+TPiSdJu+0Tdbf/b2rMLG5R8HJlFtWMPOeY2k/ffKm8Ze
         Txpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=R4sUD/h50Bf43vOXljayxbaTzrnkE01kcRyo4ru/wmE=;
        b=VsjfYtnqbvBC+5M6YMnGHYODb1BIEaZf1HcBhX1VF3gbGEhUtAJvxifxtfUcGU5HQy
         WroXt6TVIncS9d6VtonfDTsoQ2AVqzuqkEdloE8vIUOy77XDUlU8mPUB1lUmsb6T+CZm
         SQAKBMI9l/ed9NbryqJcz4QrBkrEP01upDDrl8vbBdeF2T5KrUAvaXcpZDoXzRipwPAJ
         M8j/r7i4tY3h4hTZZqofETGRQMEPnNzKMSs/a+bsRAp6pMVzyPZB3Wk1y9cr8CkQKRl2
         tsnqcReOliuA145ivl6hWLDTJaVPkJQbFlV7hNSroK4TImSbrYoYPm4uqX/JdskDT6SG
         88Nw==
X-Gm-Message-State: AOAM530DieGsIMXwC4s1XbHHK4VGWfD86qneA2sbEjAjK1qfvNHPRRzm
        YhGBc+0if1li/tNl4shd76b90Q==
X-Google-Smtp-Source: ABdhPJx2shVhEMiPQQnvRhN82e0FGdSWbageEUczWptVA506xGOCxhu6bQZW3y6SqBnigtrgpKjrxQ==
X-Received: by 2002:a17:906:704f:b0:6e0:2ce5:131e with SMTP id r15-20020a170906704f00b006e02ce5131emr34569646ejj.246.1648580769541;
        Tue, 29 Mar 2022 12:06:09 -0700 (PDT)
Received: from [192.168.0.162] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id bm23-20020a170906c05700b006d597fd51c6sm7492373ejb.145.2022.03.29.12.06.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Mar 2022 12:06:08 -0700 (PDT)
Message-ID: <e019c6cb-9840-5e4c-9c36-10e2ec99bba9@linaro.org>
Date:   Tue, 29 Mar 2022 21:06:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: convert rockchip,
 rk3368-cru.txt to YAML
Content-Language: en-US
To:     Johan Jonker <jbx6244@gmail.com>, heiko@sntech.de,
        zhangqing@rock-chips.com
Cc:     robh+dt@kernel.org, krzk+dt@kernel.org, mturquette@baylibre.com,
        sboyd@kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220329180550.31043-1-jbx6244@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220329180550.31043-1-jbx6244@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 29/03/2022 20:05, Johan Jonker wrote:
> Convert rockchip,rk3368-cru.txt to YAML.
> 
> Changes against original bindings:
>  - Add clocks and clock-names because the device has to have
>    at least one input clock.
> 
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> ---
>  .../bindings/clock/rockchip,rk3368-cru.txt    | 61 ---------------
>  .../bindings/clock/rockchip,rk3368-cru.yaml   | 78 +++++++++++++++++++
>  2 files changed, 78 insertions(+), 61 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/rockchip,rk3368-cru.txt
>  create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rk3368-cru.yaml
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
