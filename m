Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12855C433DB
	for <linux-clk@archiver.kernel.org>; Tue, 26 Jan 2021 17:22:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CD105230FC
	for <linux-clk@archiver.kernel.org>; Tue, 26 Jan 2021 17:22:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391173AbhAZRV6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 26 Jan 2021 12:21:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730071AbhAZQzp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 26 Jan 2021 11:55:45 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA40CC061D7C
        for <linux-clk@vger.kernel.org>; Tue, 26 Jan 2021 08:55:03 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id m13so2781494wro.12
        for <linux-clk@vger.kernel.org>; Tue, 26 Jan 2021 08:55:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Pz9VQ30QT10sFw3p7SZr4MIFLqcoCuT1kYq7h28FsoI=;
        b=PF0FfcRGHglmCRgXuhLv5V1KBb8LlfSc3KAIlPQ/rh0Pq029vtQUANKknIBlFKkoQK
         uW4frSXDkMIALok8IKL0uGGBplX2TRvQcsK0P8HWaVgYKCGiuUiZ5GzI0UOubmXUPeuP
         XoYoGZYrNic0DwuI/PpwwPIO1ATfShqgB0Q4bb736c1j1gDDawNQRZjUy2y9AQhUXg4W
         KIeNqRUaFa10mOyCe6/DlckWBwYeMTUVVCGXMuoQai+kuqu+xDifUcnAyoxP3tJwAp1T
         mnFcCHVXCw2qZN7IeSZeLwAHBb2rJQOUasJgY5zSKhhzyDpFL13Tcoq6o7FTPvCnoAuR
         F3hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Pz9VQ30QT10sFw3p7SZr4MIFLqcoCuT1kYq7h28FsoI=;
        b=jKkpEg/YapSm/+YmDZOWnOnNnA8zsJw28Vs4/NxDKf86dSmBERu6ZINQCJxQ+Dwj4M
         bEzs+Lth9yQkPRJbtKiQTri1iTX8CW2/FauHOHwkH9E6bqe/WHg4/293Nt5/E+NCvv+E
         Lnf9xQQE9jQ+eMG67i8LJ5x8bFM1KFTqn0olrYpwcJbcw1bohav/5/jaP+0kN5Rz4LT0
         oc+zUG8RIZTA6EXgf77E92APLq/F/VViEq0b8PwIrYy72kUBURTscOoMta/PYvXlqaTQ
         Nt7uC0PE1PS3o8dN5OwVxs3vCvR+YItkCdhPKLkdxfYblWLrnlmaQ6e0AHkGHUkPNJN5
         XdrA==
X-Gm-Message-State: AOAM530RLPMfikFixG38dOP8RCBWcM6QtaESe+AO77TW1EcKE76Du5iL
        fkqOe7cA22CoEHmWmCvys7ZNzA==
X-Google-Smtp-Source: ABdhPJyvxvmA12WazvbTYMP2H4ciS5tTRJgRMbY8wWi/qHjALlszPnI8tbrCaHHbiMBaczjXXJr/mA==
X-Received: by 2002:adf:f18a:: with SMTP id h10mr6951758wro.299.1611680102365;
        Tue, 26 Jan 2021 08:55:02 -0800 (PST)
Received: from dell ([91.110.221.188])
        by smtp.gmail.com with ESMTPSA id x128sm4428288wmb.29.2021.01.26.08.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jan 2021 08:55:01 -0800 (PST)
Date:   Tue, 26 Jan 2021 16:54:59 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     linux-kernel@vger.kernel.org,
        Emilio =?iso-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Boris BREZILLON <boris.brezillon@free-electrons.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 12/21] clk: sunxi: clk-sun6i-ar100: Demote non-conformant
 kernel-doc header
Message-ID: <20210126165459.GG4903@dell>
References: <20210126124540.3320214-1-lee.jones@linaro.org>
 <20210126124540.3320214-13-lee.jones@linaro.org>
 <20210126155430.llxijnwf5i4z3end@gilmour>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210126155430.llxijnwf5i4z3end@gilmour>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 26 Jan 2021, Maxime Ripard wrote:

> On Tue, Jan 26, 2021 at 12:45:31PM +0000, Lee Jones wrote:
> > Fixes the following W=1 kernel build warning(s):
> > 
> >  drivers/clk/sunxi/clk-sun6i-ar100.c:26: warning: Function parameter or member 'req' not described in 'sun6i_get_ar100_factors'
> > 
> > Cc: "Emilio López" <emilio@elopez.com.ar>
> > Cc: Michael Turquette <mturquette@baylibre.com>
> > Cc: Stephen Boyd <sboyd@kernel.org>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Chen-Yu Tsai <wens@csie.org>
> > Cc: Jernej Skrabec <jernej.skrabec@siol.net>
> > Cc: Boris BREZILLON <boris.brezillon@free-electrons.com>
> > Cc: linux-clk@vger.kernel.org
> > Cc: linux-arm-kernel@lists.infradead.org
> > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> > ---
> >  drivers/clk/sunxi/clk-sun6i-ar100.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/clk/sunxi/clk-sun6i-ar100.c b/drivers/clk/sunxi/clk-sun6i-ar100.c
> > index e1b7d0929cf7f..54babc2b4b9ee 100644
> > --- a/drivers/clk/sunxi/clk-sun6i-ar100.c
> > +++ b/drivers/clk/sunxi/clk-sun6i-ar100.c
> > @@ -16,7 +16,7 @@
> >  
> >  #include "clk-factors.h"
> >  
> > -/**
> > +/*
> >   * sun6i_get_ar100_factors - Calculates factors p, m for AR100
> >   *
> >   * AR100 rate is calculated as follows
> 
> This is the sixth patch doing the exact same thing over the files in
> that folder you sent. Please fix all the occurences at once

No.  That would make the whole clean-up process 10x harder than it
already is

Before starting this endeavour there were 18,000+ warnings spread over
100's of files and 10's of subsystems that needed addressing (only a
couple thousand left now thankfully).  Some issues vastly different,
some duplicated (much too much copy/pasting going which made things
very frustrating at times).

Anyway, in order to work though them all gracefully and in a sensible
time-frame I had to come up with a workable plan.  Each subsystem is
compiled separately and a script attempts to take out duplicate
warnings and takes me through the build-log one file at a time.  Once
all of the warnings are fixed in a source-file, it moves on to the
next file.  The method is clean and allows me to handle this
gargantuan task in bite-sized chunks.

Going though and pairing up similar changes is unsustainable for a
task like this.  It would add a lot of additional overhead and would
slow down the rate of acceptance since source files tend to have
different reviewers/maintainers - some working faster to review
patches than others, leading to excessive lag times waiting for that
one reviewer who takes weeks to review.  Having each file addressed
in a separate patch also helps revertability and bisectability.  Not
such a big problem with the documentation patches, but still.

Admittedly doing it this way *can* look a bit odd in *some* patch-sets
when they hit the MLs - particularly clock it seems, where there
hasn't even been a vague attempt to document any of the parameters in
the kernel-doc headers - however the alternative would mean nothing
would get done!

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
