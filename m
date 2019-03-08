Return-Path: <SRS0=0ksy=RL=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 100D0C43381
	for <linux-clk@archiver.kernel.org>; Fri,  8 Mar 2019 06:21:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CF67C20811
	for <linux-clk@archiver.kernel.org>; Fri,  8 Mar 2019 06:21:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BxbKtbnn"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726358AbfCHGVK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 8 Mar 2019 01:21:10 -0500
Received: from mail-qk1-f193.google.com ([209.85.222.193]:41475 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726329AbfCHGVK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 8 Mar 2019 01:21:10 -0500
Received: by mail-qk1-f193.google.com with SMTP id y15so10593746qki.8
        for <linux-clk@vger.kernel.org>; Thu, 07 Mar 2019 22:21:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wJt9KTqEs6PQ/4BCTlYdLFCrzchCw4x0e5cQ1YECBGE=;
        b=BxbKtbnn2Okxku+HH5kPqtvTDZf4c85eiZfk/e1uwTKj1NUThDKfaoOQ8o78fT70ka
         HuyA2ix+2trqd59FzZ1OcrcEby3hlyU25Jo/BBKnFjlXJjiel/JhrpizMvKjJwgCrWLn
         aooKtAmWXKGf6kCfKqTuh33caKKtN3cQtcKF0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wJt9KTqEs6PQ/4BCTlYdLFCrzchCw4x0e5cQ1YECBGE=;
        b=Fu8wf/2UtizzYgWUPKnMnBNasTqh8tF2UwX9S4sqYDOV3V0RphlThnDvqN8xSoxVNu
         9fqpK65A5KvvjNXKv1N1qZfy/NqFeeas26Tg3Y4V3d7HQBbAJzzNZ8mXciFXuuCDL6ys
         pVTxy1ZiNU4N926x2Ux7ZQECaZSUr1znROWCs1wUg+tpy3bvoj2wb4AKedkPvh/ML46U
         6ruRrNtFt9fF+TpAhE6wCF19pU7pPjT+DKI6ECfA04c3iKFS5H+eN7as9z0zTSXWloDS
         aXzjC8TZ1dRmLBwP0bB9YXoigToYpn8rQux9Giqtbq8gKs680mo9KrtdOxjsjooWXIfD
         PZDA==
X-Gm-Message-State: APjAAAVQYYdqr6skapi5SmxdvOlvJM/cfD9wA4pRiQoNNWxQc9rCjYfx
        jA38kltrtjrJjLXxGfUFGiYBexPb1vdy2W0eX+9wDA==
X-Google-Smtp-Source: APXvYqybJK5qXcEabDpsCMW8zALansvSkmLUu6sxPflep+rejmofeFNC/0wT4mTJ7Iajmg2ubwnFzfcfxpJZeEd3nNU=
X-Received: by 2002:ae9:ef05:: with SMTP id d5mr13058150qkg.323.1552026068798;
 Thu, 07 Mar 2019 22:21:08 -0800 (PST)
MIME-Version: 1.0
References: <20190305050546.23431-1-weiyi.lu@mediatek.com> <20190305050546.23431-8-weiyi.lu@mediatek.com>
In-Reply-To: <20190305050546.23431-8-weiyi.lu@mediatek.com>
From:   Nicolas Boichat <drinkcat@chromium.org>
Date:   Fri, 8 Mar 2019 14:20:57 +0800
Message-ID: <CANMq1KDzSpc6sam5wgUZX_vD4200WPnVs5CxQuu-CSV69ffArQ@mail.gmail.com>
Subject: Re: [PATCH v5 6/9] clk: mediatek: Add flags support for mtk_gate data
To:     Weiyi Lu <weiyi.lu@mediatek.com>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Rob Herring <robh@kernel.org>,
        James Liao <jamesjj.liao@mediatek.com>,
        Fan Chen <fan.chen@mediatek.com>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        lkml <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>, linux-clk@vger.kernel.org,
        srv_heupstream <srv_heupstream@mediatek.com>,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Mar 5, 2019 at 1:06 PM Weiyi Lu <weiyi.lu@mediatek.com> wrote:
>
> On some Mediatek platforms, there are critical clocks of
> clock gate type.
> To register clock gate with flags CLK_IS_CRITICAL,
> we need to add the flags field in mtk_gate data and register APIs.
>
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>

Reviewed-and-tested-by: Nicolas Boichat <drinkcat@chromium.org>

> ---
>  drivers/clk/mediatek/clk-gate.c | 5 +++--
>  drivers/clk/mediatek/clk-gate.h | 3 ++-
>  drivers/clk/mediatek/clk-mtk.c  | 3 ++-
>  drivers/clk/mediatek/clk-mtk.h  | 1 +
>  4 files changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/clk/mediatek/clk-gate.c b/drivers/clk/mediatek/clk-gate.c
> index 934bf0e45e26..85daf826619a 100644
> --- a/drivers/clk/mediatek/clk-gate.c
> +++ b/drivers/clk/mediatek/clk-gate.c
> @@ -157,7 +157,8 @@ struct clk *mtk_clk_register_gate(
>                 int clr_ofs,
>                 int sta_ofs,
>                 u8 bit,
> -               const struct clk_ops *ops)
> +               const struct clk_ops *ops,
> +               unsigned long flags)
>  {
>         struct mtk_clk_gate *cg;
>         struct clk *clk;
> @@ -168,7 +169,7 @@ struct clk *mtk_clk_register_gate(
>                 return ERR_PTR(-ENOMEM);
>
>         init.name = name;
> -       init.flags = CLK_SET_RATE_PARENT;
> +       init.flags = flags | CLK_SET_RATE_PARENT;
>         init.parent_names = parent_name ? &parent_name : NULL;
>         init.num_parents = parent_name ? 1 : 0;
>         init.ops = ops;
> diff --git a/drivers/clk/mediatek/clk-gate.h b/drivers/clk/mediatek/clk-gate.h
> index 72ef89b3ad7b..9f766dfe1d57 100644
> --- a/drivers/clk/mediatek/clk-gate.h
> +++ b/drivers/clk/mediatek/clk-gate.h
> @@ -47,6 +47,7 @@ struct clk *mtk_clk_register_gate(
>                 int clr_ofs,
>                 int sta_ofs,
>                 u8 bit,
> -               const struct clk_ops *ops);
> +               const struct clk_ops *ops,
> +               unsigned long flags);
>
>  #endif /* __DRV_CLK_GATE_H */
> diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
> index 9c0ae4278a94..35359e5397c7 100644
> --- a/drivers/clk/mediatek/clk-mtk.c
> +++ b/drivers/clk/mediatek/clk-mtk.c
> @@ -130,7 +130,8 @@ int mtk_clk_register_gates(struct device_node *node,
>                                 gate->regs->set_ofs,
>                                 gate->regs->clr_ofs,
>                                 gate->regs->sta_ofs,
> -                               gate->shift, gate->ops);
> +                               gate->shift, gate->ops,
> +                               gate->flags);
>
>                 if (IS_ERR(clk)) {
>                         pr_err("Failed to register clk %s: %ld\n",
> diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
> index 11b5517903d0..928905496c4b 100644
> --- a/drivers/clk/mediatek/clk-mtk.h
> +++ b/drivers/clk/mediatek/clk-mtk.h
> @@ -158,6 +158,7 @@ struct mtk_gate {
>         const struct mtk_gate_regs *regs;
>         int shift;
>         const struct clk_ops *ops;
> +       unsigned long flags;
>  };
>
>  int mtk_clk_register_gates(struct device_node *node,
> --
> 2.18.0
>
