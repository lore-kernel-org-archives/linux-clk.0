Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C93F1ECAAD8
	for <linux-clk@archiver.kernel.org>; Thu, 22 Sep 2022 19:31:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231197AbiIVTbP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 22 Sep 2022 15:31:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230356AbiIVTbL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 22 Sep 2022 15:31:11 -0400
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com [IPv6:2607:f8b0:4864:20::829])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07C0EEB122
        for <linux-clk@vger.kernel.org>; Thu, 22 Sep 2022 12:31:08 -0700 (PDT)
Received: by mail-qt1-x829.google.com with SMTP id j10so7051601qtv.4
        for <linux-clk@vger.kernel.org>; Thu, 22 Sep 2022 12:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=NWcgMuOu/DRb30hVDSf+gjGKztVe28VznYCH2jRwr2w=;
        b=Uv1U0RJbEpqFZrbA9uyr91kswnGSB3cjK6Aj9EXiOeZ7e0XWQub4bxwG+sbRw5QAA4
         44JMp1BuOrUDUJ0uP0C6KSA8VHC/IuXF6Kqv6lVLWrpR8Nw200fkrYzWK0LLM3GfbgbA
         NCqH1+i21BykwSS/x2OqgxCdNhFdsFfsXRuCs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=NWcgMuOu/DRb30hVDSf+gjGKztVe28VznYCH2jRwr2w=;
        b=NmLvMm98ZAgDymWyqH7NDRsGNoBPO6n1XIZMYSeqxkeoXMVQ+SziZzN/FU1JMbuaXK
         QMXJ676bghOEPukbyA+C8w9dy1gXWH7l4OugEIzrEvv7OKbElonGm+HvRV9T+cKIDBLI
         exqhKxs32DjcEgErYuGZ+9hV5Rrfq2P/Wd5xKIuGAjQHlXHugb/ztDSQJyfz6KHW5Jag
         S5qMxFRS8Hkj1pFp/W+1xgsyFO14VrWAxgag9qLdGlmyzgXdv7G0RixVVxo+2xjX0tlz
         2TgTQzvlMERKpoaFxJ3tCT9CYCMpnP3n8nTHQzOSSVstAtZDwZyjFwNBkvO/QUc1GqZB
         eihQ==
X-Gm-Message-State: ACrzQf0AztJ6DYm9I7GfwgNquRqm0RB1rXizOiv6J9Sl+EVyv1g+kF/d
        3KV5BYT1stwyPNY4ukYvO9RKaDLdCnfG2p9Z
X-Google-Smtp-Source: AMsMyM5X3spJySOGhlhXn9TKeJ1vUC4PQaWa4xgYswhH4zjD3fT+v5idDUvkA6X33EHtGeHu/7U0ag==
X-Received: by 2002:ac8:5c0b:0:b0:35c:e066:998d with SMTP id i11-20020ac85c0b000000b0035ce066998dmr4195776qti.336.1663875067117;
        Thu, 22 Sep 2022 12:31:07 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id i12-20020a05620a404c00b006b8d1914504sm5393430qko.22.2022.09.22.12.31.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Sep 2022 12:31:06 -0700 (PDT)
Date:   Thu, 22 Sep 2022 15:31:04 -0400
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Guillaume Ranquet <granquet@baylibre.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
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
        Bo-Chen Chen <rex-bc.chen@mediatek.com>,
        linux-mediatek@lists.infradead.org,
        dri-devel@lists.freedesktop.org,
        Pablo Sun <pablo.sun@mediatek.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mattijs Korpershoek <mkorpershoek@baylibre.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v1 01/17] dt-bindings: clk: mediatek: Add MT8195 DPI
 clocks
Message-ID: <20220922193104.4qminv6adrajkhw2@meerkat.local>
References: <20220919-v1-0-4844816c9808@baylibre.com>
 <20220919-v1-1-4844816c9808@baylibre.com>
 <d01e4a03-1d6d-9616-45ca-1c927f2d8237@linaro.org>
 <CABnWg9uZ=FrumgUzyUoUiS6T51nZTEf5JZ-1KF0-Ra9Ood5ufA@mail.gmail.com>
 <6b24be8f-94d7-6973-6f35-18cb15fc8cd4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6b24be8f-94d7-6973-6f35-18cb15fc8cd4@linaro.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Sep 22, 2022 at 02:51:00PM +0200, Krzysztof Kozlowski wrote:
> Thanks for explanation! Probably your patches are perfectly fine and
> should apply, although I must admit diffstat is often useful.

Krzysztof:

The patches should indeed apply without problems and there's a fix for the
missing diffstat already in place.

Best regards,
Konstantin
