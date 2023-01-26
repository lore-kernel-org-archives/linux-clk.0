Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 764CAC54EED
	for <linux-clk@archiver.kernel.org>; Thu, 26 Jan 2023 15:32:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232292AbjAZPcN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 26 Jan 2023 10:32:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232285AbjAZPcM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 26 Jan 2023 10:32:12 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 070D41CAF0
        for <linux-clk@vger.kernel.org>; Thu, 26 Jan 2023 07:32:11 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id bk16so2137173wrb.11
        for <linux-clk@vger.kernel.org>; Thu, 26 Jan 2023 07:32:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jz1yQJDh82hmVQElGHGWfr/ouKY/iJoAmFgYkVIjURw=;
        b=CWVyglyvdNmFmSjrgGGDhJJYrYauQdQgibOI4/kl+7D0kO8kyPjUmNAkXIfPCdC7Vj
         V80wClnbqrY2beIlkLJ1Vh9QH7V37IgvU0gt34DovVqXLzqm4T6tHoonZs99RCm84zFI
         iJdqw2n16VUyp0dg4ssV6te4UhHXJ5ba4uFJWsAdmziiP5xQ1zhefta8prLOgdyXE8SV
         B7IDYFUur1cKxGe942GwHb0s7sLwII/KYl30pKzd+mNGATpMktX8GNdsCmpFugYegLmt
         asYOdz3+UCsQ4UioAbl3B8S37n3ErYOHlrK7a1QmY0HUEicJiFBWxVYOfoZoylh+ytre
         CMAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jz1yQJDh82hmVQElGHGWfr/ouKY/iJoAmFgYkVIjURw=;
        b=ndUtezThaEEay17XS/RIKyPMc/boW/AtVwk+nfJed1IKiNCDvDeodg/p+UdT/+LBvh
         Ba2PKAVj4lEpT7xkfLyM1KBWUkkQFlkNyBug0YBhsi/QX+CAmUYsghKj3QxXaoI1lGDo
         La8fBeZOjL1cdQwppXgvm8g2YXz38fXwBzYGbd6UDP55RabZxd4F4fhVtzEyzLDXGfCy
         Mex36qpPG7tI7nm8QW2AbIdxX2+q5l5xDDza+7iyIYc/4kXhOY34TQTm9ySiit7XqtDv
         1C9twqiv3dJ5cbu7SUk1qErHsLqCk19ONKSmrlx1EvvuB4Z7+5jtMvfwLYh++uUXkBPj
         yotg==
X-Gm-Message-State: AFqh2kq9b7czcvUKSfNiYr6oYVTzuDOEH43Fq2FgY8q3w3svlh6jk48g
        p1CjxIONvZSQX0M2UoCEG8FIdg==
X-Google-Smtp-Source: AMrXdXvbHP4MU8LW1+p6+/QnuhuohmSQZLuwW60JkdlaAcbwU5Y7GEyF4W4xaywzdk2WMdog6QND6Q==
X-Received: by 2002:a05:6000:1e18:b0:2bd:d782:c2c1 with SMTP id bj24-20020a0560001e1800b002bdd782c2c1mr35767974wrb.24.1674747129636;
        Thu, 26 Jan 2023 07:32:09 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id n15-20020a5d598f000000b002bdff778d87sm1865447wri.34.2023.01.26.07.32.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jan 2023 07:32:09 -0800 (PST)
Message-ID: <67279d92-7a46-8a55-34d1-03d10369d8f5@linaro.org>
Date:   Thu, 26 Jan 2023 16:32:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v2 2/6] dt-bindings: clock: mediatek,mt8186-fhctl: Support
 MT6795, MT8173/92/95
Content-Language: en-US
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>, sboyd@kernel.org
Cc:     mturquette@baylibre.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
        edward-jw.yang@mediatek.com, johnson.wang@mediatek.com,
        wenst@chromium.org, miles.chen@mediatek.com,
        chun-jie.chen@mediatek.com, rex-bc.chen@mediatek.com,
        jose.exposito89@gmail.com, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com
References: <20230126085321.87267-1-angelogioacchino.delregno@collabora.com>
 <20230126085321.87267-3-angelogioacchino.delregno@collabora.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230126085321.87267-3-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 26/01/2023 09:53, AngeloGioacchino Del Regno wrote:
> MT6795, MT8173, MT8192 and MT8195 support Frequency Hopping: add the
> compatibles for them.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

