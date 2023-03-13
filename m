Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 459D1C61DA4
	for <linux-clk@archiver.kernel.org>; Mon, 13 Mar 2023 16:47:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229883AbjCMQrx (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 13 Mar 2023 12:47:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229901AbjCMQrw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 13 Mar 2023 12:47:52 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04A375FE86
        for <linux-clk@vger.kernel.org>; Mon, 13 Mar 2023 09:47:51 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1pblKh-0003ZU-O7; Mon, 13 Mar 2023 17:47:35 +0100
Received: from mfe by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1pblKf-0008IJ-PH; Mon, 13 Mar 2023 17:47:33 +0100
Date:   Mon, 13 Mar 2023 17:47:33 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     sboyd@kernel.org
Cc:     linux-clk@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Adam Ford <aford173@gmail.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Abel Vesa <abelvesa@kernel.org>, Jacky Bai <ping.bai@nxp.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Richard Cochran <richardcochran@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>, Marek Vasut <marex@denx.de>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v7 1/5] clk: Introduce
 devm_clk_hw_register_gate_parent_data()
Message-ID: <20230313164733.wav2s46y3n4sxyzz@pengutronix.de>
References: <20230301163257.49005-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230301163257.49005-1-marex@denx.de>
User-Agent: NeoMutt/20180716
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Stephen,

seems like we all agreed on this series. Can you have a look on this as
well?

Thanks,
  Marco

On 23-03-01, Marek Vasut wrote:
> Add an API for clock gate that uses parent_data for the parent instead of
> a string parent_name.
> 
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Reviewed-by: Fabio Estevam <festevam@gmail.com>
> Tested-by: Adam Ford <aford173@gmail.com> #imx8mp-beacon-kit
> Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Abel Vesa <abelvesa@kernel.org>
> Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Jacky Bai <ping.bai@nxp.com>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Marco Felsch <m.felsch@pengutronix.de>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Richard Cochran <richardcochran@gmail.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-clk@vger.kernel.org
> ---
> V3: New patch
> V4: - Rebase on next 20230223
> V5: Add TB from Adam and Alexander
> V6: Add RB from Fabio
> V7: Add RB from Peng
> ---
>  include/linux/clk-provider.h | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
> index 842e72a5348fa..92b7c794c6272 100644
> --- a/include/linux/clk-provider.h
> +++ b/include/linux/clk-provider.h
> @@ -608,6 +608,25 @@ struct clk *clk_register_gate(struct device *dev, const char *name,
>  	__devm_clk_hw_register_gate((dev), NULL, (name), (parent_name), NULL, \
>  			       NULL, (flags), (reg), (bit_idx),		      \
>  			       (clk_gate_flags), (lock))
> +
> +/**
> + * devm_clk_hw_register_gate - register a gate clock with the clock framework
> + * @dev: device that is registering this clock
> + * @name: name of this clock
> + * @parent_data: parent clk data
> + * @flags: framework-specific flags for this clock
> + * @reg: register address to control gating of this clock
> + * @bit_idx: which bit in the register controls gating of this clock
> + * @clk_gate_flags: gate-specific flags for this clock
> + * @lock: shared register lock for this clock
> + */
> +#define devm_clk_hw_register_gate_parent_data(dev, name, parent_data, flags,  \
> +					      reg, bit_idx, clk_gate_flags,   \
> +					      lock)			      \
> +	__devm_clk_hw_register_gate((dev), NULL, (name), NULL, NULL,	      \
> +				    (parent_data), (flags), (reg), (bit_idx), \
> +				    (clk_gate_flags), (lock))
> +
>  void clk_unregister_gate(struct clk *clk);
>  void clk_hw_unregister_gate(struct clk_hw *hw);
>  int clk_gate_is_enabled(struct clk_hw *hw);
> -- 
> 2.39.2
> 
> 
