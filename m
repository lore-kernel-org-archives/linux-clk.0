Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD771C64E7C
	for <linux-clk@archiver.kernel.org>; Wed,  2 Dec 2020 22:23:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6110A21D93
	for <linux-clk@archiver.kernel.org>; Wed,  2 Dec 2020 22:23:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728668AbgLBWWi convert rfc822-to-8bit (ORCPT
        <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 2 Dec 2020 17:22:38 -0500
Received: from aposti.net ([89.234.176.197]:37312 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726603AbgLBWWh (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 2 Dec 2020 17:22:37 -0500
Date:   Wed, 02 Dec 2020 22:21:40 +0000
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 1/4] clk: JZ4780: Add function for disable the second
 core.
To:     =?UTF-8?b?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>
Cc:     sboyd@kernel.org, robh+dt@kernel.org, mturquette@baylibre.com,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, dongsheng.qiu@ingenic.com,
        aric.pzqi@ingenic.com, rick.tyliu@ingenic.com,
        yanfei.li@ingenic.com, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com
Message-Id: <4SGQKQ.DVCN1X7ZWNK81@crapouillou.net>
In-Reply-To: <20201125172618.112707-2-zhouyanjie@wanyeetech.com>
References: <20201125172618.112707-1-zhouyanjie@wanyeetech.com>
        <20201125172618.112707-2-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

Le jeu. 26 nov. 2020 à 1:26, 周琰杰 (Zhou Yanjie) 
<zhouyanjie@wanyeetech.com> a écrit :
> Add "jz4780_core1_disable()" for disable the second core of JZ4780,
> prepare for later commits.
> 
> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>

Reviewed-by: Paul Cercueil <paul@crapouillou.net>

Stephen: this patch can be merged independently of the others.

Cheers,
-Paul

> ---
>  drivers/clk/ingenic/jz4780-cgu.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/drivers/clk/ingenic/jz4780-cgu.c 
> b/drivers/clk/ingenic/jz4780-cgu.c
> index 0268d23..dcca74e 100644
> --- a/drivers/clk/ingenic/jz4780-cgu.c
> +++ b/drivers/clk/ingenic/jz4780-cgu.c
> @@ -252,8 +252,29 @@ static int jz4780_core1_enable(struct clk_hw *hw)
>  	return 0;
>  }
> 
> +static void jz4780_core1_disable(struct clk_hw *hw)
> +{
> +	struct ingenic_clk *ingenic_clk = to_ingenic_clk(hw);
> +	struct ingenic_cgu *cgu = ingenic_clk->cgu;
> +	unsigned long flags;
> +	u32 lcr, clkgr1;
> +
> +	spin_lock_irqsave(&cgu->lock, flags);
> +
> +	lcr = readl(cgu->base + CGU_REG_LCR);
> +	lcr |= LCR_PD_SCPU;
> +	writel(lcr, cgu->base + CGU_REG_LCR);
> +
> +	clkgr1 = readl(cgu->base + CGU_REG_CLKGR1);
> +	clkgr1 |= CLKGR1_CORE1;
> +	writel(clkgr1, cgu->base + CGU_REG_CLKGR1);
> +
> +	spin_unlock_irqrestore(&cgu->lock, flags);
> +}
> +
>  static const struct clk_ops jz4780_core1_ops = {
>  	.enable = jz4780_core1_enable,
> +	.disable = jz4780_core1_disable,
>  };
> 
>  static const s8 pll_od_encoding[16] = {
> --
> 2.7.4
> 


