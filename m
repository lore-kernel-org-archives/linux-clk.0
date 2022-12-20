Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30093C4167B
	for <linux-clk@archiver.kernel.org>; Tue, 20 Dec 2022 20:02:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233892AbiLTUB5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 20 Dec 2022 15:01:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232195AbiLTUB4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 20 Dec 2022 15:01:56 -0500
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4BE91AA3F;
        Tue, 20 Dec 2022 12:01:53 -0800 (PST)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-14449b7814bso16762620fac.3;
        Tue, 20 Dec 2022 12:01:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XD55XyA+UeGl0x1txDw04g7E8lf7pFWIOBaB2ROk0Mk=;
        b=WE2MiXk8UNCWd9iqPQq2ijZnMnH4DhOaIrBmO1/S8k5NqFSvhIrOGg+yDdYDDMu5lL
         a6pJbe/LSIaNpiO/u3aPTAYLSYa3tm0i4BPkR6l2eDh6c3pP8r//GYjnNAwyugI6vCQU
         Ua8WnE35a2ojc0hXtpw+v4OgGXIJuCO2uwtL5ci+JryptUB1qUnCrOF/XWrp4Rt+urim
         WeO1yThmG9INeFfjqdJiSNd9Yx5aqznm7h6T4Y59+SKqRb8rhw8TdvGkIsPrCWmU1pN5
         mLMQL2gSJiyrSAZg4VNV9WSe7ydzw2NZIZ47y0+rdyGb0Gt1RmE0E6pwr9N5v0q8T60Q
         ORAg==
X-Gm-Message-State: AFqh2kpim+zPaN5NO0LUetXbLlYc9KYsEv0TzHLo6GZ1exc0WsONPqYS
        rZpHs30qmqEaeIEhZ0EHQFqaelhZwg==
X-Google-Smtp-Source: AMrXdXuG/hfBvY1BIoKYZJjYitZjhW0WF1f7siHccRou8Yx+f0u8pDK0BGhqq69VNRSkB085zCtsMA==
X-Received: by 2002:a05:6870:2888:b0:137:3ad9:bf0a with SMTP id gy8-20020a056870288800b001373ad9bf0amr5968171oab.20.1671566512847;
        Tue, 20 Dec 2022 12:01:52 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id z36-20020a056870d6a400b0013669485016sm6379637oap.37.2022.12.20.12.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Dec 2022 12:01:51 -0800 (PST)
Received: (nullmailer pid 991718 invoked by uid 1000);
        Tue, 20 Dec 2022 20:01:50 -0000
Date:   Tue, 20 Dec 2022 14:01:50 -0600
From:   Rob Herring <robh@kernel.org>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
        festevam@gmail.com, sboyd@kernel.org, abelvesa@kernel.org,
        Anson.Huang@nxp.com, kernel@pengutronix.de,
        mturquette@baylibre.com, linux-arm-kernel@lists.infradead.org,
        shawnguo@kernel.org, robh+dt@kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: clocks: imx8mp: make sai4 a dummy clock
Message-ID: <167156651020.991660.2392640619605024450.robh@kernel.org>
References: <20221219171058.164381-1-m.felsch@pengutronix.de>
 <20221219171058.164381-2-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221219171058.164381-2-m.felsch@pengutronix.de>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Mon, 19 Dec 2022 18:10:58 +0100, Marco Felsch wrote:
> The hardware don't have a SAI4 instance so remove the define. Use a
> comment to keep it as reference and to avoid confusion.
> 
> Fixes: 108869144739 ("dt-bindings: imx: Add clock binding doc for i.MX8MP")
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
>  include/dt-bindings/clock/imx8mp-clock.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
