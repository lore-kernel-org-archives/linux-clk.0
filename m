Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5B11C47082
	for <linux-clk@archiver.kernel.org>; Wed, 26 May 2021 10:12:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9778261360
	for <linux-clk@archiver.kernel.org>; Wed, 26 May 2021 10:12:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233865AbhEZKOI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 26 May 2021 06:14:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233853AbhEZKOH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 26 May 2021 06:14:07 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09707C061756
        for <linux-clk@vger.kernel.org>; Wed, 26 May 2021 03:12:36 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id d20so355636pls.13
        for <linux-clk@vger.kernel.org>; Wed, 26 May 2021 03:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=aHVNQXjGDzYmugExqLyS8QgS8HOqQNAY67dCdTL11Tk=;
        b=rLHPLAwB+SG9oHy7Jyj56zS3SJ69OLTPsaFqkBYX74C5976mGMe460E/bN8apJCOIi
         Cnv6pbre43lJCmvIasCmkn6pZkKm0bmpoRGYXCp6audilP0g2JdGKZ1CMsy25lRcPCiB
         UzEZ65RdEK//1A3aXrhm7HL643Fq8y8t+SiRv+TKfcpiOtI5wLLlTtGNgtkygpXCch0q
         LMVRScl7tSOF0BTPYqv8m0HsKHLfOmib/hnY61z/DHsVzVuAIek9KHRjpYTuq0iVTLjz
         ROl+LlLgC543671tluDhEjdDM2oEVV7NtLwadH0Xn1qmQK3hG+aYt2lWZcrbQotoECAn
         wQrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=aHVNQXjGDzYmugExqLyS8QgS8HOqQNAY67dCdTL11Tk=;
        b=k0XBQvdT3Ofc1zxmKefJOPYcvQ14XrUp2SeHp4y+YfoHZg/+YnCa1LuSH2EGp+sI0p
         nii57MT5Hd7hu6eqjXtslwZfX1/t+2kaSaZJsP0c6egenGuIuvluGAMhMNFkj2zRl2Va
         V5bsOG05/rTykHzhXp/HZ1+7Vntb7TSymbA/FGAxBHYq7TkNde576Q9Rp5ZXj2wWIUh8
         KcqT2RyYtppVW0Lu59S3MJMuU/TWXfWkvhV7wojDgNf2lPY4vtWtdsPnkLpQvi+7Yzi7
         kC8PjLflZWVoHoRTGZv5osQ8rylUIAe8Aa+RV0HyPYHjLN6F4x/odQRL4Ud1GH6PyNRa
         /qjA==
X-Gm-Message-State: AOAM530XltuP4BCjLxsXrtExZT2i2/qH9t5NIaz3ucn7sSqvGM6WXjf3
        lV7fw7mtlFU/ilWhqRIvJTpZ
X-Google-Smtp-Source: ABdhPJzDHzsSQIoA8GD3ct1bX1CiJEn08s3Ct9CsJrWmHFdkDP3RG3pKmcDZLhavigaeds2wCWRhPA==
X-Received: by 2002:a17:902:61:b029:f8:c1e2:d84e with SMTP id 88-20020a1709020061b02900f8c1e2d84emr19843520pla.29.1622023955102;
        Wed, 26 May 2021 03:12:35 -0700 (PDT)
Received: from work ([120.138.12.4])
        by smtp.gmail.com with ESMTPSA id m84sm15533106pfd.41.2021.05.26.03.12.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 May 2021 03:12:34 -0700 (PDT)
Date:   Wed, 26 May 2021 15:42:30 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
Cc:     Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Edgar Bernardi Righi <edgar.righi@lsitec.org.br>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 4/6] clk: actions: Fix AHPPREDIV-H-AHB clock chain on Owl
 S500 SoC
Message-ID: <20210526101230.GD10723@work>
References: <cover.1615221459.git.cristian.ciocaltea@gmail.com>
 <58225ced4893018792d581c0476a0f1c70e08907.1615221459.git.cristian.ciocaltea@gmail.com>
 <20210316054547.GD1798@thinkpad>
 <20210316185014.GD1111731@BV030612LT>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210316185014.GD1111731@BV030612LT>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Mar 16, 2021 at 08:50:14PM +0200, Cristian Ciocaltea wrote:
> On Tue, Mar 16, 2021 at 11:15:47AM +0530, Manivannan Sadhasivam wrote:
> > On Mon, Mar 08, 2021 at 07:18:29PM +0200, Cristian Ciocaltea wrote:
> > > There are a few issues with the setup of the Actions Semi Owl S500 SoC's
> > > clock chain involving AHPPREDIV, H and AHB clocks:
> > > 
> > > * AHBPREDIV clock is defined as a muxer only, although it also acts as
> > >   a divider.
> > > * H clock is defined as a standard divider, although the raw value zero
> > >   is not supported.
> > 
> > What do you mean by not supported? The datasheet lists "0" as the valid divisor
> > value for divide by 1.
> 
> Unfortunately CMU_BUSCLK1 is not documented in my S500 Datasheet
> (Version: 1.6, 2016-03-07). Do you have a newer (or a more official)
> one?
> 

Yes I do have a newer version of the datasheet (v1.8) and there I can
see the divisor 0.

> The reference xapp-le code snipped is:
> 
> static struct owl_div divider_H_CLK = {
>     .type = DIV_T_NATURE,
>     .range_from = 1,  /* reserve H_CLK divsor 1 */
>     .range_to = 3,
>     .reg = &divbit_H_CLK,
> };
> 
> Not sure why divisor 1 has been reserved..
> 

It is not as per the datasheet. Did you run into any issues with this?
Else I'd suggest to keep it as it is.

Thanks,
Mani

> Thanks,
> Cristi
> 
> > Rest looks good to me.
> > 
> > Thanks,
> > Mani
> > 
> [...]
