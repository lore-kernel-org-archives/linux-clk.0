Return-Path: <SRS0=AG5N=4Q=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19E03C3F2D0
	for <linux-clk@archiver.kernel.org>; Fri, 28 Feb 2020 09:36:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DB4D5246AC
	for <linux-clk@archiver.kernel.org>; Fri, 28 Feb 2020 09:36:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EhG0ADsL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726614AbgB1JgY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 28 Feb 2020 04:36:24 -0500
Received: from mail-wr1-f52.google.com ([209.85.221.52]:46143 "EHLO
        mail-wr1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726809AbgB1JgY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 28 Feb 2020 04:36:24 -0500
Received: by mail-wr1-f52.google.com with SMTP id j7so2092179wrp.13
        for <linux-clk@vger.kernel.org>; Fri, 28 Feb 2020 01:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=gPAGlkcQCf/Lm8yRgf2pxUcWg+Lei3LJ/oeCwqIf2XI=;
        b=EhG0ADsLPbPrgMAUt6aaWTKjj+tB1tSOzmQhcyapn2EcxnlwwZOEcIdu+F5SNSrNhM
         AmzjWwkWd/eL10qYcDD5BU/eX0NAQJ9dRJeVOvtukwoHyBp9FL4GhkG1GwTI6PT5mdP1
         yHuWvMbc1nt6rMm322IrAYOoHDkZanu600NurmUxaybZeZ37SEmMP9T4c19tBaomgf2B
         7QG5PP3cNnT4Hmu0dL1mSD6EJEuVjj5Ox4cMCF/eC1tCGy79WVsy2fiqAGoaPlcbzIqx
         RzJ0xS9dtgp8a7khGX3iaswev4kYEdnLr4K9dpK53pjxb9BpI/wTxrFDn9gO2GNUTiTP
         Wljg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=gPAGlkcQCf/Lm8yRgf2pxUcWg+Lei3LJ/oeCwqIf2XI=;
        b=LuLFkSRMUrp5G29/uwlWpaYzNKDUqmp2uaJ2ktD7QqeWK8IAO7kn9SmSmNfDo8ITYx
         v+Kyf5kZWNyeNEOwwo1meir6Yj+scMg8aAiS8V7m6dsfybIhuTQof7M9Vy6+Tmg5xcwx
         YpivPHTK8bdbIZLoB/vGe0+uHahoLAJsmyFlXiF2X+MYUgH0M8B+ceHQeb2j0b2iSiel
         p80yTEHj4jPPiVzDJefIshqNpJ4DvBqk5B+rMbrErHnoI5B14iCz0tPHcTcMK79Fb2lr
         8wi7JqadrnbT2QkCUl+B3UjasmeQjmUtznKj1h2gPU7MfdpW2ymffhwE0WOnJ9AHZNZ3
         aabQ==
X-Gm-Message-State: APjAAAUfo/1b0Q05Nlkrad6zNEygD4Zy9cwg5wBJlncWFYiiRkvnJvzd
        5KOYGBzIWQZwdinaunLcTkQ=
X-Google-Smtp-Source: APXvYqyHR5qGmd+zCJ6OKsvXf4wTw71OXAIBT3QCYzmU4xUr3hIBivc2F1fI3/Zp7Mf8w9iCyu7tRA==
X-Received: by 2002:a5d:53d2:: with SMTP id a18mr3900719wrw.49.1582882582728;
        Fri, 28 Feb 2020 01:36:22 -0800 (PST)
Received: from localhost (dslb-002-207-138-002.002.207.pools.vodafone-ip.de. [2.207.138.2])
        by smtp.gmail.com with ESMTPSA id z14sm8420219wrg.76.2020.02.28.01.36.21
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Feb 2020 01:36:21 -0800 (PST)
Date:   Fri, 28 Feb 2020 10:14:29 +0100
From:   Oliver Graute <oliver.graute@gmail.com>
To:     Anson Huang <anson.huang@nxp.com>
Cc:     Aisheng Dong <aisheng.dong@nxp.com>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: RFC: imx8qm: imx-scu-clk: probe of clk failed
Message-ID: <20200228091429.GE16310@optiplex>
References: <20200227125743.GC16310@optiplex>
 <20200227153110.GD16310@optiplex>
 <DB3PR0402MB3916849150B4778E117B6F86F5E80@DB3PR0402MB3916.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DB3PR0402MB3916849150B4778E117B6F86F5E80@DB3PR0402MB3916.eurprd04.prod.outlook.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 28/02/20, Anson Huang wrote:
> Hi, Oliver
> 
> > Subject: Re: RFC: imx8qm: imx-scu-clk: probe of clk failed
> > 
> > On 27/02/20, Oliver Graute wrote:
> > > Hello Aisheng,
> > > Hello Anson,
> > >
> > > I get the following imx-scu errors when using Linux version
> > > 5.6.0-rc1-next-20200214 with scfw Build 3353, Commit 494c97f3
> > >
> > > It seems that important clocks are off somehow and that lpspi isn't
> > > working because of that. What is the best way to debug such issues?
> > >
> > > [    1.103799] imx-scu scu: NXP i.MX SCU Initialized
> > > [    1.111383] a35_clk: failed to get clock rate -22
> > 
> > After some deeper digging I saw that the reason for "a35_clk: failed" is an
> > IMX_SC_ERR_PARM = 3. Because he trys to get the resource SC_R_A35 which
> > is only available on imx8qxp and not on imx8qm. No clue why he try that
> > instead of SC_R_A53.
> 
> You are running on i.MX8QM board, right? Is it because the A35/A53/A72 clocks
> are registered on same clock driver, so that clock core will calculate their rate during
> clock tree setup? But even A35 clock get rate failed on i.MX8QM, I don't see it will
> impact lpspi.

yes I'am using a i.MX8QM based board. Which clocks are needed to get
lpspi working on imx8qm?
> 
> i.MX8QM is already supported on our internal v5.4 tree, there are some
> changes in clk-scu.c, I pasted some code piece as below, maybe you can
> compare the difference and have a try?

ok I use your proposed code now. A struct clk_scu_pi_ops is missing for
me here. Also I added this:

--- a/include/dt-bindings/clock/imx8-clock.h
+++ b/include/dt-bindings/clock/imx8-clock.h
@@ -131,7 +131,9 @@
 #define IMX_ADMA_PWM_CLK                               188
 #define IMX_ADMA_LCD_CLK                               189

-#define IMX_SCU_CLK_END                                        190
+#define IMX_A53_CLK                                    190
+#define IMX_A72_CLK                                    191
+#define IMX_SCU_CLK_END                                        192

--- a/drivers/clk/imx/clk-imx8qxp.c
+++ b/drivers/clk/imx/clk-imx8qxp.c
@@ -60,6 +68,8 @@ static int imx8qxp_clk_probe(struct platform_device *pdev)

        /* ARM core */
        clks[IMX_A35_CLK]               = imx_clk_scu("a35_clk", IMX_SC_R_A35, IMX_SC_PM_CLK_CPU, clk_cells);
+       clks[IMX_A53_CLK]               = imx_clk_scu("a53_clk", IMX_SC_R_A53, IMX_SC_PM_CLK_CPU, clk_cells);
+       clks[IMX_A72_CLK]               = imx_clk_scu("a72_clk", IMX_SC_R_A72, IMX_SC_PM_CLK_CPU, clk_cells);


Is it correct to use the imx8qxp clock probing here?

Best regards,

Oliver
