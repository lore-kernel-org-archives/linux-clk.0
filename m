Return-Path: <SRS0=Vu82=QB=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E334C282C7
	for <linux-clk@archiver.kernel.org>; Fri, 25 Jan 2019 10:25:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 484EE218B0
	for <linux-clk@archiver.kernel.org>; Fri, 25 Jan 2019 10:25:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727618AbfAYKZe (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 25 Jan 2019 05:25:34 -0500
Received: from mail-vk1-f196.google.com ([209.85.221.196]:45947 "EHLO
        mail-vk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726562AbfAYKZd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 25 Jan 2019 05:25:33 -0500
Received: by mail-vk1-f196.google.com with SMTP id n126so2000928vke.12;
        Fri, 25 Jan 2019 02:25:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yeVcUot33XC2zLeZeowpyknFk1SPQwl9q2Uqa+xj3/0=;
        b=Kt8LuUp2IWbhP10gb6BXPyJ/gm+7QYU0MWjcIQyr3jZMi19UQ1vB/jjtflP2F4DSXu
         DNdx/+7HjDIO2GfaFAzStoZlsvViYZp4Xpn8JRVNWDHYuZAN8FQS9FQWUJqSwEWnnC3W
         xADWgcBs/qRGe5nVSvPeRty6CVRV1dT0dlrcPyURirGvSV8qm2OzXeijTdhvay/G6ZxI
         UwDOICK4GUZEXRXCyJxSDXhgm6Ms4suJtkY2o1kjVUtJHZ4zpg8pqst1jhbcsBskAFQL
         zf7093JBsZnYO60TgNmBPYI+e0Wd+Gu0eRU8frmWzpwosFJP5QHJoCnIWzeEV1hGrLwq
         n1/Q==
X-Gm-Message-State: AJcUukdVAABBRPv2w+6+qMqgEVXENk9W1MQOpxmHh6LfZ/Z/4qw3sk5Z
        B7bAAjuP0eplHjzVz8AINx5j2nL8C+W+zfoRb9g=
X-Google-Smtp-Source: ALg8bN5JUibmT15KyVarRlSf0sfQuSA1Y1zCkaI17rIBhgX2BrRFc0ZttXYPO37h84n2x1KFQVlBD47hAzvJ+hunxt8=
X-Received: by 2002:a1f:a414:: with SMTP id n20mr4213626vke.83.1548411932108;
 Fri, 25 Jan 2019 02:25:32 -0800 (PST)
MIME-Version: 1.0
References: <f1c53dd5-2dc5-9f11-44e3-8e222ed21903@cogentembedded.com> <5c5dbf41-16a9-9d1a-8a29-997906696045@cogentembedded.com>
In-Reply-To: <5c5dbf41-16a9-9d1a-8a29-997906696045@cogentembedded.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 25 Jan 2019 11:25:20 +0100
Message-ID: <CAMuHMdXc=Ed0P7Wrh8ttaGtPZc3UkUgxD0U+WThb1kAWWLkPHg@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] clk: renesas: rcar-gen3-cpg: add RPC clocks
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

On Tue, Jan 22, 2019 at 8:59 PM Sergei Shtylyov
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
> Changes in version 3:
> - added 'struct rpcd2_clock' embracing both 'struct clk_fixed_factor' and
>   'struct clk_gate' to reduce the # of kzalloc() calls;
> - added a comment about the single notifier to 'struct rpc_clock';
> - refreshed the patch.

Thanks for the update!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- renesas-drivers.orig/drivers/clk/renesas/rcar-gen3-cpg.c
> +++ renesas-drivers/drivers/clk/renesas/rcar-gen3-cpg.c

> +struct rpc2_clock {

rpcd2

> +       struct clk_fixed_factor fixed;
> +       struct clk_gate gate;
> +};
> +
> +static struct clk * __init cpg_rpcd2_clk_register(const char *name,
> +                                                 void __iomem *base,
> +                                                 const char *parent_name)
> +{
> +       struct rpc2_clock *rpc2;

rpcd2 (twice)

No need to resend, fixing up while applying.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
