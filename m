Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:42367 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1161505AbcA1RBK (ORCPT <rfc822;linux-clk@vger.kernel.org>);
	Thu, 28 Jan 2016 12:01:10 -0500
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Alexander Kochetkov <al.kochet@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: rockchip: Allow sclk_i2s0 and i2s0_frac to change their parents rate on rk3188
Date: Thu, 28 Jan 2016 18:01:08 +0100
Message-ID: <1687954.9WCMHmWDJQ@diego>
In-Reply-To: <1453897469-2134-1-git-send-email-al.kochet@gmail.com>
References: <1453897469-2134-1-git-send-email-al.kochet@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Alexander,

Am Mittwoch, 27. Januar 2016, 15:24:29 schrieb Alexander Kochetkov:
> Allow sclk_i2s0 and i2s0_frac to change their parents rate as
> that the upstream dividers are purely there to feed sclk_i2s0
> 
> Tested on radxarock-lite.
> 
> Signed-off-by: Alexander Kochetkov <al.kochet@gmail.com>

doesn't apply due to the fractional divider change going into 4.5

please respin on top of 4.5-rc1 (or my clock-branch for 4.6 [0],
but should be the same in that regard).


Thanks
Heiko

[0] https://git.kernel.org/cgit/linux/kernel/git/mmind/linux-rockchip.git/log/?h=v4.6-clk/next

