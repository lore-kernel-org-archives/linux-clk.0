Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AE2BC19F2D
	for <linux-clk@archiver.kernel.org>; Thu, 11 Aug 2022 08:53:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234782AbiHKIx1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 11 Aug 2022 04:53:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234787AbiHKIx0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 11 Aug 2022 04:53:26 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8462291D17
        for <linux-clk@vger.kernel.org>; Thu, 11 Aug 2022 01:53:22 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id x10so1038383ljq.4
        for <linux-clk@vger.kernel.org>; Thu, 11 Aug 2022 01:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=TKfhK/47jSo6ly3ouMqZhGdcjWMMRh4i4L8ffrR5LBU=;
        b=YlJBhwE9mvMrmCNAhvJYzhkd1XDLy21w0WGKpWwb3oKYQR7E5rm3+vsL5t5RMXgD7M
         /lcAv+DfcJDMyumhKOJA9XOZe4UawoOEkAHVb4XIm47It4s7pF7jCUz8GAdA3pMDh1qL
         IGJ+c/4E7M19nYbuptXygy/47/gUSKWeNzGRg0s5NvV2VVZvxGJT0k6JlFSOZEkdsJyR
         x5qL0mlsU9HFgWGRcl65pk8ZoaVnR3mAjV9oEQDtODkTa1vHDaqx4CMxgZVLRf41cFsC
         fOdxJ7iBWoc5oNH4zPjBJTKWC6fxnamNSh0YnAouT8lWMrqqA/7k9Qi6ACmyfegmO4gi
         AgoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=TKfhK/47jSo6ly3ouMqZhGdcjWMMRh4i4L8ffrR5LBU=;
        b=2tlTRCH8N3WERBkDFk1kG+xB1hvKrqugDMJT4Q8OplUJWN9tj0pxAD3z4aD42Bakqe
         i4leeAhxj2ziWGNJvIr2n5IssdbBylE8Cg2YSUr/hysqk3CIG4j60SN+F/Pb14kDbG+/
         aCECEF//ORX7oi5mabXJYkFmle8N24QEZpXFz+vMVmWqk7TbU+XZB2s5MgtIkOjhZLkT
         ayMJTCiaWZyHcAEX7xWP7+ga0udqQBBuCCUtZKNm/b5qjnQ8PxEz1VouIruJ/18uiQZM
         54jMXj1IWJW5Gy6qC9g8QubhsDKGFse4Uo6dPOLZZ9W1gTLvNatlcv7oSQYeo364IEEl
         gYPg==
X-Gm-Message-State: ACgBeo0aNbmcmocH7KSDAbDa5YtHkGmlGIZHXO5Iz7Bh00RttanEmlwP
        hdfqB+yl8NX/7WTUASGyuTEmmg==
X-Google-Smtp-Source: AA6agR7PQ8R8BExrgepXEvNs90xa72JOHIMuumqMQKL+fybEaLfGQa5vYBmqDBodPtkVH2RqiYjLyA==
X-Received: by 2002:a2e:8605:0:b0:25e:5fe4:9e6b with SMTP id a5-20020a2e8605000000b0025e5fe49e6bmr10723557lji.484.1660208000918;
        Thu, 11 Aug 2022 01:53:20 -0700 (PDT)
Received: from [192.168.1.39] ([83.146.140.105])
        by smtp.gmail.com with ESMTPSA id n12-20020a05651203ec00b0048b0526070fsm637504lfq.71.2022.08.11.01.53.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Aug 2022 01:53:20 -0700 (PDT)
Message-ID: <dc7a4f78-4244-7425-a1c2-509172ec97de@linaro.org>
Date:   Thu, 11 Aug 2022 11:53:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v3 4/4] clk: mediatek: add driver for MT8365 SoC
Content-Language: en-US
To:     Markus Schneider-Pargmann <msp@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Fabien Parent <parent.f@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        Fabien Parent <fparent@baylibre.com>
References: <20220811084433.2598575-1-msp@baylibre.com>
 <20220811084433.2598575-5-msp@baylibre.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220811084433.2598575-5-msp@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 11/08/2022 11:44, Markus Schneider-Pargmann wrote:
> From: Fabien Parent <fparent@baylibre.com>
> 
> Add clock drivers for MT8365 SoC.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> ---
> 
> Notes:
>     Changes in v3:
>     - Changed all Kconfig options to be tristate
>     - Do not depend on ARM64
>     - Fix order of frees on probe errors.
>     - Use mtk_clk_register_gates_with_dev
>     - Fixed null clocks
>     - Removed clk26m_ck
>     - Use MUX_GATE_CLR_SET_UPD instead of custom MT8365_MUX_CLR_SET_UPD
>     - Use devm_clk_hw_register_mux for top_misc_muxes
>     - Use devm_clk_hw_register_gate for peri_clks and top_clks
>     - Fix checkpatch warnings
>     - Add missing MODULE_LICENSEs in all files
> 
>  drivers/clk/mediatek/Kconfig                  |   50 +
>  drivers/clk/mediatek/Makefile                 |    7 +
>  drivers/clk/mediatek/clk-mt8365-apu.c         |   55 +
>  drivers/clk/mediatek/clk-mt8365-cam.c         |   57 +
>  drivers/clk/mediatek/clk-mt8365-mfg.c         |   63 +
>  drivers/clk/mediatek/clk-mt8365-mm.c          |  112 ++
>  drivers/clk/mediatek/clk-mt8365-vdec.c        |   63 +
>  drivers/clk/mediatek/clk-mt8365-venc.c        |   52 +
>  drivers/clk/mediatek/clk-mt8365.c             | 1155 +++++++++++++++++
>  .../dt-bindings/clock/mediatek,mt8365-clk.h   |  179 ++-

No, bindings are always separate.




Best regards,
Krzysztof
