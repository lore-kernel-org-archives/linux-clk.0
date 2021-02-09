Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AD84C4332D
	for <linux-clk@archiver.kernel.org>; Tue,  9 Feb 2021 02:36:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2398664EA4
	for <linux-clk@archiver.kernel.org>; Tue,  9 Feb 2021 02:36:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231168AbhBICgK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 8 Feb 2021 21:36:10 -0500
Received: from mail.kernel.org ([198.145.29.99]:34176 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231166AbhBICgC (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 8 Feb 2021 21:36:02 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id C142B64EBC;
        Tue,  9 Feb 2021 02:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612838121;
        bh=DN1lAnjnLnsMN0INhztK+mh/o/okJKT4odpP6urnQn4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=k+cbWcBFYKPbTsy3EOSwijNAGqnRkYZcJyYL6X5m991tlgEGT7qRsdgdStGnXj2Vg
         UXDYyjlwO9K2GX9ZhsFyoMXAlq9ySA5yd798oy3w7a2b9AtyzwVZitRZVRKSWz3/xf
         kUubkQjsgq/uPJ5KqUpAOQ33NXPs8tQGBLSpwG2qOsvKA0RcUHqhO2Hn7ZfXX9haeR
         IDx1LHvXRzQKtFpS+ydc+QOZB+C7MkdHXQ1A6SdpgDWE9IhzHWg9HIsLODfIuYgyQz
         VfuO3hh0lKDMNXAQohPgUWOMjYl1wk+atTNieRIDd43Iw7/Bbg6EBY2QnWOAfp3srE
         XaUj0BzYZGWAw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210121071659.1226489-11-m.tretter@pengutronix.de>
References: <20210121071659.1226489-1-m.tretter@pengutronix.de> <20210121071659.1226489-11-m.tretter@pengutronix.de>
Subject: Re: [PATCH v3 10/15] soc: xilinx: vcu: make the PLL configurable
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     m.mtretter@pengutronix.de, michals@xilinx.com,
        kernel@pengutronix.de, mturquette@baylibre.com
To:     Michael Tretter <m.tretter@pengutronix.de>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Date:   Mon, 08 Feb 2021 18:35:20 -0800
Message-ID: <161283812051.76967.2989359787806520148@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Michael Tretter (2021-01-20 23:16:54)
> Do not configure the PLL when probing the driver, but register the clock
> in the clock framework and do the configuration based on the respective
> callbacks.
>=20
> This is necessary to allow the consumers, i.e., encoder and decoder
> drivers, of the xlnx_vcu clock provider to set the clock rate and
> actually enable the clocks without relying on some pre-configuration.
>=20
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> Acked-by: Michal Simek <michal.simek@xilinx.com>
> ---

Applied to clk-next
