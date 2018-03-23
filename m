Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:44590 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751797AbeCWISJ (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 23 Mar 2018 04:18:09 -0400
From: Heiko Stuebner <heiko@sntech.de>
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 1/3] clk: rockchip: Fix wrong parents for MMC phase clock for rk3328
Date: Fri, 23 Mar 2018 09:18:05 +0100
Message-ID: <2350960.e3EHEgP2OW@phil>
In-Reply-To: <1521599960-34381-1-git-send-email-shawn.lin@rock-chips.com>
References: <1521599960-34381-1-git-send-email-shawn.lin@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Am Mittwoch, 21. März 2018, 03:39:18 CET schrieb Shawn Lin:
> commit c420c1e4db22 ("clk: rockchip: Prevent calculating mmc phase if
> clock rate is zero") catches some gremlins for clk-rk3328.c that the
> parents of MMC phase clock should be clk_{sdmmc, sdio, emmc}, but not
> sclk_{sdmmc, sdio, emmc}.
> 
> Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>

applied for 4.17


Thanks
Heiko
