Return-Path: <SRS0=IVDQ=DW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57E76C433E7
	for <linux-clk@archiver.kernel.org>; Thu, 15 Oct 2020 01:29:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0A8C522257
	for <linux-clk@archiver.kernel.org>; Thu, 15 Oct 2020 01:29:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="U84wn4Ix"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732231AbgJOB3j (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 14 Oct 2020 21:29:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732256AbgJOB3i (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 14 Oct 2020 21:29:38 -0400
Received: from mail-ua1-x943.google.com (mail-ua1-x943.google.com [IPv6:2607:f8b0:4864:20::943])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B595C00215F
        for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2020 17:10:38 -0700 (PDT)
Received: by mail-ua1-x943.google.com with SMTP id k12so167022uad.11
        for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2020 17:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yNVbwBUlc8xHfj5dGGUid3sUj8ZlijbrpDXeVgVJXrI=;
        b=U84wn4IxrbhrL0RT2hXQbW3knYBWBZbRGv71UK8XNw/IJjfDX3nKflFtDK5ewY9+v0
         JXQo/o5eAqYzysT4O4KYn8Xyt9EgE0HJN8aHHXqYwv4UHaFyXBu9rTpYJKiF/ll33E2d
         SSaKz5fzA+kudRu1ykZxpDTHC4XvSYIj//NRE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yNVbwBUlc8xHfj5dGGUid3sUj8ZlijbrpDXeVgVJXrI=;
        b=bADreoZllLlY3RET1aVL3nZvStnDeeUWb1Dzfmgc4K8VZzcTGU2xkyntC34XbbTHj2
         ChWf55b27DS6YRo8DtBy5fRhYhzMIzCs7Q5L2or6uO2D2DFHvgf1YLxS3n2NTN4W2iry
         6WeeW4laPro9CPRm9qlzobrsHHcgTuBzTtnz/YKz93D1tvVdPtBkTw8mkUNhjbs51SaW
         kZe3BE8kNmzueNOPpTNIdm0I8cxyP/UXMunH4xgE+utvjvCsQd4CEdrgn8+CY+6Sjo+U
         wpjm6Yc9qADKBTVnF1aZD68/yUqak1UkKIemuh+33i+ai/9L1ctzBlQafnHSAYSFLQVY
         C6rQ==
X-Gm-Message-State: AOAM531y61a8xvCmeRhyRwLCQiuCQUPHb9rWdeVehLoDatm6nbgGtYLB
        cBmSjNic/wLFic5DLUER5umpYl3tMZT7sA==
X-Google-Smtp-Source: ABdhPJxI4gQ6s8XFodpEMTdRDuDtLt0lFw4tmJp5yfEWYHBYBY3uybJfCjprH1fgFpfusNkSwWUV6A==
X-Received: by 2002:ab0:208a:: with SMTP id r10mr786037uak.56.1602720637248;
        Wed, 14 Oct 2020 17:10:37 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id s18sm179375vkd.51.2020.10.14.17.10.36
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2020 17:10:36 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id u7so452606vsq.11
        for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2020 17:10:36 -0700 (PDT)
X-Received: by 2002:a67:e3b9:: with SMTP id j25mr998543vsm.37.1602720635942;
 Wed, 14 Oct 2020 17:10:35 -0700 (PDT)
MIME-Version: 1.0
References: <20201014140507.v3.1.I4567b5e7e17bbb15ef063d447cb83fd43746cb18@changeid>
 <20201014140507.v3.3.Id0cc5d859e2422082a29a7909658932c857f5a81@changeid> <160271877655.884498.7099344361539095621@swboyd.mtv.corp.google.com>
In-Reply-To: <160271877655.884498.7099344361539095621@swboyd.mtv.corp.google.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 14 Oct 2020 17:10:24 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XedSbZ_HQK5KBw4ba1j7Ow6rn-GT0dLzsPrTtLrh+LWQ@mail.gmail.com>
Message-ID: <CAD=FV=XedSbZ_HQK5KBw4ba1j7Ow6rn-GT0dLzsPrTtLrh+LWQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] clk: qcom: lpasscc-sc7180: Re-configure the PLL in
 case lost
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Taniya Das <tdas@codeaurora.org>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>,
        David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

On Wed, Oct 14, 2020 at 4:39 PM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Douglas Anderson (2020-10-14 14:05:23)
> > diff --git a/drivers/clk/qcom/lpasscorecc-sc7180.c b/drivers/clk/qcom/lpasscorecc-sc7180.c
> > index 48d370e2108e..e12d4c2b1b70 100644
> > --- a/drivers/clk/qcom/lpasscorecc-sc7180.c
> > +++ b/drivers/clk/qcom/lpasscorecc-sc7180.c
> > @@ -388,6 +388,25 @@ static int lpass_create_pm_clks(struct platform_device *pdev)
> >         return ret;
> >  }
> >
> > +static int lpass_core_cc_pm_clk_resume(struct device *dev)
> > +{
> > +       struct regmap *regmap = dev_get_regmap(dev, "lpass_core_cc");
>
> Please make "lpass_core_cc" a static const pointer in this driver so
> that it can be used here and when the regmap is made so that we're
> certain they match.

Sure.  In theory the compiler ought to use string constant pooling so
they would have pointed to the same place, but you're right that it
wouldn't catch typos or other cases where they don't match.  I'll do
both regmap names just for symmetry.  Hopefully that's OK.

-Doug
