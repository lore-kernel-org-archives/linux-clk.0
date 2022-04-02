Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B45BC433F5
	for <linux-clk@archiver.kernel.org>; Sat,  2 Apr 2022 16:59:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358573AbiDBRBZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 2 Apr 2022 13:01:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358576AbiDBRBX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 2 Apr 2022 13:01:23 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE2DA23142
        for <linux-clk@vger.kernel.org>; Sat,  2 Apr 2022 09:59:30 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id u28so17681eda.12
        for <linux-clk@vger.kernel.org>; Sat, 02 Apr 2022 09:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=mn05wTy/NlZVsNgz6hNdV0Fxw7lJ50c59f6ciYye0FQ=;
        b=fq3SOd6MFtCnhKuLIK+XqlH/P+ltpB9Wgb2pGbPmcDnYS5rZkpXTwRVdNS9sG/WvUA
         a6jXfIbjBmddM7WxPEq54uXmuYuxnbTQAd8Do+KoU+zKRcK1la0JCeHW2Qfo+i1sfsmF
         twivpRIFYeInj73kTMZqga/jEH9wttpctNbWY/aZ+THJec1cB8oioDbGF5GhU8QEVeU+
         coJjJezqBCtpcznrhMSyJab2KfUjB2kamgercpvZTiJ39orM0+48gS9RoPecmgnaQhTK
         UUtrGruEiamfa+MkxcR8171Sgamf/qEfibR+Hj0WhcnfDZxsL1HwPoFmnv8/quPsGlJW
         7zVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=mn05wTy/NlZVsNgz6hNdV0Fxw7lJ50c59f6ciYye0FQ=;
        b=QaJaaL8RpIFy9ot7ftNODbVosGBLya+HksWIp6HvZ356VntxfiICtuhOZhoBnmalSI
         zrVSytYVL2UvFFa+aQLEbEPkxooDrFYNk904+KmmLY7qyE8KGmD/lYG8dcFOHoUfBtcl
         qqhNNASDc7jGCwN8OHlt45ZvuwWluuk8U6SO4nMYwV0JAD15e+pyj4cLSfumQGY7QkPj
         b4wNmMvfIDTwQWvFtf7n+TPNrHw+bKchiYfPYHzcMIpdlOjfqZ9DPbvHKvbdc+72hhFj
         QY1pgLDh4Yn0aKK/mDvjfj0rsRz10lQvCQxN0/OFjxMraKTYeNp+3BObj6kIzs9D4OxV
         gdEA==
X-Gm-Message-State: AOAM533aol2aQMntgLqNnq38a31uj2bqFXwbSLfsOjR9LAGV0ATlen3c
        d3PyP6RYwafQQi7hGWiO23Zc8g==
X-Google-Smtp-Source: ABdhPJwoAd+Eq+1ILPRp3HMI7n442Wkx1NQELFVkIpWw5zi4uUY7WVW3nNEmMZDKhp+1fvQw2oFcEw==
X-Received: by 2002:aa7:d398:0:b0:419:d011:fe8b with SMTP id x24-20020aa7d398000000b00419d011fe8bmr26354361edq.168.1648918769576;
        Sat, 02 Apr 2022 09:59:29 -0700 (PDT)
Received: from [192.168.0.171] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id u25-20020a170906b11900b006e08588afedsm2255299ejy.132.2022.04.02.09.59.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Apr 2022 09:59:29 -0700 (PDT)
Message-ID: <969094a6-097f-1cf4-64fb-c0ae7d3d2173@linaro.org>
Date:   Sat, 2 Apr 2022 18:59:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v4 00/16] Convert Rockchip clk
Content-Language: en-US
To:     Johan Jonker <jbx6244@gmail.com>, heiko@sntech.de,
        zhangqing@rock-chips.com
Cc:     robh+dt@kernel.org, krzk+dt@kernel.org, mturquette@baylibre.com,
        sboyd@kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220402143636.15222-1-jbx6244@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220402143636.15222-1-jbx6244@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 02/04/2022 16:36, Johan Jonker wrote:
> Combined serie of previously converted Rockchip clk bindings.
> 
> Changed V4:
>   combine dts patches
>   add more clocks

Why adding more clocks? The discussion whether to do it did not finish.

You merged all your patches into one series, but this makes impossible
to compare them with your previous submission:

  b4 diff ...
  Analyzing 20 messages in the thread

  ERROR: Could not auto-find previous revision

         Run "b4 am -T" manually, then "b4 diff -m mbx1 mbx2"


Please provide links to previous versions on lore, so we can check what
changed.

Best regards,
Krzysztof
