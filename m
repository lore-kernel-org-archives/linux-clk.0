Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:44340 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751395AbeCWHyH (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 23 Mar 2018 03:54:07 -0400
From: Heiko Stuebner <heiko@sntech.de>
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 2/3] clk: rockchip: Fix wrong parent for SDMMC phase clock for rk3228
Date: Fri, 23 Mar 2018 08:51:40 +0100
Message-ID: <2742343.qouzS0Ddo7@phil>
In-Reply-To: <1521599960-34381-2-git-send-email-shawn.lin@rock-chips.com>
References: <1521599960-34381-1-git-send-email-shawn.lin@rock-chips.com> <1521599960-34381-2-git-send-email-shawn.lin@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Am Mittwoch, 21. März 2018, 03:39:19 CET schrieb Shawn Lin:
> commit c420c1e4db22 ("clk: rockchip: Prevent calculating mmc phase
> if clock rate is zero") catches one gremlin again for clk-rk3228.c
> that the parent of SDMMC phase clock should be sclk_sdmmc0, but not
> sclk_sdmmc. However, I don't like the name of sclk_sdmmc0, so I now
> rename it to be sclk_sdmmc.
> 
> Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>

applied to my clk-branch after adapting the commit message a bit,
so that it is less about personal taste and highlights the discrepancy
in the manual between clk_sdmmc0 and hclk_sdmmc (without 0)
and we thus standardize on the one without 0.


Heiko
