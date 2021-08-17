Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 335A6C4338F
	for <linux-clk@archiver.kernel.org>; Tue, 17 Aug 2021 07:26:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 17CCA60FA0
	for <linux-clk@archiver.kernel.org>; Tue, 17 Aug 2021 07:26:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238432AbhHQH1X (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 17 Aug 2021 03:27:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238067AbhHQH1W (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 17 Aug 2021 03:27:22 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC925C061764
        for <linux-clk@vger.kernel.org>; Tue, 17 Aug 2021 00:26:49 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id z9so27037749wrh.10
        for <linux-clk@vger.kernel.org>; Tue, 17 Aug 2021 00:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=DeSKEV4kzIYCFvMlyG0CcZpPIPk6C3caP7V/Uxgw/9k=;
        b=eIdqLOZVL0OULfaNktsy49d15zGef7kYk5Nsaq5mcWm+4QJjKmvjms0mljsplVDwyv
         b1QwVTESuN9vFQIXGgKcGFtJuQu+QVTC0vCQOpBHOlydYmWISc2TxqiZdbdJmaE8DKZY
         DMjaDsvDb1vzIWum/cSNA+M71QNvMW8pJrZmzRHbcvUpTmUCRhRb6UBvpO5LgA9fAsga
         dfKLBbJzl7CrVmzcEdaYOWcoeZuYp1d04TrMaxOtXMOrG5sHIu1wqL/ENHaa2YhvTGz9
         KCD7U4L+l1oBtUt9sFbCtmbz3cRGu5FkkdlSQxmHKkZKfmUJHP6xjOTZn7DAdrGG41Jb
         tauw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=DeSKEV4kzIYCFvMlyG0CcZpPIPk6C3caP7V/Uxgw/9k=;
        b=AGXX+l+Cwu7TqTzHIUFpaTfm9ZnwiWdPppTRSb2kbsaAVS8wJY60SvbZZC+fvozV4o
         SOaMCkJfodV7Z7JjaCiPxjybNswaKwfes10JZoLBUw/5VTESFUJE45WC9Y7J2ilwNTvH
         Bvl/7s585AvXM0/1kV/RR1tKQSeqtqFOkCCfU3ZP6kR1iUNi0/NnieUQLVNXlN6kaZmk
         ZIn40StB3zYaTZcQgMEaLbGQMvIWxpMjWQOq/Jm9yy/zUP4H2RekqOgSSqq6nqQis3Qy
         VMUi0imx9iEB015h2Evqkn9NUA0K1eaEXe9zS+8Fs+oxNl8NIEjbB40zRrOGwUAVmaQk
         nNbw==
X-Gm-Message-State: AOAM531J3ksOOeGJROFARGt1QJXLSKPF3q+ui5jo+8ompMpnatpl09tv
        LWt5bfR5/GKEiew/Ur6cayPoIJxImZSv2A==
X-Google-Smtp-Source: ABdhPJxpbtwzWAD4DHKJBWVTKhC3N9ycqOWMcg7VtGaTjC0n0r5Cn7CshtZhQlmoPTl82e1tVBmgng==
X-Received: by 2002:adf:8287:: with SMTP id 7mr2228934wrc.360.1629185208510;
        Tue, 17 Aug 2021 00:26:48 -0700 (PDT)
Received: from blmsp ([2a02:2454:3e6:c900::97e])
        by smtp.gmail.com with ESMTPSA id b12sm1576598wrx.72.2021.08.17.00.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 00:26:48 -0700 (PDT)
Date:   Tue, 17 Aug 2021 09:26:47 +0200
From:   Markus Schneider-Pargmann <msp@baylibre.com>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Russell King <linux@armlinux.org.uk>, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: Fix *bulk_get* return value documentation
Message-ID: <20210817072647.55funsorbowf544b@blmsp>
References: <20210811075719.1716886-1-msp@baylibre.com>
 <162879633884.19113.18202513608808069954@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <162879633884.19113.18202513608808069954@swboyd.mtv.corp.google.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Stephen,

On Thu, Aug 12, 2021 at 12:25:38PM -0700, Stephen Boyd wrote:
> Quoting Markus Schneider-Pargmann (2021-08-11 00:57:19)
> > Some of the bulk_get variants document that the return value is a valid
> > IS_ERR() condition but it is not. These functions return an errno
> > directly if an error occures.
> > 
> > This patch fixes that documentation and documents that the return value
> > is 0 or errno.
> > 
> > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> > ---
> >  include/linux/clk.h | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/include/linux/clk.h b/include/linux/clk.h
> > index 266e8de3cb51..56a741903963 100644
> > --- a/include/linux/clk.h
> > +++ b/include/linux/clk.h
> > @@ -340,7 +340,7 @@ struct clk *clk_get(struct device *dev, const char *id);
> >   * that were obtained will be freed before returning to the caller.
> >   *
> >   * Returns 0 if all clocks specified in clk_bulk_data table are obtained
> > - * successfully, or valid IS_ERR() condition containing errno.
> > + * successfully, or an errno otherwise.
> >   * The implementation uses @dev and @clk_bulk_data.id to determine the
> >   * clock consumer, and thereby the clock producer.
> >   * The clock returned is stored in each @clk_bulk_data.clk field.
> 
> While you're here can you also use the Return: syntax so it isn't
> freeform and doc generation can split it out?

thanks, good idea. Will do that.

Best,
Markus
