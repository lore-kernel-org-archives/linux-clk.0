Return-Path: <SRS0=Lp8A=MI=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9439DC43382
	for <linux-clk@archiver.kernel.org>; Wed, 26 Sep 2018 09:27:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4F6FB2086E
	for <linux-clk@archiver.kernel.org>; Wed, 26 Sep 2018 09:27:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F6FB2086E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727675AbeIZPjV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 26 Sep 2018 11:39:21 -0400
Received: from mail-vk1-f195.google.com ([209.85.221.195]:37074 "EHLO
        mail-vk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727672AbeIZPjV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 26 Sep 2018 11:39:21 -0400
Received: by mail-vk1-f195.google.com with SMTP id 79-v6so5495919vkm.4;
        Wed, 26 Sep 2018 02:27:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fInjVqM0c9DsAk+hXSs3mIfSDfm4JgxcQHqFsmdG700=;
        b=VTjSE+Na4CuKuUIsOc18xCaTobP7+JaWU82Ekjb4SMywTMKuvcwQf1b+AGlrAosGV2
         w+ZbgL/5ysonYo0sjvxiZG+7U3VIH141o6Hm4dRcz6pIizo4nDPkQeDv4FKwbDunNPPe
         UiyCwSIXhR7MJHLF9zIgTPAWaCZzHXASDaKJec2aLi7VGe0Z72XdPdD1cX1xotMhPNww
         9EjLMmgjzoleElcLZIUL9HXVLisojkvO/z71mlQn68HWmdFsfbaiJ4+JcDqkP7drOETX
         Hpq2054Sh2w1/IPlqcNn5YEJlhvB0ygnTdVvnziOCOm8bZRZQAbruAo6+tuXajS0ZVQI
         4U4w==
X-Gm-Message-State: ABuFfoh+s5+/8Ik3FSMp6u5AsFbWG/td4GVBMZOniw+jqKR+vd7xGM+6
        XYjnk/E+rlbFTtQpG/XY7+rieCGj/d3DGX5m90o=
X-Google-Smtp-Source: ACcGV60SKAw+SzbDF48b626x2GE5jNwXwTHZ7PXtVkhnOq8EQMrCqQIiuSXcEf/TDfZrCA3ikw7Os0gSiKt2rCpSxkM=
X-Received: by 2002:a1f:2ad6:: with SMTP id q205-v6mr1508170vkq.83.1537954038926;
 Wed, 26 Sep 2018 02:27:18 -0700 (PDT)
MIME-Version: 1.0
References: <20180924164937.36536-1-chris.brandt@renesas.com> <20180924164937.36536-4-chris.brandt@renesas.com>
In-Reply-To: <20180924164937.36536-4-chris.brandt@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 26 Sep 2018 11:27:06 +0200
Message-ID:
 <CAMuHMdXRWRvxNb12GPDi-agEFhLg3_Cnukm6LwapFdaT8Fpddg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] clk: renesas: r7s9210: Move table update to
 separate function
To:     Chris Brandt <chris.brandt@renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org
Message-ID: <20180926092706.B7T9lIKaA-2-_bIeyOVJo_u8FEZI_bzkZ8QueTv1j7g@z>

On Mon, Sep 24, 2018 at 6:50 PM Chris Brandt <chris.brandt@renesas.com> wrote:
> Same functionality, just easier to read.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> ---
>  drivers/clk/renesas/r7s9210-cpg-mssr.c | 94 ++++++++++++++++++----------------
>  1 file changed, 49 insertions(+), 45 deletions(-)
>
> diff --git a/drivers/clk/renesas/r7s9210-cpg-mssr.c b/drivers/clk/renesas/r7s9210-cpg-mssr.c
> index 7ab9030ef8b9..f9c22b61883b 100644
> --- a/drivers/clk/renesas/r7s9210-cpg-mssr.c
> +++ b/drivers/clk/renesas/r7s9210-cpg-mssr.c
> @@ -97,6 +97,53 @@ static const struct mssr_mod_clk r7s9210_mod_clks[] __initconst = {
>
>  };
>
> +/* The clock dividers in the table vary based on DT and register settings */
> +static void r7s9210_update_clk_table(struct clk *extal_clk, void __iomem *base)

Can be __init.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in clk-renesas-for-v4.20, with the above fixed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
