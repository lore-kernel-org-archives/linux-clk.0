Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BDCCC6FA82
	for <linux-clk@archiver.kernel.org>; Thu, 22 Sep 2022 12:52:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231484AbiIVMwI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 22 Sep 2022 08:52:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229644AbiIVMwH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 22 Sep 2022 08:52:07 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EB76E11E4
        for <linux-clk@vger.kernel.org>; Thu, 22 Sep 2022 05:52:06 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id b24so10863395ljk.6
        for <linux-clk@vger.kernel.org>; Thu, 22 Sep 2022 05:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=PNn1OQ2Plf4WVBh8wbrS607nOaHGst3TaPaRJYK7Aak=;
        b=CVGA+9eYGLDgWkSPKlFtUYW7Io1/rFSCvwEMKB7Gs/8EG6JZbR6Klv1N/Ssdfs+JO6
         3Kr1a01uH9k/kaacPBCO4DpAJ4HrfKFcCD7ZgKpoPkG6YHm7RaUDrQB1ciLK6fvi23F+
         LAe8eD4drDrtN1FtQURTmtvpR2coeGjD+xWZt61UNnAOy4+gomuZPUYs+X0rgsqOlE89
         1mk4T0wlxkGlScUZZk+4wtbPpL+LnUTrsbMSOGutcLpxe9NwTsPY9IopfBRrBg1XEaBZ
         ML0D2CDd32mohuD8Xstavzd0cUwk3sfurhLWThgIctivIdhfRmfWDtlydGQS3DGOysSh
         V8tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=PNn1OQ2Plf4WVBh8wbrS607nOaHGst3TaPaRJYK7Aak=;
        b=JPVtBOVoTvwLWqyM/zV8gRnVGgonrASP56wynPyQPBsevnPOA5HXXyB6BaCkn+Kg4Q
         49USSTBisxLnhY2jWgdPLzZZNrf5XuXpZrOzuUuG8hwWm6joRmcxx/t0olhphX4RUyi2
         yCwUz2appJictfzLUrI/2HIXZAuKt/DjsecHR/lACK7lm8lhtYH8ohH8G97RgjgrsNhe
         gzdcMN5rJww6v5EawBEV2EeNWX2UNrNeO9eQvhACclU5+/pG8L7VOH7lI+5HIeop2N4N
         36/EgNA5/dvzawAuNDcs0LsZGfMSyjlcf6VlN0Zi+liSjU0clptSoQ6zYeARZVV7pMBk
         1XEA==
X-Gm-Message-State: ACrzQf10qWc3bqrYWGap269smSk18Vt0yXJqJIAKU9/3jm/PWnWs7TAg
        OyxQ08cDzHjl7hojXTZdwq/oSQ==
X-Google-Smtp-Source: AMsMyM5673D4f9tuM/pxeZPs6CGF5k+tgPEYNZ/c3GXJJnsbfS77mWqxFlfpPqoIXPaNAY62naOkMg==
X-Received: by 2002:a2e:b712:0:b0:26a:d1d9:f8d1 with SMTP id j18-20020a2eb712000000b0026ad1d9f8d1mr1100753ljo.271.1663851124500;
        Thu, 22 Sep 2022 05:52:04 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id t7-20020a05651c204700b0026acd11cd51sm904641ljo.59.2022.09.22.05.52.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Sep 2022 05:52:04 -0700 (PDT)
Message-ID: <179bc9a0-8d11-cc3e-80f6-25bb15325e35@linaro.org>
Date:   Thu, 22 Sep 2022 14:52:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v1 03/17] dt-bindings: phy: mediatek: hdmi-phy: Add mt8195
 compatible
Content-Language: en-US
To:     Guillaume Ranquet <granquet@baylibre.com>,
        Vinod Koul <vkoul@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Rob Herring <robh+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        CK Hu <ck.hu@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     linux-mediatek@lists.infradead.org,
        dri-devel@lists.freedesktop.org,
        Pablo Sun <pablo.sun@mediatek.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mattijs Korpershoek <mkorpershoek@baylibre.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org
References: <20220919-v1-0-4844816c9808@baylibre.com>
 <20220919-v1-3-4844816c9808@baylibre.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220919-v1-3-4844816c9808@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 19/09/2022 18:56, Guillaume Ranquet wrote:
> Add a compatible for the HDMI PHY on MT8195
> 
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

