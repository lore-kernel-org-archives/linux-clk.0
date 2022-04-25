Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 522E1C433EF
	for <linux-clk@archiver.kernel.org>; Mon, 25 Apr 2022 08:41:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237138AbiDYIoq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 25 Apr 2022 04:44:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233425AbiDYIop (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 25 Apr 2022 04:44:45 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA93882D34
        for <linux-clk@vger.kernel.org>; Mon, 25 Apr 2022 01:41:39 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id l7so28233651ejn.2
        for <linux-clk@vger.kernel.org>; Mon, 25 Apr 2022 01:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=+pzRVC0gT9zFiZtrDMedaHXZTcAEp3gFNZ9jUtyJUSY=;
        b=gcfVAfz/SAa5L6EAzl0d7kO/pyYnSWLEY6OCjuijoNMVR99RSWK9cVFketV78ewi1H
         Ew0QpplSg3Y4hSY4ba2DbNsv6o5V+71OlPeDcLKm2YIMA5XS42Ip/OZzBNJ+jbyUIDOT
         snK3oFi0DQz4OfeKc0usAxbgN8t+KohsIfgiZnkAAXCQA6HRVBIVOaC/Xm2zM/2Ebdhh
         vcTiT0uaEYLi8y7pL3L1SLnqMPCjU9o0GVqoSatDU3ljfwmxf0Gd9w+Fe0Qcg6XOZzJJ
         Se1aoaTJ0DeTwQA9oaDBdfM1XMGOrIAySC8azw4lJtpiQ94CU1UcxeDntWJ0IPZ99BnA
         SUUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=+pzRVC0gT9zFiZtrDMedaHXZTcAEp3gFNZ9jUtyJUSY=;
        b=2WCHsIMn6BWGYTDlobhd3ZSnJkhWP2Ne/685PobTrSlEOL1DLB0cfxoL1V7XbpCqVk
         8PkyjZbW0aIZj2arJ1WDgOFIP+u3B63svsFB1BWHwbamxYSOEbC0YSLp2uNsHtMOZhNe
         LEFSPgKF3gqkY52akIAbWoxmCOgpOB079Q2eVKxXCVFGZmrEIUNmeiZKBrpjWyIO4nh9
         u4k9Mby/UvbBFU8n23onGytnb0Ha4JporoLwOhxmnaPfUsta2Z5ISZoMRcDqWDx/yzQM
         rqwqvKBLuFBShMeEopXhI1Pz7YaLCD2BkopB+myCe9PY6qAfC3oM3SJBmGljxpPB7AtL
         Vrag==
X-Gm-Message-State: AOAM532ESco6aF4ezQmwjOpUQzpA2vNxD4/A9elt8Vf0NPnqATUe4M33
        2cC/7nspeG24AhU1y+LGNY99nw==
X-Google-Smtp-Source: ABdhPJzUz/psaa+nbuSchDlMQ1Kx2x7dlomMaZKQcYPZHDJjZTlyyQ5QQ+jEZR6VnuzLVIoagHwRiw==
X-Received: by 2002:a17:907:3d94:b0:6f3:8b47:cd95 with SMTP id he20-20020a1709073d9400b006f38b47cd95mr5577978ejc.134.1650876097639;
        Mon, 25 Apr 2022 01:41:37 -0700 (PDT)
Received: from [192.168.0.240] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id bq23-20020a056402215700b0041d8fcac53asm4302602edb.23.2022.04.25.01.41.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Apr 2022 01:41:37 -0700 (PDT)
Message-ID: <9f5fafe8-c032-2aac-185b-8ecb5c52f363@linaro.org>
Date:   Mon, 25 Apr 2022 10:41:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 3/3] dt-bindings: arm: mediatek: infracfg: Convert to
 DT schema
Content-Language: en-US
To:     Yassine Oudjana <yassine.oudjana@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     Sam Shih <sam.shih@mediatek.com>, Ryder Lee <ryder.lee@kernel.org>,
        devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Yassine Oudjana <y.oudjana@protonmail.com>
References: <20220424084647.76577-1-y.oudjana@protonmail.com>
 <20220424084647.76577-4-y.oudjana@protonmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220424084647.76577-4-y.oudjana@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 24/04/2022 10:46, Yassine Oudjana wrote:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> Convert infracfg bindings to DT schema format. Not all drivers
> currently implement resets, so #reset-cells is made a required
> property only for those that do. Using power-controller in the
> example node name makes #power-domain-cells required causing
> a dt_binding_check error. To solve this, the node is renamed to
> syscon@10001000.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> ---
>  .../arm/mediatek/mediatek,infracfg.txt        | 42 ----------
>  .../arm/mediatek/mediatek,infracfg.yaml       | 81 +++++++++++++++++++
>  2 files changed, 81 insertions(+), 42 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.txt
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.yaml
> 
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
