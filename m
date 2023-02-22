Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56EF3C636D6
	for <linux-clk@archiver.kernel.org>; Wed, 22 Feb 2023 17:23:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229564AbjBVRXO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 22 Feb 2023 12:23:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232696AbjBVRXB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 22 Feb 2023 12:23:01 -0500
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08DAD8A4E
        for <linux-clk@vger.kernel.org>; Wed, 22 Feb 2023 09:22:56 -0800 (PST)
Received: from booty (unknown [77.244.183.192])
        (Authenticated sender: luca.ceresoli@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 6C5D040002;
        Wed, 22 Feb 2023 17:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1677086575;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3Xl5RikiACyYQxItKqWbCFrWkyMhwRXOlZGZbIyVlW0=;
        b=afWsAyYAapONsnm2hqBUiR7m67tTtCbTNYs+4qQ8dlqLAhvDsCkQv0eMOHR0+3RUMRrIu9
        4l9plu8rSArz2lqtCqOyRpk0FJgqoy3fPXOaMPisNcE7dBglN0zWIr1ZY0bwX0iSPARSsD
        +oGRCfiYpM1SOqSAsyac0HTsAf7pBcCAW6//OqSA1Fx0hxKho5im6y7sdNg4V99SNtjSkE
        Bf0pOuRC/8gCdXO+MkVHrRWUI3ipt6Z5INsDe2siRi8stVij+q68t5aC8V0fR4ZukHEsR2
        XzyoAY/ld/lwvvNmuToO3zQRzPs9AVoRwnM94iT1FvXncfJPaAK/CQi+EpNfYA==
Date:   Wed, 22 Feb 2023 18:22:52 +0100
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
Subject: Re: [PATCH v3 6/6] arm64: dts: imx8mp: Add analog audio output on
 i.MX8MP EVK
Message-ID: <20230222182252.2ad6d82b@booty>
In-Reply-To: <20220625013235.710346-6-marex@denx.de>
References: <20220625013235.710346-1-marex@denx.de>
        <20220625013235.710346-6-marex@denx.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hello Marek,

On Sat, 25 Jun 2022 03:32:35 +0200
Marek Vasut <marex@denx.de> wrote:

> Enable SAI3 on i.MX8MP EVK, add WM8960 codec binding and regulator.
> This is all that is needed to get analog audio output operational
> on i.MX8MP EVK.
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

I'm sending in reply to this e-mail the device tree patch I have used
for my audio testing on the MSC SM2-MB-EP1 board. Feel free to add it to
your series if you want, it obviously depends on it.

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
