Return-Path: <SRS0=jX97=D7=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 265FEC4363A
	for <linux-clk@archiver.kernel.org>; Sat, 24 Oct 2020 20:23:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EADD9222BA
	for <linux-clk@archiver.kernel.org>; Sat, 24 Oct 2020 20:23:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1764383AbgJXUXi (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 24 Oct 2020 16:23:38 -0400
Received: from inva020.nxp.com ([92.121.34.13]:59576 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1764381AbgJXUXi (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sat, 24 Oct 2020 16:23:38 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 72C841A0589;
        Sat, 24 Oct 2020 22:23:35 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 62F541A0547;
        Sat, 24 Oct 2020 22:23:35 +0200 (CEST)
Received: from localhost (fsr-ub1664-175.ea.freescale.net [10.171.82.40])
        by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 4F318202EC;
        Sat, 24 Oct 2020 22:23:35 +0200 (CEST)
Date:   Sat, 24 Oct 2020 23:23:35 +0300
From:   Abel Vesa <abel.vesa@nxp.com>
To:     Adam Ford <aford173@gmail.com>
Cc:     linux-clk@vger.kernel.org, marex@denx.de,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Rob Herring <robh+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org
Subject: Re: [RFC 0/3] clk: imx: Implement blk-ctl driver for i.MX8MN
Message-ID: <20201024202335.y3npwtgragpp5wcz@fsr-ub1664-175>
References: <20201024162016.1003041-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201024162016.1003041-1-aford173@gmail.com>
User-Agent: NeoMutt/20180622
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 20-10-24 11:20:12, Adam Ford wrote:
> There are some less-documented registers which control clocks and 
> resets for the multimedia block which controls the LCDIF, ISI, MIPI 
> CSI, and MIPI DSI.
> 
> The i.Mx8M Nano appears to have a subset of the i.MX8MP registers with
> a couple shared registers with the i.MX8MM.  This series builds on the
> series that have been submitted for both of those other two platforms.
> 
> This is an RFC because when enabling the corresponding DTS node, the 
> system freezes on power on.  There are a couple of clocks that don't
> correspond to either the imx8mp nor the imx8mm, so I might have something
> wrong, and I was hoping for some constructive feedback in order to get
> the imx8m Nano to a similar point of the Mini and Plus.
> 

Thanks for the effort.

I'm assuming this relies on the following patchset, right ?
https://lkml.org/lkml/2020/10/24/139

> Adam Ford (3):
>   dt-bindings: clock: imx8mn: Add media blk_ctl clock IDs
>   dt-bindings: reset: imx8mn: Add media blk_ctl reset IDs
>   clk: imx: Add blk-ctl driver for i.MX8MN
> 
>  drivers/clk/imx/clk-blk-ctl-imx8mn.c     | 80 ++++++++++++++++++++++++
>  include/dt-bindings/clock/imx8mn-clock.h | 11 ++++
>  include/dt-bindings/reset/imx8mn-reset.h | 22 +++++++
>  3 files changed, 113 insertions(+)
>  create mode 100644 drivers/clk/imx/clk-blk-ctl-imx8mn.c
>  create mode 100644 include/dt-bindings/reset/imx8mn-reset.h
> 
> -- 
> 2.25.1
> 
