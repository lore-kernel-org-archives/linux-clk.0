Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15D7DC7EE23
	for <linux-clk@archiver.kernel.org>; Fri, 24 Feb 2023 16:38:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229679AbjBXQi3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 24 Feb 2023 11:38:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229553AbjBXQi2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 24 Feb 2023 11:38:28 -0500
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A75F072A3;
        Fri, 24 Feb 2023 08:38:26 -0800 (PST)
Received: from booty (unknown [77.244.183.192])
        (Authenticated sender: luca.ceresoli@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 62BB21BF20E;
        Fri, 24 Feb 2023 16:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1677256705;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=IcwVBMNJxREzAORSB4kwnslnfJW5DZUbMD+E/Pg4QUI=;
        b=Qvx1aSQrhkeqEq19g8opXBm26MmSXSy9FWspGxqNL10YEXRd/YW9UgQACHVM2qjOSqWupk
        6jSALGtl+yYBFU6MS8qY+MSVSrnpEbZANxFkXUtCxP8UgZ/gwA0b/yMqoRM6W9J8cx//il
        le4EkDfKhZPxI+b1nT1td1wVkIZHEcoLTrIhIP0Tk3k/wDyQtDl5+8rIUUJcqswnS/0+NN
        HVf77A8PC2mW+x4IKpk5H+FOZh14eABKzZrAp8Q9c+hPjueVY7tpaSqqOQVFx/7emrK5kF
        Y50oihFedkwuKxnnFlyqapLTfSBMEUUB/mvNnokJaRtSGQJssBG76GE2ODEogA==
Date:   Fri, 24 Feb 2023 17:38:20 +0100
From:   Luca Ceresoli <luca.ceresoli@bootlin.com>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-clk@vger.kernel.org, Abel Vesa <abelvesa@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Jacky Bai <ping.bai@nxp.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Peng Fan <peng.fan@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Richard Cochran <richardcochran@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 2/5] clk: imx: imx8mp: Add audiomix block control
Message-ID: <20230224173820.644929b6@booty>
In-Reply-To: <20230223171114.59164-2-marex@denx.de>
References: <20230223171114.59164-1-marex@denx.de>
        <20230223171114.59164-2-marex@denx.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Marek,

On Thu, 23 Feb 2023 18:11:11 +0100
Marek Vasut <marex@denx.de> wrote:

> Unlike the other block control IPs in i.MX8M, the audiomix is mostly a
> series of clock gates and muxes. Model it as a large static table of
> gates and muxes with one exception, which is the PLL14xx . The PLL14xx
> SAI PLL has to be registered separately.
> 
> Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

  ^ confirmed with v4, works as well

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
