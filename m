Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F28BEC83F14
	for <linux-clk@archiver.kernel.org>; Tue, 29 Aug 2023 17:28:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237384AbjH2R1x (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 29 Aug 2023 13:27:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238167AbjH2R1o (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 29 Aug 2023 13:27:44 -0400
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98C34CC9
        for <linux-clk@vger.kernel.org>; Tue, 29 Aug 2023 10:27:15 -0700 (PDT)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-50043cf2e29so7221259e87.2
        for <linux-clk@vger.kernel.org>; Tue, 29 Aug 2023 10:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693329659; x=1693934459;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QBKkSL9t38kSqeftJsbciCM+HglFHnwrbKgwPhleq2o=;
        b=WOyiTVlnOOUo6lKsyRU0FN0t4Y0sbAF7/1a9l8mU5zGheftOc2fA41+7bCjl3jMHaC
         SdSdMV2DBKjRnw1tr2HnWisrSnTXsku10i1pwBDD62x096r2AUaZ8gEGrGo3NCJbxgJz
         zv1axfA/ZNKEESvUiu0gC/krrVKl/kGAJfwbyFwsYFIzEIzVkf/feQ3TBotYPHegFQ8y
         Fdle+Z4wZCcxfK+3JbdGH9LGAWOKMXY6nXXMQkDr7d51pdunU2ilmTA/HRTXh2s9cmnZ
         9hm29kl6z4GKDxqVPxPFJ30PJphupOPXQbS5T6+pHdzKUPeEn90N1xu6MxDgkYvi1l12
         U90Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693329659; x=1693934459;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QBKkSL9t38kSqeftJsbciCM+HglFHnwrbKgwPhleq2o=;
        b=a3+3g3xtpiZlNW+js4/zxpeeYcxkhK9tVvlVq5WNJc0sB4aClzesiauqoKT/jGVEkZ
         yZCXn7p6sqCrF0kthu3+56WsSVQhZBONuuQYiFx+u/sjQ9cxsEwSLa4IoF1tIQOv6qtj
         cP/Bps1WxxSFhwigKPcrkuOJwIf5ZBGsBTKmeO3Rr3muFjKXtdRI5x0nqRxdZcRE4in6
         vmmqYjJe0CqOK24jqos+XSUeUMSRvAIz96XopJ+d9TCA06gFJdtFC+fw1KNSr2MZTU3P
         0anjLqGuMguW/8cV6DuhFXKHrMYSrKZ+r1glKn07NRuyNbON+EwJQEAUxyLlAJGhX5zD
         QvyQ==
X-Gm-Message-State: AOJu0YzrJ6pNKqa9XOIOmLpjfjysvgGEHbJn5iN8nU3Bb4vhjhcqATh3
        n872+Y8c8slpgerMfk4Hem5ZdA==
X-Google-Smtp-Source: AGHT+IG/q2ZZ6mJ8wgVf7UkQm2wC4U2oV3GvzNYN1v09DUHmgy8f2+SWpj1f+hhyVjmrfvs8FPGv0Q==
X-Received: by 2002:ac2:4bd3:0:b0:500:ac3:dd77 with SMTP id o19-20020ac24bd3000000b005000ac3dd77mr9085492lfq.10.1693329658953;
        Tue, 29 Aug 2023 10:20:58 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.196])
        by smtp.gmail.com with ESMTPSA id l15-20020aa7d94f000000b0052568bf9411sm5797806eds.68.2023.08.29.10.20.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Aug 2023 10:20:58 -0700 (PDT)
Message-ID: <d3fa22f6-22e4-3d15-70d1-d64b2c125ad7@linaro.org>
Date:   Tue, 29 Aug 2023 19:20:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 02/31] dt-bindings: gpu: mali-utgard: Add Rockchip RK3128
 compatible
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
 <20230829171647.187787-3-knaerzche@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230829171647.187787-3-knaerzche@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 29/08/2023 19:16, Alex Bee wrote:
> Rockchip RK312x SoC family has a Mali400 MP2.
> Add a compatible for it.
> 
> Signed-off-by: Alex Bee <knaerzche@gmail.com>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

