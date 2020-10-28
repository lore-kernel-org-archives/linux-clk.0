Return-Path: <SRS0=XeJu=EE=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BE0EC388F7
	for <linux-clk@archiver.kernel.org>; Thu, 29 Oct 2020 00:31:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EB6812080D
	for <linux-clk@archiver.kernel.org>; Thu, 29 Oct 2020 00:31:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="onAmLV9j"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387979AbgJ2Ab0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 28 Oct 2020 20:31:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387934AbgJ1Wbh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 28 Oct 2020 18:31:37 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8757C0613D2
        for <linux-clk@vger.kernel.org>; Wed, 28 Oct 2020 15:31:37 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id t22so327455plr.9
        for <linux-clk@vger.kernel.org>; Wed, 28 Oct 2020 15:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=gyZXe4UlIiJyEgA29yuKS3oeW8M7zKVy8IBiRsmYAmc=;
        b=onAmLV9juNbP7wo91heam4H8gAMYtfy0venQZrmZZMNDJ8HiSHuuZ+CS/6A/yrwoSy
         ZZNOgWqUW4BH3NZGYK6+7vUXkGUv/DTH/Bfzi6Ln8fRJBp8+Cyb29Ra3Jy4YdefTcDo/
         zGGjvWhGYKGbs1ClJV+Ye7VjWBEJ3XORqgnVA4dlgEbukbSJ7Bcx9oRwo+L6XeApeMcx
         FdZha+HtwNipI11KsEjqoYfnLUDq5xnY3NObfd4sQySAytfwzKMntQM/bYaoqkpDl/Z5
         UzZfGapIufvzWiB4QEkzOuPpfvs+I8KiQ4YFpJ73sM1046oIlPRkgLy7DXNTV7u7ufqC
         jxJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=gyZXe4UlIiJyEgA29yuKS3oeW8M7zKVy8IBiRsmYAmc=;
        b=gCcica2qIxA1pe4ZZFNcpfuPaEjOyzJn/70oFRtL73eeUW42vrzE25fhKhdypJ9nBP
         ekWNmXVHUPjAfdKntFJUZx5boHh+6Jgq4/lJw8pJxOU5N8+TTO6nLeEXJnAwtoP4CL3T
         anFj9snaFS5wOgwL4IhJA6J9tOJmkdctp4UWz3ECYE+UxMF2NgXX6QKuMbo/yYarMqTD
         9LdBTPwdvma80WuM02M0piXhilHWg4wqFcUqqi3dZflpMRWZp5vaZwUWhqno882BYAoH
         Y9WSlr2IMEydKGGZzrRluZxZKHLRZUqQlzee6IJ1cAmum0+u3s54xKKszlPLz0WzzVA0
         lXwQ==
X-Gm-Message-State: AOAM531y4DsoFOaws/ZLaAWwVDQiJSDae0ahAbxjv8ZYYcAyHCdHUSHz
        YGE4/KUN3MaQjpm9QVzw/HM/ncPtLkxI
X-Google-Smtp-Source: ABdhPJy4wp8FcMTLG82s6NTTpGozSLiiRiD9djXMWJMN+OzFd+L2lYlZ4UuNtdVzO4TBLhilRIP1pA==
X-Received: by 2002:a62:be04:0:b029:15d:7423:e320 with SMTP id l4-20020a62be040000b029015d7423e320mr8247134pff.42.1603904943114;
        Wed, 28 Oct 2020 10:09:03 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6e05:4ccd:292c:2726:5b8f:786d])
        by smtp.gmail.com with ESMTPSA id h13sm187608pfk.23.2020.10.28.10.08.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Oct 2020 10:09:02 -0700 (PDT)
Date:   Wed, 28 Oct 2020 22:38:53 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     bjorn.andersson@linaro.org
Cc:     sboyd@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org,
        vkoul@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] Add GCC and RPMh clock support for SDX55
Message-ID: <20201028170853.GA3191@Mani-XPS-13-9360>
References: <20201028074232.22922-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201028074232.22922-1-manivannan.sadhasivam@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Oct 28, 2020 at 01:12:28PM +0530, Manivannan Sadhasivam wrote:
> Hello,
> 
> This series adds Global Clock Controller (GCC) and RPMh clock support
> for SDX55 SoC from Qualcomm with relevant DT bindings.
> 
> This series has been tested on SDX55 MTP board. The dts patches for this
> SoC/board will be posted later.
> 
> Thanks,
> Mani
> 
> Manivannan Sadhasivam (1):
>   clk: qcom: Add support for SDX55 RPMh clocks
> 
> Naveen Yadav (1):
>   clk: qcom: Add SDX55 GCC support

Bjorn, I've inherited the gcc driver from downstream and did some modification.
But I'm not sure if I can take the authorship of this patch hence kept it to the
downstream author.

In my point of view, the downstream author wrote the driver so I should keep
the copyright and even list them as MODULE_AUTHOR. But I don't think I should
give the patch authorship to them because I haven't received the patch anyhow.
I usually keep the authorship if I take the patch from a source like LKML and
repost it. But in this case, I authored the patch using someone's code!

What is your view on this?

Thanks,
Mani

> 
> Vinod Koul (2):
>   dt-bindings: clock: Add SDX55 GCC clock bindings
>   dt-bindings: clock: Introduce RPMHCC bindings for SDX55
> 
>  .../bindings/clock/qcom,gcc-sdx55.yaml        |   71 +
>  .../bindings/clock/qcom,rpmhcc.yaml           |    1 +
>  drivers/clk/qcom/Kconfig                      |    8 +
>  drivers/clk/qcom/Makefile                     |    1 +
>  drivers/clk/qcom/clk-rpmh.c                   |   20 +
>  drivers/clk/qcom/gcc-sdx55.c                  | 1667 +++++++++++++++++
>  include/dt-bindings/clock/qcom,gcc-sdx55.h    |  112 ++
>  include/dt-bindings/clock/qcom,rpmh.h         |    1 +
>  8 files changed, 1881 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-sdx55.yaml
>  create mode 100644 drivers/clk/qcom/gcc-sdx55.c
>  create mode 100644 include/dt-bindings/clock/qcom,gcc-sdx55.h
> 
> -- 
> 2.17.1
> 
