Return-Path: <SRS0=Ex8p=P5=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7FB7C2F3A0
	for <linux-clk@archiver.kernel.org>; Mon, 21 Jan 2019 14:17:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9454520861
	for <linux-clk@archiver.kernel.org>; Mon, 21 Jan 2019 14:17:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729941AbfAUOR4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 21 Jan 2019 09:17:56 -0500
Received: from mail-vs1-f66.google.com ([209.85.217.66]:37160 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730713AbfAUORz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 21 Jan 2019 09:17:55 -0500
Received: by mail-vs1-f66.google.com with SMTP id n13so12706816vsk.4;
        Mon, 21 Jan 2019 06:17:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/wTUzcyGBlR7LmNro59iGM+yTVYXUvcFC5KOI1SHxvc=;
        b=XIs515/IKxM/nDsF05V7Bz0+EzwyzPgqgoRhWtimvW9uXqcbn+3+DHJlzvsNN8STsw
         Qd6WX0FnZIrqqj5BIw6JcrjDa/BL6uPR9VL8Bj5GXbidSzlFXgPRlJ5JEDtv+3yIfH2u
         PX/4o61WvZLdU/D3+xIzmp3ZnPeidfLNN4hDRfeOKTh7BvSngAKYm+B2D2CZZsN75DCj
         HZXoIcthUygPRXJS0QJ7/HNcyJZ2GOqL3Nl/b5KBgn1pKjjpoX/v5NPARQ2/M9Edi/dp
         KVb9V/Z2X7w5tBpbdAf1YORXDrTmhs/4JT3T2jfYfC0jvKKFG3heThHgsjZYrPnlXyeH
         iH6Q==
X-Gm-Message-State: AJcUukdkavuNarzITKb3K5b3dPKhKvT0g0ngt18ZhGvD1JwmsR15E6DM
        ZBP1iZbxp/WYy+kC3SJkm8QAfSsNWZ1dqfNyUVM=
X-Google-Smtp-Source: ALg8bN7OZ2FxQlrpJwc1Wh/O1LQ+19eBk4C96t84u3DXGXlY8iWuetSS3TlBdhyb4gVWGyWfmPY5yfvzg0l1dXAtC/0=
X-Received: by 2002:a67:d119:: with SMTP id u25mr11316013vsi.63.1548080273741;
 Mon, 21 Jan 2019 06:17:53 -0800 (PST)
MIME-Version: 1.0
References: <cfd91d1f-3b1e-c6c4-0975-7aac09383fdf@cogentembedded.com> <29eba2fe-942a-6b71-afc1-e30ac603f162@cogentembedded.com>
In-Reply-To: <29eba2fe-942a-6b71-afc1-e30ac603f162@cogentembedded.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 21 Jan 2019 15:17:42 +0100
Message-ID: <CAMuHMdWkozXDOzPHVwQz+LG32mZ8dxzbrQa6tVwLWALwzSRUaA@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] clk: renesas: rcar-gen3-cpg: add RPC clocks
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

On Tue, Dec 4, 2018 at 8:51 PM Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> The RPCSRC internal clock is controlled by the RPCCKCR.DIV[4:3] on all
> the R-Car gen3 SoCs except V3M (R8A77970) but the encoding of this field
> is different between SoCs; it makes sense to support the most common case
> of this encoding in the R-Car gen3 CPG driver...
>
> After adding the RPCSRC clock, we can add the RPC[D2] clocks derived from
> it and controlled by the RPCCKCR register on all the R-Car gen3 SoCs except
> V3M (R8A77970); the composite clock driver seems handy for this task, using
> the spinlock added in the previous patch...
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>
> ---
> Changes in version 2:
> - merged in the RPCD2 clock support from the next patch;
> - moved in the RPCSRC clock support from the R8A77980 CPG/MSSR driver patch;
> - switched the RPC and RPCSD2 clock support to the composite clock driver;
> - changed the 1st parameter of cpg_rpc[d2]_clk_register();
> - rewrote the patch description, renamed the patch.

Thanks for the update!

