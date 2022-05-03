Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2D58C433F5
	for <linux-clk@archiver.kernel.org>; Tue,  3 May 2022 12:27:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231669AbiECMaq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 3 May 2022 08:30:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235321AbiECMao (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 3 May 2022 08:30:44 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6750C38784
        for <linux-clk@vger.kernel.org>; Tue,  3 May 2022 05:27:05 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id i19so33059955eja.11
        for <linux-clk@vger.kernel.org>; Tue, 03 May 2022 05:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=3v4789HnPrfyXLlbi4TVrwsRga5l4AtBHsLanAodRHg=;
        b=tOyrcEqYRqwaatbWkdvtYKd4xy6bH1Z+GOzXIo+D5G+HJjDP+TfVdYblY3sEMayIy7
         xLZEGk7z2ekyGYFLKjX42MH2El3J73RzKd7iPBYfjrJcsRlkJImmwNwMqaXk4E3Fsj1L
         8XfvZeoQ65NL1Ju6JOlIxX2P2fF9BoG4iIo4sH1JSUzBAIUYjBXEGmzazDNhFXZu0fXr
         7+XNSdPIdkzyiklnKlm47RWsIJIyvSywc8+ojhDYRJY6ZuYOp36gbejaqYlAHRClXGgf
         4tLefzK5LxSerPrMwRN3PHqfwyymPdkVZdBJMDiLQ/hdabTPGF81c2gWHvYjapxlcbzg
         2iJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=3v4789HnPrfyXLlbi4TVrwsRga5l4AtBHsLanAodRHg=;
        b=AIUgi92MGvyVhd8+u595fHvBVwMJ2+8VH4r9C/P4PPE284YIK1lTdfsTI+6ZdfN+jS
         c/oml3zexe9zELxFQWi7KDMJiQHe/M6dwskPeftDUG0z5XZtNBHgAnkvxiobhUGDjl9m
         OglnYeyAZ9NEn/QZxVUK65okVcpvVMk/WkGez0AigWFZkxRHE8wAk3ULRDAc+bwhTk/R
         ZMjVfuRsSmq4l+HoQ4bvvkQHUX3BxwO2YFEFAAsMQ7ayIawcvTLKtwpDV4i/O131KLf+
         srRRZGAMF1CUhs7d8SS/65GhLXDW5CYRcPF3yEtN6sbBHVI5LPoBaYMBDkKWB4ht4k9q
         0skQ==
X-Gm-Message-State: AOAM5316JwuAsPjXCFlZ4JRzbtTcBFA9IJW+f62bHeQn3XlTHbbkHSk8
        9j4CkqmEP9eBmp1x2scXyHHgOw==
X-Google-Smtp-Source: ABdhPJz1R4QiNsUY3ftHoYu9rTkjTJu3dFEsS0UonNJRNjbK/2iYu1E8Jz/5btp8OLo7mKGT9jFoNg==
X-Received: by 2002:a17:907:9705:b0:6f0:2b25:784e with SMTP id jg5-20020a170907970500b006f02b25784emr15455246ejc.76.1651580823976;
        Tue, 03 May 2022 05:27:03 -0700 (PDT)
Received: from [192.168.0.203] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id hx8-20020a170906846800b006f3ef214dd0sm4515214ejc.54.2022.05.03.05.27.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 May 2022 05:27:02 -0700 (PDT)
Message-ID: <1699e161-ca41-3a01-6cf2-11e7d5dd2152@linaro.org>
Date:   Tue, 3 May 2022 14:27:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v6 13/16] dt-bindings: reset: mediatek: Add infra_ao reset
 index for MT8192/MT8195
Content-Language: en-US
To:     Rex-BC Chen <rex-bc.chen@mediatek.com>, mturquette@baylibre.com,
        sboyd@kernel.org, matthias.bgg@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     p.zabel@pengutronix.de, angelogioacchino.delregno@collabora.com,
        chun-jie.chen@mediatek.com, wenst@chromium.org,
        runyang.chen@mediatek.com, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220503093856.22250-1-rex-bc.chen@mediatek.com>
 <20220503093856.22250-14-rex-bc.chen@mediatek.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220503093856.22250-14-rex-bc.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 03/05/2022 11:38, Rex-BC Chen wrote:
> To support reset of infra_ao, add the index of infra_ao reset of
> thermal/svs/pcei for MT8192 and thermal/svs for MT8195.
> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
