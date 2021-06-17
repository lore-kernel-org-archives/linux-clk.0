Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FB36C49EA2
	for <linux-clk@archiver.kernel.org>; Thu, 17 Jun 2021 07:59:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4546D6101A
	for <linux-clk@archiver.kernel.org>; Thu, 17 Jun 2021 07:59:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230332AbhFQIBL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 17 Jun 2021 04:01:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230076AbhFQIBI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 17 Jun 2021 04:01:08 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C17CC061768
        for <linux-clk@vger.kernel.org>; Thu, 17 Jun 2021 00:58:59 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id n12so4264233pgs.13
        for <linux-clk@vger.kernel.org>; Thu, 17 Jun 2021 00:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hNu6HaeL5nahbHeNWRpYtmzxyhbr1PCpcEAdU1n7Ml4=;
        b=WXMADGzfWuZUokmX7qH1Wt/igrX9l7ELcu1892oN6yx1WfV3yng9W+FZVtBPX4xS6p
         TNxTOX2rCVvXG843gFX0yqBYJ6qIFQX0uuBynqEZe+yf6thS/Cru9h/YwkVEj0b8g2Fv
         itDa97dNOXm+1GD8t9NEkk9ztFqPPUogTYxSG4lx+LHXn6uT09Fnk51+iQsurqjPvB0J
         nXSy8bkUVtN/tgezW5szoM1cW2GldgjU2I+rL3Jet7zIcnhth0ONbWIeioET3QXqJxpc
         UA4TQLPCb290UM5VkbgcAslILqZfiBx40YzBCiV2+H+KlnObzV2bHcxU1TFmrEyl+wbV
         Vuog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hNu6HaeL5nahbHeNWRpYtmzxyhbr1PCpcEAdU1n7Ml4=;
        b=V/L/J8A95ln3J1zyQTICjcNTPxFj1ZYViTxsnoeCc1w3xGKBRAdbzcZVEJszD9V/eo
         dLKYVKImLsHWsUxo0NAZop/Gr6KmoJ7apimrShPzEeh8+cchzlITImFWjLn5d/VtZml0
         NVd4jemDQN2evscOhTxlOopHVW958/RuGgMMeC59C+1oGZrRo5sChhUmlkP7mp3OWNTc
         oq92zRSzZfSTt87FXI0eq0fzr2So6sPiYwBcqi8LyXv0L4TBeDUToC4ur4nj4tfsfUuu
         V0PJAUHNi19V6nUafMTeyc68czuHQ2+1JYXg09+G5mcYcubA3QiuatZgOYrrLh3YD7Y0
         bTmA==
X-Gm-Message-State: AOAM533wC7KC3HL+xkWUcH//oHbimwuLj3mxovJ/tBlbA2wNeeaNwSCR
        Y615vIsLuw7t2NmZkmqFKO+HgmvHUIsuRfTMhset7Q==
X-Google-Smtp-Source: ABdhPJzS968MwriJjtB8A4o5jf5U7wGm+srfciMOwtBfxiJR4VBaTGHofICzjBGjNv61Ss4Qaq23msGUlKDxn7Vu/EE=
X-Received: by 2002:a63:d47:: with SMTP id 7mr3778974pgn.339.1623916738949;
 Thu, 17 Jun 2021 00:58:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210616141107.291430-1-robert.foss@linaro.org>
 <20210616141107.291430-3-robert.foss@linaro.org> <780fd0b4-fffc-5afb-e546-86ba75bad9f9@somainline.org>
In-Reply-To: <780fd0b4-fffc-5afb-e546-86ba75bad9f9@somainline.org>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Thu, 17 Jun 2021 09:58:47 +0200
Message-ID: <CAG3jFytEYSpUB3nUO2JScqtUGQ_JYLmeA53FOLC6wKA3+ZZe5A@mail.gmail.com>
Subject: Re: [RFC v1 02/11] clk: qcom: rcg2: Add support for flags
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Taniya Das <tdas@codeaurora.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Vinod Koul <vinod.koul@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 16 Jun 2021 at 17:33, Konrad Dybcio
<konrad.dybcio@somainline.org> wrote:
>
>
> On 16.06.2021 16:10, Robert Foss wrote:
> > These changes are ported from the downstream driver, and are used on SM8350
> > for CAMCC, DISPCC, GCC, GPUCC & VIDEOCC.
> >
> > Signed-off-by: Robert Foss <robert.foss@linaro.org>
> > ---
> >  drivers/clk/qcom/clk-rcg.h  | 4 ++++
> >  drivers/clk/qcom/clk-rcg2.c | 3 +++
> >  2 files changed, 7 insertions(+)
> >
> > diff --git a/drivers/clk/qcom/clk-rcg.h b/drivers/clk/qcom/clk-rcg.h
> > index 99efcc7f8d88..a1f05281d950 100644
> > --- a/drivers/clk/qcom/clk-rcg.h
> > +++ b/drivers/clk/qcom/clk-rcg.h
> > @@ -149,6 +149,10 @@ struct clk_rcg2 {
> >       const struct freq_tbl   *freq_tbl;
> >       struct clk_regmap       clkr;
> >       u8                      cfg_off;
> > +     u8                      flags;
> > +#define FORCE_ENABLE_RCG     BIT(0)
> > +#define HW_CLK_CTRL_MODE     BIT(1)
> > +#define DFS_SUPPORT          BIT(2)
> >  };
> >
> >  #define to_clk_rcg2(_hw) container_of(to_clk_regmap(_hw), struct clk_rcg2, clkr)
> > diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
> > index 42f13a2d1cc1..ed2c9b6659cc 100644
> > --- a/drivers/clk/qcom/clk-rcg2.c
> > +++ b/drivers/clk/qcom/clk-rcg2.c
> > @@ -295,6 +295,9 @@ static int __clk_rcg2_configure(struct clk_rcg2 *rcg, const struct freq_tbl *f)
> >       cfg |= rcg->parent_map[index].cfg << CFG_SRC_SEL_SHIFT;
> >       if (rcg->mnd_width && f->n && (f->m != f->n))
> >               cfg |= CFG_MODE_DUAL_EDGE;
> > +     if (rcg->flags & HW_CLK_CTRL_MODE)
> > +             cfg |= CFG_HW_CLK_CTRL_MASK;
> > +
> >       return regmap_update_bits(rcg->clkr.regmap, RCG_CFG_OFFSET(rcg),
> >                                       mask, cfg);
> >  }
>
> What about code for handling other flags? If it's not a part of the series,
>
> I don't think it makes sense to define them. Or perhaps you sent the
>
> wrong revision?

I opted to add all of the flags just to document them existing, but
only introducing the ones that will immediately be used is the better
way to go.
