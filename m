Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45CB6C6FD18
	for <linux-clk@archiver.kernel.org>; Tue, 18 Apr 2023 17:29:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231659AbjDRR3b (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 18 Apr 2023 13:29:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231877AbjDRR3b (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 18 Apr 2023 13:29:31 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D172583FE
        for <linux-clk@vger.kernel.org>; Tue, 18 Apr 2023 10:29:28 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-506bdf29712so2885783a12.0
        for <linux-clk@vger.kernel.org>; Tue, 18 Apr 2023 10:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681838967; x=1684430967;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k8K/4YMZuDcuh5BZ2DbCbQlB4lFUO8Ytiq9k9HbeZFA=;
        b=sccrfK60nOcez5USmWirFJsYTIddBTzhgQ8+MIXG+OqMLaXClvKsbybDfaXI4HH83P
         1h0gIZDrvAZSe454VoJtEDQFWqF96DzjDyTwSs/tW7rje7D5Q60/6mxj9wvyLPqmTcv6
         GWaCi0AsbD3XRxDwSgUUPKWjQRlYfMHVJcuPmpezdbz7T02gmiGU3nLWNVKDrWapA4e7
         0+/a8WRnp4Sbt53ECE8t9jVjgdhwgRWurHVX06uHf79TKOjYj1Lzwqh62sseWmz0sVwg
         LKwrm3als5Oh/PqNKvaxtb+biIJuffgECyPC35TsGxyhzenEA0KO4OeNrDFQZi/Fyrzz
         DR2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681838967; x=1684430967;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k8K/4YMZuDcuh5BZ2DbCbQlB4lFUO8Ytiq9k9HbeZFA=;
        b=Rkk8FlQYiOOEBLuTVeQCqKGxMydSdLL7S0NRymzv1Q69ubJjtmVnvf2YZ504qSnUeS
         OOjA345aFBWMGBHjo19qRSueKxTkRzm1siR/RjVBYcx+0xOn660RAjyckVAhXmhcTnXZ
         ftNn8j90a1ILNoXkbyBhdQ8Ls94NsEmIBPTRzNUYw9YOEPILG/HcIbQ83BGBcUyRiD2m
         DlGkinAgThFPvDSEVnL5lzaemm/2zEnfPWb2pIN5hbRdX+vCi5lxNWagn6IlRMuXhvN1
         J4LoaLUD0EF5kTIZoJjWOr9JKVLyKK4z2Yz/RkOoLnA6AZneATy8uJMweGEDCLD5K38i
         tJOw==
X-Gm-Message-State: AAQBX9c6UznFCgY+0qtD+HBNRPTcffj+MrnbrE6IcJ3X7+HOA4izsjef
        9gkErXppHbyBbvcaEvKhnU6oEw==
X-Google-Smtp-Source: AKy350arEzNQ4T5BD+P0URcn7Uvt1j65gpuJYpNBnBKMiWN16xeO5EwyxUGCCccSBZ53+R/0tGpuOQ==
X-Received: by 2002:a05:6402:27cf:b0:506:70a3:2aa0 with SMTP id c15-20020a05640227cf00b0050670a32aa0mr3156647ede.3.1681838967266;
        Tue, 18 Apr 2023 10:29:27 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:a276:7d35:5226:1c77? ([2a02:810d:15c0:828:a276:7d35:5226:1c77])
        by smtp.gmail.com with ESMTPSA id p9-20020a05640210c900b004fa012332ecsm7263677edu.1.2023.04.18.10.29.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Apr 2023 10:29:26 -0700 (PDT)
Message-ID: <9b6f54d9-f5ee-3e1c-7924-dd5c706aaf41@linaro.org>
Date:   Tue, 18 Apr 2023 19:29:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v1 1/2] dt-bindings: clocking-wizard: add versal
 compatible
Content-Language: en-US
To:     Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
        devicetree@vger.kernel.org
Cc:     git@amd.com, linux-clk@vger.kernel.org, robh+dt@kernel.org,
        sboyd@kernel.org, mturquette@baylibre.com,
        krzysztof.kozlowski+dt@linaro.org, michal.simek@xilinx.com
References: <20230418102855.6791-1-shubhrajyoti.datta@amd.com>
 <20230418102855.6791-2-shubhrajyoti.datta@amd.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230418102855.6791-2-shubhrajyoti.datta@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 18/04/2023 12:28, Shubhrajyoti Datta wrote:
> Add the devicetree compatible for Versal clocking wizard.
> 

Use subject prefixes matching the subsystem (which you can get for
example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
your patch is touching).

> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

