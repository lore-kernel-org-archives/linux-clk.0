Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91980C2B9F4
	for <linux-clk@archiver.kernel.org>; Thu, 17 Jun 2021 13:37:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 746EA613CE
	for <linux-clk@archiver.kernel.org>; Thu, 17 Jun 2021 13:37:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232870AbhFQNkE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 17 Jun 2021 09:40:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232860AbhFQNkA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 17 Jun 2021 09:40:00 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C19BDC0613A2
        for <linux-clk@vger.kernel.org>; Thu, 17 Jun 2021 06:37:48 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id e33so5019180pgm.3
        for <linux-clk@vger.kernel.org>; Thu, 17 Jun 2021 06:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8YG5vMsHcsKskVBXOdCn/5yj+uSIqvs9d62rb4CfcBI=;
        b=pAQrP36eVxCnDjZJVxSfZlsst+euC5ETQKztJTtQiBJe9y7pBMWSkiFCjOz31wersS
         qrYfyryK0ZF8gOBA6xEyKq8ssrKJ57JlRdRNBdALA8GvpnYhIdskDmJjPOtbsn57sQEQ
         MAqhrDNKLXIAh+9UJcBAoMSkddQu8eTG7hxpojJHHsuNKVWcNhXNh4O8MeyEhQQmiriH
         F8dgfcngNCnHBkwtMxg30itxCAN6hSZDR9ZiKAYWj8pcGwLIb732Fijq1WertcIKYNp7
         aLBJYJHuMAckljlO4LGMN1I+JFSiu5pzfY2TjvU2A5LbKPKGr94kswXqL7xVL4TNsFmF
         BA0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8YG5vMsHcsKskVBXOdCn/5yj+uSIqvs9d62rb4CfcBI=;
        b=jAvSN3BO2jTMgz69QxDNTue2xKHSjqzjNjMX/GP6mhpecTVkWPICOxPfKOChoIa187
         run/C5f1pyGNF5bHXM5X+gawj380CqsUxSkpE7+q+nlxkRxB5W/D3NriVRNl7TLZTeWb
         hwOfkk28PW2ThwL0qM8jNGCevhICYKVyFv+eVK7diTKevhICdbOXG/oYmOo1gGvgTNd0
         8nVldBAeAogrSXeMeTH+nab0owVQjtjqAzdEfebHPXUgzqSgAo0g21a2VsTH7YVeQwDZ
         ofgoICiojqPxzFuHA8SRkAGgw6kmNj2R/+gnMwRhjtxfo/BTEMvkoo4RkwtnReE7Fgbx
         nGzQ==
X-Gm-Message-State: AOAM532yl51diIPOigc+h49Bd4ZsxX293h1R7fg8QfBW+JOE2Fy6v1yB
        OOFPZ3SPzFa9JN5FoqSx02cRlhcB5AdFqWLnL4vA7A==
X-Google-Smtp-Source: ABdhPJxECzb3IPGjfMCeGl0qZ7eQVlp4fcsIfD2py++9U+ua348j/EMjO1vQQ/RlmIG0u4epWhC9GegcDa3f/NQsXSA=
X-Received: by 2002:a63:5a08:: with SMTP id o8mr982718pgb.120.1623937068323;
 Thu, 17 Jun 2021 06:37:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210616141107.291430-1-robert.foss@linaro.org>
 <20210616141107.291430-3-robert.foss@linaro.org> <b48198ff-a954-4941-32d6-65c992b345e7@linaro.org>
In-Reply-To: <b48198ff-a954-4941-32d6-65c992b345e7@linaro.org>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Thu, 17 Jun 2021 15:37:37 +0200
Message-ID: <CAG3jFyubcKP71_w83WWxTX9y3aTz+osTKxbq6Mo+hDTfxbf=WQ@mail.gmail.com>
Subject: Re: [RFC v1 02/11] clk: qcom: rcg2: Add support for flags
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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

On Wed, 16 Jun 2021 at 18:07, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
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
>
> Downstream also has these flags for 8250, but the upstream driver ended
> up not using them for the dispcc clocks. Could you please check that you
> realy need HW_CLK_CTRL for dispcc clocks?

HW_CLK_CTRL being flagged in dispcc causes the CFG_HW_CLK_CTRL flag to
be set in the RCG_CFG registers of dispcc.

This flag simply marks the clock as having hardware control enabled or disabled.

As for the question if it is really needed, I can't answer that since
no documentation or downstream comments explain the exact behaviour.
As far as I know the only way to figure out if it is required is
disabling the flag and checking for bugs. I did find this[1] patch,
which enabled HW_CLK_CTRL_MODE.

Should I err on the side of the downstream implementation, or try to
create a minimum functional driver based on the downstream driver?

[1] https://patchwork.kernel.org/project/linux-arm-msm/patch/1514877987-8082-2-git-send-email-anischal@codeaurora.org/
