Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE72AC433F5
	for <linux-clk@archiver.kernel.org>; Wed,  6 Oct 2021 07:59:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A0AC661077
	for <linux-clk@archiver.kernel.org>; Wed,  6 Oct 2021 07:59:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231465AbhJFIBK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 6 Oct 2021 04:01:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237528AbhJFIBJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 6 Oct 2021 04:01:09 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCCEDC061749
        for <linux-clk@vger.kernel.org>; Wed,  6 Oct 2021 00:59:17 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id t8so6124979wri.1
        for <linux-clk@vger.kernel.org>; Wed, 06 Oct 2021 00:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=VR42jplXEyWwm4Rbes/BlNj+3w2C+/LaKWXYtyT3Dn8=;
        b=jtR/VmB0T7MABmHHGyhlgvapP7iuUL5TYPO236XrLm540txRoHhsKCmduBgHZDLT8D
         glIkOZLiCE5xfENk7EVa1+pxqIiDJyaSbBj0cyegwTww1heWSe70ujCenPY5FiYAQUAH
         uSfzm6U/lVtglgFT0XMcxLPMZ+JaQCbtha1Ot4AwP56vkHgugCgWYgGINVpcFKlacTOk
         7/Mhrk15auAttizfk25K5AEZAev4ia2vz5n9Ad/xjUmWKN9zfRZDS/HMif/JcvlQjsix
         v2fbcOnKTPZdl6C+HjF4FEYq3wtnbh3GluC4Z3XxIf3xXfGeM+/RKHOikK9mHhUIxzvQ
         b3Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=VR42jplXEyWwm4Rbes/BlNj+3w2C+/LaKWXYtyT3Dn8=;
        b=Rv0qodbaNRBOSiAZMxDAAVGdA4TofW1SP28GunSF9yjt/07nvnnjD7VnT2yVGFkMCT
         BNqAbNhUfHrbGk9FY/fHoq1uxwEJ7owVSmSaXPRAn3WwVfORFsHpZ6kA+SqZAybj/Hpb
         D3UPZJnoF5Np/ooFdHn+hvVDPuxxmiwjs9PGgCKjYCMJd46kzgmvOYr61hnNKWkdyYVq
         sUH2MrKsxj6MA+reP7wjk6ULq5MgD5N9ISYuQCFlp3SLZ2u0G4GzIIBNMimHslSK+XvA
         Q6s/8Z/r+D7VNDKqpU6P5SzqdjFP3y4799/6gR4/fWHzn80pEOKHCb226au7zWMcHfgw
         3dIg==
X-Gm-Message-State: AOAM5318lwvHVGe5+C8UjF/Tw/1cPDqBk2TAEIBMt/kLyz+pCSSYV6B8
        /SeYTNWXkJGSptsF1Y3EwkFvEQ==
X-Google-Smtp-Source: ABdhPJwJj4g5XhITxOkW3toOBNYAmREUTrS1TEAQPSRfl1T7PTS8gIUw5QHVwCWyp+rk27NtSZ9yzw==
X-Received: by 2002:adf:f302:: with SMTP id i2mr16902802wro.18.1633507156414;
        Wed, 06 Oct 2021 00:59:16 -0700 (PDT)
Received: from google.com ([95.148.6.175])
        by smtp.gmail.com with ESMTPSA id k9sm19663548wrz.22.2021.10.06.00.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Oct 2021 00:59:15 -0700 (PDT)
Date:   Wed, 6 Oct 2021 08:59:14 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Chunyan Zhang <zhang.lyra@gmail.com>
Cc:     Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Baolin Wang <baolin.wang7@gmail.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Chunyan Zhang <chunyan.zhang@unisoc.com>,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 2/4] dt-bindings: mfd: sprd: Add bindings for ums512
 global registers
Message-ID: <YV1XUnz9t1pFMb1S@google.com>
References: <20210918045114.387005-1-zhang.lyra@gmail.com>
 <20210918045114.387005-3-zhang.lyra@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210918045114.387005-3-zhang.lyra@gmail.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sat, 18 Sep 2021, Chunyan Zhang wrote:

> From: Chunyan Zhang <chunyan.zhang@unisoc.com>
> 
> Add bindings for Unisoc system global register which provide register map
> for clocks.
> 
> Signed-off-by: Chunyan Zhang <chunyan.zhang@unisoc.com>
> ---
>  .../bindings/mfd/sprd,ums512-glbreg.yaml      | 68 +++++++++++++++++++
>  1 file changed, 68 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/sprd,ums512-glbreg.yaml

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
