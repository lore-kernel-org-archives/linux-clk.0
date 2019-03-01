Return-Path: <SRS0=/2Yr=RE=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CF90C10F03
	for <linux-clk@archiver.kernel.org>; Fri,  1 Mar 2019 12:53:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6737A20851
	for <linux-clk@archiver.kernel.org>; Fri,  1 Mar 2019 12:53:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728120AbfCAMxD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 1 Mar 2019 07:53:03 -0500
Received: from mail-vk1-f194.google.com ([209.85.221.194]:41045 "EHLO
        mail-vk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727920AbfCAMxC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 1 Mar 2019 07:53:02 -0500
Received: by mail-vk1-f194.google.com with SMTP id b6so5586565vkf.8;
        Fri, 01 Mar 2019 04:53:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=P7qszWOfoLfuGJhgFmotpkeWhfLT6IfLYkVq3D/FMYE=;
        b=HeAlrUdlzyn80SElOWH8OM3IBMdvrNWZewxSGMowXO3dCBZPeAW6iN7Dg3JiFx6o46
         KQFBmCU9FydLnms0ANdM/0gtD0rt/9CYCPTzDnO7n3wruipaqHfVd7YopteWoikTxgOD
         kCqhGzFlSxPvxW0SO6QIpMvfUgQ9ERlUf7bvriwTkHTGirKmGpf9mQ5Bjomv9kmuN3ld
         QObQnuc9J7eBtlAis8Zo9NVC9m2lZTp0DYVnJuScyC7EjPuEKEHvrOanREy18IRV/jvi
         RwCdYCCGm9SkfaNU1ANSBDv0FSjxJd9tFn+SDQtpxXBDUsK3IxMY4ByIJt8G6nLfh43I
         eGaQ==
X-Gm-Message-State: APjAAAVToCp54NS9OENABgDigxStzzoSJUvWP447SU7KGVFB4tLMG1pS
        fCJkkTqkBxyI6F/fh0K6mX4pU37fq35sxqja4Mwe8XpJ
X-Google-Smtp-Source: APXvYqxERk+iblTxq/3AhASSN0NYr9xx8sv6Q2WQSEXZeeUo7j6bdC4OTtu7L24WK/sFB8RWiFx7GI89D3/6PHZVwJ0=
X-Received: by 2002:a1f:a5d3:: with SMTP id o202mr2722870vke.40.1551444781658;
 Fri, 01 Mar 2019 04:53:01 -0800 (PST)
MIME-Version: 1.0
References: <20190228135246.31714-1-horms+renesas@verge.net.au> <20190228135246.31714-3-horms+renesas@verge.net.au>
In-Reply-To: <20190228135246.31714-3-horms+renesas@verge.net.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 1 Mar 2019 13:52:50 +0100
Message-ID: <CAMuHMdU8AWAWjGHQC6tJnxqZRU1W+LmLvnw0nhWqNAKotGApMw@mail.gmail.com>
Subject: Re: [PATCH 2/4] clk: renesas: r8a77990: Add ZG clock
To:     Simon Horman <horms+renesas@verge.net.au>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Simon,

On Thu, Feb 28, 2019 at 2:52 PM Simon Horman <horms+renesas@verge.net.au> wrote:
> Adds support for R-Car E3 (r8a77990) ZG clock.
>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> ---
> Tested on Ebisu to the extent that the clock rate is 600MHz on boot
> ---
>  drivers/clk/renesas/r8a77990-cpg-mssr.c | 2 ++
>  drivers/clk/renesas/rcar-gen3-cpg.c     | 1 -
>  drivers/clk/renesas/rcar-gen3-cpg.h     | 1 +
>  3 files changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/renesas/r8a77990-cpg-mssr.c b/drivers/clk/renesas/r8a77990-cpg-mssr.c
> index 0e475dcb68b9..d0d29fc942ff 100644
> --- a/drivers/clk/renesas/r8a77990-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a77990-cpg-mssr.c
> @@ -83,6 +83,8 @@ static const struct cpg_core_clk r8a77990_core_clks[] __initconst = {
>         DEF_FIXED("za8",       R8A77990_CLK_ZA8,   CLK_PLL0D8,     1, 1),
>         DEF_GEN3_Z("z2",       R8A77990_CLK_Z2,    CLK_TYPE_GEN3_Z, CLK_PLL0,
>                    4, CPG_FRQCRC, 8),
> +       DEF_GEN3_Z("zg",       R8A77990_CLK_ZG,    CLK_TYPE_GEN3_Z, CLK_PLL0,
> +                  8, CPG_FRQCRB, 24),

While this approach may be correct for R-Car H3, M3-W, and M3-N, this is
not correct for R-Car E3, due to the presence of Spread Spectrum Clock
Generator support:
  - When SCCG is enabled (MD12=1), the parent clock is either S0 or S1,
    with only 2 or 3 (out of 32) supported dividers,
  - When SCCG is disabled (MD12=0), the parent clock is PLL0, with only
    2 (out of 32) supported dividers.

So I'm afraid the ZG clock on SCCG-capable SoCs needs its own very special
clock type.

This applies also to R-Car D3 and RZ/G2E.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
