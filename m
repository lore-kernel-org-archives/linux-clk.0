Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31056C48BD1
	for <linux-clk@archiver.kernel.org>; Fri, 11 Jun 2021 19:16:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 16C43613B8
	for <linux-clk@archiver.kernel.org>; Fri, 11 Jun 2021 19:16:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230390AbhFKTS2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 11 Jun 2021 15:18:28 -0400
Received: from mail-lf1-f52.google.com ([209.85.167.52]:36789 "EHLO
        mail-lf1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229824AbhFKTS1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 11 Jun 2021 15:18:27 -0400
Received: by mail-lf1-f52.google.com with SMTP id v22so10089417lfa.3
        for <linux-clk@vger.kernel.org>; Fri, 11 Jun 2021 12:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XX1W3URWQ8r7C42PWjWKsvggaK12j8Zhh8tbxVvnO2w=;
        b=nTb2yspBH9u7uwoFjX8jsvdCFER3T7Bg+mpnOMpkt4egaQm7qPi7JOIsnAKqah/LXZ
         drWRb1WZk+czg48dmZFpssa0KuRfbWn7mW3UVNp3P5AKH2B3xN15/uWNvDDYh/R/iDqf
         KZJKULNgY5qxFSwUY/CtclPh7LQYPy11OEBjje2bPI2ycK1Iay5R070vmzOX8iTf5Va8
         RnYlsgYc+bIvRwDdB/cjijQcprkz0x1qGD7wE7fcyK9tfWT/kbuIe5LsiRTllfH2Dcmf
         fg85Tw49uriMJ6UDesjh15oUodZahOpAsnAi1yJJVFjlkBkEoMpSZADCnUiJG+alXrFh
         n31w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XX1W3URWQ8r7C42PWjWKsvggaK12j8Zhh8tbxVvnO2w=;
        b=q3pPEeV2SLlwRT10sIJCHUWx/zLCp/lxEd0yfqgPcZXzobmYJqRl3jShlTaz1Yfgwc
         h55/PNyzzXDUGMQHB4QuEsX889nXPf74yKGyOi+9h6A6LE8rg7k3ZCMs4pYl/OAZZEXc
         QzpcWXDfxvHO7AFp1xF5ZFyp85IKNvD8O344bbzedhlLic56q7qdlO9LX4gsBXMNhKke
         gQzndGQ2qbeyAEve4z5b5IMqMArhvtYsoEBiA08Zcq9aCyJi8Obgy/ARlhbXugJ0MVoR
         IBkGWFBt7UTC5ob1wU3K3Hkdq8W4hUTEXa9g6Ca4KZ3inM9/gdSEpZ62kJUNu0fVMt4Z
         ElBg==
X-Gm-Message-State: AOAM532QGDJxTATERkcuBRHMoPVflYrjqTuVT+A/Nxe5g4NH17hRZcxj
        qEVro9U/FVTephRAzSpiRG2bLohml14biXmSmDX+mQ==
X-Google-Smtp-Source: ABdhPJzojiGmPxWqA+iJlZvJDBVswkAfdjKbLrU0iZLy3nWfGlyWzCEH7Q2CBe44XskeGNFG3yWJgOHAbCBUTjJOHNU=
X-Received: by 2002:a19:c181:: with SMTP id r123mr3490274lff.7.1623438928342;
 Fri, 11 Jun 2021 12:15:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210331105735.3690009-1-dmitry.baryshkov@linaro.org>
 <20210331105735.3690009-23-dmitry.baryshkov@linaro.org> <CALAqxLVwpLOsvjBVi+xb5S2VQNuGKgeOzrSqwZe5FN6RSeEEWA@mail.gmail.com>
 <CAA8EJprMKydEKQhHr=wk76H_a1-udjspVXSY1j2tqHNErAG-uQ@mail.gmail.com>
In-Reply-To: <CAA8EJprMKydEKQhHr=wk76H_a1-udjspVXSY1j2tqHNErAG-uQ@mail.gmail.com>
From:   John Stultz <john.stultz@linaro.org>
Date:   Fri, 11 Jun 2021 12:15:16 -0700
Message-ID: <CALAqxLVeCH-8eiDZVy6vN4nD594od69A388bTwfJsJfmgb3Ddw@mail.gmail.com>
Subject: Re: [PATCH v4 22/24] drm/msm/dsi: remove temp data from global pll structure
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <freedreno@lists.freedesktop.org>,
        "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
        Peter Collingbourne <pcc@google.com>,
        Amit Pundir <amit.pundir@linaro.org>,
        Vinod Koul <vinod.koul@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Jun 11, 2021 at 2:01 AM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Hi,
>
> On Fri, 11 Jun 2021 at 10:07, John Stultz <john.stultz@linaro.org> wrote:
> >
> > On Wed, Mar 31, 2021 at 3:58 AM Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> > >
> > > The 7nm, 10nm and 14nm drivers would store interim data used during
> > > VCO/PLL rate setting in the global dsi_pll_Nnm structure. Move this data
> > > structures to the onstack storage. While we are at it, drop
> > > unused/static 'config' data, unused config fields, etc.
> > >
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> > > Tested-by: Stephen Boyd <swboyd@chromium.org> # on sc7180 lazor
> >
> > Hey Dmitry,
> >   Just wanted to give you a heads up.  Peter Collingbourne reported
> > today that his db845c wasn't booting to display for him on his 4k
> > monitor. It works fine on a 1080p screen, and while 4k isn't supported
> > (yet?),  normally the board should fall back to 1080p when connected
> > to a 4k monitor.  I was able to reproduce this myself and I see the
> > errors below[1].
>
> It looks like I made a mistake testing these patches with the splash
> screen disabled.
> Stephen Boyd has proposed a fix few days ago (will be included into
> the 5.13). Could you check that it fixes the problem for you?
>
> https://lore.kernel.org/linux-arm-msm/20210608195519.125561-1-swboyd@chromium.org/

Ah! This does seem to fix it! Thank you so much for pointing it out!

thanks
-john
