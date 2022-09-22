Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC337C6FA90
	for <linux-clk@archiver.kernel.org>; Thu, 22 Sep 2022 07:11:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230227AbiIVHL0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 22 Sep 2022 03:11:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230261AbiIVHLX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 22 Sep 2022 03:11:23 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B70CDB7762
        for <linux-clk@vger.kernel.org>; Thu, 22 Sep 2022 00:11:21 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id g20so8640719ljg.7
        for <linux-clk@vger.kernel.org>; Thu, 22 Sep 2022 00:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=9Be+A/VflX8S5BSqS53W57zqfNrh5ghlqPax0x4FTS8=;
        b=T3mVBaJwvES3FaV8YLG+gKGlW4ElLKPh5ChWHSrNIodjkllrZ8OQYmIrgIuU7FK4mY
         gtckyzupo4ix1OZra5CINB67aFDwsrI36Oc9bV+mP78teb+wc2F73GjoF1Iagtd8u5Ig
         X5GsWm4RA2xFuJ/c07wohmcaJ+7FV4LFKuQsfyrl4NIZqpGKOiFzxxJUiFzOZkuV4Obq
         zR7yFDmao8u+qZLIGzFxSCOGuzx2n1pNtsfAwk7rUlRlLqVkkE+c1sBYU6Q77Qe+1O1a
         MG/81Il1kTsJT2cEToM+YF/EBSmt86qCF5FTSoaLYoa5tOkA3jc+V4RyoFhCq+vZd0hT
         xJxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=9Be+A/VflX8S5BSqS53W57zqfNrh5ghlqPax0x4FTS8=;
        b=Q2UDsfFSc1WotQBcErdVeG6F+igLI6lu60eHW0P4PViWkkbO/phbhpTpj6okqabFef
         5qGnJxKpnxlwoCmePd2oa91mReog9mca0kHKmp0mB1N/XScvH8+P48CAUse5U5MlJQNO
         v3liH0EXMc8F+7EREB6y9ynoMDHyjoYDWjkmbUIdkIV33ZwX0+Y+ANVT2ihgRAbqZ8RM
         7r8m6U85W6H910/KkO7HE6QMOfo6EBWNyV6C7D/wPybWQZqinY4/bGhWiE9Y4WFb2YPZ
         kggCJoJavkchm1NWJqUXlUXYd1P/g+JYFOwvkMX+P6BuJatjC3JC9VhvKBvCRsFQFehn
         avlg==
X-Gm-Message-State: ACrzQf3gO20XnZodDciFJlP0NdhfbNkZ7XbCAfHcaFWeD/jIhkY9bck6
        eyYSb3Q1Cq4nYK9hS6sW+u7ZfQ==
X-Google-Smtp-Source: AMsMyM7iojxShj6IEudo+H4VWui9taf1pE4pa+BEPva5UkHYdDaU9Dgt+hBCkSrdVpL9VnVmgusIXw==
X-Received: by 2002:a05:651c:2108:b0:26c:6102:5d3b with SMTP id a8-20020a05651c210800b0026c61025d3bmr667340ljq.168.1663830679817;
        Thu, 22 Sep 2022 00:11:19 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id k4-20020a05651239c400b0049908e21e26sm785597lfu.253.2022.09.22.00.11.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Sep 2022 00:11:18 -0700 (PDT)
Message-ID: <d01e4a03-1d6d-9616-45ca-1c927f2d8237@linaro.org>
Date:   Thu, 22 Sep 2022 09:11:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v1 01/17] dt-bindings: clk: mediatek: Add MT8195 DPI
 clocks
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
 <20220919-v1-1-4844816c9808@baylibre.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220919-v1-1-4844816c9808@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 19/09/2022 18:55, Guillaume Ranquet wrote:
> From: Pablo Sun <pablo.sun@mediatek.com>
> 
> Expand dt-bindings slot for VDOSYS1 of MT8195.
> This clock is required by the DPI1 hardware
> and is a downstream of the HDMI pixel clock.
> 
> Signed-off-by: Pablo Sun <pablo.sun@mediatek.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
> 

Looks like broken patch.

Best regards,
Krzysztof

