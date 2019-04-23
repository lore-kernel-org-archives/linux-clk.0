Return-Path: <SRS0=Ati7=SZ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EC3AC10F14
	for <linux-clk@archiver.kernel.org>; Tue, 23 Apr 2019 07:49:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 358DA204EC
	for <linux-clk@archiver.kernel.org>; Tue, 23 Apr 2019 07:49:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725935AbfDWHtl (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 23 Apr 2019 03:49:41 -0400
Received: from mail-vs1-f65.google.com ([209.85.217.65]:38601 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725888AbfDWHtl (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 23 Apr 2019 03:49:41 -0400
Received: by mail-vs1-f65.google.com with SMTP id s2so7709862vsi.5;
        Tue, 23 Apr 2019 00:49:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iaE8IUlf60hL4IwALqewtJ+kk5muvzJCn/QJKmcD5nw=;
        b=TSkSn8MbIFC3hRjCOIF0VWmjYdJmxdOFMC+Ty7CMqGw/q0x2TKNJvKyZWKHouvNsSX
         eGeTKmt8bwqw/ZpjuTpi0KtiVsLZ9jcR/157PCGVW0k4ui+VozDZYVK9S9XQ6Me1g97X
         sNDFjL0ElkdhBtwy6BMopsVJZpAkI0FF4EiHKoRzKHrYGVriJ6ylPgGajxyBxkUukmyz
         4n4evIFF60dr2Sv+Ndc/nCiG0e1kPMPgC0wChukknhY+MeCv77QXtS4yeHDMkP7kA8q/
         1OmUFBhCcoXduaRdGmY+eWgiHqoN5/A2ID8zWGa2LOcVz+X3fYLr2LQ6RcZx3EpXs8rP
         gHsA==
X-Gm-Message-State: APjAAAX34P1/msH5WXc1WzYqP8bNpXLpakaskU5PSy2dzCsnuwkjTPi4
        E/043AnXGa4iON1mF5OZq9eJqlgS73z67oS64bs=
X-Google-Smtp-Source: APXvYqwePCTMrrLrJ90Oq7fNmWzT8iMPfnUzQtV6TZGLzWU6MT52/ml65Nt8iafXxqW5uSlSP2EdgZ1PeA4LJ3ksQeE=
X-Received: by 2002:a67:f34f:: with SMTP id p15mr11955838vsm.11.1556005780530;
 Tue, 23 Apr 2019 00:49:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190418111211.10474-1-jonas.gorski@gmail.com> <20190418111211.10474-2-jonas.gorski@gmail.com>
In-Reply-To: <20190418111211.10474-2-jonas.gorski@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 23 Apr 2019 09:49:28 +0200
Message-ID: <CAMuHMdX7E8fR+2s-gPgGLKUCdW_--YUDW7w+op3BDurgACFEmA@mail.gmail.com>
Subject: Re: [PATCH RFT V3 1/8] clk: divider: add explicit big endian support
To:     Jonas Gorski <jonas.gorski@gmail.com>
Cc:     linux-clk <linux-clk@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Fabio Estevam <festevam@gmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Stephen Boyd <sboyd@kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Paul Mackerras <paulus@samba.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Thierry Reding <thierry.reding@gmail.com>,
        Anatolij Gustschin <agust@denx.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Jonas,

On Thu, Apr 18, 2019 at 1:12 PM Jonas Gorski <jonas.gorski@gmail.com> wrote:
> Add a clock specific flag to switch register accesses to big endian, to
> allow runtime configuration of big endian divider clocks.
>
> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
> ---
> V2 -> V3:
>  * fix passed arguments to clk_div_readl found by kbuild
>  * drop unneeded else in clk_div_readl
> V1 -> V2:
>  * switch from global to local flag
>
>  drivers/clk/clk-divider.c    | 26 ++++++++++++++++++++++----
>  include/linux/clk-provider.h |  4 ++++
>  2 files changed, 26 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/clk/clk-divider.c b/drivers/clk/clk-divider.c
> index e5a17265cfaf..25c7404e376c 100644
> --- a/drivers/clk/clk-divider.c
> +++ b/drivers/clk/clk-divider.c
> @@ -25,6 +25,24 @@
>   * parent - fixed parent.  No clk_set_parent support
>   */
>
> +static inline u32 clk_div_readl(struct clk_divider *divider)
> +{
> +       if (divider->flags & CLK_DIVIDER_BIG_ENDIAN)
> +               return ioread32be(divider->reg);
> +
> +       return clk_readl(divider->reg);
> +}
> +
> +static inline void clk_div_writel(struct clk_divider *divider, u32 val)
> +{
> +       if (divider->flags & CLK_DIVIDER_BIG_ENDIAN)
> +               iowrite32be(val, divider->reg);
> +       else
> +               clk_writel(val, divider->reg);
> +}
> +
> +#define div_mask(width)        ((1 << (width)) - 1)

What's the purpose of adding this definition?
It does not seem to be used.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
