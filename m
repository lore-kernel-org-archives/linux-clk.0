Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0791C7EE30
	for <linux-clk@archiver.kernel.org>; Thu,  2 Mar 2023 11:56:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229673AbjCBL4x (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 2 Mar 2023 06:56:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229455AbjCBL4w (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 2 Mar 2023 06:56:52 -0500
X-Greylist: delayed 362 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 02 Mar 2023 03:56:50 PST
Received: from out-18.mta1.migadu.com (out-18.mta1.migadu.com [95.215.58.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DEA0311E5
        for <linux-clk@vger.kernel.org>; Thu,  2 Mar 2023 03:56:50 -0800 (PST)
Date:   Thu, 2 Mar 2023 12:50:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1677757846;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ZHxXUIjZ3yM2bOr/sXKxK6BLdhEY+KdmmLiQWDKvLtY=;
        b=O7BumZJJUoKzE3C4Klysvp7axH0nizavxX2q3VqKTyC7/tOM4bSQMS57S2yDpNPMNyaTKu
        YPXpFZx7d5ScYhYpuh7ZYVzHCLCEeUW+soywo5Us7x70XW4VqeR0sp1bJRUQDni7kz4Hc5
        XdPGt0/Sb4+KrK7to2VRq41QHlXyNyw=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Richard Leitner <richard.leitner@linux.dev>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-clk@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Adam Ford <aford173@gmail.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Abel Vesa <abelvesa@kernel.org>, Jacky Bai <ping.bai@nxp.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Richard Cochran <richardcochran@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v7 1/5] clk: Introduce
 devm_clk_hw_register_gate_parent_data()
Message-ID: <ZACNk0gzThkklzsl@g0hl1n.net>
References: <20230301163257.49005-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230301163257.49005-1-marex@denx.de>
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Mar 01, 2023 at 05:32:53PM +0100, Marek Vasut wrote:
> Add an API for clock gate that uses parent_data for the parent instead of
> a string parent_name.
> 
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Reviewed-by: Fabio Estevam <festevam@gmail.com>
> Tested-by: Adam Ford <aford173@gmail.com> #imx8mp-beacon-kit
> Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Signed-off-by: Marek Vasut <marex@denx.de>

Hi Marek,
I've successfully tested this patch on a custom i.MX8MP board. Therefore
please feel free to add:

Tested-by: Richard Leitner <richard.leitner@skidata.com>
