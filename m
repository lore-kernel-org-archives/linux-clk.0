Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29EDDC433EF
	for <linux-clk@archiver.kernel.org>; Wed, 16 Mar 2022 10:46:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355199AbiCPKrX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 16 Mar 2022 06:47:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349442AbiCPKrX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 16 Mar 2022 06:47:23 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AB8D6353A
        for <linux-clk@vger.kernel.org>; Wed, 16 Mar 2022 03:46:07 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id g17so3072743lfh.2
        for <linux-clk@vger.kernel.org>; Wed, 16 Mar 2022 03:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GteVWLltyK5Jm3+PPqUFpGc+wNqzAaaXRGKL8n97SG4=;
        b=BUZw5e7LEn7GEHouUIwY6FKJIKkdPJTENZkyseYtgEWUXCnQnmkiLqzDYKLqcLq8Rj
         hHIYP/XWTPhDgTPME9+bHo7P4h6vpbfnCIbC9VRNYcVKrTnj8iYHM3yLTAA9FRD1pdg5
         cQTE8ecKbPcHH82NEHlNq4+VAXw3hPZyKiQKbwkei6edZbZ+PWNvNAObOnW6wwp1CxEW
         WXIXmTkzgciTsQjnVZjzGabv8LXS1bkD4kSOdWOAtdabDsqEFYBQ92NcwogcDH8lQZjl
         TkvOod4EauvE3CZlLyE5iQxCHQZtkqr1Jg0DIES6b8xR4sq5K6aJ+HS/V99Uk9O+Ogp4
         mXqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GteVWLltyK5Jm3+PPqUFpGc+wNqzAaaXRGKL8n97SG4=;
        b=Hd5z9iBUoPZDsd8oOju6Y2rrmynX1ObibfvcS2aAYC1yMymF/oB0n/0Vc8xWoBh+pX
         Pxj0aUQETUB0ESCn9keTTgiz/+GwmLo8LuRkGz91w3G3qUK/h547Lg6gBdT+zprkK+y3
         JYSzVElhcsySeqKgMUQkwkidIqNZiaBpo2SWK/SEaQN6z4ojaX1qDMf/y51e9x+uA8p9
         FdPzuC2lwBfuo7FmympUiJW/W7wSik+PutR/nGg4aNXwt9oEdEu0rFV3Ur1JAJIf/Oxh
         e0NJ8hZTuzVh5n/ZZvFI/HrLO3uqwcw9IYDq+HKvhfzoGd8iwhJ6vla9DGWQjT0ioDqI
         C5ZA==
X-Gm-Message-State: AOAM533UAxbJHQSJJYyQg1Z9DVaPvobUmGg6h0qJSvdlZIghbXp9aIsC
        6o73zy3x0sJYsC8cN6h09BnfRnnf3zCGWQTq1lzhbQ==
X-Google-Smtp-Source: ABdhPJwzs6cfjG1RsK5PU9KcqMqRftnVfbjOUKEeVJGSdrn27baM8pVzLXoTaCgWMMnm2oxC8D3tsQOKtnmZFqMK8Vg=
X-Received: by 2002:a05:6512:3e0c:b0:448:3480:1fe5 with SMTP id
 i12-20020a0565123e0c00b0044834801fe5mr19016208lfv.358.1647427565349; Wed, 16
 Mar 2022 03:46:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220313232926.1004842-1-linus.walleij@linaro.org>
 <20220313232926.1004842-2-linus.walleij@linaro.org> <20220315222049.DA563C340E8@smtp.kernel.org>
