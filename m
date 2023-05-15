Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2D2AC7EE22
	for <linux-clk@archiver.kernel.org>; Mon, 15 May 2023 01:30:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229797AbjEOBa6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 14 May 2023 21:30:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229976AbjEOBa5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 14 May 2023 21:30:57 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D1D7B9;
        Sun, 14 May 2023 18:30:54 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3913961CD2;
        Mon, 15 May 2023 01:30:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BF83C433D2;
        Mon, 15 May 2023 01:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684114253;
        bh=1YwRJsz4bjeDzaGLdHHEuhRHYha2f/lVMZzE4VeBLss=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AdyfZzvnn2zXvAJDRCz7VSgDYQxv+LKtlTorkA2TGfXRvZw9zlScV8KqzRy02zGXx
         cwxiBEU2Vo1iYRmUrIizxU3iknvZrqNIBkMGL55IIpZ5Jh+N/FQxxQRe2M5R9x0D1w
         BlwCHWOnyL0F8XW8+navcvSgLJLR+eVg32TqD+pY2eXPqV+eCk42zfsa+HiyPJH8dv
         +VPXxzONymQmZ0gNyPHYuoxzd4qct7PcmTOOEB3QVTy2i9JlUXKMt13u/D6FOeQGtJ
         fWsJXrHPEtWrPUE/MpXwEMQ05xD6hfbwYAXRFcBKSC8t89Y2UwUm53qF5r8I5cGs0K
         RX1gc7DbZah3A==
Date:   Mon, 15 May 2023 09:30:38 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Adam Ford <aford173@gmail.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Richard Leitner <richard.leitner@skidata.com>,
        Abel Vesa <abelvesa@kernel.org>, Jacky Bai <ping.bai@nxp.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Richard Cochran <richardcochran@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH v8 1/2] arm64: dts: imx8mp: Add SAI, SDMA, AudioMIX
Message-ID: <20230515013038.GB767028@dragon>
References: <20230508114236.8444-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230508114236.8444-1-marex@denx.de>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, May 08, 2023 at 01:42:35PM +0200, Marek Vasut wrote:
> Add all SAI nodes, SDMA2 and SDMA3 nodes, and AudioMIX node. This is
> needed to get audio operational on i.MX8MP .
> 
> Acked-by: Peng Fan <peng.fan@nxp.com>
> Reviewed-by: Fabio Estevam <festevam@gmail.com>
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>
> Tested-by: Adam Ford <aford173@gmail.com> #imx8mp-beacon-kit
> Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Tested-by: Richard Leitner <richard.leitner@skidata.com>
> Signed-off-by: Marek Vasut <marex@denx.de>

Applied both, thanks!
