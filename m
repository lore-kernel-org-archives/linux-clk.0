Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C1F6C77B75
	for <linux-clk@archiver.kernel.org>; Wed, 17 May 2023 08:40:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229996AbjEQIk2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 17 May 2023 04:40:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230160AbjEQIkR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 17 May 2023 04:40:17 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E0DE5269
        for <linux-clk@vger.kernel.org>; Wed, 17 May 2023 01:40:14 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-50be17a1eceso818357a12.2
        for <linux-clk@vger.kernel.org>; Wed, 17 May 2023 01:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684312813; x=1686904813;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=757JBJxgRWVinuPZFHNhDwrpQbzagkxwUnhVEdJlotA=;
        b=Sm26zdi4yXWmd/d5jNfPI+ohb2rArHlvywdRT2QtSF9RdznkTFYFLJw5eixE0xpD2D
         3DIuKF8aZGLtDWaN5Vz2s32vbMTLk+1rsQrL9DDe+rueBVKOJtq1bqPMHy3QU4u381wM
         GX3cAIMXuyEG1WuPyAENLUJZeywDLLOz5bSJiti645EOHFNTKKf6WToE7UamrRM56gJT
         DtypxiEf9FwRmPmnInm6WVJMLs+9k/FXppKdCoZckAWIZSgCIzIiBTrwBwB1D5dMlm12
         ptVtQo+A6X5qP+n29tfqHa6cUyTbPPD4eCJqlDUm1AAQlvGc8z9vwAD2qqMYWYN/veje
         ZknQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684312813; x=1686904813;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=757JBJxgRWVinuPZFHNhDwrpQbzagkxwUnhVEdJlotA=;
        b=SLsQaqKi/7sKV7ElA8NklutGU8wXfjwf3stRAijSM5PysujyP3WnHB8HWMijBMWwJD
         66Qf2uUPV+38dw32MLuwwDkN7UsQBVOOxIG1MzEZJzb/9q6D1uhgV5zviueYhjuLk+aF
         LqbdujYX77XM9DL8wA8BOqJfx8nxGfdjkvf4ew9lSIg3d8o+FxO89F6gRme2qRRfL4yx
         Qmkg/glGV45W9jlcXviOfRwNd67j5yG7MyR7XYGiopo5yAUcMaYXC7EQjk/an2Qg6HKH
         VRa8dLiGrZtC8v0BnMZ+qpcmzcyweclJhTgEc/bGJrL4SbibfB6KCyRmbLjSScSRlF4X
         a4AA==
X-Gm-Message-State: AC+VfDw4y5OCSCcszmNEVFUVs2t0QC4b4a54UFIpunTqSAPEfjP2be8+
        1CevyyC4quoAyiFwOfX3aELz2g==
X-Google-Smtp-Source: ACHHUZ6MmcsQD6x7J6FNqyzT+Zg/rDHY0Azqiv9uIV7gCqHJk7KqXU7NawbLmhXBHUzQBiHfFpn3Lg==
X-Received: by 2002:aa7:d1c6:0:b0:50d:975f:3729 with SMTP id g6-20020aa7d1c6000000b0050d975f3729mr1577173edp.11.1684312813416;
        Wed, 17 May 2023 01:40:13 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:c9ff:4c84:dd21:568d? ([2a02:810d:15c0:828:c9ff:4c84:dd21:568d])
        by smtp.gmail.com with ESMTPSA id o22-20020aa7d3d6000000b0050696c2d2f6sm8771234edr.88.2023.05.17.01.40.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 May 2023 01:40:12 -0700 (PDT)
Message-ID: <9c7ff0f1-3d2c-b83a-a47d-544c76f29663@linaro.org>
Date:   Wed, 17 May 2023 10:40:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/2] clk: mediatek: mt8365: fix the clock indexes
Content-Language: en-US
To:     Alexandre Mergnat <amergnat@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Chen-Yu Tsai <wenst@chromium.org>
Cc:     Markus Schneider-Pargmann <msp@baylibre.com>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
References: <20230517-fix-clk-index-v1-0-142077a1732b@baylibre.com>
 <20230517-fix-clk-index-v1-1-142077a1732b@baylibre.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230517-fix-clk-index-v1-1-142077a1732b@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 17/05/2023 10:28, Alexandre Mergnat wrote:
> Before the patch [1], the clock probe was done directly in the
> clk-mt8365 driver. In this probe function, the array which stores the
> data clocks is sized using the higher defined numbers (*_NR_CLOCK) in
> the clock lists [2]. Currently, with the patch [1], the specific
> clk-mt8365 probe function is replaced by the mtk generic one [3], which
> size the clock data array by adding all the clock descriptor array size
> provided by the clk-mt8365 driver.
> 
> Actually, all clock indexes come from the header file [2], that mean, if
> there are more clock (then more index) in the header file [2] than the
> number of clock declared in the clock descriptor arrays (which is the
> case currently), the clock data array will be undersized and then the
> generic probe function will overflow when it will try to write in
> "clk_data[CLK_INDEX]". Actually, instead of crashing at boot, the probe
> function returns an error in the log which looks like:
> "of_clk_hw_onecell_get: invalid index 135", then this clock isn't
> enabled.

Please use subject prefixes matching the subsystem. You can get them for
example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
your patch is touching.

This is huge ABI break and I don't understand why it is needed. Entire
description above did not explain me that.

> 
> The simplest way to fix the regression is to remove from the header file
> [2] the unused clocks.

??? The simples is to revert the patch, so you won't break the ABI.

> 
> [1]: Commit ffe91cb28f6a ("clk: mediatek: mt8365: Convert to
>      mtk_clk_simple_{probe,remove}()")
> [2]: include/dt-bindings/clock/mediatek,mt8365-clk.h
> [3]: drivers/clk/mediatek/clk-mtk.c
> 
> Fixes: ffe91cb28f6a ("clk: mediatek: mt8365: Convert to mtk_clk_simple_{probe,remove}()")
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  include/dt-bindings/clock/mediatek,mt8365-clk.h | 361 ++++++++++++------------
>  1 file changed, 177 insertions(+), 184 deletions(-)
> 
> diff --git a/include/dt-bindings/clock/mediatek,mt8365-clk.h b/include/dt-bindings/clock/mediatek,mt8365-clk.h
> index f9aff1775810..fd59c8bdeb24 100644
> --- a/include/dt-bindings/clock/mediatek,mt8365-clk.h
> +++ b/include/dt-bindings/clock/mediatek,mt8365-clk.h
> @@ -7,147 +7,142 @@
>  #define _DT_BINDINGS_CLK_MT8365_H
>  
>  /* TOPCKGEN */
> -#define CLK_TOP_CLK_NULL		0> -#define CLK_TOP_I2S0_BCK		1

...

> +#define CLK_TOP_I2S0_BCK		0

Why? This is really broken. You can remove the defines, but re-shuffling
everything?!?

Best regards,
Krzysztof

