Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE0C1C6FA8F
	for <linux-clk@archiver.kernel.org>; Tue, 29 Aug 2023 17:29:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230472AbjH2R32 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 29 Aug 2023 13:29:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237823AbjH2R3E (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 29 Aug 2023 13:29:04 -0400
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AA11E61
        for <linux-clk@vger.kernel.org>; Tue, 29 Aug 2023 10:28:32 -0700 (PDT)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-9936b3d0286so630674466b.0
        for <linux-clk@vger.kernel.org>; Tue, 29 Aug 2023 10:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693329730; x=1693934530;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2tJx1LZA2LjgFtn73CfwP5M/IqTnK+MwGx8w31m75yU=;
        b=zhdT4+gqpd6hXl/1AYIMtl2I0Wi+ntmhHwcmBTqkgBdvdiVKuV+a+dl3qf6MAC89Yg
         xtFKR6zdCcg3/y9R9kN0QMBc3eeiglNerx8lEfteQJMddk3E6iZif5l2T9B4XvKrE4ma
         hYV1xLa2w3qc7BFGJIpITAtU+wKnbA5fhNkJSaRIR9+2o36urU0mHIIeYsJkxt6huU8v
         SdEYknF7yo13DKV/C0MCR/50DtwnBGfyf/pCh5qAp0176tnlclQF4fBPE5h/SKyKzi4q
         alj0NninrfISvuwp2iM8QhKKKSXceytX0YvYXWTOUbyrmlluV8qB43btBUzRiXMPYAFy
         NyDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693329730; x=1693934530;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2tJx1LZA2LjgFtn73CfwP5M/IqTnK+MwGx8w31m75yU=;
        b=SAieFyhMN+5pesTRODsAf5VoP6JHzGNLmup638P5zo+pVzx/i3JyLf8TOOR07snJh7
         gM//pVnX6VteczPGmXUHU4PARTgKFUPhluUIeqjwtISeXzvI8erk51Gvpz3tvpSUc5X/
         +AeyDIsMdbw+zkGIJARYFpOxo46fvjcyW1G+nyrPI/HLvQegZqCK/tawkbvgSJq16nLN
         w8iJi9rgXaY4C2D7VXwo9WfeFSpiNdGgxO9HvI0GX1ScByahvvjQwlTYpVFMSv7JwjHt
         GSF8DOG/kXaOU6geCMtqox6ljvtPr71x+LAzCww/qULRxrmwRIWLPu8TEn4mg/t2BMms
         judg==
X-Gm-Message-State: AOJu0YxiXc/q/fK0b5IOomRGgrhAMKs/7mVS5T0lxX/pOAUbbp8bzjfk
        Y2lcPPsgAa9pZfNDNnZTG1pGkA==
X-Google-Smtp-Source: AGHT+IEkfyuO10UaoAlJW/IYUjOxaNUiUgX99OtB+CD8vi2Z/YeQChXUrbKkNwIR57XqpbHKCgrV0w==
X-Received: by 2002:a17:906:51d6:b0:9a1:d087:e0bf with SMTP id v22-20020a17090651d600b009a1d087e0bfmr15768869ejk.43.1693329730572;
        Tue, 29 Aug 2023 10:22:10 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.196])
        by smtp.gmail.com with ESMTPSA id v24-20020a17090606d800b0099364d9f0e2sm6189666ejb.98.2023.08.29.10.22.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Aug 2023 10:22:10 -0700 (PDT)
Message-ID: <92b8261b-420e-d96a-ba77-9abe7d53b427@linaro.org>
Date:   Tue, 29 Aug 2023 19:22:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 04/31] dt-bindings: arm: rockchip: Add Geniatech XPI-3128
Content-Language: en-US
To:     Alex Bee <knaerzche@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, Lee Jones <lee@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     Elaine Zhang <zhangqing@rock-chips.com>,
        Johan Jonker <jbx6244@gmail.com>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, alsa-devel@alsa-project.org,
        linux-clk@vger.kernel.org, linux-phy@lists.infradead.org
References: <20230829171647.187787-1-knaerzche@gmail.com>
 <20230829171647.187787-5-knaerzche@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230829171647.187787-5-knaerzche@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 29/08/2023 19:16, Alex Bee wrote:
> Add Geniatech XPI-3128, a RK3128 based single board computer.
> 
> Signed-off-by: Alex Bee <knaerzche@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
>  1 file changed, 5 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

