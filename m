Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D92B3C433FE
	for <linux-clk@archiver.kernel.org>; Tue,  7 Dec 2021 09:32:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233940AbhLGJgN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 7 Dec 2021 04:36:13 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:36532
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233743AbhLGJgM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 7 Dec 2021 04:36:12 -0500
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com [209.85.167.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 515523F1F7
        for <linux-clk@vger.kernel.org>; Tue,  7 Dec 2021 09:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1638869561;
        bh=T6+9s82eszvtvdECt4LjIhYDKx4D2t9XfbY0joue/Fo=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=Jm/Hyhx5pGgs/QGzfTB/OsnrNBMqsQU9++qLk3/KoWnoQ4UHRZLulY0Mk3AiPqjmq
         smFLibq2s9roLJVdkjNgDZ4eYO2c9YFNdfCMrO7YRZUBtr0ZIu/mledv+VMGjtwGsy
         fGlNzPB/2wK6CoW8CJKxwvp3yGROf0c4VWEfjoWuZ2OJxzL7lTuBtnCchc06T8Md+2
         0eHrN5jH+dNzzVDyxGP6RoJPIhNOjmv2oCrtw4WTa3Qg1nj6gei2ttffpOKJlcPFQ7
         1a0gxN1vu9U4dVYCXQQXdW39961opiE42Xw901EkT5iuixKg4Y26RGOhXOOvbrrr4H
         fPIytuhbIPv+w==
Received: by mail-lf1-f70.google.com with SMTP id d2-20020a0565123d0200b0040370d0d2fbso5073250lfv.23
        for <linux-clk@vger.kernel.org>; Tue, 07 Dec 2021 01:32:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=T6+9s82eszvtvdECt4LjIhYDKx4D2t9XfbY0joue/Fo=;
        b=omT7OddqIK2jffLnhiw4QfztENEez1SaZMqjkJoCr/Hbf55MoiMg6J6+dohyFCBnIC
         vy4k8Jo7iRjP6TzP6FYKYb2QjuikFzNMjzWLU5M5ozben8TVoojDjdRIkXaziK49zlJL
         xRkrr+wPU2ihhfcbN7ViP1cxuYReSdPykdBxb8tnIGYg/q/oBZPcawjq6K8d29lhFUPP
         JMihGJXBAriwXJ1wDU5GN0SFzP3bkSFd13IFMxTX90bNwubQ/xkLMnq1sPmeSPOZaxZ5
         dDJUdiwbREUs402T9+eAZNjkuXr4lYuCITsg4pQ8rkfJsroygFYaf8ZvQ0Y2ewJyNvit
         GPog==
X-Gm-Message-State: AOAM5320K4k0L3WhoBiYV5csP4TQOJHwrHojC5d73zanYXbtlTlG4PR4
        TnvS/v4DU+Xj3jBJwXZVsQIqaMSIECy2RViQZGxun7VqJPohzWdEC3gII7ZuOi0y5l04GaaUhFQ
        NYDd/jpJ1rvNk4OpNLImKsIuE4U5ws9LSE5bfjw==
X-Received: by 2002:a2e:994a:: with SMTP id r10mr41066359ljj.301.1638869560693;
        Tue, 07 Dec 2021 01:32:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwKyBwQ35QuPUmJsbOyAfvODA2PllK81Af6yVKERMwFTiAYBejXq04Tp3ARzZKlv7wtY5zCdQ==
X-Received: by 2002:a2e:994a:: with SMTP id r10mr41066327ljj.301.1638869560444;
        Tue, 07 Dec 2021 01:32:40 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id l5sm1553374ljh.66.2021.12.07.01.32.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Dec 2021 01:32:39 -0800 (PST)
Message-ID: <f2f2a084-9362-db44-27e9-19b54d350775@canonical.com>
Date:   Tue, 7 Dec 2021 10:32:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v4 4/7] clk: samsung: Make exynos850_register_cmu shared
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
 <20211206153124.427102-5-virag.david003@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211206153124.427102-5-virag.david003@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 06/12/2021 16:31, David Virag wrote:
> Rename exynos850_register_cmu to exynos_arm64_register_cmu and move it
> to a new file called "clk-exynos-arm64.c".
> 
> This should have no functional changes, but it will allow this code to
> be shared between other arm64 Exynos SoCs, like the Exynos7885 and
> possibly ExynosAuto V9.
> 
> Signed-off-by: David Virag <virag.david003@gmail.com>
> ---
> Changes in v2:
>   - New patch
> 
> Changes in v3:
>   - Fix SPDX comment style in clk-exynos-arm64.h
> 
> Changes in v4:
>   - Fix missing headers but still remove of_address.h
>   - "__SAMSUNG_CLK_ARM64_H" -> "__CLK_EXYNOS_ARM64_H" in
>     clk-exynos-arm64.h everywhere (only the comment at the end had the
>     latter by accident)
> 
>  drivers/clk/samsung/Makefile           |  1 +
>  drivers/clk/samsung/clk-exynos-arm64.c | 94 ++++++++++++++++++++++++++
>  drivers/clk/samsung/clk-exynos-arm64.h | 20 ++++++
>  drivers/clk/samsung/clk-exynos850.c    | 88 ++----------------------
>  4 files changed, 119 insertions(+), 84 deletions(-)
>  create mode 100644 drivers/clk/samsung/clk-exynos-arm64.c
>  create mode 100644 drivers/clk/samsung/clk-exynos-arm64.h
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
