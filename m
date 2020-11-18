Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C075BC6369E
	for <linux-clk@archiver.kernel.org>; Wed, 18 Nov 2020 14:44:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 61C922151B
	for <linux-clk@archiver.kernel.org>; Wed, 18 Nov 2020 14:44:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TqMS4Bip"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726686AbgKROoL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 18 Nov 2020 09:44:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726894AbgKROoK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 18 Nov 2020 09:44:10 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6F56C0613D6
        for <linux-clk@vger.kernel.org>; Wed, 18 Nov 2020 06:44:10 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id r6so1155928pjd.1
        for <linux-clk@vger.kernel.org>; Wed, 18 Nov 2020 06:44:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=wi1tklYoU+4Q/BdD+it/ualPtR5EztUZa56jdKuDyDs=;
        b=TqMS4BiprOHGkvbm/xiKQnITqSoHYZ4NlIRjexMJPgoTxMgGkRIO4ZIkXsqT6jTAbf
         9uCdIBAwl77/nhCg9xDQOrdS3cjiZkRQYE/oWWEfdlgG2TNLf2CgfhUwMdSlM4Q7XlNl
         gtFXIK1an9xUvq1LQ9tXIVZFfb+rrXB50yllQ1J5kKFcIcc5nn0sAuk1BVCHZktzR75W
         1sBd6t4dYif6KYW8R69NpBs6I1MmSz1Nng+dmMoIMuRWVp+R4lNqPGjCPYvplZDV5fy7
         +2iiuOL6ERlQo6qcIMNYqafp/lZtIHQIrfDWNLUaT2uvjhAGNVv65Fys5u5WHpD3nYJn
         VvpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wi1tklYoU+4Q/BdD+it/ualPtR5EztUZa56jdKuDyDs=;
        b=NwllsRyBtDE4yyTe3K87XuO8pOZwe5DPOERzrI8Q5MF5l6EyHzhfzZLq500e4rmnwG
         NUz65ZvnFa9xp0QtaElJlJvss5wYV5WlTgEfZv5ydLuOL6AIWlGBD5RiSIYcVyH59p0N
         N/HkjpuarElqEEidCw9rBcFn1m5iVtslZmND9ybUFhSIyrRc/a3B+XtIy9RpuQXzjtlS
         2pJFrFyu1m0b4QALqTj9YXqM958bal7RXH7FVNJa5TZDXb3T3WrZACIua40gkupbf2y/
         SNJeqXiJ//KIT/RzMrWEYRvZOihzuL+CV1T4WGtPZ2iycgAYNrDXvN0BttM3FMQZtJhd
         XiNA==
X-Gm-Message-State: AOAM533zFcQDQTHC7VLkrbR2bvWS1l2T6357sl45IJwzcRxiXw8bfZh9
        MJodTO/c1hg3Q7pKHwCbMSkR
X-Google-Smtp-Source: ABdhPJx3dbWXij883VJ/7IaBRRF9jyjwMBK0HE9oi+np7RYbL45jFvE/U6ijF9mdN63vfRKK9SEGaw==
X-Received: by 2002:a17:90b:11d3:: with SMTP id gv19mr288958pjb.232.1605710650071;
        Wed, 18 Nov 2020 06:44:10 -0800 (PST)
Received: from thinkpad ([2409:4072:400:708e:ac67:2882:f617:a8ff])
        by smtp.gmail.com with ESMTPSA id y5sm2833325pjr.50.2020.11.18.06.44.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2020 06:44:09 -0800 (PST)
Date:   Wed, 18 Nov 2020 20:14:01 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Vinod Koul <vkoul@kernel.org>, mturquette@baylibre.com,
        robh+dt@kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Naveen Yadav <naveenky@codeaurora.org>
Subject: Re: [PATCH v2 2/4] clk: qcom: Add SDX55 GCC support
Message-ID: <20201118144401.GA8942@thinkpad>
References: <20201105104817.15715-1-manivannan.sadhasivam@linaro.org>
 <20201105104817.15715-3-manivannan.sadhasivam@linaro.org>
 <20201106093819.GE2621@vkoul-mobl>
 <160538612750.60232.17440819605514427384@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <160538612750.60232.17440819605514427384@swboyd.mtv.corp.google.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sat, Nov 14, 2020 at 12:35:27PM -0800, Stephen Boyd wrote:
> Quoting Vinod Koul (2020-11-06 01:38:19)
> > On 05-11-20, 16:18, Manivannan Sadhasivam wrote:
> > > +#include "reset.h"
> > > +
> > > +enum {
> > > +     P_BI_TCXO,
> > > +     P_CORE_BI_PLL_TEST_SE,
> > 
> > This is for test and we removed this for upstream, so can you do that as
> > well (not parent will decrease for clks below)
> > 
> > With that updated:
> > 
> > Reviewed-by: Vinod Koul <vkoul@kernel.org>
> > 
> 
> I half understood that. Just an FYI that I'm waiting for this update.

Looks like this change is not needed. Can you please consider merging
this series?

Thanks,
Mani
