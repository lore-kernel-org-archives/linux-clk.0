Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91F44C433F5
	for <linux-clk@archiver.kernel.org>; Wed, 15 Dec 2021 16:12:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244545AbhLOQM1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 15 Dec 2021 11:12:27 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:54328
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231277AbhLOQM0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 15 Dec 2021 11:12:26 -0500
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 86BE03F1FD
        for <linux-clk@vger.kernel.org>; Wed, 15 Dec 2021 16:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1639584745;
        bh=Gqc3SWSuQa3GN/NS9ZGbbsxJWcy8NtTw1YR++9SWwQw=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=KGshOtyxuE3MVTKTbOebTCBv+DVq/p4jcjEwTGbIL8JFb7lNiKMOvNmPIPFh4T8cH
         FwZGtxoFMIhh2ot1SGULocc5se5T+aGVFtMmG2HfoWI6FwQO5xWkx1fitdbA0G7oee
         iHqTk57QTlSxMIwzt5l5TzVGYH0/m56nV4WKpXByXUm6P4Lgx5DbiqJ/psIKY2pVB4
         1WWf1VhTr2WVz4Pbyydi6ielc9bsyVviy951dtwrSI/hpcWWkUonesXa8302MZlha9
         RzgjWMdSXSAj7etc4R/PO9R2UewKyjNdcrhNYAjqI3v2dUKRWmvlrm+aCxu/pZajmJ
         DylpBfQDULzOw==
Received: by mail-lf1-f69.google.com with SMTP id n18-20020a0565120ad200b004036c43a0ddso9773050lfu.2
        for <linux-clk@vger.kernel.org>; Wed, 15 Dec 2021 08:12:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Gqc3SWSuQa3GN/NS9ZGbbsxJWcy8NtTw1YR++9SWwQw=;
        b=0F0Ylq/okkP6nk0YS4CHqTA91BFjsqUz+1R4/PSwrrtoRz/XLoiDyl1KvQG6C3iv/w
         DY6ivWHSLsN/Cdoy5wNEpF8kYPsXU6JxbnqvkJyNgUszY4/EKMk/BEwP8+KEPmuLSAxB
         bQ3qD76G84omdAVl2zz5agc0tcxmcIi8+sqjysLmLZ9PZdt78Q9PIn6bYKpLtTazrihQ
         KOelHMwK4vGzLyt2Xs+cFxs9TZzIwo5YKI5PJ2ynZEeUDq3AhbzVLFHfTCPWap9xLP0e
         Q2kLmSZKTLB77TPTSudGyoq4btjV7+cQEE05ZYt8Ghoyvzj0+6cpBN6ybr2+xTg14KWS
         BTAg==
X-Gm-Message-State: AOAM5308rDL89WjWkDgYDLLiRQ1ss4IZseOG3ODxB9azYtCKp+DO/VkP
        WjRFjFoHboltB4SsVL83t6/Jg6uo8DkJT/LpnnAQbSbcqs49Ap0CwlJeHWQUwBL9EMI6b+tQNaH
        9oq5x96fGvvORFKYJYhb6/k+pZMl1nOJwqTZpqA==
X-Received: by 2002:a05:6512:3682:: with SMTP id d2mr10716065lfs.442.1639584744923;
        Wed, 15 Dec 2021 08:12:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxNVGmlJj0OKjNo7M0Kl/aa/AKzI1cH8gLEUiWMbPVLW5IlObeJGkS3Mke6b9GAr49iwqZ8LQ==
X-Received: by 2002:a05:6512:3682:: with SMTP id d2mr10716048lfs.442.1639584744769;
        Wed, 15 Dec 2021 08:12:24 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id i21sm384643lfr.133.2021.12.15.08.12.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Dec 2021 08:12:24 -0800 (PST)
Message-ID: <1111ab2c-d542-c464-6367-deb487867ce7@canonical.com>
Date:   Wed, 15 Dec 2021 17:12:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 2/7] clk: samsung: exynos850: Add missing sysreg clocks
Content-Language: en-US
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     Jaewon Kim <jaewon02.kim@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Youngmin Nam <youngmin.nam@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Palmer <daniel@0x0f.com>,
        Hao Fang <fanghao11@huawei.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <20211215160906.17451-1-semen.protsenko@linaro.org>
 <20211215160906.17451-3-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211215160906.17451-3-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 15/12/2021 17:09, Sam Protsenko wrote:
> System Register is used to configure system behavior, like USI protocol,
> etc. SYSREG clocks should be provided to corresponding syscon nodes, to
> make it possible to modify SYSREG registers.
> 
> While at it, add also missing PMU and GPIO clocks, which looks necessary
> and might be needed for corresponding Exynos850 features soon.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
>  drivers/clk/samsung/clk-exynos850.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
