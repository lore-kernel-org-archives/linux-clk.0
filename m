Return-Path: <SRS0=Glxp=Y5=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 672C1C49EAD
	for <linux-clk@archiver.kernel.org>; Tue,  5 Nov 2019 09:47:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3AF5A20869
	for <linux-clk@archiver.kernel.org>; Tue,  5 Nov 2019 09:47:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730574AbfKEJrw (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 5 Nov 2019 04:47:52 -0500
Received: from ns.iliad.fr ([212.27.33.1]:55504 "EHLO ns.iliad.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730550AbfKEJrv (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 5 Nov 2019 04:47:51 -0500
Received: from ns.iliad.fr (localhost [127.0.0.1])
        by ns.iliad.fr (Postfix) with ESMTP id A008D2043B;
        Tue,  5 Nov 2019 10:47:50 +0100 (CET)
Received: from [192.168.108.51] (freebox.vlq16.iliad.fr [213.36.7.13])
        by ns.iliad.fr (Postfix) with ESMTP id 909452036B;
        Tue,  5 Nov 2019 10:47:50 +0100 (CET)
Subject: Re: [PATCH] clk: imx: pll14xx: initialize flags to 0
To:     Peng Fan <peng.fan@nxp.com>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
References: <1572938372-7006-1-git-send-email-peng.fan@nxp.com>
From:   Marc Gonzalez <marc.w.gonzalez@free.fr>
Message-ID: <5fc2dfd6-ae59-6af8-0423-ddc8e0b4f78f@free.fr>
Date:   Tue, 5 Nov 2019 10:47:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1572938372-7006-1-git-send-email-peng.fan@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ; Tue Nov  5 10:47:50 2019 +0100 (CET)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 05/11/2019 08:21, Peng Fan wrote:

> From: Peng Fan <peng.fan@nxp.com>
> 
> init.flags is initialized with value from pll_clk->flags, however
> imx_1443x_pll and imx_1416x_pll are not static structure, so flags
> might be random value. So let's initialize flags as 0 now.

This is incorrect. When using an initializer list, struct members
not explicitly specified are initialized to 0.

https://port70.net/~nsz/c/c11/n1570.html#6.7.9p19

> The initialization shall occur in initializer list order, each
> initializer provided for a particular subobject overriding any
> previously listed initializer for the same subobject; all
> subobjects that are not initialized explicitly shall be initialized
> implicitly the same as objects that have static storage duration.
(You might point out that the kernel is compiled with -std=gnu89 not C11,
but GCC's semantics are the same.)

https://gcc.gnu.org/onlinedocs/gcc/Designated-Inits.html#Designated-Inits

> diff --git a/drivers/clk/imx/clk-pll14xx.c b/drivers/clk/imx/clk-pll14xx.c
> index fa76e04251c4..a7f1c1abe664 100644
> --- a/drivers/clk/imx/clk-pll14xx.c
> +++ b/drivers/clk/imx/clk-pll14xx.c
> @@ -65,12 +65,14 @@ struct imx_pll14xx_clk imx_1443x_pll = {
>  	.type = PLL_1443X,
>  	.rate_table = imx_pll1443x_tbl,
>  	.rate_count = ARRAY_SIZE(imx_pll1443x_tbl),
> +	.flags = 0,
>  };

What tree is this patch based on?

https://elixir.bootlin.com/linux/v5.4-rc1/source/drivers/clk/imx/clk-pll14xx.c#L65

Regards.
