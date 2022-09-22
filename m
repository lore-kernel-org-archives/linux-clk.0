Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73C0CC6FA8B
	for <linux-clk@archiver.kernel.org>; Thu, 22 Sep 2022 07:20:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231148AbiIVHUj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 22 Sep 2022 03:20:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230488AbiIVHUZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 22 Sep 2022 03:20:25 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAF01AA3CB
        for <linux-clk@vger.kernel.org>; Thu, 22 Sep 2022 00:20:23 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id z20so9902810ljq.3
        for <linux-clk@vger.kernel.org>; Thu, 22 Sep 2022 00:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=l75230f4/Tc4m+TS6iA4e2H4Q+VpG770+Je6OFiVsyM=;
        b=hQ/UL/kN7XbzEXqfO+tmv964OK2GMoUE38JlkbYLqDPJ3sX9aZ7YaBiMAegrLKbyFm
         0lZTvlLYhE4eq+ExfRYlG4w+IguonGImEXN1v7MA9wWCrKgtVqE6SlrQ5VX0NG5E9Y38
         /4BtzZAHXkNvDllPnvs5t7kQv4zT0w0CgLdr2XvTwVocykNzokmm0+yttQvK5fx3Huhi
         zNfdsrW1u+Dk3rWZfo4H2Ndvrr5eoKn1l2tfcmE+E+seNPLEYCzpsjlgaKMuf7tWEqls
         XHvG3Ou2t6CdsQ7XwS5mMARAd0yru57ioABcS+6+ct3Mv211ahTfWMz9T8lmsbob5+7B
         DFWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=l75230f4/Tc4m+TS6iA4e2H4Q+VpG770+Je6OFiVsyM=;
        b=yDDixtWgPwpROvJ39BsXwX5xMmAYgUyZ5PjyAo4faHFOmKFdg7qhrK+eQQWBfdaZSw
         74+4HC3ZNn5eA/oGVWvzuURLOOtUJXn2reuBS59l9lsLaYK5QnAQeQ7WAYDEKk4oMynj
         csXn4wJ6Pu1H1fGIZO9/S2JvsVx/QFjM7wwS3GucSOWLwJR7FA1qUHEQfJnQULX3Ndcg
         V+2EQh1J0Qr1XyPEUOPPYjchY6BUh82JJ6xQ9QZIsoOOCOw5GVBIOpTmmui6fgtlPqyd
         fYTsspLQfXd4CxSYEMuUlvi3pCLQC5LK7weDG5tWAw4dF08AMaanSo8wpnwKeBQSEFeO
         +dUg==
X-Gm-Message-State: ACrzQf1p4ZDv9zdLnFB8pejnYJP2mDH/kNpmaMHnf9Ccz6/ubBTcXPs0
        sLzJo9Pnwbir/74yLVhQ1PngGQ==
X-Google-Smtp-Source: AMsMyM5wVw1kKJjWwk0eAv9vC8nvZTseIqkjOoLB/YN16eVtCyQpO11pitWkmTSeOsIupJQ3U8Qndg==
X-Received: by 2002:a2e:9b17:0:b0:26c:4ede:512c with SMTP id u23-20020a2e9b17000000b0026c4ede512cmr577476lji.529.1663831221961;
        Thu, 22 Sep 2022 00:20:21 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id a14-20020a195f4e000000b0048ae316caf0sm805348lfj.18.2022.09.22.00.20.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Sep 2022 00:20:21 -0700 (PDT)
Message-ID: <e993c25e-f334-e1ca-73f8-58cf141c521e@linaro.org>
Date:   Thu, 22 Sep 2022 09:20:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v1 15/17] dt-bindings: display: mediatek: dpi: Add
 compatible for MediaTek MT8195
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
 <20220919-v1-15-4844816c9808@baylibre.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220919-v1-15-4844816c9808@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 19/09/2022 18:56, Guillaume Ranquet wrote:
> Add dt-binding documentation of dpi for MediaTek MT8195 SoC.
> 
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> index 5bb23e97cf33..2c7ecef54986 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> @@ -24,6 +24,7 @@ properties:
>        - mediatek,mt8183-dpi
>        - mediatek,mt8186-dpi
>        - mediatek,mt8192-dpi
> +      - mediatek,mt8195-dpi
>        - mediatek,mt8195-dp-intf

Aren't these the same?

Best regards,
Krzysztof

