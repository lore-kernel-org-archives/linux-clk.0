Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FSL_HELO_FAKE,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54648C4338F
	for <linux-clk@archiver.kernel.org>; Thu,  5 Aug 2021 08:00:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2B0756044F
	for <linux-clk@archiver.kernel.org>; Thu,  5 Aug 2021 08:00:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232182AbhHEIA2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 5 Aug 2021 04:00:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239150AbhHEIA2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 5 Aug 2021 04:00:28 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D24E1C0613D5
        for <linux-clk@vger.kernel.org>; Thu,  5 Aug 2021 01:00:12 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id l18so5298866wrv.5
        for <linux-clk@vger.kernel.org>; Thu, 05 Aug 2021 01:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=wumc4OZ7mBGOruxhA75GZYnXNkQhB5mW1nT6BqQbhoM=;
        b=OzEDvkO70XEjJpSxi59DeN+Dn6kIot+RdgCjtY4yI40znzqsrqBWxOANTs5It1hlVQ
         wWl7kpglPubk2ubzYbZPHmqRadHU2jbkvRemE5TEh5xjIByLkJxxxZF1Cf1/Hxa/4o3Z
         EMF1lgFJsvGL3bRxSmf3SLeuUYOo6wZI4xcHtsZiJAqRf7D/EqeGkXU/KmX0OXwXC1gV
         5gEOrbj+bXMZ35y70DOAqq2L+kXBst0eJJ6YjpuDbcrCIy2GAzQLTnLdHvka4Uw5I6wx
         xoEfm6xYSKMY3+A+cGWn8XLltL9F0QnvsT7EmpF6gAgRlGKwCmcO9Rq1bnRJFaLnquuS
         Ggdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=wumc4OZ7mBGOruxhA75GZYnXNkQhB5mW1nT6BqQbhoM=;
        b=kD627IAAzbc3RVoRGOzsk9x2KyQbIYrBHINYJtUiRuKlY+at25bOARdWACtEC3jJIu
         w502zqsFSTyyHoJ/QdkAq/i5gx7cvLzG6EPg/jMUUcQjmt4YpEBFDZfN+GWalIlRg3/W
         XlMt94HvpZqaxYjMAqNi+XetjO0fKH1/8930ZvhcrJjq3AH40Pm4uXEWTlqeTtMNW8oJ
         2Wu8GzjIjs8af8mcP51bAoT9Ip5MTpIJuDjETwBjqsVGUdQGKMjVH2E8wXTcHWaKyQy/
         RXDOfIZCaAxFJmZ9Y4r4O5HnsCNjiKdwDBsrk6yAEO+5FBfJMVDwR40wL+IgKvOH4uNb
         +9ug==
X-Gm-Message-State: AOAM5333YJo+avi7L6ZMgN1Pm/ukxsRngYub3RKm9CyoVvPOdy5cDb2v
        kdRrgoywz7JClgVT0ZKhkpnnpA==
X-Google-Smtp-Source: ABdhPJwwI7OpevysCPXVydCiImYOL403jvLwB9REh/tzZacm4rsI/wiorAFciqp4F5XD5r0f76eBSQ==
X-Received: by 2002:a5d:424d:: with SMTP id s13mr3652510wrr.356.1628150411445;
        Thu, 05 Aug 2021 01:00:11 -0700 (PDT)
Received: from google.com ([109.180.115.228])
        by smtp.gmail.com with ESMTPSA id f15sm5133528wrp.12.2021.08.05.01.00.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Aug 2021 01:00:10 -0700 (PDT)
Date:   Thu, 5 Aug 2021 09:00:09 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH 2/2] mfd: db8500-prcmu: Handle missing FW variant
Message-ID: <YQuaiW/MSZY4bmok@google.com>
References: <20210801233314.3150754-1-linus.walleij@linaro.org>
 <20210801233314.3150754-2-linus.walleij@linaro.org>
 <YQejHNP1AzFHZ6gK@google.com>
 <CACRpkdaK0pBgmFSazjJ5NOj9rF9DzUyCfumxyi8PNaS_61_=Ww@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdaK0pBgmFSazjJ5NOj9rF9DzUyCfumxyi8PNaS_61_=Ww@mail.gmail.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 05 Aug 2021, Linus Walleij wrote:

> On Mon, Aug 2, 2021 at 9:47 AM Lee Jones <lee.jones@linaro.org> wrote:
> > On Mon, 02 Aug 2021, Linus Walleij wrote:
> >
> > > There was an "unknown" firmware variant turning up in the wild
> > > causing problems in the clock driver. Add this missing variant
> > > and clarify that varian 11 and 15 are Samsung variants, as this
> > > is now very well known from released products.
> > >
> > > Cc: Michael Turquette <mturquette@baylibre.com>
> > > Cc: Stephen Boyd <sboyd@kernel.org>
> > > Cc: linux-clk@vger.kernel.org
> > > Cc: phone-devel@vger.kernel.org
> > > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> > > ---
> > > Clock maintainers: could you please ACK this so Lee can take
> > > this into the MFD tree? The chances of merge collisions are
> > > zero, this code changes very seldom.
> > > ---
> > >  drivers/clk/ux500/u8500_of_clk.c | 3 ++-
> >
> > >  drivers/mfd/db8500-prcmu.c       | 6 ++++--
> > >  include/linux/mfd/dbx500-prcmu.h | 3 ++-
> >
> > Acked-by: Lee Jones <lee.jones@linaro.org>
> 
> Actually I intended for the clock people to ACK it for you
> but since it is completely independent of 1/2 it actually works
> either way, maybe they will rather pick it up, who knows? :D

That's fine too.

I assume they will not require an immutable branch, as the turn-over
in this file is very low.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
