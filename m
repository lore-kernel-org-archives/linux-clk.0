Return-Path: <SRS0=xl4E=XM=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=FSL_HELO_FAKE,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F391BC4CEC9
	for <linux-clk@archiver.kernel.org>; Tue, 17 Sep 2019 15:34:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C987221897
	for <linux-clk@archiver.kernel.org>; Tue, 17 Sep 2019 15:34:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726827AbfIQPe0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 17 Sep 2019 11:34:26 -0400
Received: from mail-io1-f53.google.com ([209.85.166.53]:34474 "EHLO
        mail-io1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726724AbfIQPe0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 17 Sep 2019 11:34:26 -0400
Received: by mail-io1-f53.google.com with SMTP id q1so8716701ion.1
        for <linux-clk@vger.kernel.org>; Tue, 17 Sep 2019 08:34:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=b5eESMD28qPgijAAjYQFFcmvEqcWiLEcXpX+fUcktPY=;
        b=Osd6WCOEmx0w1JGrpwov4obR8Cq5hHbCQw61zdKoOoZvDBYk9aPftrleRNfP5htJC7
         hKjaCx52VWBcpGqWE1G4cy7YcgcYkeAn7jjbtngswScEV99H6WGjsodm0foZ4bfV0c1+
         2m4ndA5TXuAP0hxbXCEiJGpgML+aMAldxJVke+vTpHsfe8AsdTEYsM0zLE8x9JImbZS+
         lcHSBCRJ4bItdQ9NUWfMXTaUGTdh9x9T7MbOq8i6nNz09i8qhgybb5qW0x/c3hGcvAXZ
         y2ln6faX6Fn+FUx/yUEB5XW8SgJ03a3N6nWKfVpxkvT0nEJInLGOyJ8OW/visR3G9R3w
         74+w==
X-Gm-Message-State: APjAAAX2WE/EX0qlR5m5s4DJKF9ccsM7p9g4mZnqyLGlGNb2KdIiLVbx
        QMcu4Xt240ce8zgN7/VpoeCHhg==
X-Google-Smtp-Source: APXvYqxPWSxk0QiDZucIgQV74YO0vltXHIK9raR1c0yDGCwIJyW9xu9hnN02QKJ2g6jbj+82Tj3aaQ==
X-Received: by 2002:a02:9182:: with SMTP id p2mr4407846jag.43.1568734464780;
        Tue, 17 Sep 2019 08:34:24 -0700 (PDT)
Received: from google.com ([2620:15c:183:0:82e0:aef8:11bc:24c4])
        by smtp.gmail.com with ESMTPSA id u11sm3569716iof.22.2019.09.17.08.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2019 08:34:23 -0700 (PDT)
Date:   Tue, 17 Sep 2019 09:34:19 -0600
From:   Raul Rangel <rrangel@chromium.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Rob Clark <robclark@gmail.com>,
        Sean Paul <seanpaul@chromium.org>
Subject: Re: [RFC] clk: Remove cached cores in parent map during unregister
Message-ID: <20190917153419.GA258455@google.com>
References: <20190723051446.20013-1-bjorn.andersson@linaro.org>
 <20190729224652.17291206E0@mail.kernel.org>
 <20190821181009.00D6322D6D@mail.kernel.org>
 <20190826212415.ABD3521848@mail.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190826212415.ABD3521848@mail.kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Aug 26, 2019 at 02:24:14PM -0700, Stephen Boyd wrote:
> > 
> > ---8<---
> > diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> > index c0990703ce54..f42a803fb11a 100644
> > --- a/drivers/clk/clk.c
> > +++ b/drivers/clk/clk.c
> > @@ -3737,6 +3737,37 @@ static const struct clk_ops clk_nodrv_ops = {
> >         .set_parent     = clk_nodrv_set_parent,
> >  };
> >  
> > +static void clk_core_evict_parent_cache_subtree(struct clk_core *root,
> > +                                               struct clk_core *target)
> > +{
> > +       int i;
> > +       struct clk_core *child;
> > +
> > +       if (!root)
> > +               return;
> 
> I don't think we need this part. Child is always a valid pointer.
> 

Bjorn or Saiprakash
Are there any plans to send out Stephen's proposed patch?

Thanks
