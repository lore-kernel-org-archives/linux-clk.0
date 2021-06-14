Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF56FC2B9F4
	for <linux-clk@archiver.kernel.org>; Mon, 14 Jun 2021 13:44:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 88CCF611CE
	for <linux-clk@archiver.kernel.org>; Mon, 14 Jun 2021 13:44:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233831AbhFNNqH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 14 Jun 2021 09:46:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233429AbhFNNqH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 14 Jun 2021 09:46:07 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EAB7C061574
        for <linux-clk@vger.kernel.org>; Mon, 14 Jun 2021 06:44:04 -0700 (PDT)
Received: from gallifrey.ext.pengutronix.de ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <l.stach@pengutronix.de>)
        id 1lsmsh-0005oX-82; Mon, 14 Jun 2021 15:43:59 +0200
Message-ID: <24cd89bb32cae386003a188623cdd7730580b643.camel@pengutronix.de>
Subject: Re: [PATCH] clk: imx8mq: remove SYS PLL 1/2 clock gates
From:   Lucas Stach <l.stach@pengutronix.de>
To:     Abel Vesa <abel.vesa@nxp.com>, Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Shawn Guo <shawnguo@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel@pengutronix.de, patchwork-lst@pengutronix.de
Date:   Mon, 14 Jun 2021 15:43:58 +0200
In-Reply-To: <YMdZvv04Fl3S9bCh@ryzen.lan>
References: <20210528180135.1640876-1-l.stach@pengutronix.de>
         <162262001425.4130789.11065881280638357225@swboyd.mtv.corp.google.com>
         <YMdZvv04Fl3S9bCh@ryzen.lan>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.1 (3.40.1-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Am Montag, dem 14.06.2021 um 16:29 +0300 schrieb Abel Vesa:
> On 21-06-02 00:46:54, Stephen Boyd wrote:
> > Quoting Lucas Stach (2021-05-28 11:01:35)
> > > Remove the PLL clock gates as the allowing to gate the sys1_pll_266m breaks
> > > the uSDHC module which is sporadically unable to enumerate devices after
> > > this change. Also it makes AMP clock management harder with no obvious
> > > benefit to Linux, so just revert the change.
> > > 
> > > Fixes: b04383b6a558 ("clk: imx8mq: Define gates for pll1/2 fixed dividers")
> > > Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> > > ---
> > > Previously this was a more targeted change only reverting the problematic
> > > bit for uSDHC, but Jacky Bai expressed the desire to just revert the whole
> > > change, as it makes things harder for AMP use-cases.
> > > ---
> > 
> > Do we need to take this via clk-fixes for this release? Or can it be
> > punted to the next one? The commit it is fixing is not new this merge
> > window, but if there are big problems then I guess it is OK. The patch
> > is fairly large but if uSDHC works better with it applied that is
> > probably good enough.
> > 
> 
> If Lucas has nothing against, I'll send this along with my clk-imx for
> 5.14 updates. Makes even more sense since it is touching the bindings.
> See my comment below.

Yea, the regression has been there long enough that it probably doesn't
matter if this waits for one or two more weeks.

Regards,
Lucas

> 
> > >  drivers/clk/imx/clk-imx8mq.c             | 56 ++++++++----------------
> > >  include/dt-bindings/clock/imx8mq-clock.h | 19 --------
> > >  2 files changed, 18 insertions(+), 57 deletions(-)
> > > 
> > > diff --git a/drivers/clk/imx/clk-imx8mq.c b/drivers/clk/imx/clk-imx8mq.c
> > > index b08019e1faf9..c491bc9c61ce 100644
> > > --- a/drivers/clk/imx/clk-imx8mq.c
> > > +++ b/drivers/clk/imx/clk-imx8mq.c
> > > @@ -358,46 +358,26 @@ static int imx8mq_clocks_probe(struct platform_device *pdev)
> > >         hws[IMX8MQ_VIDEO2_PLL_OUT] = imx_clk_hw_sscg_pll("video2_pll_out", video2_pll_out_sels, ARRAY_SIZE(video2_pll_out_sels), 0, 0, 0, base + 0x54, 0);
> > >  
> > >         /* SYS PLL1 fixed output */
> > > -       hws[IMX8MQ_SYS1_PLL_40M_CG] = imx_clk_hw_gate("sys1_pll_40m_cg", "sys1_pll_out", base + 0x30, 9);
> > > -       hws[IMX8MQ_SYS1_PLL_80M_CG] = imx_clk_hw_gate("sys1_pll_80m_cg", "sys1_pll_out", base + 0x30, 11);
> > > -       hws[IMX8MQ_SYS1_PLL_100M_CG] = imx_clk_hw_gate("sys1_pll_100m_cg", "sys1_pll_out", base + 0x30, 13);
> > > -       hws[IMX8MQ_SYS1_PLL_133M_CG] = imx_clk_hw_gate("sys1_pll_133m_cg", "sys1_pll_out", base + 0x30, 15);
> > > -       hws[IMX8MQ_SYS1_PLL_160M_CG] = imx_clk_hw_gate("sys1_pll_160m_cg", "sys1_pll_out", base + 0x30, 17);
> > > -       hws[IMX8MQ_SYS1_PLL_200M_CG] = imx_clk_hw_gate("sys1_pll_200m_cg", "sys1_pll_out", base + 0x30, 19);
> > > -       hws[IMX8MQ_SYS1_PLL_266M_CG] = imx_clk_hw_gate("sys1_pll_266m_cg", "sys1_pll_out", base + 0x30, 21);
> > > -       hws[IMX8MQ_SYS1_PLL_400M_CG] = imx_clk_hw_gate("sys1_pll_400m_cg", "sys1_pll_out", base + 0x30, 23);
> > > -       hws[IMX8MQ_SYS1_PLL_800M_CG] = imx_clk_hw_gate("sys1_pll_800m_cg", "sys1_pll_out", base + 0x30, 25);
> > > -
> > > -       hws[IMX8MQ_SYS1_PLL_40M] = imx_clk_hw_fixed_factor("sys1_pll_40m", "sys1_pll_40m_cg", 1, 20);
> > > -       hws[IMX8MQ_SYS1_PLL_80M] = imx_clk_hw_fixed_factor("sys1_pll_80m", "sys1_pll_80m_cg", 1, 10);
> > > -       hws[IMX8MQ_SYS1_PLL_100M] = imx_clk_hw_fixed_factor("sys1_pll_100m", "sys1_pll_100m_cg", 1, 8);
> > > -       hws[IMX8MQ_SYS1_PLL_133M] = imx_clk_hw_fixed_factor("sys1_pll_133m", "sys1_pll_133m_cg", 1, 6);
> > > -       hws[IMX8MQ_SYS1_PLL_160M] = imx_clk_hw_fixed_factor("sys1_pll_160m", "sys1_pll_160m_cg", 1, 5);
> > > -       hws[IMX8MQ_SYS1_PLL_200M] = imx_clk_hw_fixed_factor("sys1_pll_200m", "sys1_pll_200m_cg", 1, 4);
> > > -       hws[IMX8MQ_SYS1_PLL_266M] = imx_clk_hw_fixed_factor("sys1_pll_266m", "sys1_pll_266m_cg", 1, 3);
> > > -       hws[IMX8MQ_SYS1_PLL_400M] = imx_clk_hw_fixed_factor("sys1_pll_400m", "sys1_pll_400m_cg", 1, 2);
> > > -       hws[IMX8MQ_SYS1_PLL_800M] = imx_clk_hw_fixed_factor("sys1_pll_800m", "sys1_pll_800m_cg", 1, 1);
> > > +       hws[IMX8MQ_SYS1_PLL_40M] = imx_clk_hw_fixed_factor("sys1_pll_40m", "sys1_pll_out", 1, 20);
> > > +       hws[IMX8MQ_SYS1_PLL_80M] = imx_clk_hw_fixed_factor("sys1_pll_80m", "sys1_pll_out", 1, 10);
> > > +       hws[IMX8MQ_SYS1_PLL_100M] = imx_clk_hw_fixed_factor("sys1_pll_100m", "sys1_pll_out", 1, 8);
> > > +       hws[IMX8MQ_SYS1_PLL_133M] = imx_clk_hw_fixed_factor("sys1_pll_133m", "sys1_pll_out", 1, 6);
> > > +       hws[IMX8MQ_SYS1_PLL_160M] = imx_clk_hw_fixed_factor("sys1_pll_160m", "sys1_pll_out", 1, 5);
> > > +       hws[IMX8MQ_SYS1_PLL_200M] = imx_clk_hw_fixed_factor("sys1_pll_200m", "sys1_pll_out", 1, 4);
> > > +       hws[IMX8MQ_SYS1_PLL_266M] = imx_clk_hw_fixed_factor("sys1_pll_266m", "sys1_pll_out", 1, 3);
> > > +       hws[IMX8MQ_SYS1_PLL_400M] = imx_clk_hw_fixed_factor("sys1_pll_400m", "sys1_pll_out", 1, 2);
> > > +       hws[IMX8MQ_SYS1_PLL_800M] = imx_clk_hw_fixed_factor("sys1_pll_800m", "sys1_pll_out", 1, 1);
> > >  
> > >         /* SYS PLL2 fixed output */
> > > -       hws[IMX8MQ_SYS2_PLL_50M_CG] = imx_clk_hw_gate("sys2_pll_50m_cg", "sys2_pll_out", base + 0x3c, 9);
> > > -       hws[IMX8MQ_SYS2_PLL_100M_CG] = imx_clk_hw_gate("sys2_pll_100m_cg", "sys2_pll_out", base + 0x3c, 11);
> > > -       hws[IMX8MQ_SYS2_PLL_125M_CG] = imx_clk_hw_gate("sys2_pll_125m_cg", "sys2_pll_out", base + 0x3c, 13);
> > > -       hws[IMX8MQ_SYS2_PLL_166M_CG] = imx_clk_hw_gate("sys2_pll_166m_cg", "sys2_pll_out", base + 0x3c, 15);
> > > -       hws[IMX8MQ_SYS2_PLL_200M_CG] = imx_clk_hw_gate("sys2_pll_200m_cg", "sys2_pll_out", base + 0x3c, 17);
> > > -       hws[IMX8MQ_SYS2_PLL_250M_CG] = imx_clk_hw_gate("sys2_pll_250m_cg", "sys2_pll_out", base + 0x3c, 19);
> > > -       hws[IMX8MQ_SYS2_PLL_333M_CG] = imx_clk_hw_gate("sys2_pll_333m_cg", "sys2_pll_out", base + 0x3c, 21);
> > > -       hws[IMX8MQ_SYS2_PLL_500M_CG] = imx_clk_hw_gate("sys2_pll_500m_cg", "sys2_pll_out", base + 0x3c, 23);
> > > -       hws[IMX8MQ_SYS2_PLL_1000M_CG] = imx_clk_hw_gate("sys2_pll_1000m_cg", "sys2_pll_out", base + 0x3c, 25);
> > > -
> > > -       hws[IMX8MQ_SYS2_PLL_50M] = imx_clk_hw_fixed_factor("sys2_pll_50m", "sys2_pll_50m_cg", 1, 20);
> > > -       hws[IMX8MQ_SYS2_PLL_100M] = imx_clk_hw_fixed_factor("sys2_pll_100m", "sys2_pll_100m_cg", 1, 10);
> > > -       hws[IMX8MQ_SYS2_PLL_125M] = imx_clk_hw_fixed_factor("sys2_pll_125m", "sys2_pll_125m_cg", 1, 8);
> > > -       hws[IMX8MQ_SYS2_PLL_166M] = imx_clk_hw_fixed_factor("sys2_pll_166m", "sys2_pll_166m_cg", 1, 6);
> > > -       hws[IMX8MQ_SYS2_PLL_200M] = imx_clk_hw_fixed_factor("sys2_pll_200m", "sys2_pll_200m_cg", 1, 5);
> > > -       hws[IMX8MQ_SYS2_PLL_250M] = imx_clk_hw_fixed_factor("sys2_pll_250m", "sys2_pll_250m_cg", 1, 4);
> > > -       hws[IMX8MQ_SYS2_PLL_333M] = imx_clk_hw_fixed_factor("sys2_pll_333m", "sys2_pll_333m_cg", 1, 3);
> > > -       hws[IMX8MQ_SYS2_PLL_500M] = imx_clk_hw_fixed_factor("sys2_pll_500m", "sys2_pll_500m_cg", 1, 2);
> > > -       hws[IMX8MQ_SYS2_PLL_1000M] = imx_clk_hw_fixed_factor("sys2_pll_1000m", "sys2_pll_1000m_cg", 1, 1);
> > > +       hws[IMX8MQ_SYS2_PLL_50M] = imx_clk_hw_fixed_factor("sys2_pll_50m", "sys2_pll_out", 1, 20);
> > > +       hws[IMX8MQ_SYS2_PLL_100M] = imx_clk_hw_fixed_factor("sys2_pll_100m", "sys2_pll_out", 1, 10);
> > > +       hws[IMX8MQ_SYS2_PLL_125M] = imx_clk_hw_fixed_factor("sys2_pll_125m", "sys2_pll_out", 1, 8);
> > > +       hws[IMX8MQ_SYS2_PLL_166M] = imx_clk_hw_fixed_factor("sys2_pll_166m", "sys2_pll_out", 1, 6);
> > > +       hws[IMX8MQ_SYS2_PLL_200M] = imx_clk_hw_fixed_factor("sys2_pll_200m", "sys2_pll_out", 1, 5);
> > > +       hws[IMX8MQ_SYS2_PLL_250M] = imx_clk_hw_fixed_factor("sys2_pll_250m", "sys2_pll_out", 1, 4);
> > > +       hws[IMX8MQ_SYS2_PLL_333M] = imx_clk_hw_fixed_factor("sys2_pll_333m", "sys2_pll_out", 1, 3);
> > > +       hws[IMX8MQ_SYS2_PLL_500M] = imx_clk_hw_fixed_factor("sys2_pll_500m", "sys2_pll_out", 1, 2);
> > > +       hws[IMX8MQ_SYS2_PLL_1000M] = imx_clk_hw_fixed_factor("sys2_pll_1000m", "sys2_pll_out", 1, 1);
> > >  
> > >         hws[IMX8MQ_CLK_MON_AUDIO_PLL1_DIV] = imx_clk_hw_divider("audio_pll1_out_monitor", "audio_pll1_bypass", base + 0x78, 0, 3);
> > >         hws[IMX8MQ_CLK_MON_AUDIO_PLL2_DIV] = imx_clk_hw_divider("audio_pll2_out_monitor", "audio_pll2_bypass", base + 0x78, 4, 3);
> > > diff --git a/include/dt-bindings/clock/imx8mq-clock.h b/include/dt-bindings/clock/imx8mq-clock.h
> > > index 82e907ce7bdd..afa74d7ba100 100644
> > > --- a/include/dt-bindings/clock/imx8mq-clock.h
> > > +++ b/include/dt-bindings/clock/imx8mq-clock.h
> > > @@ -405,25 +405,6 @@
> > >  
> > >  #define IMX8MQ_VIDEO2_PLL1_REF_SEL             266
> > >  
> > > -#define IMX8MQ_SYS1_PLL_40M_CG                 267
> > > -#define IMX8MQ_SYS1_PLL_80M_CG                 268
> > > -#define IMX8MQ_SYS1_PLL_100M_CG                        269
> > > -#define IMX8MQ_SYS1_PLL_133M_CG                        270
> > > -#define IMX8MQ_SYS1_PLL_160M_CG                        271
> > > -#define IMX8MQ_SYS1_PLL_200M_CG                        272
> > > -#define IMX8MQ_SYS1_PLL_266M_CG                        273
> > > -#define IMX8MQ_SYS1_PLL_400M_CG                        274
> > > -#define IMX8MQ_SYS1_PLL_800M_CG                        275
> > > -#define IMX8MQ_SYS2_PLL_50M_CG                 276
> > > -#define IMX8MQ_SYS2_PLL_100M_CG                        277
> > > -#define IMX8MQ_SYS2_PLL_125M_CG                        278
> > > -#define IMX8MQ_SYS2_PLL_166M_CG                        279
> > > -#define IMX8MQ_SYS2_PLL_200M_CG                        280
> > > -#define IMX8MQ_SYS2_PLL_250M_CG                        281
> > > -#define IMX8MQ_SYS2_PLL_333M_CG                        282
> > > -#define IMX8MQ_SYS2_PLL_500M_CG                        283
> > > -#define IMX8MQ_SYS2_PLL_1000M_CG               284
> > > -
> > 
> > Just to doubly confirm, none of these are being used in dts files? It
> > would be simpler to leave these defines here and drop the clks from the
> > driver to reduce risk.
> > 
> 
> Double checked. These are not used in any dts files.
> 
> > >  #define IMX8MQ_CLK_GPU_CORE                    285
> > >  #define IMX8MQ_CLK_GPU_SHADER                  286
> > >  #define IMX8MQ_CLK_M4_CORE                     287


