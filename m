Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 580B1C433F5
	for <linux-clk@archiver.kernel.org>; Mon, 13 Sep 2021 04:53:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 33DEE60F11
	for <linux-clk@archiver.kernel.org>; Mon, 13 Sep 2021 04:53:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230196AbhIMEyS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 13 Sep 2021 00:54:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230042AbhIMEyS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 13 Sep 2021 00:54:18 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E60AC061760
        for <linux-clk@vger.kernel.org>; Sun, 12 Sep 2021 21:53:03 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id l11so18369264lfe.1
        for <linux-clk@vger.kernel.org>; Sun, 12 Sep 2021 21:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4GP94oI8tMu6AWKPmeh+Mi99FWEewPUjupFIyk9Vgy8=;
        b=dy5jiiVGzeuUU3o2/KUgrSZ5nU4dGqicgHDbYfCkZ+dTO+28QM6vPMBSnfZB9xA0vR
         JsrU7k163qDyuxipvfEBNOaVwCopH6Us6ZtfnezWtK6Nov6EHU1jzPll20Y6SymwwAVO
         /qH/doGQpsWz0mI2+fGUQJ75Vw/WLAHwY8piw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4GP94oI8tMu6AWKPmeh+Mi99FWEewPUjupFIyk9Vgy8=;
        b=h6TosxZ/yKEHYVFHsTKnjrFEU1dv7bQ2ofB+0QEcSHw5Y/EHx8oh5eRy2IiVbs+sgg
         PfQUX6GPrxZsfa2lG+GrKzdYh5ToQm3ZoJf0DF4Sr750pi2bMm++yRDOu2GuUpA0Ygng
         wo4TfWa4tHIoZsvfARH2nuEpudf+IGjmV0ksbgZE/4jM6VJiUTUepD8tyNswAwBwgaRA
         zoht1InyU9EvkGnhp9dCQaGWQFW4Fq3Lgly/YcT9zKMKdhHVLkrGKfu45oIHvbZW6cxR
         hT3p+bt35kfI368zNOGsJgTHxgMm0yXpRkBmbzDg0YgXzLplss/n8MPZveL2QBB8iJja
         5dow==
X-Gm-Message-State: AOAM531lKSVL907dhfuRFLsCbSnXW+/6Ag2FGSL/7CpgpPwQLibOG9Qz
        Ik1yjNA46oVt7JWUJcDwCecJL0BkaX3hPsfpUjHItw==
X-Google-Smtp-Source: ABdhPJz/3Qrvat1JZ3K+cjHFjhNfQ1Dn3Xyi3uZH6ast4XQTlgibkT6qLsGdMg9yDmhhz9D5dLFRiduzFLzRZJkmR20=
X-Received: by 2002:a05:6512:c16:: with SMTP id z22mr8054334lfu.482.1631508781305;
 Sun, 12 Sep 2021 21:53:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210908111337.v2.1.I006bb36063555079b1a88f01d20e38d7e4705ae0@changeid>
 <CAD=FV=Wp=zqx4j=srryypAfpRusHQinuhXjmu4G_HuBo7+PN1g@mail.gmail.com>
In-Reply-To: <CAD=FV=Wp=zqx4j=srryypAfpRusHQinuhXjmu4G_HuBo7+PN1g@mail.gmail.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Mon, 13 Sep 2021 12:52:50 +0800
Message-ID: <CAGXv+5H-NJnUQ3WCdbdw9yz9FPHCHK7siLW2YsCfjiruj6B5pA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] clk: rockchip: rk3399: make CPU clocks critical
To:     Brian Norris <briannorris@chromium.org>,
        Heiko Stuebner <heiko@sntech.de>
Cc:     Doug Anderson <dianders@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Sep 9, 2021 at 3:44 AM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Wed, Sep 8, 2021 at 11:14 AM Brian Norris <briannorris@chromium.org> wrote:
> >
> > The CPU clocks don't currently have any owner (e.g., cpufreq-dt doesn't
> > enable() them -- and even if it did, it's not early enough compared to
> > other consumers -- nor does arch/arm64/kernel/smp.c), and instead are
> > simply assumed to be "on" all the time.
> >
> > They are also parents of a few other clocks which haven't been
> > previously exposed for other devices to consume. If we want to expose
> > those clocks, then the common clock framework may eventually choose to
> > disable their parents (including the CPU PLLs) -- which is no fun for
> > anyone.
> >
> > Thus, mark the CPU clocks as critical, to prevent them from being
> > disabled implicitly.
> >
> > Signed-off-by: Brian Norris <briannorris@chromium.org>
> > ---
> >
> > Changes in v2:
> >   - New, split from the patch that requires this change
> >
> >  drivers/clk/rockchip/clk-rk3399.c | 11 +++++++----
> >  1 file changed, 7 insertions(+), 4 deletions(-)
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
