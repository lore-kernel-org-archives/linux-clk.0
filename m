Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4DEBC63777
	for <linux-clk@archiver.kernel.org>; Wed, 25 Nov 2020 08:40:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 33FA22145D
	for <linux-clk@archiver.kernel.org>; Wed, 25 Nov 2020 08:40:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="DpZi7f2/";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="TS2Z/ncM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725842AbgKYIkL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 25 Nov 2020 03:40:11 -0500
Received: from Galois.linutronix.de ([193.142.43.55]:48548 "EHLO
        galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726684AbgKYIkK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 25 Nov 2020 03:40:10 -0500
Date:   Wed, 25 Nov 2020 09:40:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1606293609;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=v0z0HinQyOiR6NXCZj+pHjGrB9RBsM9ImS1zg24PhOA=;
        b=DpZi7f2/LUsWYKRR92vZr7cQXc21spAqImmGxD1t8I8JPTgr5pekHngoc6cqk7xdlF+2jU
        hKel2I64X7FnFqOMTfDrD1uaqP6ZLTh7R3ZKwPEhjTcObOt1hXSXaBstl0n+xrNMXPz+fo
        IpyIUvgTvZnXxuDJqOnQD5YaaNt8EjzeI0qXw/kFz5rVu2CfTurKtI9/kSQpm7GpbcHM04
        Zno6JBPCYga7mRg701s/uIPkmUMUJpJcs+mEbTCtscZPGTHAS8qjyBZecVlsVHtfWZuRr4
        wUxxXluRBPaqMkwSNXPiqzJLw1lI/65Op6Dun4slJGgF7jpMQxnE/q1b9RGlwg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1606293609;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=v0z0HinQyOiR6NXCZj+pHjGrB9RBsM9ImS1zg24PhOA=;
        b=TS2Z/ncM/u/oxS7Ke4qUMwkt2og/uyasGU5U6/mX5LVHKK1kw0Sbx/51i5CGWD1gbNuODg
        71KFx9QKcv/Oh9CA==
From:   Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To:     Aisheng Dong <aisheng.dong@nxp.com>
Cc:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        Anson Huang <anson.huang@nxp.com>,
        Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [RFC PATCH] clk: imx8qxp: Unbreak auto module building for
 MXC_CLK_SCU
Message-ID: <20201125084007.miwbxcln6tdkesgj@linutronix.de>
References: <20201124121740.ytag7rm53umi2qvm@linutronix.de>
 <AM6PR04MB49665B30445C929ABF458D3E80FA0@AM6PR04MB4966.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <AM6PR04MB49665B30445C929ABF458D3E80FA0@AM6PR04MB4966.eurprd04.prod.outlook.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 2020-11-25 07:15:24 [+0000], Aisheng Dong wrote:
> I think the simplest solution is make MXC_CLK_SCU to be invisible to users and can only
> be selected by CLK_IMX8QXP option because currently clk-scu.o and clk-imx8qxp.o are built
> together, it's meaningless and buggy to separate them. Longtermly they will be combined into
> one driver file.
> 
> E.g
> diff --git a/drivers/clk/imx/Kconfig b/drivers/clk/imx/Kconfig
> index 3b393cb07295..dbacdd70af2e 100644
> --- a/drivers/clk/imx/Kconfig
> +++ b/drivers/clk/imx/Kconfig
> @@ -5,7 +5,7 @@ config MXC_CLK
>         depends on ARCH_MXC || COMPILE_TEST
>  
>  config MXC_CLK_SCU
> -       tristate "IMX SCU clock"
> +       tristate
>         depends on ARCH_MXC || COMPILE_TEST
>         depends on IMX_SCU && HAVE_ARM_SMCCC

So it still becomes a module if it gets selected by one, like
CLK_IMX8QXP.

> See fixes here:
> https://patchwork.kernel.org/project/linux-clk/cover/20201124100802.22775-1-aisheng.dong@nxp.com/

Whatever you do, please make sure the issue in v5.10 gets also addressed.

Sebastian
