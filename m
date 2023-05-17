Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 336F6C77B7F
	for <linux-clk@archiver.kernel.org>; Wed, 17 May 2023 08:41:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230063AbjEQIlm (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 17 May 2023 04:41:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229961AbjEQIlj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 17 May 2023 04:41:39 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10D6835AE
        for <linux-clk@vger.kernel.org>; Wed, 17 May 2023 01:41:38 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-510d6e1f1abso428027a12.2
        for <linux-clk@vger.kernel.org>; Wed, 17 May 2023 01:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684312896; x=1686904896;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZUZxK878WWwa8+El0+lNFY+QXkRVXfNrvEurY+MA+qM=;
        b=bBy8nLsLvo2UC1Vbh6qJ2TLwFfrYyM2z2E/otQSOfBQZOShZUCwUDXkzfOaOuoZEhU
         OBeYWerJNOHy9gkVcZtFGovcOrUGU4SD7ikdxOziLtNPU3B3A6yIakHr8cB4i8MkmbYR
         W0BxyaL8t2CDLf38KeseB7VMQ00HAQhZdUM1bjJEERFqCgdfI7MaTQ9057i6RFZKSvh8
         bp50hbkiflDdpKEDuYQyr88kKZP1LqlHpvcchKHAByarGFCm88phMKisjVtxPlZiw16L
         sZOKzc5AsPOXyd2TIVaykbDLdKMCH4k44zQ/7+1HKiGqpD9vyJNeKF3OeU5wKw9hnRLo
         9Fqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684312896; x=1686904896;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZUZxK878WWwa8+El0+lNFY+QXkRVXfNrvEurY+MA+qM=;
        b=j7AoLd49ezlJhZ6RWxHeqzdXLMArUpHBweTJSpIGXqKakJ2hXa+Czz2g9xtW42Bbj8
         5N4u8vf2Te23q9ujVYruVpH88nVLnwlyb2C5v+PNmtLmm/W9RbP4s6sj7O29SIJcqL6j
         d44ABZRkdSyqt/UdpxWoW2Ylp2mi4fccNIHWr/tR9NoWuHAQk/rzvPWRKgWiogW5YeDu
         9/WLBaJnOYF6iCXlSaaYVBiSd4diL1lS7PPmzomhEBoHHDbl4MfaqrYLAXl4T1++xCR7
         AECtL96HgEF3EfmrNLEY9lX9kqUX+CEU9Flz2eKcvvwZkDnHXJMXEb4ljQTxujiF/rHj
         SSEg==
X-Gm-Message-State: AC+VfDzCd0zwNQh1mFV9jH1KpckZFgEhut51GTyufpEm+B41tkq+BGQJ
        z1SzVFQ1czayfF2rm9DE+DqV6g==
X-Google-Smtp-Source: ACHHUZ4X3mrKVkrJMCaJ9WdmHLTHtWPOpptSnrOnoRmnWSlWiXUhp7yx0KJz1Er++grYX6XxpUrjug==
X-Received: by 2002:aa7:df0d:0:b0:510:b4c7:d17 with SMTP id c13-20020aa7df0d000000b00510b4c70d17mr1466284edy.12.1684312896455;
        Wed, 17 May 2023 01:41:36 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:c9ff:4c84:dd21:568d? ([2a02:810d:15c0:828:c9ff:4c84:dd21:568d])
        by smtp.gmail.com with ESMTPSA id o9-20020aa7dd49000000b005106975c7a1sm2739689edw.23.2023.05.17.01.41.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 May 2023 01:41:35 -0700 (PDT)
Message-ID: <42ca8c57-5211-72ff-4f55-ed2c2886dac9@linaro.org>
Date:   Wed, 17 May 2023 10:41:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/2] clk: mediatek: mt8365: remove the max clock number
 defines
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
 <20230517-fix-clk-index-v1-2-142077a1732b@baylibre.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230517-fix-clk-index-v1-2-142077a1732b@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 17/05/2023 10:28, Alexandre Mergnat wrote:
> Since we swap to the generic MTK probe function [1], the *_NR_CLK
> defines used to know the number of defined clocks are no longer
> necessary. This patch remove all *_NR_CLK.

Please do not use "This commit/patch", but imperative mood. See longer
explanation here:
https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst#L95

> 
> [1]: Commit ffe91cb28f6a ("clk: mediatek: mt8365: Convert to
>      mtk_clk_simple_{probe,remove}()")
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>


Please use subject prefixes matching the subsystem. You can get them for
example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
your patch is touching.

And what about other users of bindings?

Best regards,
Krzysztof

