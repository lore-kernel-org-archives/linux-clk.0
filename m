Return-Path: <SRS0=lNOc=M4=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68E91C5ACC6
	for <linux-clk@archiver.kernel.org>; Tue, 16 Oct 2018 21:18:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0C4E121470
	for <linux-clk@archiver.kernel.org>; Tue, 16 Oct 2018 21:18:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="jTOdzPIp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C4E121470
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726957AbeJQFKt (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 17 Oct 2018 01:10:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:46790 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725960AbeJQFKt (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 17 Oct 2018 01:10:49 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2D4D12098A;
        Tue, 16 Oct 2018 21:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1539724712;
        bh=GmJVp6PvtK4/mP4RQK2wS2cKmtjcmSNtoMl8QX4PDLI=;
        h=To:From:In-Reply-To:Cc:References:Subject:Date:From;
        b=jTOdzPIp2WGiuvJQADo1RdRBqMBNIJOhZ57XQPgAMvwO0OXdJhT20El1OQdVIofu1
         cTV6I3g+Z5df2n3mxzTmGdYppcTc9zn1HaDwdmtwdJ+SSRJQECMIhwwVPtkwJwNpc4
         vdFq0sP1ohLM4Dp+2PLbXawZ+Genhk6J8y1tHG9I=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To:     "A.s. Dong" <aisheng.dong@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <AM0PR04MB42111FD6D3542E12250E556880FD0@AM0PR04MB4211.eurprd04.prod.outlook.com>
Cc:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
References: <1539504194-28289-1-git-send-email-aisheng.dong@nxp.com>
 <1539504194-28289-6-git-send-email-aisheng.dong@nxp.com>
 <20181015073207.66npcgegibl2rybb@pengutronix.de>
 <AM0PR04MB4211129386C9088C6AFEDAF580FD0@AM0PR04MB4211.eurprd04.prod.outlook.com>
 <20181015095342.kjokajxyugugbtcw@pengutronix.de>
 <AM0PR04MB42111FD6D3542E12250E556880FD0@AM0PR04MB4211.eurprd04.prod.outlook.com>
Message-ID: <153972471150.5275.14761857440358508106@swboyd.mtv.corp.google.com>
User-Agent: alot/0.7
Subject: RE: [PATCH V4 05/11] clk: imx: scu: add scu clock gate
Date:   Tue, 16 Oct 2018 14:18:31 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting A.s. Dong (2018-10-15 08:30:45)
> > -----Original Message-----
> > From: Sascha Hauer [mailto:s.hauer@pengutronix.de]
> > Sent: Monday, October 15, 2018 5:54 PM
> > To: A.s. Dong <aisheng.dong@nxp.com>
> > Cc: linux-clk@vger.kernel.org; sboyd@kernel.org; mturquette@baylibre.co=
m;
> > dl-linux-imx <linux-imx@nxp.com>; kernel@pengutronix.de; Fabio Estevam
> > <fabio.estevam@nxp.com>; shawnguo@kernel.org;
> > linux-arm-kernel@lists.infradead.org
> > Subject: Re: [PATCH V4 05/11] clk: imx: scu: add scu clock gate
> > =

> > On Mon, Oct 15, 2018 at 09:17:14AM +0000, A.s. Dong wrote:
> > > > -----Original Message-----
> > > > From: Sascha Hauer [mailto:s.hauer@pengutronix.de]
> > > > Sent: Monday, October 15, 2018 3:32 PM
> > > > To: A.s. Dong <aisheng.dong@nxp.com>
> > > > Cc: linux-clk@vger.kernel.org; sboyd@kernel.org;
> > > > mturquette@baylibre.com; dl-linux-imx <linux-imx@nxp.com>;
> > > > kernel@pengutronix.de; Fabio Estevam <fabio.estevam@nxp.com>;
> > > > shawnguo@kernel.org; linux-arm-kernel@lists.infradead.org
> > > > Subject: Re: [PATCH V4 05/11] clk: imx: scu: add scu clock gate
> > > >
> > > > On Sun, Oct 14, 2018 at 08:07:56AM +0000, A.s. Dong wrote:
> > > > > +/* Write to the LPCG bits. */
> > > > > +static int clk_gate_scu_enable(struct clk_hw *hw) {
> > > > > +       struct clk_gate_scu *gate =3D to_clk_gate_scu(hw);
> > > > > +       u32 reg;
> > > > > +
> > > > > +       if (gate->reg) {
> > > > > +               reg =3D readl(gate->reg);
> > > > > +               reg &=3D ~(CLK_GATE_SCU_LPCG_MASK << gate->bit_id=
x);
> > > > > +               if (gate->hw_gate)
> > > > > +                       reg |=3D (CLK_GATE_SCU_LPCG_HW_SEL |
> > > > > +                               CLK_GATE_SCU_LPCG_SW_SEL) << gate=
->bit_idx;
> > > > > +               else
> > > > > +                       reg |=3D (CLK_GATE_SCU_LPCG_SW_SEL << gat=
e->bit_idx);
> > > > > +               writel(reg, gate->reg);
> > > > > +       }
> > > >
> > > > These register manipulations look like they need locking.
> > > >
> > >
> > > Unlike the legacy MX6&7 SoCs, each clock has a separate LPCG register.
> > > Do we still need locking?
> > =

> > Let's take PWM_0_LPCG as an example:
> > =

> > +       clks[IMX8QXP_LSIO_PWM0_IPG_S_CLK]       =3D
> > imx_clk_gate_scu("pwm_0_ipg_s_clk", "pwm_0_div", IMX_SC_R_PWM_0,
> > IMX_SC_PM_CLK_PER, (void __iomem *)(PWM_0_LPCG), 0x10, 0);
> > +       clks[IMX8QXP_LSIO_PWM0_IPG_SLV_CLK]     =3D
> > imx_clk_gate_scu("pwm_0_ipg_slv_clk", "pwm_0_ipg_s_clk",
> > IMX_SC_R_PWM_0, IMX_SC_PM_CLK_PER, (void __iomem *)(PWM_0_LPCG),
> > 0x14, 0);
> > +       clks[IMX8QXP_LSIO_PWM0_IPG_MSTR_CLK]    =3D
> > imx_clk_gate2_scu("pwm_0_ipg_mstr_clk", "lsio_bus_clk_root", (void
> > __iomem *)(PWM_0_LPCG), 0x18, 0);
> > +       clks[IMX8QXP_LSIO_PWM0_HF_CLK]          =3D
> > imx_clk_gate_scu("pwm_0_hf_clk", "pwm_0_ipg_slv_clk", IMX_SC_R_PWM_0,
> > IMX_SC_PM_CLK_PER, (void __iomem *)(PWM_0_LPCG), 4, 0);
> > +       clks[IMX8QXP_LSIO_PWM0_CLK]             =3D
> > imx_clk_gate_scu("pwm_0_clk", "pwm_0_ipg_slv_clk", IMX_SC_R_PWM_0,
> > IMX_SC_PM_CLK_PER, (void __iomem *)(PWM_0_LPCG), 0, 0);
> > =

> > This register is used in five different clocks.
> > =

> =

> Good catch.
> BTW, it seems for the same clk group, we may still not need lock
> as the clock framework already defined the global enable/disable lock
> for the same group.
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/D=
ocumentation/driver-api/clk.rst
> " Drivers don't need to manually protect resources shared between the ope=
rations
> of one group, regardless of whether those resources are shared by multiple
> clocks or not. However, access to resources that are shared between opera=
tions
> of the two groups needs to be protected by the drivers."
> =

> Do you think it's okay to drop it?
> =


No it's not OK. We prefer that clk drivers don't assume the global locks
in the clk framework are going to protect them from concurrent access to
the same resource between different clks. Drivers can assume that a clk
op won't be called in parallel for the same clk, but they shouldn't
assume that everything is protected otherwise. If they did, we would
have to go find all the drivers that make this assumption and then fix
them when we eventually split the lock into smaller pieces.

Long story short, if you have something shared (i.e. a register) and you
plan to write to it and read from it for multiple clks, add a lock
around it.
