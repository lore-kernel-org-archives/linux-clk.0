Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27FF6C4332B
	for <linux-clk@archiver.kernel.org>; Tue,  9 Feb 2021 02:36:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F1AD664EAC
	for <linux-clk@archiver.kernel.org>; Tue,  9 Feb 2021 02:36:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231157AbhBICgB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 8 Feb 2021 21:36:01 -0500
Received: from mail.kernel.org ([198.145.29.99]:34142 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230490AbhBICf4 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 8 Feb 2021 21:35:56 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2324064EBD;
        Tue,  9 Feb 2021 02:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612838116;
        bh=mXEOeVgMILJLqYYBs8rYyU3LrXs7dxbak43+PL/OPhI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=ayiaKiPDhek8ua6ntAJZu88d7dejReQBbf2jhucLHlom6GtbI0fqX5vD5OKpLJh7S
         M/aVw6kezENbxmJmAQI7ie7gIvxKtQbAVoVgnV/0cgAEKhYpEdxLVxN2Uq8YujKeiC
         pRksCPBAkU7Xn/ofAFwObHBZeF48T9sfkv5aq/HSoCQr9FPL7iwAM8sG32Fh2bf2+V
         UVAsoJFz9D+KcR2cr1+sXCJkmBXGBvHcuCWgnH50HZKVWCn5m4YsPIy+B+Uk1YyTX7
         VUUMaISNtvYvEdhRJI5S8MTMDJ0IPa01uuLlojbGUeOWtLJGUaxJ3PbtlRq7k9AWhq
         tYNvjvHG+whpg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210121071659.1226489-10-m.tretter@pengutronix.de>
References: <20210121071659.1226489-1-m.tretter@pengutronix.de> <20210121071659.1226489-10-m.tretter@pengutronix.de>
Subject: Re: [PATCH v3 09/15] soc: xilinx: vcu: make pll post divider explicit
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     m.mtretter@pengutronix.de, michals@xilinx.com,
        kernel@pengutronix.de, mturquette@baylibre.com
To:     Michael Tretter <m.tretter@pengutronix.de>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Date:   Mon, 08 Feb 2021 18:35:14 -0800
Message-ID: <161283811492.76967.12550892371365309943@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Michael Tretter (2021-01-20 23:16:53)
> According to the downstream driver documentation due to timing
> constraints the output divider of the PLL has to be set to 1/2. Add a
> helper function for that check instead of burying the code in one large
> setup function.
>=20
> The bit is undocumented and marked as reserved in the register
> reference.
>=20
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> Acked-by: Michal Simek <michal.simek@xilinx.com>
> ---

Applied to clk-next
