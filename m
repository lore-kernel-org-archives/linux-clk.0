Return-Path: <SRS0=ECv2=VT=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F3CBC76188
	for <linux-clk@archiver.kernel.org>; Mon, 22 Jul 2019 06:21:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 01E5E21BE6
	for <linux-clk@archiver.kernel.org>; Mon, 22 Jul 2019 06:21:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J3TUjk9X"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727558AbfGVGVG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 22 Jul 2019 02:21:06 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:42768 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726339AbfGVGVG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 22 Jul 2019 02:21:06 -0400
Received: by mail-pl1-f194.google.com with SMTP id ay6so18723812plb.9
        for <linux-clk@vger.kernel.org>; Sun, 21 Jul 2019 23:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=em1xDbBG2V868fnaJ310Xoyx4Wy4FPOvg/qDb7nS9HE=;
        b=J3TUjk9XltjIzYh10bMRGW13tchJ4DbhtCiQjCOGMrq6A29PXJCg6Zo8DWFqk6S1hu
         TfSyYjB8QrgN9eSlN9czUZlJfOZh9LXs8hClja8N3oX3Ys+3LRbZR+Tit2cfySWe+Vcw
         kJFJJkDHMjbc5hpyToknouy/tPw75+1J2S553IqdWei6JYqo7nEbh8tP5R+DlAw/qt8I
         qeI6yFSjLrfI6EEoRtvAwJW5xzJ9XeAd1Ri5NZmgvQBy0onENztmxYxVQmShh/MppR1R
         QpBFafxhot15/SjuuyfpCeu5IT5dGFDGW+FzOK9DIFx44tR+V3sfEAh+e2cmHuHeMIJ4
         I+aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=em1xDbBG2V868fnaJ310Xoyx4Wy4FPOvg/qDb7nS9HE=;
        b=M+g7vhjrZO1vAnsrbM94a3nraGgZv+3GTdICRHrbcsogb31r/F6kdH3ybGp7cqPCvd
         xzrM8rjzQp1ZrcweKCijrXhClPUO9oPlUSfPPDGcP0aXDQfrWym2eXVGbTZRORzQ+wR7
         2UgKywthyb0se78rKwOdSvJ2iA5FZgu6MifwPgDDL43U+L0EBYKK24pW0N1KQRs8t3nR
         rpttihrxC+VZLqoX5Mgg12wyoXNHhvQsPSmO6YF9r4WvgpY4jr0dE2ksLAB4+dFHMD6l
         xl3i+Kf7Lb8kDj61ae1P2GGH7tOl43NK0RvYxkwO90fW4/24GxLQekNFwDJQHDed8Yvf
         2pyA==
X-Gm-Message-State: APjAAAWPZqXJbWLNXcTlZhAe7pWHqHfYjTNdZmQW0BvFvg2VKKbI0jYN
        fdZXBIRKAgJZF9flGzruTSt2
X-Google-Smtp-Source: APXvYqx/P8ROIwjOfYJZUiLmueKG0CpXvl26zSTX4l6j88jxpCjb5sbY+HThfXwbPZMTrfHsVPhHNQ==
X-Received: by 2002:a17:902:2983:: with SMTP id h3mr74032905plb.45.1563776465833;
        Sun, 21 Jul 2019 23:21:05 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2405:204:72cd:b527:a1c8:8495:bea7:a059])
        by smtp.gmail.com with ESMTPSA id g92sm45161537pje.11.2019.07.21.23.20.58
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 21 Jul 2019 23:21:04 -0700 (PDT)
Date:   Mon, 22 Jul 2019 11:50:56 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     sboyd@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        haitao.suo@bitmain.com, darren.tsao@bitmain.com,
        fisher.cheng@bitmain.com, alec.lin@bitmain.com
Subject: Re: [PATCH 0/5] Add Bitmain BM1880 clock driver
Message-ID: <20190722062056.GA3715@Mani-XPS-13-9360>
References: <20190705151440.20844-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190705151440.20844-1-manivannan.sadhasivam@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Jul 05, 2019 at 08:44:35PM +0530, Manivannan Sadhasivam wrote:
> Hello,
> 
> This patchset adds common clock driver for Bitmain BM1880 SoC clock
> controller. The clock controller consists of gate, divider, mux
> and pll clocks with different compositions. Hence, the driver uses
> composite clock structure in place where multiple clocking units are
> combined together.
> 
> This patchset also removes UART fixed clock and sources clocks from clock
> controller for Sophon Edge board where the driver has been validated.
> 

Ping on this series.

Thanks,
Mani

> Thanks,
> Mani
> 
> Manivannan Sadhasivam (5):
>   dt-bindings: clock: Add Bitmain BM1880 SoC clock controller binding
>   arm64: dts: bitmain: Add clock controller support for BM1880 SoC
>   arm64: dts: bitmain: Source common clock for UART controllers
>   clk: Add driver for Bitmain BM1880 SoC clock controller
>   MAINTAINERS: Add entry for Bitmain BM1880 SoC clock driver
> 
>  .../bindings/clock/bitmain,bm1880-clk.txt     |  47 +
>  MAINTAINERS                                   |   2 +
>  .../boot/dts/bitmain/bm1880-sophon-edge.dts   |   9 -
>  arch/arm64/boot/dts/bitmain/bm1880.dtsi       |  27 +
>  drivers/clk/Kconfig                           |   6 +
>  drivers/clk/Makefile                          |   1 +
>  drivers/clk/clk-bm1880.c                      | 947 ++++++++++++++++++
>  include/dt-bindings/clock/bm1880-clock.h      |  82 ++
>  8 files changed, 1112 insertions(+), 9 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/bitmain,bm1880-clk.txt
>  create mode 100644 drivers/clk/clk-bm1880.c
>  create mode 100644 include/dt-bindings/clock/bm1880-clock.h
> 
> -- 
> 2.17.1
> 
