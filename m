Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0051C32772
	for <linux-clk@archiver.kernel.org>; Mon, 22 Aug 2022 17:29:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236544AbiHVR3M (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 22 Aug 2022 13:29:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235910AbiHVR3K (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 22 Aug 2022 13:29:10 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 417403D5AE
        for <linux-clk@vger.kernel.org>; Mon, 22 Aug 2022 10:29:09 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id q7so12574398lfu.5
        for <linux-clk@vger.kernel.org>; Mon, 22 Aug 2022 10:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=wY+75YmJF6F6iHSTUHNAJDV+N7PX1+5Hl6WRxPY2Co4=;
        b=Qk4olVB8xIDb10EgA54jPX/P/Qz8Qfd5ZPOIP6eHYJ8mMMiosL1SnTkZkjWYP/9ZIJ
         MzViCBXQnLKWsZq0B2Tdr+9IqUpzAHfAu2miVGL3P3pXvpxeAa8RENu7VjZ+s4GYBQEs
         +YDWLFTAdyBotMOlspmwa6FDCAb8kenPU0WDS5v8yozswPr2YX5klbb+dAuXDjuKhOAX
         NKd5grHVF4UaytXHMuYnYkXAQ8ZqpbMWSDA2PBCWg7mF9nBJqXL5hPSHmlSiPX2Gxgil
         ABmmT8RjtLpjDBcS5Dd6qnsvOW8D+M0x+BL/WE3QpeKi+kQDSbQhbC19Oo1qBupCJRPz
         TndQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=wY+75YmJF6F6iHSTUHNAJDV+N7PX1+5Hl6WRxPY2Co4=;
        b=kDiq9MrrCi1cbmV3enhWmaQWIRLvKjt4nNvX+brM2D8pzVOWVsiBi9/Pp0n4chsat3
         QJT9vN0GFwZ598I62IyGlXgWvyReaY61wi5qZTsa4DKuxBmPbJzrLAXwJgWrB3D8Smqf
         cL0aUbVFrPnB3zG5IgMbkwBlZam72XWLSe/2j6TbSb5r2YCuudPTzaGgx1hBceB9/N3e
         rSy2Dj5XzaH3CslZ/tXd6uOjc1tIblOIUMrxN9fsh1zDd3C8MDYQBLhYNw2zV3UO8o6N
         BKw/S8iddmfoB2iBX2Sai4HICGwHFO/X1z9WxsxU2ujq6SI6IPgMwNA3IH+zgD0xRUIx
         CpPQ==
X-Gm-Message-State: ACgBeo2sgpKDa7C/U/NDLUvS+ApLOhb8hqTnAgq3DDBeewQ73RqleaME
        0LJAXfrmeRiA2nhVbtGLuSt0Zw==
X-Google-Smtp-Source: AA6agR6+/WgJeFE32Q4SCQCRljiwY1ET62J6fHGTG4QgqjBOsMf+vYQvQjMAbaLH24s9T3+dpWet2Q==
X-Received: by 2002:a05:6512:2c8a:b0:48a:f7e9:973f with SMTP id dw10-20020a0565122c8a00b0048af7e9973fmr7197041lfb.5.1661189347595;
        Mon, 22 Aug 2022 10:29:07 -0700 (PDT)
Received: from [192.168.0.11] (89-27-92-210.bb.dnainternet.fi. [89.27.92.210])
        by smtp.gmail.com with ESMTPSA id s13-20020a056512202d00b00492dbf809e8sm378312lfs.118.2022.08.22.10.29.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Aug 2022 10:29:06 -0700 (PDT)
Message-ID: <0de7f878-1471-4916-9384-9d966e840d74@linaro.org>
Date:   Mon, 22 Aug 2022 20:29:05 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v4 1/4] dt-bindings: clock: mediatek: add bindings for
 MT8365 SoC
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
References: <20220822152652.3499972-1-msp@baylibre.com>
 <20220822152652.3499972-2-msp@baylibre.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220822152652.3499972-2-msp@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22/08/2022 18:26, Markus Schneider-Pargmann wrote:
> From: Fabien Parent <fparent@baylibre.com>
> 
> Add the clock bindings for the MediaTek MT8365 SoC.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Hm, when did I review it?

> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> ---
> 
> Notes:
>     Changes in v4:
>     - Remove unnecessary quotes from $id and $schema
>     - Add myself as maintainer
>     - Dual-licensed mediatek,mt8365-clk.h


Best regards,
Krzysztof
