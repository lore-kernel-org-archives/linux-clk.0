Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C7B1C7EE2F
	for <linux-clk@archiver.kernel.org>; Fri,  3 Mar 2023 20:24:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231726AbjCCUYu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 3 Mar 2023 15:24:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231725AbjCCUYu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 3 Mar 2023 15:24:50 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4739125E13
        for <linux-clk@vger.kernel.org>; Fri,  3 Mar 2023 12:24:48 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id s11so14989820edy.8
        for <linux-clk@vger.kernel.org>; Fri, 03 Mar 2023 12:24:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677875087;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X2Z27b+UScFCuRyrLv7rqfV3Hiudiqa4YUfaAz4E1nc=;
        b=L+hYotLGtz8O+I7bvl6es73wFJ1LwiS+IRcpqx1pnCZtxP5r2Cjsl7FjNB8yi15Mxw
         Hs+yn2JP/DMQe8uGXeB+rJyLjEdo/dNWw0Fl7JjsIdUwHgn3Gz5+MENAJXrhJw2N/0U0
         EtMx7VbGH2SRU4ZFNA4jlazLPiJGBHd2XNzWW2NoqayoE1uMDn7kCI2OAb7rlDnrMxk4
         tNvud9DtyxZ1Y975L1IQfF4F0Wk9a0cU+Z/S8OgGiyi4clMMLZhE1jmjRfltmiD1x2m6
         f+6KbQgJsuzu7ndG+ZSZ+6KjcGrXrKQrGi7lvGX31SiGkAfhIXVJHKffDEbjeXEWHBGM
         QN0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677875087;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X2Z27b+UScFCuRyrLv7rqfV3Hiudiqa4YUfaAz4E1nc=;
        b=W6Ez3aYLpV4Xn7lrCUnhxoBUzjjKD/ZnsENQ3J4VNowML9Z5Ie0F7hgmI2spbCTwAB
         XDD32X6VA6lD3wTfJCL7zaAMqjcR9KqqD8OmsjB//GWQaM31V8w/lqNOIOnbYF+qEt9o
         gIXKmndVlJeS+yKL09Vqbpsr4IFAZ8bBA5IdGArdUAzxQA0O7WUgw23e2adYnIE41Wyy
         KA/NL8hRLC/j37trbT27WpKS6mtt+9hHFg2+Us28LDaHxg+dCx6Fxd+wd9B3DKNc7J08
         PDBG88mX3GSv931GB08IFZdJyduviNVhBqeOG2D9jYvnyqtgkIfBn/m70Xu1ZnbZ6KBG
         FJMQ==
X-Gm-Message-State: AO0yUKUR9Y2xT9mlla6OajZsgvy/1GGdCHAOhmSvDD0RBlYQCvHBg9Uj
        1DuT8R8taWpbaXqkzRuxDm0tPw==
X-Google-Smtp-Source: AK7set+WR/tSvSs5yH6C1aFl1G8ggGp5jSCh4ccN9oWkb4JiV3SmZbMIlcdmtP4sam8YRYlOS2Ga+A==
X-Received: by 2002:a17:906:30d3:b0:8b1:3d04:c2da with SMTP id b19-20020a17090630d300b008b13d04c2damr3180167ejb.45.1677875086791;
        Fri, 03 Mar 2023 12:24:46 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:3321:2e91:9111:67ba? ([2a02:810d:15c0:828:3321:2e91:9111:67ba])
        by smtp.gmail.com with ESMTPSA id c15-20020a170906170f00b008c6c47f59c1sm1291067eje.48.2023.03.03.12.24.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Mar 2023 12:24:46 -0800 (PST)
Message-ID: <d529206a-ef17-44cd-1ef5-17badad711f4@linaro.org>
Date:   Fri, 3 Mar 2023 21:24:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 5/5] clk: hisilicon: Add CRG driver for Hi3798MV100 SoC
Content-Language: en-US
To:     David Yang <mmyangfl@gmail.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230303151417.104321-1-mmyangfl@gmail.com>
 <20230303151417.104321-6-mmyangfl@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230303151417.104321-6-mmyangfl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 03/03/2023 16:14, David Yang wrote:
> Add CRG driver for Hi3798MV100 SoC. CRG (Clock and Reset Generator) module
> generates clock and reset signals used by other module blocks on SoC.
> 
> Signed-off-by: David Yang <mmyangfl@gmail.com>
> ---
>  .../devicetree/bindings/clock/hisi-crg.txt    |   2 +
>  drivers/clk/hisilicon/crg-hi3798.c            | 193 ++++++++++++++++--
>  include/dt-bindings/clock/histb-clock.h       |  11 +

No. Don't mix bindings and code.

Run checkpatch - you should get warnings for this (and such you must
fix, not ignore).

Best regards,
Krzysztof

