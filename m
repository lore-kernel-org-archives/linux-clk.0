Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11D81C636D6
	for <linux-clk@archiver.kernel.org>; Wed, 22 Feb 2023 16:59:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229950AbjBVQ7D (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 22 Feb 2023 11:59:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229907AbjBVQ7C (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 22 Feb 2023 11:59:02 -0500
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::224])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 290841E1DF
        for <linux-clk@vger.kernel.org>; Wed, 22 Feb 2023 08:59:00 -0800 (PST)
Received: from booty (unknown [77.244.183.192])
        (Authenticated sender: luca.ceresoli@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 5C003E0003;
        Wed, 22 Feb 2023 16:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1677085139;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=BjOdiqpPXgXpjWK4KDIQnbRFIloCXPnuO8ncEXyTUas=;
        b=gkE9q40AdjZNckDMSeQOa0mpbw0IJXEfhGNweq0hlhDyV29Xp7jbqT1jgo3DG8wya6e8gb
        3QYEnXXMcnuyaiHnpzQaIauKiPvCca2JIJ/7SmTNkCsO8jO9UjhVHEgTJSRxKAs4BsEl20
        LQOdZ36DvwGqsSJdbUZG1KMrdInv7LWisiFMg7vDldfThslwyP60iLurdBM9qSjKIJ/KwP
        wd8ZDPeSy/IzM6ivM9ZUNoUDMj4y1KkrsWxduqfyQOkQaXamVK2BwxS+tWgKuFXRiMMXQT
        8Gn3HXdeYjrcxfZguVQFkiziWmlKbJzsSBmjSBl4O0nL4Qbeq/s8sc4eu1JM4Q==
Date:   Wed, 22 Feb 2023 17:58:55 +0100
From:   Luca Ceresoli <luca.ceresoli@bootlin.com>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-clk@vger.kernel.org, Abel Vesa <abel.vesa@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Jacky Bai <ping.bai@nxp.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com
Subject: Re: [PATCH v3 3/6] clk: imx: imx8mp: Add audiomix block control
Message-ID: <20230222175855.7940e53a@booty>
In-Reply-To: <20220625013235.710346-3-marex@denx.de>
References: <20220625013235.710346-1-marex@denx.de>
        <20220625013235.710346-3-marex@denx.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Marek,

On Sat, 25 Jun 2022 03:32:32 +0200
Marek Vasut <marex@denx.de> wrote:

> Unlike the other block control IPs in i.MX8M, the audiomix is mostly a
> series of clock gates and muxes. Model it as a large static table of
> gates and muxes with one exception, which is the PLL14xx . The PLL14xx
> SAI PLL has to be registered separately.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Abel Vesa <abel.vesa@nxp.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Jacky Bai <ping.bai@nxp.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-clk@vger.kernel.org
> Cc: linux-imx@nxp.com

[Tested on MSC SM2-MB-EP1 Carrier Board with SM2S-IMX8PLUS-QC6-14N0600E SoM]
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
