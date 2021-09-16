Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 119DEC433EF
	for <linux-clk@archiver.kernel.org>; Thu, 16 Sep 2021 05:04:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EC06B61164
	for <linux-clk@archiver.kernel.org>; Thu, 16 Sep 2021 05:04:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231951AbhIPFFz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 16 Sep 2021 01:05:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234176AbhIPFFw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 16 Sep 2021 01:05:52 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A12E1C061766
        for <linux-clk@vger.kernel.org>; Wed, 15 Sep 2021 22:04:31 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id w8so5030290pgf.5
        for <linux-clk@vger.kernel.org>; Wed, 15 Sep 2021 22:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=m8pZguFuGhNfWPMK3DmEgTUY5gKWHuK0UZr8qzbuIE8=;
        b=B+TGQJxmKEGSc6t2j6mF/MTC9uF/Pt3UZv+uKFZCWgbwxD1YxsKnbgyHRwSbpUach5
         pu/GkPk4PdJzibuK3pQ7TDNeOdyfU6wzNrJ8vn5kpPVOBk6dhlxVl2mV2S8FJKYdUsoz
         n1KG/CinnA/0MLc9ZcnNY7Xo1ce52YE+01PYSeQyFeHMoOdC9LKy/bFKMm1yLeI7Ce5A
         nLFhM08VvvPf7HkfzQFIiKPKKvAqTOGxPS+y2eV350lMKLII2AwBebdrYy8PFP2420XI
         alBvBbQvfAgu8hMp1NSfsIuBc427UgJnfOPL8SkwLA1bD3WrdpFmzVqKPy+5RW5UJNs9
         F1nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=m8pZguFuGhNfWPMK3DmEgTUY5gKWHuK0UZr8qzbuIE8=;
        b=bqsy6y/yGRk5g32clqn9Kfyp07t8j5BvhR69CkYVOzVU54GDzJWQDo7fXTYEfSjYGK
         fHsriKpBPm9bp9ZSGzpu+f6LAISgKkuy3K+Z83j6Xpqpf/9UbbvkWkqpVU9Gg4mbxxTn
         O7eBv2R8ooUnEePgUc+bUcUhnQxO0AONKRGyFX0Q004K+j8n0KXKMO768HA0wsJjVExw
         tttf4bj6bjKddvamCVqcSIkJpkbumSa68+MhLfMaoD0+ELoYZYPC95LT9KcBD4AoYKvO
         Ktb5KWpbcGsiYnyd5FFW+NwM09/3geBAaPaz2BZ2ViW7u3hVEkv+8xk8IwiOmFAga547
         YfaQ==
X-Gm-Message-State: AOAM530aNG6kpvClSBjT/P/uUmSU6zo/123LWRwWmXDW6CMnjQ1ifnaw
        aafsKQl+25c3qdbvf9Y+fO7++w==
X-Google-Smtp-Source: ABdhPJyZ3lZHJLjMxaOxtl//zK+Bx2+Knn0ildGND0zESTIraqGjWOSxIEkQV9lV/6Ws71LrCdJJLA==
X-Received: by 2002:a05:6a00:22d5:b0:440:3750:f5f4 with SMTP id f21-20020a056a0022d500b004403750f5f4mr3579272pfj.64.1631768670992;
        Wed, 15 Sep 2021 22:04:30 -0700 (PDT)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id g13sm1440188pfi.176.2021.09.15.22.04.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Sep 2021 22:04:30 -0700 (PDT)
Date:   Thu, 16 Sep 2021 13:04:24 +0800
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] clk: qcom: smd-rpm: Add rate hooks for
 clk_smd_rpm_branch_ops
Message-ID: <20210916050423.GG25255@dragon>
References: <20210914025554.5686-1-shawn.guo@linaro.org>
 <20210914025554.5686-2-shawn.guo@linaro.org>
 <163165658855.763609.14080313241484048687@swboyd.mtv.corp.google.com>
 <20210915150526.GE25255@dragon>
 <YUIr/002dfXxDWDY@ripper>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YUIr/002dfXxDWDY@ripper>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Sep 15, 2021 at 10:23:11AM -0700, Bjorn Andersson wrote:
> On Wed 15 Sep 08:05 PDT 2021, Shawn Guo wrote:
> 
> > On Tue, Sep 14, 2021 at 02:56:28PM -0700, Stephen Boyd wrote:
> > > Quoting Shawn Guo (2021-09-13 19:55:52)
> > > > On QCM2290 platform, the clock xo_board runs at 38400000, while the
> > > > child clock bi_tcxo needs to run at 19200000.  That said,
> > > > clk_smd_rpm_branch_ops needs the capability of setting rate. Add rate
> > > > hooks into clk_smd_rpm_branch_ops to make it possible.
> > > 
> > > This doesn't sound right. The branch is a simple on/off. If xo_board is
> > > 38.4MHz, then there is an internal divider in the SoC that makes bi_tcxo
> > > (i.e. the root of the entire clk tree) be 19.2MHz. We don't model the
> > > divider, I guess because it isn't very important to. Instead, we tack on
> > > a divider field and implement recalc_rate op. See clk-rpmh.c in the qcom
> > > directory for this.
> > 
> > Thanks for the comment, Stephen!  To be honest, I copied the
> > implementation from vendor kernel, and wasn't really sure if it's
> > correct or the best.
> > 
> > So here is what I get based on your suggestion.  Let's me know if
> > it's how you wanted it to be.  Thanks!
> > 
> > Shawn
> > 
> > ----8<---------
> > 
> > From 23dda79fee412738f046b89bdd20ef95a24c35cc Mon Sep 17 00:00:00 2001
> > From: Shawn Guo <shawn.guo@linaro.org>
> > Date: Wed, 15 Sep 2021 22:00:32 +0800
> > Subject: [PATCH] clk: qcom: smd-rpm: Add a divider field for branch clock
> > 
> > Similar to clk-rpmh, clk-smd-rpm has the same need to handle the case
> > where an internal divider is there between xo_board and bi_tcxo.  The
> > change is made in the a back compatible way below.
> > 
> >  - Add div field to struct clk_smd_rpm, and have
> >    __DEFINE_CLK_SMD_RPM_BRANCH() assign it.
> > 
> >  - Update all existing __DEFINE_CLK_SMD_RPM_BRANCH() wrappers to pass a
> >    zero div.
> > 
> >  - Add DEFINE_CLK_SMD_RPM_BRANCH_DIV() which doesn't take rate argument
> >    but div.
> > 
> >  - Update clk_smd_rpm_recalc_rate() to handle div and add it as
> >    .recalc_rate of clk_smd_rpm_branch_ops.
> > 
> 
> This looks good to me.
> 
> And the confirmed that the xo_board in sdm630.dtsi (and hence SDM660) is
> wrong, it should be 38.4MHz as well.

Hmm, I see CAF kernel has 19.2MHz for SDM630/660 xo_board clock.  Or am
I looking at the wrong place?

Shawn

> Unfortunately adding the appropriate divider to the sdm660 bcxo would
> break existing .dtsi (but we can probably convince the community that it
> would be ok, if we do it now).
