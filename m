Return-Path: <SRS0=rfa6=QI=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_MUTT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3DE0C282D8
	for <linux-clk@archiver.kernel.org>; Fri,  1 Feb 2019 03:53:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 96E272184A
	for <linux-clk@archiver.kernel.org>; Fri,  1 Feb 2019 03:53:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="Hn/N2ppw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727198AbfBADx5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 31 Jan 2019 22:53:57 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:37325 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725807AbfBADxw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 31 Jan 2019 22:53:52 -0500
Received: by mail-pf1-f195.google.com with SMTP id y126so2503871pfb.4
        for <linux-clk@vger.kernel.org>; Thu, 31 Jan 2019 19:53:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=S9LasyzrQ0TxSPombwL6hgsxriPftAjP7h1Vz7GenYM=;
        b=Hn/N2ppwwQ9r0l2tXCeKWhTKGI77LrgEVTlEGUI91oBRy0wBRMGAgXSYT7wahDcvGm
         hgR4CvBnKSBrgNvKXhfHzBhwCImJhpkHmUTQkg602tKy0B75JAyRPSNFi5JQ8UJpr9yk
         QluU6cjej5yx16EQU3p5+c33afhcgtq6FUHD8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=S9LasyzrQ0TxSPombwL6hgsxriPftAjP7h1Vz7GenYM=;
        b=saYeIYzF1lWuxrmqq9Nf0dU5BTns14roctc3JFu/eTQ2deReqYKxPFGQO9ESecQdYc
         QzBQPjHrvpXijvlWdXpV2Y5BMvo+1Fg9j8cBDTXwwGDbLoMt70UzwDf1vfI7E2xiOUZ0
         +8vyIeWoiRniySXC9ZwxGppRe1sGAf+d0pQCYFKCyiPb/ldDZoDpSwKF2DyMCC6t7fbL
         FWPbW+fUNX2X1UPdKA1o3zEFffgAiQ6RXlqYYdfaN3ZgLaujGGQlK4ooA1ireHIP3eKc
         JpcBWx6jslsLZahbN2Sp9gYRcnJkeC5hnbA3MwLr3Fh0R20SW7MEhvT7PJ68zYDATA1Y
         dBwg==
X-Gm-Message-State: AHQUAuYpA03X2a3LWnZlC+lpjWo3uAeLCpCOBJVMQNX5RTDw9Fpc5luS
        JCFmdkoX4LQFIqq1yJJmF6fZ
X-Google-Smtp-Source: AHgI3IaYzFupx8Rp55r9QwMjklghWV/j0AWYVD5TpYpBPjRF1AuBWLAE4fI27w9hKUyU1gQvJrqZ3w==
X-Received: by 2002:a63:554b:: with SMTP id f11mr716292pgm.37.1548993230864;
        Thu, 31 Jan 2019 19:53:50 -0800 (PST)
Received: from Mani-XPS-13-9360 ([2405:204:72ca:1df8:3db9:68de:e3db:c028])
        by smtp.gmail.com with ESMTPSA id g26sm7448811pfh.61.2019.01.31.19.53.46
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 Jan 2019 19:53:50 -0800 (PST)
Date:   Fri, 1 Feb 2019 09:23:43 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     sboyd@kernel.org, mturquette@baylibre.com, afaerber@suse.de,
        robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-actions@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/6] Add clock support for Actions Semi S500 SoC
Message-ID: <20190201035343.GB4283@Mani-XPS-13-9360>
References: <20190115033340.25016-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190115033340.25016-1-manivannan.sadhasivam@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Stephen,

On Tue, Jan 15, 2019 at 09:03:34AM +0530, Manivannan Sadhasivam wrote:
> Hello,
> 
> This patchset adds common clock support for Actions Semi S500 SoC of
> the Owl family SoCs. This series is based on the initial work done
> by Edgar Bernardi Righi. https://patchwork.kernel.org/cover/10587527/
> 
> Since there isn't any update from him for long time, I took the liberty
> to modify his patches, address review comments and send to list for review.
> 
> This series has been tested on Allo Sparky SBC.
> 

Can you please merge the clk patches so that I can take the DT bits through
Actions sub-tree?

Thanks,
Mani

> Thanks,
> Mani
> 
> Changes in v2:
> 
> * Incorporated review comments from Stephen for driver cleanup.
> 
> Edgar Bernardi Righi (1):
>   dt-bindings: clock: Add DT bindings for Actions Semi S500 CMU
> 
> Manivannan Sadhasivam (5):
>   clk: actions: Add configurable PLL delay
>   ARM: dts: Add CMU support for Actions Semi Owl S500 SoC
>   ARM: dts: Remove fake UART clock for S500 based SBCs
>   clk: actions: Add clock driver for S500 SoC
>   MAINTAINERS: Add linux-actions mailing list for Actions Semi
> 
>  .../bindings/clock/actions,owl-cmu.txt        |   7 +-
>  MAINTAINERS                                   |   1 +
>  arch/arm/boot/dts/owl-s500-cubieboard6.dts    |   7 -
>  .../arm/boot/dts/owl-s500-guitar-bb-rev-b.dts |   7 -
>  arch/arm/boot/dts/owl-s500-sparky.dts         |   7 -
>  arch/arm/boot/dts/owl-s500.dtsi               |  22 +
>  drivers/clk/actions/Kconfig                   |   5 +
>  drivers/clk/actions/Makefile                  |   1 +
>  drivers/clk/actions/owl-pll.c                 |   2 +-
>  drivers/clk/actions/owl-pll.h                 |  30 +-
>  drivers/clk/actions/owl-s500.c                | 525 ++++++++++++++++++
>  include/dt-bindings/clock/actions,s500-cmu.h  |  78 +++
>  12 files changed, 661 insertions(+), 31 deletions(-)
>  create mode 100644 drivers/clk/actions/owl-s500.c
>  create mode 100644 include/dt-bindings/clock/actions,s500-cmu.h
> 
> -- 
> 2.17.1
> 
