Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CF29C433EF
	for <linux-clk@archiver.kernel.org>; Wed, 29 Jun 2022 11:46:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232642AbiF2Lqs (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 29 Jun 2022 07:46:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232572AbiF2Lqr (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 29 Jun 2022 07:46:47 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0830A3F88D
        for <linux-clk@vger.kernel.org>; Wed, 29 Jun 2022 04:46:47 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id q6so31950613eji.13
        for <linux-clk@vger.kernel.org>; Wed, 29 Jun 2022 04:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=y26EqFL9g5dJmCSYo/uiI7QjtNL6pCpbp9EtOx0DV2k=;
        b=Xs0iqTshoHumfeIOWL/pDmURrLeeZH6zhilSdxZPMQdL1VsBFaBZ2wS2NtClKado9J
         IJajaGH+wiNLsgGnkXvQwQ0Q1DQ46NgL+wJj3hRda9LnjJ8WFE9/UKVAL6Z+F/RkLwKT
         95cJIPkbww0uqMXiEs67n2yHsbvHTG0Gw6KqqZ3mLdCPjoBT4sijYCR7gLfQxGBkc2Co
         oYpTxnKiBv/RueGhSE4FGYytFwr8hUKxGIxmvBnReaURlfYKdO8ZxR8l/rA7P4KbIP4j
         UPB/E1T1cZP2VCttYrc1aDfknofasecBmLnRkD9k8RmFHHt5qjMz/g/a4mps+oMmzoTF
         sAVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=y26EqFL9g5dJmCSYo/uiI7QjtNL6pCpbp9EtOx0DV2k=;
        b=LFZYpyfpGcs+t8t/ivOgKw5hMBWKNTqyVxbJxpxAu9jB+MJeaddTOVMCEOvULKH4SV
         CxLeUFrGE30n+sXci/knUpPtbfUZldAhhiZ0KcuLwNnWv0iIQ1eJCGpoGvVrczpwOfQ1
         NFJZYJKg6oUHSBZ/66s1I5apzc9l5/v86Ts+mjyuTmGnboe7G/Tmyu8xEhBMH7oGAlMT
         dBurN9pi5B3CGgoAhjWWGLgAsL+rufH1GX3vaWdhRpBrPwiyqgP7yONKsH6zKHie/4/l
         ExCZBWs0TcqVZjrpSM0WphmirWvA+mGXspDHf99vQEvXRC0BwQCmU/qIq4LomDgXlqoS
         TM/w==
X-Gm-Message-State: AJIora/htOR5jnrKh18Ym9MxymyWsI8+0N5WkoUVOzEUTVx87PX9pRcT
        r0vKs2z3pu6yQeFJpA2Jxt6e2g==
X-Google-Smtp-Source: AGRyM1uh2G3mI6ImWNz8iu33UFfTR01pMKRnSNrsb6NJV3DDngQMz4Q29Cs61ZqPiJ7yXvPUhJQicQ==
X-Received: by 2002:a17:906:6545:b0:722:7c99:1ad7 with SMTP id u5-20020a170906654500b007227c991ad7mr2906545ejn.325.1656503205568;
        Wed, 29 Jun 2022 04:46:45 -0700 (PDT)
Received: from [192.168.0.184] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id cq12-20020a056402220c00b004356b8ad003sm11028134edb.60.2022.06.29.04.46.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jun 2022 04:46:45 -0700 (PDT)
Message-ID: <bd98faab-a94b-17ad-fbaf-aafe5b882bdd@linaro.org>
Date:   Wed, 29 Jun 2022 13:46:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/2] dt-bindings: reset: mt8195: Add resets for PCIE
 controllers
Content-Language: en-US
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>, mturquette@baylibre.com
Cc:     sboyd@kernel.org, matthias.bgg@gmail.com, p.zabel@pengutronix.de,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        wenst@chromium.org, chun-jie.chen@mediatek.com,
        miles.chen@mediatek.com, rex-bc.chen@mediatek.com,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220629105205.173471-1-angelogioacchino.delregno@collabora.com>
 <20220629105205.173471-2-angelogioacchino.delregno@collabora.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220629105205.173471-2-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 29/06/2022 12:52, AngeloGioacchino Del Regno wrote:
> Add the reset index for PCIe P0 and P1 (PCIe0, PCIe1) on MT8195.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  include/dt-bindings/reset/mt8195-resets.h | 2 ++
>  1 file changed, 2 insertions(+)


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
