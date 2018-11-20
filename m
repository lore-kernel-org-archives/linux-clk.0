Return-Path: <SRS0=sCFe=N7=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E64EC46463
	for <linux-clk@archiver.kernel.org>; Tue, 20 Nov 2018 20:15:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 05D03214E0
	for <linux-clk@archiver.kernel.org>; Tue, 20 Nov 2018 20:14:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="VeOyRuad"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 05D03214E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727638AbeKUGpo (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 21 Nov 2018 01:45:44 -0500
Received: from mail.kernel.org ([198.145.29.99]:44080 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725937AbeKUGpo (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 21 Nov 2018 01:45:44 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 177FA2147A;
        Tue, 20 Nov 2018 20:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1542744889;
        bh=zbgtTpi+xG1TUoRttnEsA5vIqHvmqyrdAitiUwYHSHo=;
        h=To:From:In-Reply-To:Cc:References:Subject:Date:From;
        b=VeOyRuadKy6SxiYjwGOO+y+Srxf7sRR6TxSHCjQO6w5x5GqNuYbngNAGSMw94L71G
         S7OylahO496Gov8DxqIUHQgweh6kwEDWZps6nkJk3u5oRyVlQmPDrSM8Gt5DFtM+6J
         VDTuuvaFjijKfVWmBFb4QGP4IoGZRtT3G1NSQwJc=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To:     "A.s. Dong" <aisheng.dong@nxp.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1541862894-8209-6-git-send-email-aisheng.dong@nxp.com>
Cc:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "A.s. Dong" <aisheng.dong@nxp.com>
References: <1541862894-8209-1-git-send-email-aisheng.dong@nxp.com>
 <1541862894-8209-6-git-send-email-aisheng.dong@nxp.com>
Message-ID: <154274488829.88331.14073987677874819400@swboyd.mtv.corp.google.com>
User-Agent: alot/0.7
Subject: Re: [PATCH V6 5/6] clk: imx: add lpcg clock support
Date:   Tue, 20 Nov 2018 12:14:48 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting A.s. Dong (2018-11-10 07:20:04)
> diff --git a/drivers/clk/imx/clk-lpcg-scu.c b/drivers/clk/imx/clk-lpcg-sc=
u.c
> new file mode 100644
> index 0000000..54a1cb3
> --- /dev/null
> +++ b/drivers/clk/imx/clk-lpcg-scu.c
> @@ -0,0 +1,108 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright 2018 NXP
> + *     Dong Aisheng <aisheng.dong@nxp.com>
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/slab.h>
> +#include <linux/spinlock.h>
> +
> +static DEFINE_SPINLOCK(imx_lpcg_scu_lock);
> +
> +#define CLK_GATE_SCU_LPCG_MASK         0x3
> +#define CLK_GATE_SCU_LPCG_HW_SEL       BIT(0)
> +#define CLK_GATE_SCU_LPCG_SW_SEL       BIT(1)
> +
> +struct clk_lpcg_scu {
> +       struct clk_hw hw;
> +       void __iomem *reg;
> +       u8 bit_idx;
> +       bool hw_gate;

What does hw_gate mean? Can you add kernel-doc to this structure?

> +};
> +
> +#define to_clk_lpcg_scu(_hw) container_of(_hw, struct clk_lpcg_scu, hw)
> +
> +/* Write to the LPCG bits. */

Please remove this useless comment.

> +static int clk_lpcg_scu_enable(struct clk_hw *hw)
> +{
> +       struct clk_lpcg_scu *clk =3D to_clk_lpcg_scu(hw);
> +       unsigned long flags =3D 0;

Don't initialize flags here.

> +       u32 reg;
> +
> +       spin_lock_irqsave(&imx_lpcg_scu_lock, flags);
> +
> +       if (clk->reg) {
> +               reg =3D readl(clk->reg);
> +               reg &=3D ~(CLK_GATE_SCU_LPCG_MASK << clk->bit_idx);
> +               if (clk->hw_gate)
> +                       reg |=3D (CLK_GATE_SCU_LPCG_HW_SEL |
> +                               CLK_GATE_SCU_LPCG_SW_SEL) << clk->bit_idx;
> +               else
> +                       reg |=3D (CLK_GATE_SCU_LPCG_SW_SEL << clk->bit_id=
x);
> +               writel(reg, clk->reg);
> +       }
> +
> +       spin_unlock_irqrestore(&imx_lpcg_scu_lock, flags);
> +
> +       return 0;
> +}
> +
> +static void clk_lpcg_scu_disable(struct clk_hw *hw)
> +{
> +       struct clk_lpcg_scu *clk =3D to_clk_lpcg_scu(hw);
> +       unsigned long flags =3D 0;

Same comment.

> +       u32 reg;
> +
> +       spin_lock_irqsave(&imx_lpcg_scu_lock, flags);
> +
> +       if (clk->reg) {

Why do we even call this function if there isn't a clk->reg value?
Can't we just not assign the clk_ops in that case?

> +               reg =3D readl(clk->reg);
> +               reg &=3D ~(CLK_GATE_SCU_LPCG_MASK << clk->bit_idx);
> +               writel(reg, clk->reg);
> +       }
> +
> +       spin_unlock_irqrestore(&imx_lpcg_scu_lock, flags);
> +}
> +
