Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DD1AC433E9
	for <linux-clk@archiver.kernel.org>; Mon, 21 Dec 2020 10:24:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F2F7B22ADF
	for <linux-clk@archiver.kernel.org>; Mon, 21 Dec 2020 10:24:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726492AbgLUKYa (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 21 Dec 2020 05:24:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726139AbgLUKYa (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 21 Dec 2020 05:24:30 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8140C061285
        for <linux-clk@vger.kernel.org>; Mon, 21 Dec 2020 02:23:49 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1krHKa-000824-Ll; Mon, 21 Dec 2020 10:18:16 +0100
Received: from mtr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1krHKZ-0007vf-HC; Mon, 21 Dec 2020 10:18:15 +0100
Date:   Mon, 21 Dec 2020 10:18:15 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     devicetree@vger.kernel.org, dshah@xilinx.com,
        mturquette@baylibre.com, tejasp@xilinx.com, rajanv@xilinx.com,
        robh+dt@kernel.org, michals@xilinx.com, rvisaval@xilinx.com,
        kernel@pengutronix.de, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 08/12] soc: xilinx: vcu: implement clock provider for
 output clocks
Message-ID: <20201221091815.GA22033@pengutronix.de>
References: <20201116075532.4019252-1-m.tretter@pengutronix.de>
 <20201116075532.4019252-9-m.tretter@pengutronix.de>
 <160783893475.1580929.17041767429276672732@swboyd.mtv.corp.google.com>
 <20201215113809.GA23407@pengutronix.de>
 <160808099008.1580929.16611149064276335127@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <160808099008.1580929.16611149064276335127@swboyd.mtv.corp.google.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 10:14:17 up 18 days, 21:41, 56 users,  load average: 0.78, 0.70,
 0.57
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 15 Dec 2020 17:09:50 -0800, Stephen Boyd wrote:
> Quoting Michael Tretter (2020-12-15 03:38:09)
> > On Sat, 12 Dec 2020 21:55:34 -0800, Stephen Boyd wrote:
> > > Quoting Michael Tretter (2020-11-15 23:55:28)
> > > > +                          CLK_DIVIDER_ROUND_CLOSEST;
> > > > +       struct clk_hw *mux = NULL;
> > > > +       struct clk_hw *divider = NULL;
> > > > +       struct clk_hw *gate = NULL;
> > > > +       char *name_mux;
> > > > +       char *name_div;
> > > > +       int err;
> > > > +
> > > > +       name_mux = devm_kasprintf(dev, GFP_KERNEL, "%s%s", name, "_mux");
> > > > +       if (!name_mux) {
> > > > +               err = -ENOMEM;
> > > > +               goto err;
> > > > +       }
> > > > +       mux = clk_hw_register_mux(dev, name_mux, parent_names, num_parents,
> > > > +                                 flags, reg, 0, 1, 0, lock);
> > > > +       if (IS_ERR(mux)) {
> > > > +               err = PTR_ERR(divider);
> > > > +               goto err;
> > > > +       }
> > > > +       clk_hw_set_parent(mux, parent_default);
> > > 
> > > Can this be done from assigned-clock-parents binding?
> > 
> > Could be done, if the driver provides at least the PLL and the mux in addition
> > to the actual output clocks. Otherwise, it is not possible to reference the
> > PLL post divider and the mux from the device tree. I wanted to avoid to expose
> > the complexity to the device tree. Would you prefer, if all clocks are
> > provided instead of only the output clocks?
> 
> It is fine to do this in software too so not a big deal and no need to
> expose it from the device.
> 
> > 
> > > 
> > > > +
> > > > +static int xvcu_register_clock_provider(struct xvcu_device *xvcu)
> > > > +{
> > > > +       struct device *dev = xvcu->dev;
> > > > +       const char *parent_names[2];
> > > > +       struct clk_hw *parent_default;
> > > > +       struct clk_hw_onecell_data *data;
> > > > +       struct clk_hw **hws;
> > > > +       void __iomem *reg_base = xvcu->vcu_slcr_ba;
> > > > +
> > > > +       data = devm_kzalloc(dev, struct_size(data, hws, CLK_XVCU_NUM_CLOCKS), GFP_KERNEL);
> > > > +       if (!data)
> > > > +               return -ENOMEM;
> > > > +       data->num = CLK_XVCU_NUM_CLOCKS;
> > > > +       hws = data->hws;
> > > > +
> > > > +       xvcu->clk_data = data;
> > > > +
> > > > +       parent_default = xvcu->pll;
> > > > +       parent_names[0] = "dummy";
> > > 
> > > What is "dummy"?
> > 
> > According to the register reference [0], the output clocks can be driven by an
> > external clock instead of the PLL, but the VCU Product Guide [1] does not
> > mention any ports for actually driving the clock. From my understanding of the
> > IP core, this is a clock mux which has a not-connected first parent. Maybe
> > someone at Xilinx can clarify, what is happening here.
> > 
> > [0] https://www.xilinx.com/html_docs/registers/ug1087/ug1087-zynq-ultrascale-registers.html
> > [1] https://www.xilinx.com/support/documentation-navigation/see-all-versions.html?xlnxproducttypes=IP%20Cores&xlnxipcoresname=v-vcu
> > 
> > What would be a better way to handle this?
> > 
> > > 
> > > > +       parent_names[1] = clk_hw_get_name(parent_default);
> > > 
> > > Can we use the new way of specifying clk parents from DT or by using
> > > direct pointers instead of using string names? The idea is to get rid of
> > > clk_hw_get_name() eventually.
> > 
> > It should be possible to use the direct pointers, but this really depends on
> > how the "dummy" clock is handled.
> > 
> 
> I think if clk_parent_data is used then we can have the binding list the
> external clk as a 'clocks' property and then if it's not present in DT
> we will know that it can't ever be a parent. So it hopefully "just
> works" if clk_parent_data is used.

Thanks. It actually just works. I will send v2.

Michael
