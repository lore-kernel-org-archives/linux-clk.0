Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8273C433E0
	for <linux-clk@archiver.kernel.org>; Tue, 26 Jan 2021 19:44:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7BD20221FC
	for <linux-clk@archiver.kernel.org>; Tue, 26 Jan 2021 19:44:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729479AbhAZFfu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 26 Jan 2021 00:35:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727000AbhAYJkW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 25 Jan 2021 04:40:22 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94D02C06121D
        for <linux-clk@vger.kernel.org>; Mon, 25 Jan 2021 00:47:42 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id g10so11373576wrx.1
        for <linux-clk@vger.kernel.org>; Mon, 25 Jan 2021 00:47:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=L7zRLOa9/A/iQHZsxRUBd/9JtCVTjujkb4lDAg3Vr/k=;
        b=j8lsVt/e7FhY4i8Y9QQP5WgESMMeZIAWgIRZOLbW5E07ES6H7jUpfiUfE7QeFdOHa0
         ItxEt6o9YKKMy3BhwIB0kW5uFBrz/fttbgTjb5/bYkaxbsKPoXZYv85PowEdLtmYOJXO
         i/PT6SeXKYMF+Xf1vaPSeJvXcG1SyerAO2+sjQwoqfcw+B57A9ZPTvFxr+yfdII4Q3JH
         LPvpoiB8VArMarTPiLhj5CQ52Af3IVk9MO8X3HRDqdYdCu/sKjayNFtGTFQ5szcsHlk9
         UTauyFktDFvfyhx70AZGyAt8Je7Pu3nB5ZjYaZz4WomeXp7iBUH3uUNY3A/ZYZAC1n1O
         TQiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=L7zRLOa9/A/iQHZsxRUBd/9JtCVTjujkb4lDAg3Vr/k=;
        b=mVFG4PSVMlm9bcAXTetoQobouaKaC0w7zM6pVAAHW6CUUWKgCR1cCYRBwRiSaW00ms
         bOCm8R2W4F78JADuSjlrivOpzg6fXmhAvGptvpQM18LzJLPITprWeC6zAMQiRLyJHCny
         088R5njRtUmyUp6UM7eTEiaeYB893kBo6C18xXR2RZzV+njIrR6ltu/ASxlPgT2c4CfC
         aakr6nRsrI90C5/HsozMpINRneHZnHmkdFUgZYKSa7aSyRbQ6j2qdRDM7ZbxhyL1AedM
         WB6mcKGvAVCdioArLxrVwvQw1itenq6wslO3Am5wfV7leXG/rfhAn8g3MBaH/q+DfMKu
         NECg==
X-Gm-Message-State: AOAM533SJZ/4/i3t2zFEzyQvbZV7BfonQ3EFckZFCkEt90w52sgp0Xv4
        PzFiablvwCb5I2Ub7IbiP2qRYg==
X-Google-Smtp-Source: ABdhPJwvAT5QrVlgVRVXIetqyDdGS4/PFt4ktrvS4hgcS34u7NUByd/Pzsn94Nh20vlcxbXW4hhjMA==
X-Received: by 2002:adf:f009:: with SMTP id j9mr1074570wro.35.1611564461410;
        Mon, 25 Jan 2021 00:47:41 -0800 (PST)
Received: from dell ([91.110.221.194])
        by smtp.gmail.com with ESMTPSA id i6sm13827473wrs.71.2021.01.25.00.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 00:47:40 -0800 (PST)
Date:   Mon, 25 Jan 2021 08:47:39 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Palmer Dabbelt <palmer@dabbelt.com>
Cc:     linux-kernel@vger.kernel.org, mturquette@baylibre.com,
        sboyd@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
        Pragnesh.patel@sifive.com, zong.li@sifive.com,
        linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 06/20] clk: sifive: fu540-prci: Declare static const
 variable 'prci_clk_fu540' where it's used
Message-ID: <20210125084739.GW4903@dell>
References: <20210120093040.1719407-7-lee.jones@linaro.org>
 <mhng-d13d3ca6-2ec1-4c56-a4a8-56faafe5569c@palmerdabbelt-glaptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <mhng-d13d3ca6-2ec1-4c56-a4a8-56faafe5569c@palmerdabbelt-glaptop>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, 22 Jan 2021, Palmer Dabbelt wrote:

> On Wed, 20 Jan 2021 01:30:26 PST (-0800), lee.jones@linaro.org wrote:
> > Fixes the following W=1 kernel build warning(s):
> > 
> >  drivers/clk/sifive/fu540-prci.h:16:35: warning: ‘prci_clk_fu540’ defined but not used [-Wunused-const-variable=]
> >  drivers/clk/sifive/fu540-prci.h:16:35: warning: ‘prci_clk_fu540’ defined but not used [-Wunused-const-variable=]
> > 
> > Cc: Michael Turquette <mturquette@baylibre.com>
> > Cc: Stephen Boyd <sboyd@kernel.org>
> > Cc: Paul Walmsley <paul.walmsley@sifive.com>
> > Cc: Palmer Dabbelt <palmer@dabbelt.com>
> > Cc: Pragnesh Patel <Pragnesh.patel@sifive.com>
> > Cc: Zong Li <zong.li@sifive.com>
> > Cc: linux-clk@vger.kernel.org
> > Cc: linux-riscv@lists.infradead.org
> > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> > ---
> >  drivers/clk/sifive/fu540-prci.h  | 5 -----
> >  drivers/clk/sifive/sifive-prci.c | 5 +++++
> >  2 files changed, 5 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/clk/sifive/fu540-prci.h b/drivers/clk/sifive/fu540-prci.h
> > index c8271efa7bdc7..c220677dc0108 100644
> > --- a/drivers/clk/sifive/fu540-prci.h
> > +++ b/drivers/clk/sifive/fu540-prci.h
> > @@ -13,9 +13,4 @@
> > 
> >  extern struct __prci_clock __prci_init_clocks_fu540[NUM_CLOCK_FU540];
> > 
> > -static const struct prci_clk_desc prci_clk_fu540 = {
> > -	.clks = __prci_init_clocks_fu540,
> > -	.num_clks = ARRAY_SIZE(__prci_init_clocks_fu540),
> > -};
> > -
> >  #endif /* __SIFIVE_CLK_FU540_PRCI_H */
> > diff --git a/drivers/clk/sifive/sifive-prci.c b/drivers/clk/sifive/sifive-prci.c
> > index c78b042750e21..1490b01ce6290 100644
> > --- a/drivers/clk/sifive/sifive-prci.c
> > +++ b/drivers/clk/sifive/sifive-prci.c
> > @@ -12,6 +12,11 @@
> >  #include "fu540-prci.h"
> >  #include "fu740-prci.h"
> > 
> > +static const struct prci_clk_desc prci_clk_fu540 = {
> > +	.clks = __prci_init_clocks_fu540,
> > +	.num_clks = ARRAY_SIZE(__prci_init_clocks_fu540),
> > +};
> > +
> >  /*
> >   * Private functions
> >   */
> 
> This doesn't look like my sifive-prci.c, so I'm assuming it's against one of
> the clock trees and therefor should go in over there.

This patch is applied against -next.

> Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>

Thanks Palmer.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
