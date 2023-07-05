Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA8B2EB64DD
	for <linux-clk@archiver.kernel.org>; Wed,  5 Jul 2023 06:25:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231614AbjGEGZs (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 5 Jul 2023 02:25:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230020AbjGEGZr (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 5 Jul 2023 02:25:47 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95D0210CF
        for <linux-clk@vger.kernel.org>; Tue,  4 Jul 2023 23:25:46 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-51d885b0256so8016702a12.2
        for <linux-clk@vger.kernel.org>; Tue, 04 Jul 2023 23:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688538345; x=1691130345;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F8JPvTbXio/4o2dizd1zh30lCTah/Aako9+AdwCfXso=;
        b=grPAVe3iZANMCwV2H3vIahp6W4st50YgfOXHsQVgkiFsDNu8h0iv40AWyqdHXNEiQN
         VZuNFoQ4uHRDiLkfBu13pV5zYVq1FOMQfh99ZU8q9iSNUKJLKNkJ4ahwBybN7lfis1Lt
         /55FAQJHauoZ2Yrv1wtNM0wTepgsrNkuPGUtRxN+JCA54H8+mQEWJjhSF5kdT/ywXjy8
         9aAquzDtJ2vhly83FGIA1j13sRX1lT+jig28c/xwDx1/URIZzYRchPtL+wU1eMWoHuWM
         dBoKg5Ydm5YwKDdBsn2GHjkHwzbSZ536vvQp0wgD3+bu45MlGLYEjnFG3NS1MIAUIOSC
         Jpjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688538345; x=1691130345;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F8JPvTbXio/4o2dizd1zh30lCTah/Aako9+AdwCfXso=;
        b=Vd5Ssnr3DEzTg0M5iYniRp/GFcF+u1rfftB9556svnBwcqBShydRazJLs/SA3gxB/l
         L5LwsyooMRaJstkLvXQEqk44NZtMZr9b1ftBXpOnZU8I5btfFSQxiOBE10e8U8XFmpTw
         LFddlSXIZmJZTqIttGmHTAHVgslTvTT95gVcb25Z5Mx9hBg7kDt9IyCqNOoJ4Zl4oijU
         4AyiifZlZA+AgC2xheuOeeDsTkv0G8sC0XbKXEuWaoYGzTOfImSmSKj9Xore4IgIifJF
         h82b8WyFa0H1UNCO746qm8z5Xoco3XGb8SVcmXLdlmh/8N9QefrcYVeegc5IkNC6qCF3
         6RPA==
X-Gm-Message-State: ABy/qLakKGD/h1YYrSXubolZidpe/3IQi6vwB+QRxMSqtz13OtMjj2jN
        2UVI3V1bFEb/Y616fmfvJgAntA==
X-Google-Smtp-Source: APBJJlEgEMF9emHGgsHWWQE4/hHEfhifZft4ABIYj7Ght6PTnOoS762iWwOGS1gxr/VjTKbZk0Ciwg==
X-Received: by 2002:a05:6402:3456:b0:51a:50f2:4e7a with SMTP id l22-20020a056402345600b0051a50f24e7amr10660268edc.13.1688538345105;
        Tue, 04 Jul 2023 23:25:45 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id m5-20020aa7d345000000b0051495ce23absm12641162edr.10.2023.07.04.23.25.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jul 2023 23:25:44 -0700 (PDT)
Message-ID: <02bc22e9-393a-6695-f8b0-09e3fe0ff6e9@linaro.org>
Date:   Wed, 5 Jul 2023 08:25:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 2/3] clk: imx8: Add audio clock mux related clock
Content-Language: en-US
To:     Shengjiu Wang <shengjiu.wang@nxp.com>, abelvesa@kernel.org,
        peng.fan@nxp.com, mturquette@baylibre.com, sboyd@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        shengjiu.wang@gmail.com
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <1688521839-3036-1-git-send-email-shengjiu.wang@nxp.com>
 <1688521839-3036-3-git-send-email-shengjiu.wang@nxp.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1688521839-3036-3-git-send-email-shengjiu.wang@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 05/07/2023 03:50, Shengjiu Wang wrote:
> Audio Clock Mux is the IP for i.MX8QXP, i.MX8QM, and
> i.MX8XL platform, Add the clockid for them.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  include/dt-bindings/clock/imx8-clock.h | 28 ++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)

Please use subject prefixes matching the subsystem. You can get them for
example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
your patch is touching.

These are bindings!

Best regards,
Krzysztof

