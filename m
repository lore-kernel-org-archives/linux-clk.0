Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 724EEC433F5
	for <linux-clk@archiver.kernel.org>; Thu, 21 Oct 2021 09:48:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5633A6112D
	for <linux-clk@archiver.kernel.org>; Thu, 21 Oct 2021 09:48:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231573AbhJUJum (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 21 Oct 2021 05:50:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231334AbhJUJuj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 21 Oct 2021 05:50:39 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5464BC061749
        for <linux-clk@vger.kernel.org>; Thu, 21 Oct 2021 02:48:23 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id g141so35489wmg.4
        for <linux-clk@vger.kernel.org>; Thu, 21 Oct 2021 02:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=KAOz4kXN9mWTjZB/mTCGCbE9wR3JOwDHn4LKqlAjsGg=;
        b=S2466tA3CQtN+pUAVimd6LOFWdFTGJ3GPbMv8mnP9rQtMizbQzr+wCAePtlaCV4MQm
         VrkW65SP89irtPN+Zx5acf0haeVkrOVqr0IoN+q6BF7qxXvT8Cu239qkgRkvvdKjVtbK
         UV1GRoDKTI6j4hZrYAkSo8FsmORsqYcRFICi5MQEMe/Wtu78IK5SriBW4xbq8X+h0Bpv
         lp9W/opfTu/VXkwv0+JTTU6J72hdGvxdVynVnKOKj0KNBDo+e/s6sXv+gtFXnLKTJM7a
         Q/QQaSc/H+CV5I6IS7X70hGUs+VJiRBTgqrK21QoznzDFAYQ9SduqRwmDRglh01mkxnA
         DVPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=KAOz4kXN9mWTjZB/mTCGCbE9wR3JOwDHn4LKqlAjsGg=;
        b=h4hwCftnNQ/g47kXo6MFk8kN/8clGiu1YTaj5N2tapWzx+tS5VkE63Wn32gE65WY0y
         xni8ev0jGwvH8Ci81Il7686tq0Q6AuyXEv3oWZVbQJHxK8Amr44zLW19pK1mUgpxOTJ/
         K8kILDpBnSsgbsAwDGq330ejP5+DCGQtYV1silD55ZWx7vQEEKQKIIXyCY2TALwTRAae
         erTGfhIgOuiCN7ZLWltKpEBEgOnSMhOAt2nYV5ZMzOnq6v6QA9QoxBnp9Iv0NUzPRqmM
         9/glltkIvdgbAzTY2QwwUvDwNfBpBTT5qNmMhjnB0OzEfZoMcw1KMVxTVWEKyC3/l2Ml
         rZ2w==
X-Gm-Message-State: AOAM531UV0Dw6n/mTiSu+yeZcw0wShf47nlQsIWJc3y49ZN/ahlPiebs
        TlhU78L8iWQxSc0I/AhnT3FMVw==
X-Google-Smtp-Source: ABdhPJzgtRk+rRQDY4Iw7KGCukFgiSX5iGeK/aZ3GeiLbCZxpTLmbrIEBb3aJLotjw/I3rncdMSsVQ==
X-Received: by 2002:a7b:c0d6:: with SMTP id s22mr5389020wmh.135.1634809701955;
        Thu, 21 Oct 2021 02:48:21 -0700 (PDT)
Received: from google.com ([95.148.6.207])
        by smtp.gmail.com with ESMTPSA id b9sm318641wrp.77.2021.10.21.02.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Oct 2021 02:48:21 -0700 (PDT)
Date:   Thu, 21 Oct 2021 10:48:19 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 10/10] dt-bindings: mfd: samsung,s5m8767: document
 buck and LDO supplies
Message-ID: <YXE3Y68U7Kk1n9Qw@google.com>
References: <20211008113723.134648-1-krzysztof.kozlowski@canonical.com>
 <20211008114024.135335-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211008114024.135335-1-krzysztof.kozlowski@canonical.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, 08 Oct 2021, Krzysztof Kozlowski wrote:

> Document the properties with regulator supplies for bucks and LDOs.  At
> least one board uses it (Exynos5250 Arndale).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  .../bindings/mfd/samsung,s5m8767.yaml         | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
