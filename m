Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC59CC433F5
	for <linux-clk@archiver.kernel.org>; Tue,  7 Dec 2021 09:33:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233805AbhLGJgg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 7 Dec 2021 04:36:36 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:36588
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232193AbhLGJgf (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 7 Dec 2021 04:36:35 -0500
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id EDD6A3F19E
        for <linux-clk@vger.kernel.org>; Tue,  7 Dec 2021 09:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1638869584;
        bh=BEdVsoIuFxM799cTbQkXLyx5ca2h6q0N/IASsw9oLV4=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=UG3J9mzhkAz5p5b1AlYpnFPBP+aSpJZn2sMHin0m/0GyK25sWDm5fTxa4Ut1bQIE+
         Mif8CB3WiiGoa0srZI4EtzSnTw5A1b0MYOF925L4V+FEgsAVwgzmQFwaoHO8ttQob+
         Bemv8nv3BtxMRtKsgEjFvMRdvFhvW7llp1+vq3oE1SNS5adTnNpQ0ZWTBXiQtkjr/t
         W7BaAEY1QFM2LHeqjQMvS+LwowxTJSrtdqoEbh0QdIRJujOL/al5fI7tvwBnxgEr27
         pdlv0RKI5rW+Hp/NvbQ7n0koQnPkBsXn8+5hetBdBLgJ2gp65LH1s6m9UxT6IqjcQN
         0fIYZxo9kq9eQ==
Received: by mail-lf1-f69.google.com with SMTP id q26-20020ac2515a000000b0040adfeb8132so5086997lfd.9
        for <linux-clk@vger.kernel.org>; Tue, 07 Dec 2021 01:33:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=BEdVsoIuFxM799cTbQkXLyx5ca2h6q0N/IASsw9oLV4=;
        b=r2JueGnKiOd5JxqvqNon7/w+ll0oNNci5kDRhHoC/EIC0YHjPFFggUpx4ShaetIXk4
         vkA3I7v37RS7IxvMchamMtkdvIkaDX5lxAVVTUw27chmqZzEmMsM8DNoWS9pZSxCX0Kg
         sRWLPApJSFRtBl9wuvMEe3mx/m+4qTew23/1q2Yp+YV/Uhdf7Y1DomWkSSGRnQQQS9kx
         DvEs6rrSLxQUBcHZ0GU9XtojSUwGAU8ttKlvP+OrncqsqrNo4Qv4UzaYVMKTeLXpuaVl
         aOi9bceVWDeJ95Xyo9Gpw3+rQuHqqpgfOknSU/UtIRc1vO6/7geFcLC55uxXzwKC09dK
         qbsA==
X-Gm-Message-State: AOAM533awLUPBaJl871jKwBhco4iaaJW1k8uqMVb2u6xf9RkqOUibi/g
        WKFVMQDBK2wXCT3+OhZ5agr4/74bJoFahDOhto7EttYXowbx7BFCVPUF95M2r/35P8DVRZGowhm
        7NRajGRwD8irU6jmSdgyxUB3MA3oX79PiKStW+A==
X-Received: by 2002:ac2:4568:: with SMTP id k8mr39785440lfm.80.1638869584475;
        Tue, 07 Dec 2021 01:33:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyJnVDk3iH40oUmSMxetPRxhkoJ0C7h06clV4jQucaTt6d1WFAgv+kKH51sPo13Jm0l9iRrdA==
X-Received: by 2002:ac2:4568:: with SMTP id k8mr39785427lfm.80.1638869584282;
        Tue, 07 Dec 2021 01:33:04 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id l5sm1553513ljh.66.2021.12.07.01.33.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Dec 2021 01:33:03 -0800 (PST)
Message-ID: <314c4616-7151-f854-2ee4-9ab8d25ef0fb@canonical.com>
Date:   Tue, 7 Dec 2021 10:33:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v4 6/7] clk: samsung: Add initial Exynos7885 clock driver
Content-Language: en-US
To:     David Virag <virag.david003@gmail.com>
Cc:     Sam Protsenko <semen.protsenko@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <20211206153124.427102-1-virag.david003@gmail.com>
 <20211206153124.427102-7-virag.david003@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211206153124.427102-7-virag.david003@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 06/12/2021 16:31, David Virag wrote:
> This is an initial implementation adding basic clocks, such as UART,
> USI, I2C, WDT, ect. and their parent clocks. It is heavily based on the
> Exynos850 clock driver at 'drivers/clk/samsung/clk-exynos850.c' which
> was made by Sam Protsenko, thus the copyright and author lines were
> kept.
> 
> Bus clocks are enabled by default as well to avoid hangs while trying to
> access CMU registers.
> 
> Only the parts of CMU_TOP needed for CMU_CORE and CMU_PERI, a bit of
> CMU_CORE, and most of CMU_PERI is implemented as of now.
> 
> Signed-off-by: David Virag <virag.david003@gmail.com>
> ---
> Changes in v2:
>   - Use shared code between Exynos850 and 7885 clock drivers
>   - As the code that was from the Exynos850 clock driver was moved to
>     clk-exynos-arm64.c and what remains is mostly SoC specific data,
>     move the Linaro copyright and Sam Protsenko author lines there.
> 
> Changes in v3:
>   - Nothing
> 
> Changes in v4:
>   - Fixed missing headers
> 
>  drivers/clk/samsung/Makefile         |   1 +
>  drivers/clk/samsung/clk-exynos7885.c | 597 +++++++++++++++++++++++++++
>  2 files changed, 598 insertions(+)
>  create mode 100644 drivers/clk/samsung/clk-exynos7885.c
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
