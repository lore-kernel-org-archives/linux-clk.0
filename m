Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADAFFC4332F
	for <linux-clk@archiver.kernel.org>; Thu, 17 Nov 2022 11:43:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234777AbiKQLnA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 17 Nov 2022 06:43:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239848AbiKQLm6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 17 Nov 2022 06:42:58 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BA0E1580A
        for <linux-clk@vger.kernel.org>; Thu, 17 Nov 2022 03:42:57 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1ovdID-0005Ao-34; Thu, 17 Nov 2022 12:42:53 +0100
Received: from mfe by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1ovdIC-0007xX-EO; Thu, 17 Nov 2022 12:42:52 +0100
Date:   Thu, 17 Nov 2022 12:42:52 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Anson Huang <Anson.Huang@nxp.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-amarula@amarulasolutions.com,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>, michael@amarulasolutions.com,
        Fabio Estevam <festevam@gmail.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        linux-arm-kernel@lists.infradead.org,
        Abel Vesa <abelvesa@kernel.org>
Subject: Re: [PATCH v2 0/5] clk: imx8mn: miscellaneous cleanups and bug fixes
Message-ID: <20221117114252.g3bcggwzyf4dxa3z@pengutronix.de>
References: <20221117113637.1978703-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221117113637.1978703-1-dario.binacchi@amarulasolutions.com>
User-Agent: NeoMutt/20180716
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Dario,

On 22-11-17, Dario Binacchi wrote:
> This series has been tested on the BSH SystemMaster (SMM) S2 board.
> 
> Changes in v2:
> - Update the commit message.
> - Add Fixes tag.
> - Maintain IMX8MN_VPU_* constants to not break backward compatibility.
> - Update the commit message.
> - Add Fixes tag.
> - Maintain IMX8MN_VIDEO_PLL1* constants to not break backward
>   compatibility.
> 
> Dario Binacchi (5):
>   clk: imx8mn: rename vpu_pll to m7_alt_pll
>   clk: imx: replace osc_hdmi with dummy
>   clk: imx: rename video_pll1 to video_pll
>   clk: imx8mn: fix imx8mn_sai2_sels clocks list
>   clk: imx8mn: fix imx8mn_enet_phy_sels clocks list

Whole series lgtm, feel free to add my

Acked-by: Marco Felsch <m.felsch@pengutronix.de>
