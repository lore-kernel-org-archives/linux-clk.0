Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E31D8C433F5
	for <linux-clk@archiver.kernel.org>; Tue, 28 Sep 2021 09:52:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C6C4361157
	for <linux-clk@archiver.kernel.org>; Tue, 28 Sep 2021 09:52:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240009AbhI1JyF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 28 Sep 2021 05:54:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239840AbhI1JyF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 28 Sep 2021 05:54:05 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF1EAC061740
        for <linux-clk@vger.kernel.org>; Tue, 28 Sep 2021 02:52:25 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id k7so5068459wrd.13
        for <linux-clk@vger.kernel.org>; Tue, 28 Sep 2021 02:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=yVcQbOuCpqmzA0Unotd8q5BfUkjxaUbJiv1/pjgSmvw=;
        b=IT+UEBuPtAVijXSWbsiNBfN2jv6zi3NY6h6mLsCshHMfL44Q1zDsxubpu2mLKW11fh
         JS/kscx5DjMePLiRz+yItlMxPX/br/edRBPxcx52PmZPe2GmzHlOQGdoVKPGfAIhvNbN
         0UJON/ZWF4FxrhiW8doKw2YrtE1oO37zTNsfYC5FbIsgJWcrdEn80meonMsUYB6iZyv1
         c4eebUvTkFVsRvpfK6LEXz/5uR/YI+NAeZ29mfRV2UlK1Sk7sLZnNLBii0AP7yFspKv7
         sa6+s9JbCTtjLW4yAnHQcu7RMJGjOFwVx2oM54hHEfD4aygh0ZCgM7Z67sWhT8QitPyf
         MUJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=yVcQbOuCpqmzA0Unotd8q5BfUkjxaUbJiv1/pjgSmvw=;
        b=toUAoGHaSY9+TDY3PvNlTFgEYSlCPVNNVh3fllZFMQoTCVSzHWu3cGtq/Hbze05KfY
         3UAITJ/g+5CmIKXwAzONY8//yDllbHTfhqz3fGpQMay0nqtI+kjhPUud7GVQ+pmQ/juM
         pBHRO/kFORs2yI24OK8bGiXdFJ/XFvbcikh+RhVxyr+0jmhINAhpwB3UKqgyTJNjzFIw
         nllDVMgRB9D+s/v57htztfKV18zxqGxiXkta9HfSpPu2cEHXnXm2Vk4P91jQQaSjuZm8
         3MwXcT1n66lYnodWWi6FrZ2RmBPjYa/e/FnMgob7doHRa6kSH23ZpdUiiIR9F5OjhzYi
         hAnA==
X-Gm-Message-State: AOAM532aot0pRagdRAiD81tCNsBiBk5po/BnUYSG0QST4KO9jzCEvdO0
        00q2Z/kCSc4ls5IAZ9lQPJElsg==
X-Google-Smtp-Source: ABdhPJweAtsLKmkEaMGSf+R8jmjUTDWtQcN5Xf7jIS0jkEcJSO32F6bKYQNNj9DajCWOKJAkdfh3WA==
X-Received: by 2002:a5d:44d1:: with SMTP id z17mr5386646wrr.187.1632822744424;
        Tue, 28 Sep 2021 02:52:24 -0700 (PDT)
Received: from google.com ([95.148.6.233])
        by smtp.gmail.com with ESMTPSA id n66sm2243910wmn.2.2021.09.28.02.52.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Sep 2021 02:52:24 -0700 (PDT)
Date:   Tue, 28 Sep 2021 10:52:22 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Chanwoo Choi <cw00.choi@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [RESEND PATCH v2 1/4] mfd: sec-irq: Do not enforce (incorrect)
 interrupt trigger type
Message-ID: <YVLl1tigynO1MtYu@google.com>
References: <20210602110445.33536-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210602110445.33536-1-krzysztof.kozlowski@canonical.com>
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
> The Samsung PMIC drivers are used only on Devicetree boards.
> 
> Additionally, the PMIC datasheets describe the interrupt line as active
> low with a requirement of acknowledge from the CPU therefore the edge
> falling is not correct.
> 
> Marek Szyprowski reports that together with DTS change (proper level in
> DTS) it fixes RTC alarm failure that he observed from time to time on
> TM2e board.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> 
> ---
> 
> Rebased on https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git/log/?h=for-mfd-next
> 
> Changes since v1:
> 1. Mention in commit msg that this fixes TM2e RTC alarm.
> 2. Add Marek's tested-by.
> ---
>  drivers/mfd/sec-irq.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
