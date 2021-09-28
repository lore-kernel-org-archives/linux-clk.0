Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9467AC433EF
	for <linux-clk@archiver.kernel.org>; Tue, 28 Sep 2021 09:52:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 764926023B
	for <linux-clk@archiver.kernel.org>; Tue, 28 Sep 2021 09:52:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240035AbhI1JyS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 28 Sep 2021 05:54:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240031AbhI1JyR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 28 Sep 2021 05:54:17 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 419A5C061604
        for <linux-clk@vger.kernel.org>; Tue, 28 Sep 2021 02:52:38 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id r83-20020a1c4456000000b0030cfc00ca5fso1699419wma.2
        for <linux-clk@vger.kernel.org>; Tue, 28 Sep 2021 02:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=GuHPLheShRlbOpi51aLOYmcYsG+bNOOwfr/gYWEALaw=;
        b=o1TDOq0LiwPkSupy54hfguLkuJ5+Ii8Gk8YO5lZ4D7rYxHjsaslijOA6FSKwUud29j
         lJRoUv3tEo7jaGRXV+GCMcS09fd6xioukRVOxvBPWjgHTBNKHvBbmOl4KMo2gMroKnF6
         jMqSklqxOsMalnsJJuUKLSejLeJYtBQuCnTtGdQUYiGgQkkibe8bhvhZBLOLnX8KCG1s
         hDi4QBQOk9xhLHaF9Hjeq24VOzSj70+VjQt9YUnG25ssF2nBDcnlyHAlF5gDhgF8EZyv
         l74Tzkhgm95uSzmZ0PjDAkrLP+tUXzKYHA5WWJs8GlhQhi15q3RAsKZHmgnAbW3rkaeq
         87AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=GuHPLheShRlbOpi51aLOYmcYsG+bNOOwfr/gYWEALaw=;
        b=Qq/VzuLwRzLgn4bLM68gjAgYtegvLXmf97X6KiThzWSagsHwtBeBViVc8zPNKNUjFD
         xMBtCmf41z5IWPQvjcKsOxzEspNhTM3x8LT1/9Mq/maef6l45nUqOJJBpSfFFliBFGS3
         BHEGO0Wb4EciFAF7J5JFUUl/+DcaNkJnMjCNG+hrBgua1itJRAXwAF+BMiEECoTm4ntd
         0lNR9x4YwW8Z3eZcelQuYjNaFeEw4f4Ibg6C3j/eYWh1E/6Zv4VVE3d+ykHY6qH+4w60
         yi5/ODT0ig0/sZPwQ9HPgYNpe3t/iY1tT9xSGMl2DlD1gonjoJfYZFIDkcWkaN0y86Iv
         mLvQ==
X-Gm-Message-State: AOAM53379MQx61JPe8+yX3uh2mi/QYGLecly+N8DscrM2Z2e+Cv76Ksh
        3c9urYkW4KKeCzeQ0qmwHaHSoQ==
X-Google-Smtp-Source: ABdhPJzugmyfSJ6wM5od5emO0tsj0/opG3+kwzLDnnw74iHAPISXEdmJeQu+mCnvTAje7ebw3Y9mNQ==
X-Received: by 2002:a1c:2289:: with SMTP id i131mr3722335wmi.34.1632822756859;
        Tue, 28 Sep 2021 02:52:36 -0700 (PDT)
Received: from google.com ([95.148.6.233])
        by smtp.gmail.com with ESMTPSA id l17sm642980wrx.24.2021.09.28.02.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Sep 2021 02:52:36 -0700 (PDT)
Date:   Tue, 28 Sep 2021 10:52:34 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Chanwoo Choi <cw00.choi@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Rob Herring <robh@kernel.org>
Subject: Re: [RESEND PATCH v2 4/4] mfd: max14577: Do not enforce (incorrect)
 interrupt trigger type
Message-ID: <YVLl4n9O8xXuDeWo@google.com>
References: <20210602110445.33536-1-krzysztof.kozlowski@canonical.com>
 <20210602110445.33536-4-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210602110445.33536-4-krzysztof.kozlowski@canonical.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 02 Jun 2021, Krzysztof Kozlowski wrote:

> From: Krzysztof Kozlowski <krzk@kernel.org>
> 
> Interrupt line can be configured on different hardware in different way,
> even inverted.  Therefore driver should not enforce specific trigger
> type - edge falling - but instead rely on Devicetree to configure it.
> 
> The Maxim 14577/77836 datasheets describe the interrupt line as active
> low with a requirement of acknowledge from the CPU therefore the edge
> falling is not correct.
> 
> The interrupt line is shared between PMIC and charger driver, so using
> level sensitive interrupt is here especially important to avoid races.
> With an edge configuration in case if first PMIC signals interrupt
> followed shortly after by the RTC, the interrupt might not be yet
> cleared/acked thus the second one would not be noticed.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> Acked-by: Rob Herring <robh@kernel.org>
> 
> ---
> 
> Changes since v1:
> 1. Add Ack
> ---
>  Documentation/devicetree/bindings/mfd/max14577.txt | 4 ++--
>  drivers/mfd/max14577.c                             | 6 +++---
>  2 files changed, 5 insertions(+), 5 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
