Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44180C83F18
	for <linux-clk@archiver.kernel.org>; Tue, 29 Aug 2023 17:35:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232196AbjH2RfU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 29 Aug 2023 13:35:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238107AbjH2RfC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 29 Aug 2023 13:35:02 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B86ECCDD
        for <linux-clk@vger.kernel.org>; Tue, 29 Aug 2023 10:34:57 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-99c93638322so3537266b.1
        for <linux-clk@vger.kernel.org>; Tue, 29 Aug 2023 10:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693330496; x=1693935296;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ONMdNT0qe15nFMdXWcs/Q8c5HCoTBwiBJLGrnRV1nw0=;
        b=F3CKPXZIk70OKv6jxWGITpATwBmXaEROBefq+Mf+6vOb0qivc6wDJ7XNDPXKBZdJ8G
         99JJ2bOpqk953tDk2YLyLLpA1LEqPLLwqIPIlrX/Nw9pUO07Dr8U41oAY5J/XLpFd1wX
         aBBY3vj+JVLcuEUK9V13jjzskpeAX1TGK8HxPhwYTawQHpVSmxqmCazm008GrtquRpI8
         AJ0PoEqPacLjR+yxgnG5pZfINr4Ivq9BfvwvPN73cjkBJWQSIWKX9k63a1loEYdNnPgu
         RnDUS6YpDNNMOxXc+C82Cw1wzr947AutwMg1z54dAH04ejIJOduZQyv1ZKSXDfbaxNyp
         +kaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693330496; x=1693935296;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ONMdNT0qe15nFMdXWcs/Q8c5HCoTBwiBJLGrnRV1nw0=;
        b=RFvoX2gL3Vow0n2YJ7xXzyFNBSeCBCGA//rM/xR2sICOh1oj9srHeGcBukY2hCtd1C
         sajq22FDJrIAnbrYYD3fJL9zATySJfBGscteXUYEJZn4kniHIUQaTx3DEEw8js2P995E
         EuZVq2h6hdSsdGNYLOc+QKfTnIi59WbRQMl7hdfyz1KrZlA4gS5BQ75C4m22fUh4rSPn
         1DbzXq6Z3OMYhgKPF7dC6HET+z5LZrzMNA6OsOPOTNJh01CrnqyAlvqACY/wEMfvKgSG
         JVWPkNL2bvmVbcNziVlufJX2aKGyhWLV7agBMePQrX3BpV78kNLLCoFDetJq0hmcij/G
         mh9g==
X-Gm-Message-State: AOJu0Yzwh5i/RE6pzZFvK/XhKs9iV1UP9e2vUH7dbTSHgPj4KMYPMj5U
        j62oBne7KeOdhJ73TTf3tigHDkLgRpTYzZ64GV8=
X-Google-Smtp-Source: AGHT+IEC28zmPiIgJmKgcQJmlnUeRmPValFdXqSMVRYqh4YR7AT6QaS02hhHQPZGW4brxIj/NspEyA==
X-Received: by 2002:a17:907:1614:b0:9a5:c2c0:1d0f with SMTP id hb20-20020a170907161400b009a5c2c01d0fmr3407559ejc.12.1693329704763;
        Tue, 29 Aug 2023 10:21:44 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.196])
        by smtp.gmail.com with ESMTPSA id x18-20020a170906805200b0097073f1ed84sm6161481ejw.4.2023.08.29.10.21.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Aug 2023 10:21:44 -0700 (PDT)
Message-ID: <ea386a28-841d-0e76-cb1b-735b630001ba@linaro.org>
Date:   Tue, 29 Aug 2023 19:21:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 03/31] dt-bindings: ASoC: rockchip: Add compatible for
 RK3128 spdif
Content-Language: en-US
To:     Alex Bee <knaerzche@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, Lee Jones <lee@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     Elaine Zhang <zhangqing@rock-chips.com>,
        Johan Jonker <jbx6244@gmail.com>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, alsa-devel@alsa-project.org,
        linux-clk@vger.kernel.org, linux-phy@lists.infradead.org
References: <20230829171647.187787-1-knaerzche@gmail.com>
 <20230829171647.187787-4-knaerzche@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230829171647.187787-4-knaerzche@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 29/08/2023 19:16, Alex Bee wrote:
> Add compatible for RK3128's S/PDIF.
> 

Subject: ASoC: dt-bindings: rockchip,spdif:

> Signed-off-by: Alex Bee <knaerzche@gmail.com>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


---

This is an automated instruction, just in case, because many review tags
are being ignored. If you know the process, you can skip it (please do
not feel offended by me posting it here - no bad intentions intended).
If you do not know the process, here is a short explanation:

Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions, under or above your Signed-off-by tag. Tag is "received", when
provided in a message replied to you on the mailing list. Tools like b4
can help here. However, there's no need to repost patches *only* to add
the tags. The upstream maintainer will do that for tags received on the
version they apply.

https://elixir.bootlin.com/linux/v6.5-rc3/source/Documentation/process/submitting-patches.rst#L577

Best regards,
Krzysztof

