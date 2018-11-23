Return-Path: <SRS0=uK82=OC=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 183E5C43441
	for <linux-clk@archiver.kernel.org>; Fri, 23 Nov 2018 13:00:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D775D206B2
	for <linux-clk@archiver.kernel.org>; Fri, 23 Nov 2018 13:00:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D775D206B2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394774AbeKWXoL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 23 Nov 2018 18:44:11 -0500
Received: from mail-ua1-f66.google.com ([209.85.222.66]:35073 "EHLO
        mail-ua1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731971AbeKWXoL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 23 Nov 2018 18:44:11 -0500
Received: by mail-ua1-f66.google.com with SMTP id d2so4078272ual.2;
        Fri, 23 Nov 2018 05:00:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BEcsmH44FvN/opBTDUsgZ+tIPxYr/sDbW4ia5c5nM/8=;
        b=h9GQ7TjgkqtgRe7at8jpwBLz8oCjdIgeBiTaQcikHPMlcEkzvKolSmt4WXJmbydcsd
         RMGvNcqXyB1p7G0/LJbJvKsy4wYlP66SlawTW7G9VP1g/gW9aOFRvQlJXl/vdPeMEURr
         +Ub+3leDFEzgMYIUUA9PL/4DXqr8K2Upnbmqq9icET6NiHTLDOQ3pbjDiH9K0OWp2xaA
         beME/XhHV2ZA4HZM1MlT+RlGvTZTSA4FI/ZobGuSmHtlkYFPvF5XiVmlaihCHAJUsgmg
         q0KNf+TGkMPfej+aKlrqslpHmMejuC24gFRpELdwFAd5Kjp/FfHoHEb07p3gvVU4xD0O
         JNiA==
X-Gm-Message-State: AA+aEWaDssjWwTRKBf/rJ7nMQewDaCKr4n18QV66ACo0QlgkAZJdwRxK
        UjX9EowuxkWOROwI7I2tnAuwzWjNDg6T0vK+ZHg=
X-Google-Smtp-Source: AFSGD/Vpn5AeNQD6RC8glhmKwr7ih5oi/3d4xqOdzt4Y/Ozes9M1odWfaoKNF8Zc9kJ8g9kFZLEES9O3QyEyefoQYgI=
X-Received: by 2002:ab0:210e:: with SMTP id d14mr6594605ual.20.1542978004911;
 Fri, 23 Nov 2018 05:00:04 -0800 (PST)
MIME-Version: 1.0
References: <c79d3733-437a-55dc-d946-99521b79ec20@cogentembedded.com> <0e51165d-65cb-1522-3174-b63818180070@cogentembedded.com>
In-Reply-To: <0e51165d-65cb-1522-3174-b63818180070@cogentembedded.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 23 Nov 2018 13:59:52 +0100
Message-ID: <CAMuHMdX6n860T9oOgYiqxiF0QpNyKqEtQW9yEksAv_A02Z9qRw@mail.gmail.com>
Subject: Re: [PATCH 4/4] clk: renesas: r8a77980-cpg-mssr: add RPC clocks
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

Thanks for your patch!

On Thu, Nov 22, 2018 at 7:45 PM Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Add the RPCSRC internal clock on R-Car V3H (R8A77980) -- it's controlled
> by the RPCCKCR.DIV[4:3] on all the R-Car gen3 SoCs except V3M (R8A77970)
> but the encoding of this field is different between SoCs.

Given the tables and encoding are the same on H3, M3-W, M3-N, and V3H,
I think it makes sense to move the common support to rcar-gen3-cpg.c.

Heck, you could even just select a different table on D3/E3 using
soc_device_match(), if only one encoding would not select a different parent
clock :-(

> Add the RPC[D2] clocks (derived from this internal clock) and the RPC-IF
> module clock as well...
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

> --- renesas-drivers.orig/drivers/clk/renesas/r8a77980-cpg-mssr.c
> +++ renesas-drivers/drivers/clk/renesas/r8a77980-cpg-mssr.c

> @@ -21,6 +22,10 @@
>  #include "renesas-cpg-mssr.h"
>  #include "rcar-gen3-cpg.h"
>
> +enum r8a77980_clk_types {
> +       CLK_TYPE_R8A77980_RPCSRC = CLK_TYPE_GEN3_SOC_BASE,

Rename and move to rcar_gen3_clk_types?

> @@ -215,6 +232,27 @@ static int __init r8a77980_cpg_mssr_init
>         return rcar_gen3_cpg_init(cpg_pll_config, CLK_EXTALR, cpg_mode);
>  }
>
> +static struct clk * __init r8a77980_cpg_clk_register(struct device *dev,
> +       const struct cpg_core_clk *core, const struct cpg_mssr_info *info,
> +       struct clk **clks, void __iomem *base,
> +       struct raw_notifier_head *notifiers)
> +{
> +       if (core->type == CLK_TYPE_R8A77980_RPCSRC) {

I'd use a switch() statement here, for consistency with other drivers.

> +               const struct clk *parent = clks[core->parent];
> +
> +               if (IS_ERR(parent))
> +                       return ERR_CAST(parent);
> +
> +               return clk_register_divider_table(NULL, core->name,
> +                                                 __clk_get_name(parent), 0,
> +                                                 base + CPG_RPCCKCR, 3, 2, 0,
> +                                                 cpg_rpcsrc_div_table, NULL);

Don't you need a spinlock (last parameter, currently NULL)?
This needs to be synchronized with controlling the RPCD2 and RPC clocks,
as they operate on the same register.

However, that would deadlock, as enabling e.g. RPC-IF will enable
all parent clocks?

> +       } else  {
> +               return rcar_gen3_cpg_clk_register(dev, core, info, clks, base,
> +                                                 notifiers);
> +       }

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
