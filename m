Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDD67C636D6
	for <linux-clk@archiver.kernel.org>; Wed, 22 Feb 2023 16:59:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230511AbjBVQ7I (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 22 Feb 2023 11:59:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229907AbjBVQ7H (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 22 Feb 2023 11:59:07 -0500
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E0B7311C7
        for <linux-clk@vger.kernel.org>; Wed, 22 Feb 2023 08:59:06 -0800 (PST)
Received: from booty (unknown [77.244.183.192])
        (Authenticated sender: luca.ceresoli@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 3488320003;
        Wed, 22 Feb 2023 16:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1677085144;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=iEQxvWrxbpTxyu3Q0wydCjns2LYskbAVMpfwxHm4QSw=;
        b=mNMDhnnYG8B7d1Z37jVQms7cmwomsNIt53ChXXtCdrFC3s+QxKfdqayQgUyehMaM1dDbM/
        Ae7/g9cchf/vsigeUeXPXHCRCmdu80tOkWrwOIHdUtPxcjFfS0/+3Eu59x5lxq6EDRuZWb
        nm5pjv0VYl3HPbMa7Vgj1VnSN3KSikK8Y7uaFdHSiWmMF25OiscPNMMwXgHhR7LvtnRkA8
        u6yXgMsIqxex5UWW2iIjcBBfoGkE5NJyo+SjbNq8pI1aRu1alKPgF3eTFsfulOvqJSqsi2
        meFWebSdshsEVNKS5wEN0mfN93eTxrrrIr+u1z5HLRQjpsn+zBkqbPSEPL4o0w==
Date:   Wed, 22 Feb 2023 17:59:00 +0100
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
Subject: Re: [PATCH v3 5/6] arm64: dts: imx8mp: Add SAI, SDMA, AudioMIX
Message-ID: <20230222175900.43cccd93@booty>
In-Reply-To: <20220625013235.710346-5-marex@denx.de>
References: <20220625013235.710346-1-marex@denx.de>
        <20220625013235.710346-5-marex@denx.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Marek,

On Sat, 25 Jun 2022 03:32:34 +0200
Marek Vasut <marex@denx.de> wrote:

> Add all SAI nodes, SDMA2 and SDMA3 nodes, and AudioMIX node. This is
> needed to get audio operational on i.MX8MP .
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

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
[Tested on MSC SM2-MB-EP1 Carrier Board with SM2S-IMX8PLUS-QC6-14N0600E SoM]
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>


-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
