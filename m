Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE5FEC433FE
	for <linux-clk@archiver.kernel.org>; Mon, 21 Nov 2022 08:17:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229491AbiKUIRj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 21 Nov 2022 03:17:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229910AbiKUIRi (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 21 Nov 2022 03:17:38 -0500
Received: from out0.migadu.com (out0.migadu.com [IPv6:2001:41d0:2:267::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5971A9596
        for <linux-clk@vger.kernel.org>; Mon, 21 Nov 2022 00:17:36 -0800 (PST)
Date:   Mon, 21 Nov 2022 09:17:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1669018654;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=pemYSnj+jbbKFXAvy4XdcuWPzFdwvBsWpmIWJ/cB83Q=;
        b=qDV1amuKOSNyQCE/0Fhm/Y7Q7TO5eFzuZDDrky0ugt9G9i9/ynaTMn4A/uY3ofpJmKCYxI
        P0DqYhLA74Se4FKFZqH7VAUA9r++eii/KooOI4WSSFHn/rg2aSrtE3cLZSr3ULyAjfUDW+
        KY77FzCQ2LrXMfeNWik9hlTN30BXP2k=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Richard Leitner <richard.leitner@linux.dev>
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
Subject: Re: [PATCH v3 1/6] clk: Introduce
 devm_clk_hw_register_mux_parent_data()
Message-ID: <Y3s0GzxgSG9Tu450@skidata.com>
References: <20220625013235.710346-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220625013235.710346-1-marex@denx.de>
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

On Sat, Jun 25, 2022 at 03:32:30AM +0200, Marek Vasut wrote:
> Add an API for clock mux that uses parent_data for the parent instead of
> a string parent_name.

Just stubled across this thread while trying to bring up audio on a
i.MX8MP. The last reply in this series is from October and patch #1 & #6
doesn't apply on v6.1-rc6...
Therefore I'm curious if there is any newer version of this series I
missed? Or is there something I can help with? Especially testing?

regards;rl
