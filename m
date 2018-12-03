Return-Path: <SRS0=uslk=OM=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8FA3C04EB9
	for <linux-clk@archiver.kernel.org>; Mon,  3 Dec 2018 19:44:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8BCCF2145D
	for <linux-clk@archiver.kernel.org>; Mon,  3 Dec 2018 19:44:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZSCzaEbB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8BCCF2145D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725951AbeLCTot (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 3 Dec 2018 14:44:49 -0500
Received: from mail.kernel.org ([198.145.29.99]:60990 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725885AbeLCTot (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 3 Dec 2018 14:44:49 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 239DC20661;
        Mon,  3 Dec 2018 19:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1543866287;
        bh=1siojgpWf3s44PKIfrW/66aYWSoF8Oth97Vx5uH8Op4=;
        h=To:From:In-Reply-To:Cc:References:Subject:Date:From;
        b=ZSCzaEbBj428g7aNK0ctsAP4h6XhBHsUsOLIS8HuRw69MJ1LfmGcoszLoSBMDR2HX
         ylvhgLylFgV5K0LSHLhO/qWLXzImnSzm9qWxoCtkhtIdw1dk149n9oZ5ImqXzjOO8e
         wih5K5Jty6E7ysjcCG++2bLEmZCZxfdk852xVSdw=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Aisheng DONG <aisheng.dong@nxp.com>
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1542809234-539-7-git-send-email-aisheng.dong@nxp.com>
Cc:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        Aisheng DONG <aisheng.dong@nxp.com>
References: <1542809234-539-1-git-send-email-aisheng.dong@nxp.com>
 <1542809234-539-7-git-send-email-aisheng.dong@nxp.com>
Message-ID: <154386628648.88331.6049034476912976846@swboyd.mtv.corp.google.com>
User-Agent: alot/0.7
Subject: Re: [PATCH V8 6/7] clk: imx: add lpcg clock support
Date:   Mon, 03 Dec 2018 11:44:46 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Aisheng DONG (2018-11-21 06:12:38)
> diff --git a/drivers/clk/imx/clk-lpcg-scu.c b/drivers/clk/imx/clk-lpcg-sc=
u.c
> new file mode 100644
> index 0000000..15b7d94
> --- /dev/null
> +++ b/drivers/clk/imx/clk-lpcg-scu.c
> @@ -0,0 +1,113 @@
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
> +/*
> + * struct clk_lpcg_scu - Description of LPCG clock
> + *
> + * @hw: clk_hw of this LPCG
> + * @reg: register of this LPCG clock
> + * @bit_idx: bit index of this LPCG clock
> + * @hw_gate: HW auto gate enable
> + *
> + * This structure describes one LPCG clock
> + */
> +struct clk_lpcg_scu {
> +       struct clk_hw hw;
> +       void __iomem *reg;
> +       u8 bit_idx;
> +       bool hw_gate;
> +};
> +
> +#define to_clk_lpcg_scu(_hw) container_of(_hw, struct clk_lpcg_scu, hw)
> +
> +static int clk_lpcg_scu_enable(struct clk_hw *hw)
> +{
> +       struct clk_lpcg_scu *clk =3D to_clk_lpcg_scu(hw);
> +       unsigned long flags;
> +       u32 reg;
> +
> +       spin_lock_irqsave(&imx_lpcg_scu_lock, flags);
> +
> +       reg =3D readl(clk->reg);

Use readl_relaxed() here?

> +       reg &=3D ~(CLK_GATE_SCU_LPCG_MASK << clk->bit_idx);
> +       if (clk->hw_gate)
> +               reg |=3D (CLK_GATE_SCU_LPCG_HW_SEL |
> +                       CLK_GATE_SCU_LPCG_SW_SEL) << clk->bit_idx;
> +       else
> +               reg |=3D (CLK_GATE_SCU_LPCG_SW_SEL << clk->bit_idx);

Write this as:

	u32 val;

	val =3D CLK_GATE_SCU_LPCG_SW_SEL;
	if (...)
		val |=3D CLK_GATE_SCU_LPCG_HW_SEL;
	reg |=3D val << clk->bit_idx;

> +       writel(reg, clk->reg);

This can stay "stronger", so no writel_relaxed().

> +
> +       spin_unlock_irqrestore(&imx_lpcg_scu_lock, flags);
> +
> +       return 0;
> +}
> +
> +static void clk_lpcg_scu_disable(struct clk_hw *hw)
> +{
> +       struct clk_lpcg_scu *clk =3D to_clk_lpcg_scu(hw);
> +       unsigned long flags;
> +       u32 reg;
> +
> +       spin_lock_irqsave(&imx_lpcg_scu_lock, flags);
> +
> +       reg =3D readl(clk->reg);

readl_relaxed()?

> +       reg &=3D ~(CLK_GATE_SCU_LPCG_MASK << clk->bit_idx);
