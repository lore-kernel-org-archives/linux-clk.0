Return-Path: <SRS0=3y70=M3=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3696C28CF8
	for <linux-clk@archiver.kernel.org>; Mon, 15 Oct 2018 07:32:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AD9E92086A
	for <linux-clk@archiver.kernel.org>; Mon, 15 Oct 2018 07:32:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD9E92086A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726453AbeJOPQN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 15 Oct 2018 11:16:13 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:56615 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726422AbeJOPQM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 15 Oct 2018 11:16:12 -0400
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <sha@pengutronix.de>)
        id 1gBxMG-00019k-8a; Mon, 15 Oct 2018 09:32:08 +0200
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <sha@pengutronix.de>)
        id 1gBxMF-0006qt-La; Mon, 15 Oct 2018 09:32:07 +0200
Date:   Mon, 15 Oct 2018 09:32:07 +0200
From:   Sascha Hauer <s.hauer@pengutronix.de>
To:     "A.s. Dong" <aisheng.dong@nxp.com>
Cc:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH V4 05/11] clk: imx: scu: add scu clock gate
Message-ID: <20181015073207.66npcgegibl2rybb@pengutronix.de>
References: <1539504194-28289-1-git-send-email-aisheng.dong@nxp.com>
 <1539504194-28289-6-git-send-email-aisheng.dong@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1539504194-28289-6-git-send-email-aisheng.dong@nxp.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 09:17:57 up 124 days, 16:27, 84 users,  load average: 0.06, 0.16,
 0.17
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sun, Oct 14, 2018 at 08:07:56AM +0000, A.s. Dong wrote:
> +/* Write to the LPCG bits. */
> +static int clk_gate_scu_enable(struct clk_hw *hw)
> +{
> +	struct clk_gate_scu *gate = to_clk_gate_scu(hw);
> +	u32 reg;
> +
> +	if (gate->reg) {
> +		reg = readl(gate->reg);
> +		reg &= ~(CLK_GATE_SCU_LPCG_MASK << gate->bit_idx);
> +		if (gate->hw_gate)
> +			reg |= (CLK_GATE_SCU_LPCG_HW_SEL |
> +				CLK_GATE_SCU_LPCG_SW_SEL) << gate->bit_idx;
> +		else
> +			reg |= (CLK_GATE_SCU_LPCG_SW_SEL << gate->bit_idx);
> +		writel(reg, gate->reg);
> +	}

These register manipulations look like they need locking.

> +
> +	return 0;
> +}
> +
> +struct clk_hw *clk_register_gate_scu(const char *name, const char *parent_name,
> +				     unsigned long flags, u32 rsrc_id,
> +				     u8 clk_type, void __iomem *reg,
> +				     u8 bit_idx, bool hw_gate)
> +{
> +	struct clk_gate_scu *gate;
> +	struct clk_init_data init;
> +	struct clk_hw *hw;
> +	int ret;
> +
> +	gate = kzalloc(sizeof(*gate), GFP_KERNEL);
> +	if (!gate)
> +		return ERR_PTR(-ENOMEM);
> +
> +	gate->rsrc_id = rsrc_id;
> +	gate->clk_type = clk_type;
> +	if (reg) {
> +		gate->reg = ioremap((phys_addr_t)reg, SZ_64K);

ioremap never takes a void __iomem * as argument. Given that you have to
cast it here to another type and to void __iomem * when calling this
function is a clear sign that the type of this variable is poorly
chosen.

> +		if (!gate->reg) {
> +			kfree(gate);
> +			return ERR_PTR(-ENOMEM);
> +		}
> +	}
> +
> +	gate->bit_idx = bit_idx;
> +	gate->hw_gate = hw_gate;
> +
> +	init.name = name;
> +	init.ops = &clk_gate_scu_ops;
> +	init.flags = flags;
> +	init.parent_names = parent_name ? &parent_name : NULL;
> +	init.num_parents = parent_name ? 1 : 0;
> +
> +	gate->hw.init = &init;
> +
> +	hw = &gate->hw;
> +	ret = clk_hw_register(NULL, hw);
> +	if (ret) {
> +		iounmap(gate->reg);

Is iounmap on a NULL pointer allowed? Otherwise the error path is wrong
here.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
