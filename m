Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D21DC2BB9A
	for <linux-clk@archiver.kernel.org>; Tue, 15 Dec 2020 11:39:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4518E224B8
	for <linux-clk@archiver.kernel.org>; Tue, 15 Dec 2020 11:39:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728684AbgLOLi6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 15 Dec 2020 06:38:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728659AbgLOLix (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 15 Dec 2020 06:38:53 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39769C06179C
        for <linux-clk@vger.kernel.org>; Tue, 15 Dec 2020 03:38:13 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1kp8eg-0005T9-6J; Tue, 15 Dec 2020 12:38:10 +0100
Received: from mtr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1kp8ef-0001Z9-DT; Tue, 15 Dec 2020 12:38:09 +0100
Date:   Tue, 15 Dec 2020 12:38:09 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, rajanv@xilinx.com, tejasp@xilinx.com,
        dshah@xilinx.com, rvisaval@xilinx.com, michals@xilinx.com,
        kernel@pengutronix.de, robh+dt@kernel.org, mturquette@baylibre.com
Subject: Re: [PATCH 08/12] soc: xilinx: vcu: implement clock provider for
 output clocks
Message-ID: <20201215113809.GA23407@pengutronix.de>
References: <20201116075532.4019252-1-m.tretter@pengutronix.de>
 <20201116075532.4019252-9-m.tretter@pengutronix.de>
 <160783893475.1580929.17041767429276672732@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <160783893475.1580929.17041767429276672732@swboyd.mtv.corp.google.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 11:37:16 up 12 days, 23:04, 61 users,  load average: 0.23, 0.11,
 0.10
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sat, 12 Dec 2020 21:55:34 -0800, Stephen Boyd wrote:
> Quoting Michael Tretter (2020-11-15 23:55:28)
> > diff --git a/drivers/soc/xilinx/xlnx_vcu.c b/drivers/soc/xilinx/xlnx_vcu.c
> > index 725e646aa726..cedc8b7859f7 100644
> > --- a/drivers/soc/xilinx/xlnx_vcu.c
> > +++ b/drivers/soc/xilinx/xlnx_vcu.c
> > @@ -545,6 +512,146 @@ static int xvcu_set_pll(struct xvcu_device *xvcu)
> >         return xvcu_pll_enable(xvcu);
> >  }
> >  
> > +static struct clk_hw *xvcu_clk_hw_register_leaf(struct device *dev,
> > +                                               const char *name,
> > +                                               const char * const *parent_names,
> > +                                               u8 num_parents,
> > +                                               struct clk_hw *parent_default,
> > +                                               void __iomem *reg,
> > +                                               spinlock_t *lock)
> > +{
> > +       unsigned long flags = CLK_SET_RATE_NO_REPARENT | CLK_SET_RATE_PARENT;
> > +       u8 divider_flags = CLK_DIVIDER_ONE_BASED | CLK_DIVIDER_ALLOW_ZERO |
> 
> Why u8?

__clk_hw_register_divider expects u8 as divider_flags.

> 
> > +                          CLK_DIVIDER_ROUND_CLOSEST;
> > +       struct clk_hw *mux = NULL;
> > +       struct clk_hw *divider = NULL;
> > +       struct clk_hw *gate = NULL;
> > +       char *name_mux;
> > +       char *name_div;
> > +       int err;
> > +
> > +       name_mux = devm_kasprintf(dev, GFP_KERNEL, "%s%s", name, "_mux");
> > +       if (!name_mux) {
> > +               err = -ENOMEM;
> > +               goto err;
> > +       }
> > +       mux = clk_hw_register_mux(dev, name_mux, parent_names, num_parents,
> > +                                 flags, reg, 0, 1, 0, lock);
> > +       if (IS_ERR(mux)) {
> > +               err = PTR_ERR(divider);
> > +               goto err;
> > +       }
> > +       clk_hw_set_parent(mux, parent_default);
> 
> Can this be done from assigned-clock-parents binding?

Could be done, if the driver provides at least the PLL and the mux in addition
to the actual output clocks. Otherwise, it is not possible to reference the
PLL post divider and the mux from the device tree. I wanted to avoid to expose
the complexity to the device tree. Would you prefer, if all clocks are
provided instead of only the output clocks?

> 
> > +
> > +       name_div = devm_kasprintf(dev, GFP_KERNEL, "%s%s", name, "_div");
> > +       if (!name_div) {
> > +               err = -ENOMEM;
> > +               goto err;
> > +       }
> > +       divider = clk_hw_register_divider_parent_hw(dev, name_div, mux, flags,
> > +                                                   reg, 4, 6, divider_flags,
> > +                                                   lock);
> > +       if (IS_ERR(divider)) {
> > +               err = PTR_ERR(divider);
> > +               goto err;
> > +       }
> > +
> > +       gate = clk_hw_register_gate_parent_hw(dev, name, divider,
> > +                                             CLK_SET_RATE_PARENT, reg, 12, 0,
> > +                                             lock);
> > +       if (IS_ERR(gate)) {
> > +               err = PTR_ERR(gate);
> > +               goto err;
> > +       }
> > +
> > +       return gate;
> > +
> > +err:
> > +       if (!IS_ERR_OR_NULL(gate))
> 
> Would be nicer to have some more goto labels and skip the IS_ERR_OR_NULL
> checks.

Ack.

> 
> > +               clk_hw_unregister_gate(gate);
> > +       if (!IS_ERR_OR_NULL(divider))
> > +               clk_hw_unregister_divider(divider);
> > +       if (!IS_ERR_OR_NULL(mux))
> > +               clk_hw_unregister_divider(mux);
> > +
> > +       return ERR_PTR(err);
> > +}
> > +
> > +static void xvcu_clk_hw_unregister_leaf(struct clk_hw *hw)
> > +{
> > +       struct clk_hw *gate = hw;
> > +       struct clk_hw *divider;
> > +       struct clk_hw *mux;
> > +
> > +       if (!gate)
> > +               return;
> > +
> > +       divider = clk_hw_get_parent(gate);
> > +       clk_hw_unregister_gate(gate);
> > +       if (!divider)
> > +               return;
> > +
> > +       mux = clk_hw_get_parent(divider);
> > +       clk_hw_unregister_mux(mux);
> > +       if (!divider)
> > +               return;
> > +
> > +       clk_hw_unregister_divider(divider);
> > +}
> > +
> > +static DEFINE_SPINLOCK(venc_core_lock);
> > +static DEFINE_SPINLOCK(venc_mcu_lock);
> 
> Any reason to not allocate these spinlocks too?

