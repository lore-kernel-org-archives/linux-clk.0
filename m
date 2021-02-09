Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54252C43331
	for <linux-clk@archiver.kernel.org>; Tue,  9 Feb 2021 02:36:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3423864EA4
	for <linux-clk@archiver.kernel.org>; Tue,  9 Feb 2021 02:36:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229706AbhBICgL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 8 Feb 2021 21:36:11 -0500
Received: from mail.kernel.org ([198.145.29.99]:34196 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231132AbhBICgI (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 8 Feb 2021 21:36:08 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5A6A064EBE;
        Tue,  9 Feb 2021 02:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612838127;
        bh=7DRKxFbNwRr9XZT9CQcM9kxfMhWzSIfeoMLL9zHrncQ=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=alqbhpSl6F3RMTMo9gNulBrN+hR4F5ezRPlTuzryu4oKey1P2K+dLyS6OXutFOrQp
         VsKnRr4r58NqCWaJT+TGTlWtY/SNOXwEOnNEg/5IS2CFSh45BYpCVmI1v9MX42RQxL
         vaKH7Xtf65YLaeo1pl4sMOwKl/IPvbmYAkzEudHMntzKIdaNpiKAqpZvokNbFxeT+M
         LfT9ct24jQoYYp+tTxrviZ3ugHBYtiuB/riMUNntUzkLMoFq5rt78f//7JI0s1MyM8
         OgTtJ6OVG+hpsNAprjMqu5Daln2/YGj7ad7CT9BLiZNLRFCz0RGHdEJPWjkHvD7S2P
         dYnxB0/zSIGDg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210121071659.1226489-12-m.tretter@pengutronix.de>
References: <20210121071659.1226489-1-m.tretter@pengutronix.de> <20210121071659.1226489-12-m.tretter@pengutronix.de>
Subject: Re: [PATCH v3 11/15] soc: xilinx: vcu: remove calculation of PLL configuration
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     m.mtretter@pengutronix.de, michals@xilinx.com,
        kernel@pengutronix.de, mturquette@baylibre.com
To:     Michael Tretter <m.tretter@pengutronix.de>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Date:   Mon, 08 Feb 2021 18:35:26 -0800
Message-ID: <161283812615.76967.18165570400756233343@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Michael Tretter (2021-01-20 23:16:55)
> As the consumers are now responsible for setting the clock rate via
> clock framework, the clock rate is now calculated using round_rate and
> the driver does not need to calculate the clock rate beforehand.
>=20
> Remove the code that calculates the PLL configuration.
>=20
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> Acked-by: Michal Simek <michal.simek@xilinx.com>
> ---

Applied to clk-next
