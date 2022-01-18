Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E8FBC433FE
	for <linux-clk@archiver.kernel.org>; Tue, 18 Jan 2022 18:36:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348114AbiARSgG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 18 Jan 2022 13:36:06 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:36644
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1348098AbiARSgF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 18 Jan 2022 13:36:05 -0500
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id CA67840028
        for <linux-clk@vger.kernel.org>; Tue, 18 Jan 2022 18:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1642530963;
        bh=EE0Uqs2gxfZTLiuKZr5yQERb9YnbJAH824xo2Ga77Yc=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=VWfKvjK7OKJPAj8wXfnlcMno1Ur/yOfoHW2lOoY8f6/+0PexDw8457E+qG32QP2Wo
         bEhLJLf18dgHkTSV4Dqq4KYWPbJ+mFaHPqmC+oDJElMVMtZDRklQatjNoOpZDhJKBe
         o9btZEtrSiedrXV1ddXgrejC7Z2qfKtv7QN8B+EhSRkiBkdSuzvY2WfRdpIs+Wm48E
         fMzB7LPV9yKFkQIWbvBMMJYKjMOkNxpJZ2Znx00w+Bj8Qg0vY6L5/tm4RAhzunSI+T
         IlKD3mphx8xZMkY4VvLK2OdgmT4xSw1fXm0zCIIi8Yd79G74uypwLpw/oEiPE3ocLt
         DdnvQu8Jc5Z/A==
Received: by mail-ed1-f71.google.com with SMTP id er7-20020a056402448700b00402bbb8ce8bso6360639edb.1
        for <linux-clk@vger.kernel.org>; Tue, 18 Jan 2022 10:36:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=EE0Uqs2gxfZTLiuKZr5yQERb9YnbJAH824xo2Ga77Yc=;
        b=dMt6G5oHN3vJVDFg5q+VzJH640meCL7KzJzTmQxoEOZly/VBoNVWdWbViRWbKWymoz
         QrNV2hWhBCXrklV2SWw9ELnqQOlEukOQ/kVRJ6v1GaKkRxUvnhJE4e28KesNvypriuPW
         u91RtqZBf2DJwPeXlOM/zWh3Owxw3lAyEeW3xGI1vWRPkjrzph+R3QdaJt585QY7MMAn
         18+ow1prWvRJDNQbTCFbKvJrrERcj+pbx7KGzZ479G7XJOF1FB3WT3Xh/I0PbhWaeTTG
         IiFpe6piCfm/K2E0rNxAVe8Iz9qDOxE6XMoe6LQmVj/q7Wpt4wCJxr1vq+cnZ459SFsh
         iSaQ==
X-Gm-Message-State: AOAM531NdI5n9iuISJ1uVHn8Gxm3BEcEGK32XVY+863RbwaMHEM1yNr4
        V3141HJStjNiLxorNAN8y9bCt3TEpJH5cmHbW0XOHPtURv+7/cIu+NpeG86Kz5AhpS2kOjpBY26
        pgAJMbBWuSH7YSxU4OaxGZk0QqIE+GG1w70AkGw==
X-Received: by 2002:a17:906:950d:: with SMTP id u13mr2606640ejx.153.1642530963211;
        Tue, 18 Jan 2022 10:36:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz7fvH2EjM40W+CUN1OS0nmGVd/o0ku+wn5FGo24qFNppsdaH6JzDP3RNs1r7cpe3wn6aNXCg==
X-Received: by 2002:a17:906:950d:: with SMTP id u13mr2606629ejx.153.1642530963016;
        Tue, 18 Jan 2022 10:36:03 -0800 (PST)
Received: from [192.168.0.42] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id d7sm191717edt.74.2022.01.18.10.36.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jan 2022 10:36:02 -0800 (PST)
Message-ID: <4606bf04-154f-97bb-9b8b-1103c6308004@canonical.com>
Date:   Tue, 18 Jan 2022 19:36:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v2 08/16] clk: samsung: fsd: Add cmu_imem block clock
 information
Content-Language: en-US
To:     Alim Akhtar <alim.akhtar@samsung.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     soc@kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, olof@lixom.net, arnd@arndb.de,
        linus.walleij@linaro.org, catalin.marinas@arm.com,
        robh+dt@kernel.org, s.nawrocki@samsung.com,
        linux-samsung-soc@vger.kernel.org, pankaj.dubey@samsung.com,
        linux-fsd@tesla.com, Arjun K V <arjun.kv@samsung.com>,
        Tauseef Nomani <tauseef.n@samsung.com>
References: <20220118144851.69537-1-alim.akhtar@samsung.com>
 <CGME20220118150045epcas5p4e54922758fb7922b1fd8de0995d2127e@epcas5p4.samsung.com>
 <20220118144851.69537-9-alim.akhtar@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220118144851.69537-9-alim.akhtar@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 18/01/2022 15:48, Alim Akhtar wrote:
> Adds cmu_imem clock related code, imem block contains IPs
> like WDT, DMA, TMU etc, these clocks are required for such
> IP function.
> 
> Cc: linux-fsd@tesla.com
> Signed-off-by: Arjun K V <arjun.kv@samsung.com>
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> Signed-off-by: Tauseef Nomani <tauseef.n@samsung.com>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---
>  drivers/clk/samsung/clk-fsd.c | 283 ++++++++++++++++++++++++++++++++++
>  1 file changed, 283 insertions(+)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
