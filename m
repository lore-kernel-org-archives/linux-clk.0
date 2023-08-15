Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AE42C04FE1
	for <linux-clk@archiver.kernel.org>; Tue, 15 Aug 2023 09:16:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235990AbjHOJPu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 15 Aug 2023 05:15:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236042AbjHOJP1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 15 Aug 2023 05:15:27 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CEC41736
        for <linux-clk@vger.kernel.org>; Tue, 15 Aug 2023 02:15:23 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-99bed101b70so707477866b.3
        for <linux-clk@vger.kernel.org>; Tue, 15 Aug 2023 02:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692090921; x=1692695721;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ze5ObTtpb+O9rxTntCpaoYVBo6hW76OOXVC3qfWoqz8=;
        b=iL4nBpa1LZ7tG9SMde7NSMb5L0c8rOGNT76wdFySWCOO0KxytEcQkII33/Y4ugK9IP
         0CvkHGFxwqScK6O61uD9ov2ImrC8UJBbu2/svlE+MS4SX7WaR9HxiBQcY4JN50BjF6uB
         uwfxyqh+H0ifF/L+Zt562ihCSGQIvfPuhaO07Lj7/BGgEHETUiDwbdWOQRUPUwNbGhFV
         s8S/U7bpPXJk4k7xufe5dG8OS4blesmC9MJCs9uTjx7wTGXPquUfszOq3jtE44Jo/p3X
         OYPnnoxPx7mm+OS/1NJDH9s0K6Qm1hl410bfigGArRKLTqThEQmcRiYMq6nC99NeT67A
         tBCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692090921; x=1692695721;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ze5ObTtpb+O9rxTntCpaoYVBo6hW76OOXVC3qfWoqz8=;
        b=QCjfO5Nd4lJZ70cUf4lMftjUxyiEM0H4cv+HfJ/KVHCl80OCO6UZ9aPuQqAzCGQbwc
         yX/IqPC1NFt9kqIP2/eYPe7wIza1S5L6YckezTHTFCWNwYPXmGO/yKN4CeMybn9NpnSf
         WZ0BsbvkM+Tg/fog5zvTXV5UqCqdMqd3UdUQ4R/CLVls4G51S8r6yWb6BWkDhoCzdN1i
         HGLR0Qjg7aH+9cRJGgkhFhso2qh5pNyVtUfiAdvuQcNHAe+cZEO9hOmehyMTzuueAdJ6
         KtByP/DhSYMgoEWOaibNnxhrCto2rPgS3QjPJAVmXOF1LFfdg7xbh4c6k5G4AZK+X/ad
         5KFA==
X-Gm-Message-State: AOJu0YyFsjzdlQT4X/vT7tv4nj4Ae1OVc7gHk28EWxOq0Bqr7S91rFEn
        HRziUGdtadUKCgu7bcpCdT0+rQ==
X-Google-Smtp-Source: AGHT+IHL0Yt0Nl21n4oLa/TVXgO+c1ct/xVXLAY94QKOW8C+tl23w7X44rljo02S0XUhWgx6eKSeHQ==
X-Received: by 2002:a17:907:78d3:b0:993:d88e:41ed with SMTP id kv19-20020a17090778d300b00993d88e41edmr10415864ejc.3.1692090921599;
        Tue, 15 Aug 2023 02:15:21 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id qx27-20020a170906fcdb00b0098e0a937a6asm6764797ejb.69.2023.08.15.02.15.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Aug 2023 02:15:21 -0700 (PDT)
Message-ID: <3c702ccd-6a82-1121-0b4e-9529d82ccc13@linaro.org>
Date:   Tue, 15 Aug 2023 11:15:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v4 2/4] dt-bindings: clock: add qca8386/qca8084 clock and
 reset definitions
Content-Language: en-US
To:     Luo Jie <quic_luoj@quicinc.com>, andersson@kernel.org,
        agross@kernel.org, konrad.dybcio@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        catalin.marinas@arm.com, will@kernel.org, p.zabel@pengutronix.de
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_srichara@quicinc.com
References: <20230815085205.9868-1-quic_luoj@quicinc.com>
 <20230815085205.9868-3-quic_luoj@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230815085205.9868-3-quic_luoj@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 15/08/2023 10:52, Luo Jie wrote:
> QCA8386/QCA8084 includes the clock & reset controller that is
> accessed by MDIO bus. Two work modes are supported, qca8386 works
> as switch mode, qca8084 works as PHY mode.
> 
> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>

This is a friendly reminder during the review process.

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation:
Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions, under or above your Signed-off-by tag. Tag is "received", when
provided in a message replied to you on the mailing list. Tools like b4
can help here. However, there's no need to repost patches *only* to add
the tags. The upstream maintainer will do that for tags received on the
version they apply.

https://elixir.bootlin.com/linux/v6.5-rc3/source/Documentation/process/submitting-patches.rst#L577

If a tag was not added on purpose, please state why and what changed.

Best regards,
Krzysztof

