Return-Path: <SRS0=uK82=OC=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96AEAC43441
	for <linux-clk@archiver.kernel.org>; Fri, 23 Nov 2018 12:58:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 668F0206B2
	for <linux-clk@archiver.kernel.org>; Fri, 23 Nov 2018 12:58:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 668F0206B2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387910AbeKWXm7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 23 Nov 2018 18:42:59 -0500
Received: from mail-vs1-f68.google.com ([209.85.217.68]:42917 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731971AbeKWXm7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 23 Nov 2018 18:42:59 -0500
Received: by mail-vs1-f68.google.com with SMTP id b74so7106470vsd.9;
        Fri, 23 Nov 2018 04:58:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=W0Pov1+qPr/5hXeoB3wtQKBf6rMJwy+/6lOz2WhJZmM=;
        b=duuBgnoAiAJPuujEjkVqUElbcEM9XuAnuJd5AJbiKkLv8Kd1hoHsdXB50ZWlWCU775
         evdQsrXP3MoNF3RF2bbS4k75J3GfP1p/GYkcBHfnU3VP/wLqoCHSAeGNkpAsBh7ISUQj
         wEJJwqczRATJLQI+EviVADLj4qZxyPVJ0Rxlt/4ImRa/LcFgUsHCJ1DSVcPRj/9LK2L8
         s7sBnbfSY1bD5Gme9v2tbIXND5hC3or0N+CmcWLmwUwDoW1xjXP3y5WPQjZxrLRLvYQ5
         weE+bSdcYSmaTfksb0fCUSTVqiv65wDIGvIo0PkslDRJtJYFSVzsAE1X/bks9ER6JNZh
         30Hw==
X-Gm-Message-State: AGRZ1gL7UxH3PsSTTpAkbrILapPLULr4Hrx6ovJigAZo4trh3RVp68xX
        4UFqox5gBoIz2IKVyfORZQqgPfCdgHownote9XM=
X-Google-Smtp-Source: AJdET5f47H8RL800jj7reMhRn1UguQHpaUjen6pn6Fna2h1XloQVltbgrwSrkArAN4Dc9c78QOllRQmbjjJcnYOBACA=
X-Received: by 2002:a67:b60d:: with SMTP id d13mr6698745vsm.152.1542977932257;
 Fri, 23 Nov 2018 04:58:52 -0800 (PST)
MIME-Version: 1.0
References: <c79d3733-437a-55dc-d946-99521b79ec20@cogentembedded.com> <71808cdc-c95b-8ba2-10aa-01f6a6af7cf1@cogentembedded.com>
In-Reply-To: <71808cdc-c95b-8ba2-10aa-01f6a6af7cf1@cogentembedded.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 23 Nov 2018 13:58:40 +0100
Message-ID: <CAMuHMdXiUomHV_3+DFuD64dFFjD5fABZVDOi3RXqZzw9YH5caw@mail.gmail.com>
Subject: Re: [PATCH 3/4] clk: renesas: rcar-gen3-cpg: add RPCD2 clock
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Sergei,

On Thu, Nov 22, 2018 at 7:43 PM Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Add the RPCD2 clock for the R-Car gen3 SoCs -- this clock is en/disabled
> via the RPCCKCR register on all the R-Car gen3 SoCs except V3M (R8A77970)
> and has a fixed divisor of 2 (applied to the RPC clock).
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Thanks for your patch!

> --- renesas-drivers.orig/drivers/clk/renesas/rcar-gen3-cpg.c
> +++ renesas-drivers/drivers/clk/renesas/rcar-gen3-cpg.c
> @@ -524,6 +524,89 @@ static struct clk * __init cpg_rpc_clk_r
>         return clk;
>  }
>
> +static int cpg_rpcd2_clock_enable(struct clk_hw *hw)
> +{
> +       struct rpc_clock *clock = to_rpc_clock(hw);
> +
> +       cpg_reg_modify(clock->reg, CPG_RPC_CKSTP2, 0);
> +
> +       return 0;
> +}
> +
> +static void cpg_rpcd2_clock_disable(struct clk_hw *hw)
> +{
> +       struct rpc_clock *clock = to_rpc_clock(hw);
> +
> +       cpg_reg_modify(clock->reg, 0, CPG_RPC_CKSTP2);
> +}
> +
> +static int cpg_rpcd2_clock_is_enabled(struct clk_hw *hw)
> +{
> +       struct rpc_clock *clock = to_rpc_clock(hw);
> +
> +       return !(readl(clock->reg) & CPG_RPC_CKSTP2);
> +}

As the above 3 functions are identical to their rpc_*() counterparts,
except for the bit touched, would it make sense to share them, e.g. by
storing the bit number in struct rpc_clock?

> +static long cpg_rpcd2_round_rate(struct clk_hw *hw, unsigned long rate,
> +                                unsigned long *parent_rate)
> +{
> +       return *parent_rate / 2;

Given you set CLK_SET_RATE_PARENT, shouldn't you propagate up,
cfr. drivers/clk/clk-fixed-factor.c:clk_factor_round_rate()?

> +}

> +static struct clk * __init cpg_rpcd2_clk_register(const struct cpg_core_clk *core,
> +                                               void __iomem *base,
> +                                               const char *parent_name)
> +{
> +       struct clk_init_data init;
> +       struct rpc_clock *clock;
> +       struct clk *clk;
> +
> +       clock = kzalloc(sizeof(*clock), GFP_KERNEL);
> +       if (!clock)
> +               return ERR_PTR(-ENOMEM);
> +
> +       init.name = core->name;
> +       init.ops = &cpg_rpcd2_clock_ops;
> +       init.flags = CLK_IS_BASIC | CLK_SET_RATE_PARENT;

I don't think CLK_IS_BASIC is appropriate?

#define CLK_IS_BASIC            BIT(5) /* Basic clk, can't do a to_clk_foo() */

Given RPCD2 is the combination of a gate and fixed-divider clock, would
it make sense to use clk_composite?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
