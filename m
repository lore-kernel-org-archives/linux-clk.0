Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EAE4C433E6
	for <linux-clk@archiver.kernel.org>; Sat, 30 Jan 2021 13:37:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E38A464DCC
	for <linux-clk@archiver.kernel.org>; Sat, 30 Jan 2021 13:37:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229842AbhA3NhU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 30 Jan 2021 08:37:20 -0500
Received: from mail.kernel.org ([198.145.29.99]:37698 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229468AbhA3NhT (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sat, 30 Jan 2021 08:37:19 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id C204964E15;
        Sat, 30 Jan 2021 13:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612013798;
        bh=KRVssE/W/HbOkd0x6lLMizjG7zTX+tpYZLrB4tgCwhE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KnMqCefnHOcg0JRYWzjwRN8XGrfgbOG3Y2UMMZunjTcFeZrLIQqo0lBh/EGwxtBbF
         18wQtWyRmg7L+rlOqpHn3zTC/6wbYU1uXxnLzKi1K9tj+UKtpWGNXEwtqglr0TRMA7
         Bnwp0J4qzPAsnw/IP29c9Rx3uzK93RW71pOOVgFertz6suPrUQ/yMRbU/QMP4HnKl8
         vG9o9rQoVAPW+gLPkD2tyMfYUh+9lbgTABIDeMMPbPtq+UH5DEjz6Z79n69XSfYU6P
         zJtxKRrwPsvwUFWJO/BtRqpzeTcZMJMKAafQTC8lZFQHlGWJ9acV+cI0h+z9FuB/L0
         /znNNqyZtz3NA==
Date:   Sat, 30 Jan 2021 21:36:32 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Lucas Stach <l.stach@pengutronix.de>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Peng Fan <peng.fan@nxp.com>, Abel Vesa <abel.vesa@nxp.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel@pengutronix.de, patchwork-lst@pengutronix.de
Subject: Re: [PATCH 1/3] clk: imx8mq: add PLL monitor output
Message-ID: <20210130133632.GJ907@dragon>
References: <20210125174135.1223680-1-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210125174135.1223680-1-l.stach@pengutronix.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Jan 25, 2021 at 06:41:33PM +0100, Lucas Stach wrote:
> The PLL monitor is mentioned as a debug feature in the reference manual,
> but there are some boards that use this clock output as a reference clock
> for board level components. Add support for those clocks in the clock
> driver, so this clock output can be used properly.
> 
> Note that the VIDEO1, GPU and VPU mux inputs are rotated compared to the
> description in the reference manual. The order in this patch has been
> empirically validated.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>

Applied all 3, thanks.
