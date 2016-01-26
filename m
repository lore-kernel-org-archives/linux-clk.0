Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:56069 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751091AbcAZUVl (ORCPT <rfc822;linux-clk@vger.kernel.org>);
	Tue, 26 Jan 2016 15:21:41 -0500
From: Heiko Stuebner <heiko@sntech.de>
To: Alexander Kochetkov <al.kochet@gmail.com>
Cc: stable@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: rockchip: add hclk_cpubus to the list of rk3188 critical clocks
Date: Tue, 26 Jan 2016 21:21:38 +0100
Message-ID: <12983946.PGshY20RJE@phil>
In-Reply-To: <1453815240-15354-1-git-send-email-al.kochet@gmail.com>
References: <1453815240-15354-1-git-send-email-al.kochet@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Am Dienstag, 26. Januar 2016, 16:34:00 schrieb Alexander Kochetkov:
> hclk_cpubus needs to keep running because it is needed for devices like
> the rom, i2s0 or spdif to be accessible via cpu. Without that all
> accesses to devices (readl/writel) return wrong data. So add it
> to the list of critical clocks.
> 
> Fixes: 78eaf6095cc763c ("clk: rockchip: disable unused clocks")
> 
> Signed-off-by: Alexander Kochetkov <al.kochet@gmail.com>

applied to my clk-branch for 4.6


Thanks
Heiko
