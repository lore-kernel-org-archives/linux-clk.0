Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1538AC4321E
	for <linux-clk@archiver.kernel.org>; Sun, 27 Nov 2022 20:52:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229541AbiK0Uv7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 27 Nov 2022 15:51:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229605AbiK0Uv6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 27 Nov 2022 15:51:58 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F084DF02
        for <linux-clk@vger.kernel.org>; Sun, 27 Nov 2022 12:51:57 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id c1so14554189lfi.7
        for <linux-clk@vger.kernel.org>; Sun, 27 Nov 2022 12:51:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u3tcaQbpn4RL3pvRrRbdnOz1diiaytm2EQbdYOlRKS0=;
        b=sJeMsAwH5oeFRscCpGj9RR+Do4wDjcc2UUU7Ym+FEkFnR72j1I/gN8rOxMWxCc8SG0
         h8Oir1s18M8LhW1Cl0Nlz4vKiKz3qjfu8x+sIwCz7D/9KckEU9FQjEol2DckiZPgCj5N
         4DDhZdhsR1uyLCNAgDRJ9sJeWKdFK7Cj3L7euLeMb8jqVrqSsxmNXTfvs3gIBtV5VoHs
         ApE/9oKR51y55MAduQxfE1F7Y9Qox+gfqk0YFBYjVHI607/WmrDNo8yMJs7mVxQrGAB0
         m7e2H7/c5aCSPOXq8UF8pKazuwUllgKrT83c6YBG6ALLd16GZqQhDgeivz/5haYzB6ij
         c19g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u3tcaQbpn4RL3pvRrRbdnOz1diiaytm2EQbdYOlRKS0=;
        b=3dg9R/WD0QmShWiP4sG6ocmH1yaVhHrO/onjRDq6JAjSoB3y/KRePPSoOeRBip1uQ1
         Xkait19FYd2WELhDPV9VnfjzJ3c7Xhd4SsofKxmJ9Dy2oSDQh+si6P4pXA0mSYDdASLl
         EuRrTMlFjcTZd1JR4RcijOXkJfakQt5SKF56QWpTG8wiDbpobqIPzUVtQIQ3RJRB7GuK
         IpjONBvbSlcRKuO3+uHAlPgG6Ki9pVvxiS+etaFTYg770fwjf8umg9hocXkFAaEfVHDY
         S5xrndeXqKm6TD4DEHiXNUmynJEvTDRXR6BFpGWCk9tzD424ED1aWYsGpdgHIB2d4aEc
         8yKg==
X-Gm-Message-State: ANoB5pk1DzMAXTm2XIQ5QXfUYM9PQ5No0lIVPvx5Ecy1VaqN8wLjgeLL
        saNTgb5Dj+PeIJuDu2kWISCHxA==
X-Google-Smtp-Source: AA0mqf7Jzuiy0nCiIZmAjTMrowDbThivuRVRnEln0SfrfK4SRS6soivNU26oGPhpGm8+NFSXI39VUg==
X-Received: by 2002:a19:ca0b:0:b0:4b1:7972:627a with SMTP id a11-20020a19ca0b000000b004b17972627amr9330545lfg.101.1669582315907;
        Sun, 27 Nov 2022 12:51:55 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id s14-20020a056512202e00b004b501497b6fsm1046703lfs.148.2022.11.27.12.51.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Nov 2022 12:51:55 -0800 (PST)
Message-ID: <aa4da52a-c07c-2f3e-24b2-8a45b4c4cc77@linaro.org>
Date:   Sun, 27 Nov 2022 21:51:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 5/5] clk: sunxi-ng: d1: Add CAN bus gates and resets
Content-Language: en-US
To:     Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
        Fabien Poussin <fabien.poussin@gmail.com>
References: <20221126191319.6404-1-samuel@sholland.org>
 <20221126191319.6404-6-samuel@sholland.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221126191319.6404-6-samuel@sholland.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 26/11/2022 20:13, Samuel Holland wrote:
> From: Fabien Poussin <fabien.poussin@gmail.com>
> 
> The D1 CCU contains gates and resets for two CAN buses. While the CAN
> bus controllers are only documented for the T113 SoC, the CCU is the
> same across all SoC variants.
> 
> Signed-off-by: Fabien Poussin <fabien.poussin@gmail.com>
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
> 
>  drivers/clk/sunxi-ng/ccu-sun20i-d1.c      | 11 +++++++++++
>  drivers/clk/sunxi-ng/ccu-sun20i-d1.h      |  2 +-
>  include/dt-bindings/clock/sun20i-d1-ccu.h |  2 ++
>  include/dt-bindings/reset/sun20i-d1-ccu.h |  2 ++

Don't mix bindings with driver changes. Checkpatch should complain here...

Best regards,
Krzysztof