In-Reply-To: <20220315222049.DA563C340E8@smtp.kernel.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Wed, 16 Mar 2022 11:45:29 +0100
Message-ID: <CAPDyKFrpN3+4aEqQzkQJjOT0VaNEbNhFbSWXH1uP5aNfVRYXWw@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: ux500: Implement the missing CLKOUT clocks
To:     Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 15 Mar 2022 at 23:20, Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Linus Walleij (2022-03-13 16:29:26)
> > diff --git a/drivers/clk/ux500/clk-prcmu.c b/drivers/clk/ux500/clk-prcmu.c
> > index 937b6bb82b30..e6a27c917126 100644
> > --- a/drivers/clk/ux500/clk-prcmu.c
> > +++ b/drivers/clk/ux500/clk-prcmu.c
> > @@ -14,6 +14,7 @@
> >  #include "clk.h"
> >
> >  #define to_clk_prcmu(_hw) container_of(_hw, struct clk_prcmu, hw)
> > +#define to_clk_prcmu_clkout(_hw) container_of(_hw, struct clk_prcmu_clkout, hw)
> >
> >  struct clk_prcmu {
> >         struct clk_hw hw;
> > @@ -23,6 +24,15 @@ struct clk_prcmu {
> >         int opp_requested;
> >  };
> >
> > +struct clk_prcmu_clkout {
> > +       struct clk_hw hw;
> > +       u8 clkout_id;
> > +       u8 source;
> > +       u8 divider;
> > +       int is_prepared;
> > +       int is_enabled;
> > +};
> > +
> >  /* PRCMU clock operations. */
> >
> >  static int clk_prcmu_prepare(struct clk_hw *hw)
> > @@ -344,3 +354,144 @@ struct clk *clk_reg_prcmu_opp_volt_scalable(const char *name,
> >         return clk_reg_prcmu(name, parent_name, cg_sel, rate, flags,
> >                         &clk_prcmu_opp_volt_scalable_ops);
> >  }
> > +
> > +/* The clkout (external) clock is special and need special ops */
> > +
> > +static int clk_prcmu_clkout_prepare(struct clk_hw *hw)
> > +{
> > +       struct clk_prcmu_clkout *clk = to_clk_prcmu_clkout(hw);
> > +       int ret;
> > +
> > +       ret = prcmu_config_clkout(clk->clkout_id, clk->source, clk->divider);
> > +       if (!ret)
> > +               clk->is_prepared = 1;
> > +
> > +       return ret;
> > +}
> > +
> > +static void clk_prcmu_clkout_unprepare(struct clk_hw *hw)
> > +{
> > +       struct clk_prcmu_clkout *clk = to_clk_prcmu_clkout(hw);
> > +       int ret;
> > +
> > +       /* The clkout clock is disabled by dividing by 0 */
> > +       ret = prcmu_config_clkout(clk->clkout_id, clk->source, 0);
> > +       if (!ret)
> > +               clk->is_prepared = 0;
> > +}
> > +
> > +static int clk_prcmu_clkout_is_prepared(struct clk_hw *hw)
> > +{
> > +       struct clk_prcmu_clkout *clk = to_clk_prcmu_clkout(hw);
> > +       return clk->is_prepared;
> > +}
> > +
> > +static int clk_prcmu_clkout_enable(struct clk_hw *hw)
> > +{
> > +       struct clk_prcmu_clkout *clk = to_clk_prcmu_clkout(hw);
> > +       clk->is_enabled = 1;
>
> If this isn't reading the hardware then we can just let the core figure
> it out and remove these functions and 'is_enabled'/'is_prepared'
> variables.
>
> > +       return 0;
> > +}
> > +
> > +static void clk_prcmu_clkout_disable(struct clk_hw *hw)
> > +{
> > +       struct clk_prcmu_clkout *clk = to_clk_prcmu_clkout(hw);
> > +       clk->is_enabled = 0;
> > +}
> > +
> > +static int clk_prcmu_clkout_is_enabled(struct clk_hw *hw)
> > +{
> > +       struct clk_prcmu_clkout *clk = to_clk_prcmu_clkout(hw);
> > +       return clk->is_enabled;
> > +}
> > +
> > +static unsigned long clk_prcmu_clkout_recalc_rate(struct clk_hw *hw,
> > +                                                 unsigned long parent_rate)
> > +{
> > +       struct clk_prcmu_clkout *clk = to_clk_prcmu_clkout(hw);
> > +
> > +       if (!clk->divider)
> > +               return 0;
> > +       return (parent_rate / clk->divider);
> > +}
> > +
> > +static u8 clk_prcmu_clkout_get_parent(struct clk_hw *hw)
> > +{
> > +       struct clk_prcmu_clkout *clk = to_clk_prcmu_clkout(hw);
> > +       return clk->source;
> > +}
> > +
> > +static int clk_prcmu_clkout_set_parent(struct clk_hw *hw, u8 index)
> > +{
> > +       struct clk_prcmu_clkout *clk = to_clk_prcmu_clkout(hw);
> > +
> > +       clk->source = index;
> > +       /* Make sure the change reaches the hardware immediately */
> > +       if (clk->is_prepared)
> > +               return clk_prcmu_clkout_prepare(hw);
> > +       return 0;
> > +}
> > +
> > +static const struct clk_ops clk_prcmu_clkout_ops = {
> > +       .prepare = clk_prcmu_clkout_prepare,
> > +       .unprepare = clk_prcmu_clkout_unprepare,
> > +       .is_prepared = clk_prcmu_clkout_is_prepared,
> > +       .enable = clk_prcmu_clkout_enable,
> > +       .disable = clk_prcmu_clkout_disable,
> > +       .is_enabled = clk_prcmu_clkout_is_enabled,
> > +       .recalc_rate = clk_prcmu_clkout_recalc_rate,
> > +       .get_parent = clk_prcmu_clkout_get_parent,
> > +       .set_parent = clk_prcmu_clkout_set_parent,
> > +};
> > +
> > +struct clk *clk_reg_prcmu_clkout(const char *name,
> > +                                const char **parent_names, int num_parents,
> > +                                u8 source, u8 divider)
> > +
> > +{
> > +       struct clk_prcmu_clkout *clk;
> > +       struct clk_init_data clk_prcmu_clkout_init;
> > +       struct clk *clk_reg;
> > +       u8 clkout_id;
> > +
> > +       if (!name) {
> > +               pr_err("clk_prcmu_clkout: %s invalid arguments passed\n", __func__);
> > +               return ERR_PTR(-EINVAL);
> > +       }
> > +
> > +       if (!strcmp(name, "clkout1"))
> > +               clkout_id = 0;
> > +       else if (!strcmp(name, "clkout2"))
> > +               clkout_id = 1;
> > +       else {
> > +               pr_err("clk_prcmu_clkout: %s bad clock name\n", __func__);
> > +               return ERR_PTR(-EINVAL);
> > +       }
> > +
> > +       clk = kzalloc(sizeof(*clk), GFP_KERNEL);
> > +       if (!clk)
> > +               return ERR_PTR(-ENOMEM);
> > +
> > +       clk->clkout_id = clkout_id;
> > +       clk->is_prepared = 1;
> > +       clk->is_enabled = 1;
> > +       clk->source = source;
> > +       clk->divider = divider;
> > +
> > +       clk_prcmu_clkout_init.name = name;
> > +       clk_prcmu_clkout_init.ops = &clk_prcmu_clkout_ops;
> > +       clk_prcmu_clkout_init.flags = CLK_GET_RATE_NOCACHE;
> > +       clk_prcmu_clkout_init.parent_names = parent_names;
> > +       clk_prcmu_clkout_init.num_parents = num_parents;
> > +       clk->hw.init = &clk_prcmu_clkout_init;
> > +
> > +       clk_reg = clk_register(NULL, &clk->hw);
>
> Please use clk_hw_register()

I was just about to send a comment like this. I assume Linus just
tried to be consistent with the existing code in this file (which has
turned into being quite old nowadays).

So, I think, either we should start by converting the existing code to
use clk_hw_register() and then make these changes on top - or we allow
Linus $subject patch to use clk_register() and on top we convert over
to use clk_hw_register(), for the entire file/driver. I am fine either
way.

Linus, I am happy to help with this, just tell me.

[...]

Kind regards
Uffe
