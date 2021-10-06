Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB6D4C433F5
	for <linux-clk@archiver.kernel.org>; Wed,  6 Oct 2021 08:01:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8EB9B61077
	for <linux-clk@archiver.kernel.org>; Wed,  6 Oct 2021 08:01:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237615AbhJFID3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 6 Oct 2021 04:03:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237686AbhJFICe (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 6 Oct 2021 04:02:34 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E481C061755
        for <linux-clk@vger.kernel.org>; Wed,  6 Oct 2021 01:00:40 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id k7so5955003wrd.13
        for <linux-clk@vger.kernel.org>; Wed, 06 Oct 2021 01:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=DgBhWLICPv7pMhjFtnPurEZqoS+TS0nmbrNFYc6tYO8=;
        b=opVJgEVsqMMtrebK6OYEi00O4gbEAqVqoNwUJlc3zGQ1v4VscpU2OH+YJcAO5apMmS
         dQiAJZqOGZcz1guEG9BxmS23pxhXi429RTDKy8+iQmlQtxCdQEQ2473IwmDGDaOkPDdR
         hbijKdUQrRDcYD46BK5Ks0nOaOCosDjLs8lkNkbRINjSTTC+FK5hlln9aMM+LW5l8CvF
         enwkBwCqtIXTDrHbGw49v+GebNGxzXNQdGnRd1us+TIoT3TSyPhhfdhNmiQu6KTVLw76
         OmXO0chwBq4GRbhSN23DDfoXM5LMCaVaGPGeV4Q7rWHBQiDLl3H4QhhdZGYT8vQIDpnS
         tloA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=DgBhWLICPv7pMhjFtnPurEZqoS+TS0nmbrNFYc6tYO8=;
        b=yW9vNOP/M6MULne4cAYsqHdpF7RSWbejJ1xcg7cD72Ip4LGiDAHO7NdnidNyMsuKAf
         IIieIxABwKr/hp7orGVf0jbpBNnSX++sitKAmSACuRMSPeqP7y8njM4plt+siUY7JQj9
         Er9VL/3iaVYQaSBSKAyWIPlGR/HBGSYi0DwZ3EIB9z+xvrxmnLTZWJZutd6M2rFqsPT7
         CtpBYo7y1VkI3F1zEbXDE7Bze00wwa7bN3ayh0tSFKGeETZBzusQ4ix+6w81cvvo1SCG
         tyuJRProphImeGDS/JVWN5p5b03FTN0uVxNMPfZ4H4g7fxpkj5inmxp/HvSREkeWZAjO
         lfZQ==
X-Gm-Message-State: AOAM5304S9oBb5Q3Lr4aFmkZtzrWnxZUCzEene350b383eLoq5OxApDT
        7unEmYVPJiGTIxn5pjkCoo6Chg==
X-Google-Smtp-Source: ABdhPJxEuBQoPN9bsXR6MdCXoIERK92y9INjOmodZ+EhamGEhX0mQRx/MN6GHqngkDN8iA76J7ADwg==
X-Received: by 2002:a5d:500f:: with SMTP id e15mr12227550wrt.90.1633507239224;
        Wed, 06 Oct 2021 01:00:39 -0700 (PDT)
Received: from google.com ([95.148.6.175])
        by smtp.gmail.com with ESMTPSA id w11sm1125405wmc.44.2021.10.06.01.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Oct 2021 01:00:38 -0700 (PDT)
Date:   Wed, 6 Oct 2021 09:00:36 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Chunyan Zhang <zhang.lyra@gmail.com>
Cc:     Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Baolin Wang <baolin.wang7@gmail.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Chunyan Zhang <chunyan.zhang@unisoc.com>,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 2/4] dt-bindings: mfd: sprd: Add bindings for ums512
 global registers
Message-ID: <YV1XpL7ibF1y4LbV@google.com>
References: <20210923064137.60722-1-zhang.lyra@gmail.com>
 <20210923064137.60722-3-zhang.lyra@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210923064137.60722-3-zhang.lyra@gmail.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 23 Sep 2021, Chunyan Zhang wrote:

> From: Chunyan Zhang <chunyan.zhang@unisoc.com>
> 
> Add bindings for Unisoc system global register which provide register map
> for clocks.
> 
> Signed-off-by: Chunyan Zhang <chunyan.zhang@unisoc.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  .../bindings/mfd/sprd,ums512-glbreg.yaml      | 68 +++++++++++++++++++
>  1 file changed, 68 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/sprd,ums512-glbreg.yaml

Unapplied v3 and applied this (v4) instead, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
