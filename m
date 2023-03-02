Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0274BC7EE37
	for <linux-clk@archiver.kernel.org>; Thu,  2 Mar 2023 11:56:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229510AbjCBL4y (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 2 Mar 2023 06:56:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229624AbjCBL4w (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 2 Mar 2023 06:56:52 -0500
Received: from out-60.mta1.migadu.com (out-60.mta1.migadu.com [IPv6:2001:41d0:203:375::3c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42A7034035
        for <linux-clk@vger.kernel.org>; Thu,  2 Mar 2023 03:56:51 -0800 (PST)
Date:   Thu, 2 Mar 2023 12:50:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1677757860;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=08ekkotVo/7wea+t0o65FQHG/o1o1pxzonmpikTVPD8=;
        b=DqgwUpLGe8k9I2oxDcBkbzqhYUXnow848Hf2YaK2kPdSXCnVwAgZk9sA43ltf/QcXffeqv
        IhP0Y4su1TwqcaNyXLn2JeoTIetD2Y98lcuuJqQ+w0cL1Klllh+wO4vmE4U7iikivmBFn6
        LN9o/Ax4O7olctW00SR21adZ1yPpBjk=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Richard Leitner <richard.leitner@linux.dev>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-clk@vger.kernel.org, Marco Felsch <m.felsch@pengutronix.de>,
        Peng Fan <peng.fan@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Adam Ford <aford173@gmail.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
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
        Shawn Guo <shawnguo@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v7 2/5] clk: imx: imx8mp: Add audiomix block control
Message-ID: <ZACNojvgyKTVjVtk@g0hl1n.net>
References: <20230301163257.49005-1-marex@denx.de>
 <20230301163257.49005-2-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230301163257.49005-2-marex@denx.de>
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Mar 01, 2023 at 05:32:54PM +0100, Marek Vasut wrote:
> Unlike the other block control IPs in i.MX8M, the audiomix is mostly a
> series of clock gates and muxes. Model it as a large static table of
> gates and muxes with one exception, which is the PLL14xx . The PLL14xx
> SAI PLL has to be registered separately.
> 
> Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Reviewed-by: Fabio Estevam <festevam@gmail.com>
> Tested-by: Adam Ford <aford173@gmail.com> #imx8mp-beacon-kit
> Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Signed-off-by: Marek Vasut <marex@denx.de>

Hi Marek,
I've successfully tested this patch on a custom i.MX8MP board. Therefore
please feel free to add:

Tested-by: Richard Leitner <richard.leitner@skidata.com>
