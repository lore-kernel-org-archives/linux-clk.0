Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05B08C678D4
	for <linux-clk@archiver.kernel.org>; Thu,  2 Mar 2023 15:07:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229501AbjCBPHy (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 2 Mar 2023 10:07:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229586AbjCBPHx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 2 Mar 2023 10:07:53 -0500
Received: from out-25.mta1.migadu.com (out-25.mta1.migadu.com [IPv6:2001:41d0:203:375::19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67BE9460BD
        for <linux-clk@vger.kernel.org>; Thu,  2 Mar 2023 07:07:49 -0800 (PST)
Date:   Thu, 2 Mar 2023 16:07:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1677769667;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=8UIAhmGYviI3eSjqMW6UHeGBLYIfMsmL4NmJ9jDuWwA=;
        b=Bwkbq/00TEcouQDjpZHh1tzi+B+LcPfaZxRbQehItGHJoKnXG7nzIn2qjIrCzofhOEPWgM
        q0L38AjmkY6lGMGeep4Pnzj5JwL4toENHRHYElRXgq2RxBhOqtoHKKR0h9cU1e010Oew7l
        6WKdlCpu2abP6rvoJoJX6143o97vN0U=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Richard Leitner <richard.leitner@linux.dev>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Marek Vasut <marex@denx.de>, linux-clk@vger.kernel.org,
        Fabio Estevam <festevam@gmail.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Peng Fan <peng.fan@nxp.com>, Rob Herring <robh@kernel.org>,
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
        Shawn Guo <shawnguo@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v7 3/5] dt-bindings: clock: imx8mp: Add audiomix block
 control
Message-ID: <ZAC7wGDP42yuBc5z@g0hl1n.net>
References: <20230301163257.49005-1-marex@denx.de>
 <20230301163257.49005-3-marex@denx.de>
 <ZACNrbVDU/4ucU51@g0hl1n.net>
 <3bc36b09-d23a-2fd8-0ca7-5ebb9267a414@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3bc36b09-d23a-2fd8-0ca7-5ebb9267a414@linaro.org>
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Mar 02, 2023 at 02:01:02PM +0100, Krzysztof Kozlowski wrote:
> On 02/03/2023 12:51, Richard Leitner wrote:
> > On Wed, Mar 01, 2023 at 05:32:55PM +0100, Marek Vasut wrote:
> >> Unlike the other block control IPs in i.MX8M, the audiomix is mostly a
> >> series of clock gates and muxes. Add DT bindings for this IP.
> >>
> >> Reviewed-by: Fabio Estevam <festevam@gmail.com>
> >> Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>
> >> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> >> Reviewed-by: Rob Herring <robh@kernel.org>
> >> Tested-by: Adam Ford <aford173@gmail.com> #imx8mp-beacon-kit
> >> Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> >> Signed-off-by: Marek Vasut <marex@denx.de>
> > 
> > Hi Marek,
> > I've successfully tested this patch on a custom i.MX8MP board. Therefore
> > please feel free to add:
> 
> How can you test a binding patch on a board?

I have no idea... Sorry. That text was copied/pasted. That shouldn't
have happened.

regards;rl

> 
> Best regards,
> Krzysztof
> 