> --- renesas-drivers.orig/drivers/clk/renesas/rcar-gen3-cpg.c
> +++ renesas-drivers/drivers/clk/renesas/rcar-gen3-cpg.c
> @@ -415,6 +415,90 @@ free_clock:
>         return clk;
>  }
>
> +struct rpc_clock {
> +       struct clk_divider div;
> +       struct clk_gate gate;
> +       struct cpg_simple_notifier csn;
> +};
> +
> +static const struct clk_div_table cpg_rpcsrc_div_table[] = {
> +       { 2, 5 }, { 3, 6 }, { 0, 0 },
> +};
> +
> +static const struct clk_div_table cpg_rpc_div_table[] = {
> +       { 1, 2 }, { 3, 4 }, { 5, 6 }, { 7, 8 }, { 0, 0 },
> +};
> +
> +static struct clk * __init cpg_rpc_clk_register(const char *name,
> +       void __iomem *base, const char *parent_name,
> +       struct raw_notifier_head *notifiers)
> +{
> +       struct rpc_clock *rpc;
> +       struct clk *clk;
> +
> +       rpc = kzalloc(sizeof(*rpc), GFP_KERNEL);
> +       if (!rpc)
> +               return ERR_PTR(-ENOMEM);
> +
> +       rpc->div.reg = base + CPG_RPCCKCR;
> +       rpc->div.width = 3;
> +       rpc->div.table = cpg_rpc_div_table;
> +       rpc->div.lock = &cpg_lock;
> +
> +       rpc->gate.reg = base + CPG_RPCCKCR;
> +       rpc->gate.bit_idx = 8;
> +       rpc->gate.flags = CLK_GATE_SET_TO_DISABLE;
> +       rpc->gate.lock = &cpg_lock;
> +
> +       rpc->csn.reg = base + CPG_RPCCKCR;
> +
> +       clk = clk_register_composite(NULL, name, &parent_name, 1, NULL, NULL,
> +                                    &rpc->div.hw,  &clk_divider_ops,
> +                                    &rpc->gate.hw, &clk_gate_ops, 0);
> +       if (IS_ERR(clk))
> +               kfree(rpc);
> +
> +       cpg_simple_notifier_register(notifiers, &rpc->csn);
> +       return clk;
> +}
> +
> +static struct clk * __init cpg_rpcd2_clk_register(const char *name,
> +                                                 void __iomem *base,
> +                                                 const char *parent_name)
> +{
> +       struct clk_fixed_factor *fixed;
> +       struct clk_gate *gate;
> +       struct clk *clk;
> +
> +       fixed = kzalloc(sizeof(*fixed), GFP_KERNEL);
> +       if (!fixed)
> +               return ERR_PTR(-ENOMEM);
> +
> +       fixed->mult = 1;
> +       fixed->div = 2;
> +
> +       gate = kzalloc(sizeof(*gate), GFP_KERNEL);
> +       if (!gate) {
> +               kfree(fixed);
> +               return ERR_PTR(-ENOMEM);
> +       }

Why allocate two separate structures here, instead of grouping them in a
single struct rpcd2_clock structure, like for the RPC clock?

> +
> +       gate->reg = base + CPG_RPCCKCR;
> +       gate->bit_idx = 9;
> +       gate->flags = CLK_GATE_SET_TO_DISABLE;
> +       gate->lock = &cpg_lock;
> +
> +       clk = clk_register_composite(NULL, name, &parent_name, 1, NULL, NULL,
> +                                    &fixed->hw, &clk_fixed_factor_ops,
> +                                    &gate->hw,  &clk_gate_ops, 0);
> +       if (IS_ERR(clk)) {
> +               kfree(fixed);
> +               kfree(gate);
> +       }

I first wondered why there's no notifier to save/restore the clock during system
PSCI suspend/resume, until I realized the RPC and RPCD2 clocks share the
same hardware register, so saving/restoring the register once is sufficient.
A comment (in struct rpc_clock?) explaining that would be appreciated.

The rest looks good to me.
Using the composite clock seems to have reduced LoC by ca. 60%, nice!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
