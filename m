Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 329A9EB64D9
	for <linux-clk@archiver.kernel.org>; Thu,  6 Jul 2023 13:53:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232626AbjGFNxB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 6 Jul 2023 09:53:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231731AbjGFNxA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 6 Jul 2023 09:53:00 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AC551BD2
        for <linux-clk@vger.kernel.org>; Thu,  6 Jul 2023 06:52:58 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-51e35791a83so382678a12.2
        for <linux-clk@vger.kernel.org>; Thu, 06 Jul 2023 06:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688651577; x=1691243577;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G2aY8/ODKYxuQww964KApt9B1s+b1RjRKlIHq5b6P14=;
        b=HlHWNvKe9S1hXdtUq9sG570m+8DSKhWaWFFMQd6ngbrKx4Ztc9H+g/6ghVL48s15Ub
         9rOnDTD3Wg+Rdj/xf+Av/0+ejOm1LbM7WBlFrsijfzhMehEFi9WXtot5n6Misdf+fEwX
         rmtC2PO+toZppZGrmmSmbm2jVwPHNfQHoRyPTeQF9++EypPolKDIerENc/X/F+DLN8ZQ
         rLfs6c0jYCjM/acKmjCs5J2BxMix16KEKIoKWwrIqUzQHtMEV4csqffLL4UAYLx6IN8I
         qczoiSReoINavIIOWq39VlhYEQQg5L3mMl7iUZuFklaTgEsSW788j7PUxNQfr0Mnt3ty
         SukA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688651577; x=1691243577;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G2aY8/ODKYxuQww964KApt9B1s+b1RjRKlIHq5b6P14=;
        b=CYmpOkWRahQFNIiu85AgMuivz/4b2/LHUMykMJWyBKLw43UBBjZfboetyYNbsULUZj
         HSD53Fc2bH+BIGX3bDv808L0F6Lx0NywvoOpj28720eLYhdkWeMDzobDL0HmRV3W6nEu
         pCc2w16nmmMsJKGXz1lxVNfOS7pdq/W3RDjeWJ/Fu5zJvbmlVg5DqTlxMWr47P3XwXxm
         RqC1cR4YN5+4W0U63CsXn3A8MU+5GTdD+hkBg2tsoCb7xaL9NHsPF9VP1u1MGOtXn4D4
         q6c0SWuKcy1I/H9D7bw4EFXYpMXzbOInIBdiZCzCOiTWW9Cfl82SXAQKic6ULh/WHK6/
         OIpA==
X-Gm-Message-State: ABy/qLanhkUym3RfKzeCSeznOz0LZZwhONVFVmwz1f4ZhhbRMQTpBKeD
        0IvttbEQszCAe/8jxzzGYx/QwQ==
X-Google-Smtp-Source: APBJJlEf9BuSgjYlpRlywafdr9RzQJ+ILglympsMXKXs0nAv/M0nxoUo88BprqsG2MIjPGkCgg5jXw==
X-Received: by 2002:a05:6402:8d0:b0:51e:f23:5555 with SMTP id d16-20020a05640208d000b0051e0f235555mr1601647edz.33.1688651577464;
        Thu, 06 Jul 2023 06:52:57 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id l14-20020a056402344e00b0051e22660835sm814279edc.46.2023.07.06.06.52.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jul 2023 06:52:57 -0700 (PDT)
Message-ID: <40834eb6-2e94-d2e3-e442-d91b757be928@linaro.org>
Date:   Thu, 6 Jul 2023 15:52:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 1/3] dt-bindings: clock: fsl,imx8-acm: Add audio clock
 mux support
Content-Language: en-US
To:     Shengjiu Wang <shengjiu.wang@nxp.com>, abelvesa@kernel.org,
        peng.fan@nxp.com, mturquette@baylibre.com, sboyd@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        shengjiu.wang@gmail.com
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <1688607078-4183-1-git-send-email-shengjiu.wang@nxp.com>
 <1688607078-4183-2-git-send-email-shengjiu.wang@nxp.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1688607078-4183-2-git-send-email-shengjiu.wang@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 06/07/2023 03:31, Shengjiu Wang wrote:
> Add the clock dt-binding file for audio clock mux. which
> is the IP for i.MX8QM, i.MX8QXP, i.MX8DXL.
> 
> The Audio clock mux is binded with all the audio IP and audio clocks
> in the subsystem, so need to list the power domain of related clocks
> and IPs. Each clock and IP has a power domain, so there are so many
> power domains.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


---

This is an automated instruction, just in case, because many review tags
are being ignored. If you do not know the process, here is a short
explanation:

Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions, under or above your Signed-off-by tag. Tools like b4 can help
here. However, there's no need to repost patches *only* to add the tags.
The upstream maintainer will do that for acks received on the version
they apply.

https://elixir.bootlin.com/linux/v5.17/source/Documentation/process/submitting-patches.rst#L540

Best regards,
Krzysztof

