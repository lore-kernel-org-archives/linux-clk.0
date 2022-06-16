Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E1B9C433EF
	for <linux-clk@archiver.kernel.org>; Thu, 16 Jun 2022 17:48:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235499AbiFPRsu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 16 Jun 2022 13:48:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229592AbiFPRst (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 16 Jun 2022 13:48:49 -0400
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 786C94CD57;
        Thu, 16 Jun 2022 10:48:48 -0700 (PDT)
Received: by mail-io1-f42.google.com with SMTP id h8so2206937iof.11;
        Thu, 16 Jun 2022 10:48:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZGfyDUZ51H0L6jBKN7/RqQt3gQLeatTRqTVJbJgQXuo=;
        b=fPB7qQclNDL2yLkXUdrzX7tI/Sw20IXOzjP6l0HmC9XgEKtkZ8F0MYw4fmdXzqqGJv
         wlYlYKox0lU1RNbQp5CzmlGoyZ2TKJ4o5N2os518Qy1iI9CfbGLs+Ve4Gbey/Imv4w1/
         gheTG8zHMwK02el5wwzFE8+RcO2TabAUUNJMbPqpBsaQ4mUoQQ1mcyr6BfVZZBdIpsng
         PzbfXmZ+pMnkDDsUeGQuSQ/xBddlD4Ur6WATQ4xy09NXqGifVTfI8gYdlkkXZQD0Zc48
         XueAfVd1jSxtLOszHAiEX5OHy/4j9G39LzPfmevEd+rwFNzVrMuY1lHr6EjhudCIo57j
         CQWA==
X-Gm-Message-State: AJIora/AWLtdc+odEP4ZEATdDw8/LEgpw3eUPITOijPdtOuQ7EZBwU9t
        3MTguMbLvgB42ubg7+S4/mhG12EdJQ==
X-Google-Smtp-Source: AGRyM1t6iiuL0t37j5/IcYANnN3gbXj+i/OLVTy/7BPlBK+Kg0aP8+ztPZZ+4fMRaR4G2sN2CLgwsg==
X-Received: by 2002:a05:6638:3f16:b0:331:6f62:f903 with SMTP id ck22-20020a0566383f1600b003316f62f903mr3399109jab.123.1655401727727;
        Thu, 16 Jun 2022 10:48:47 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id a3-20020a924443000000b002d3b759dc7fsm1228571ilm.77.2022.06.16.10.48.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jun 2022 10:48:47 -0700 (PDT)
Received: (nullmailer pid 3711502 invoked by uid 1000);
        Thu, 16 Jun 2022 17:48:46 -0000
Date:   Thu, 16 Jun 2022 11:48:46 -0600
From:   Rob Herring <robh@kernel.org>
To:     Doug Brown <doug@schmorgal.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH 03/12] dt-bindings: marvell,pxa168: add clock ids for
 additional dividers
Message-ID: <20220616174846.GA3711396-robh@kernel.org>
References: <20220612192937.162952-1-doug@schmorgal.com>
 <20220612192937.162952-4-doug@schmorgal.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220612192937.162952-4-doug@schmorgal.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sun, 12 Jun 2022 12:29:28 -0700, Doug Brown wrote:
> This adds a few new clocks divided from PLL1 and CLK32 that are
> potentially used by a few peripherals with muxed clocks.
> 
> Signed-off-by: Doug Brown <doug@schmorgal.com>
> ---
>  include/dt-bindings/clock/marvell,pxa168.h | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