I will change this.

> 
> > +
> > +static int xvcu_register_clock_provider(struct xvcu_device *xvcu)
> > +{
> > +       struct device *dev = xvcu->dev;
> > +       const char *parent_names[2];
> > +       struct clk_hw *parent_default;
> > +       struct clk_hw_onecell_data *data;
> > +       struct clk_hw **hws;
> > +       void __iomem *reg_base = xvcu->vcu_slcr_ba;
> > +
> > +       data = devm_kzalloc(dev, struct_size(data, hws, CLK_XVCU_NUM_CLOCKS), GFP_KERNEL);
> > +       if (!data)
> > +               return -ENOMEM;
> > +       data->num = CLK_XVCU_NUM_CLOCKS;
> > +       hws = data->hws;
> > +
> > +       xvcu->clk_data = data;
> > +
> > +       parent_default = xvcu->pll;
> > +       parent_names[0] = "dummy";
> 
> What is "dummy"?

According to the register reference [0], the output clocks can be driven by an
external clock instead of the PLL, but the VCU Product Guide [1] does not
mention any ports for actually driving the clock. From my understanding of the
IP core, this is a clock mux which has a not-connected first parent. Maybe
someone at Xilinx can clarify, what is happening here.

[0] https://www.xilinx.com/html_docs/registers/ug1087/ug1087-zynq-ultrascale-registers.html
[1] https://www.xilinx.com/support/documentation-navigation/see-all-versions.html?xlnxproducttypes=IP%20Cores&xlnxipcoresname=v-vcu

What would be a better way to handle this?

> 
> > +       parent_names[1] = clk_hw_get_name(parent_default);
> 
> Can we use the new way of specifying clk parents from DT or by using
> direct pointers instead of using string names? The idea is to get rid of
> clk_hw_get_name() eventually.

It should be possible to use the direct pointers, but this really depends on
how the "dummy" clock is handled.

Thanks,

Michael

> 
> > +
> > +       hws[CLK_XVCU_ENC_CORE] =
> > +               xvcu_clk_hw_register_leaf(dev, "venc_core_clk",
> > +                                         parent_names,
> > +                                         ARRAY_SIZE(parent_names),
> > +                                         parent_default,
> > +                                         reg_base + VCU_ENC_CORE_CTRL,
> > +                                         &venc_core_lock);
> > +       hws[CLK_XVCU_ENC_MCU] =
> > +               xvcu_clk_hw_register_leaf(dev, "venc_mcu_clk",
> > +                                         parent_names,
> > +                                         ARRAY_SIZE(parent_names),
> > +                                         parent_default,
> > +                                         reg_base + VCU_ENC_MCU_CTRL,
> > +                                         &venc_mcu_lock);
> > +
> 
