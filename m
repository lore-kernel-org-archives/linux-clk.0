Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4625BC433DB
	for <linux-clk@archiver.kernel.org>; Tue,  9 Feb 2021 02:33:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0A82464E99
	for <linux-clk@archiver.kernel.org>; Tue,  9 Feb 2021 02:33:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230389AbhBICdm (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 8 Feb 2021 21:33:42 -0500
Received: from mail.kernel.org ([198.145.29.99]:33678 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229702AbhBICdl (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 8 Feb 2021 21:33:41 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id A9ECE64EC4;
        Tue,  9 Feb 2021 02:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612837963;
        bh=hgjqQc4b/SGxZ8HklxvwOWeaunQftuj+LiHbLeVfnpE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=ELbg5A241EETDcqCzZ7Hx2BfYOU+YQ0tKC9icAefpPK39Ayg34cr76xaU8aV+TujG
         S4/WSM/JkqyglfZZ8DHNVBTQBhrO9yLqJruHPYwP8e+qB36JCUylrYPI08cQqGr8W8
         nkRN0ORnxCW0B3KNK68lQHEuBwBgG6Pt8AiSRNQ2nQonbVJvFmSkDUSlYaiC04fry0
         vzZsC/OcWtgfI17zCqlozJvi+PrfafCjr+JRCBqd/DCWe9j1JUn6+gzCDIujLG7Lse
         5MDwYi2vKIbhrA/GX8QRtem28cvNyDZwfPja9GJ8JBGMeVkhw22sp0V1Q38RaIqm6F
         a//qd/NjldgjQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210121071659.1226489-8-m.tretter@pengutronix.de>
References: <20210121071659.1226489-1-m.tretter@pengutronix.de> <20210121071659.1226489-8-m.tretter@pengutronix.de>
Subject: Re: [PATCH v3 07/15] soc: xilinx: vcu: register PLL as fixed rate clock
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     m.mtretter@pengutronix.de, michals@xilinx.com,
        kernel@pengutronix.de, mturquette@baylibre.com
To:     Michael Tretter <m.tretter@pengutronix.de>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Date:   Mon, 08 Feb 2021 18:32:42 -0800
Message-ID: <161283796259.76967.12528625780614261771@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Michael Tretter (2021-01-20 23:16:51)
> Currently, xvcu_pll_set_rate configures the PLL to a clock rate that is
> pre-calculated when probing the driver. To still make the clock
> framework aware of the PLL and to allow to configure other clocks based
> on the PLL rate, register the PLL as a fixed rate clock.
>=20
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> Acked-by: Michal Simek <michal.simek@xilinx.com>
> ---

Applied to clk-next
