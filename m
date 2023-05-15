Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69711C77B7D
	for <linux-clk@archiver.kernel.org>; Mon, 15 May 2023 06:27:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239058AbjEOG1g (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 15 May 2023 02:27:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239762AbjEOG1c (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 15 May 2023 02:27:32 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 318F02D58
        for <linux-clk@vger.kernel.org>; Sun, 14 May 2023 23:27:25 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-9660af2499dso2039936266b.0
        for <linux-clk@vger.kernel.org>; Sun, 14 May 2023 23:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684132043; x=1686724043;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fPH+8xvBh7NiA0Q/69MSU5S3kxpPxX+T6hvZkKu8gFc=;
        b=bq3jJGSEp9INUCx1XHGMmoRyFQACqzGSIl3W4kUwn8VkHgx/N8k8S9we6QD9nhYC1J
         aXHBJQML+9dC9xgZNlO7KTgCehQIv6L5Y08FbkVwgCzmyBT1tWWHJWrq3z2BJqRjv8gm
         fw/RhfjNnlh35OQ39j9MI8IqGFVCZgWG+4bceY39I+EneDAXiNWyeZ+HftVJ5FFRz0+t
         RTeBVju0xsxLvlwviFNlZt/CZD8HMaHB+v5dgAZRhkMtU8hzKUe8KZ/rrRqAqZU0cAeg
         4KmMKIgVHKcglZA7kDXMmPF9cgolZSCD7eOlPiWR3WRW52tEfZyLVbLIfOM5PLzJdiYe
         eWSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684132043; x=1686724043;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fPH+8xvBh7NiA0Q/69MSU5S3kxpPxX+T6hvZkKu8gFc=;
        b=lYBBUTQOKFGFAst8Af8ibm020jRNqTt11BIozrTPCQMjg7RPvgLDD6+cmZlaIR1Bru
         DT+SPTXwZig9RtA7yWx2qMUrvBboennReQVZlMOFApOU/TPJ9qFvpPiZ2NzMTIZaKbCO
         rz2SM9JRExipAlaT9Dy+MrnmypzRYlEWC1CTFrXlzoOIYTYGpeIoYgKs2BvBap4sb9Ua
         Hw5RvAvZjGEB8hCc4GlAvJgWRIuMuTRQ6C4fd+Xac09XoHaXySQFlgk+//2iKCgoDlZR
         bJ2TFe0fFZn21INFmnjgd3k4j93rojIcWr5O4SpvZ4vO54EDRMcGtcMSHDNGKDh4lvdW
         9I6Q==
X-Gm-Message-State: AC+VfDzFIGCbwdwAZr28ljjIDte/ISaaWaAD+i1fannxHfOV/aINbGA4
        dWtRgOXEEeANOxYUU4oizOHQjQ==
X-Google-Smtp-Source: ACHHUZ6KhAPIFec8ZHcD908Z5f0wNboh61jxF1yxMAz9PexUx03rIa02ja5P3qimJ/lzKhVbLNL3UQ==
X-Received: by 2002:a17:907:8688:b0:96a:3005:61b7 with SMTP id qa8-20020a170907868800b0096a300561b7mr14216778ejc.74.1684132043675;
        Sun, 14 May 2023 23:27:23 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:6470:25b8:7c2d:1992? ([2a02:810d:15c0:828:6470:25b8:7c2d:1992])
        by smtp.gmail.com with ESMTPSA id hf15-20020a1709072c4f00b008f89953b761sm9004330ejc.3.2023.05.14.23.27.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 May 2023 23:27:23 -0700 (PDT)
Message-ID: <fef0ac30-73c1-86a7-e114-0846ba735965@linaro.org>
Date:   Mon, 15 May 2023 08:27:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/3] clk: thead: add support for the T-HEAD TH1520 CCU
Content-Language: en-US
To:     Yangtao Li <frank.li@vivo.com>, mturquette@baylibre.com,
        sboyd@kernel.org, Jisheng Zhang <jszhang@kernel.org>,
        Wei Fu <wefu@redhat.com>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        Icenowy Zheng <uwu@icenowy.me>
References: <20230515054402.27633-1-frank.li@vivo.com>
 <20230515054402.27633-3-frank.li@vivo.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230515054402.27633-3-frank.li@vivo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 15/05/2023 07:44, Yangtao Li wrote:
> Add support for th1520 in the clock framework.
> 
> Cc: Icenowy Zheng <uwu@icenowy.me>
> Cc: Wei Fu <wefu@redhat.com>
> Cc: Jisheng Zhang <jszhang@kernel.org>
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>  drivers/clk/Kconfig                      |   6 +
>  drivers/clk/Makefile                     |   1 +
>  drivers/clk/clk-th1520.c                 | 999 +++++++++++++++++++++++
>  include/dt-bindings/clock/th1520-clock.h |  92 +++
>  4 files changed, 1098 insertions(+)

Please run scripts/checkpatch.pl and fix reported warnings.

Bindings are always separate patches.

Best regards,
Krzysztof

