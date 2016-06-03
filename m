Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:53230 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932538AbcFCNma (ORCPT <rfc822;linux-clk@vger.kernel.org>);
	Fri, 3 Jun 2016 09:42:30 -0400
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: linux-clk@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>,
	Xing Zheng <zhengxing@rock-chips.com>,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] clk: rockchip: release io resource when failing to init clk
Date: Fri, 03 Jun 2016 15:42:23 +0200
Message-ID: <1945106.rcVxzvAYk1@diego>
In-Reply-To: <1464915258-10838-1-git-send-email-shawn.lin@rock-chips.com>
References: <1464915258-10838-1-git-send-email-shawn.lin@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Am Freitag, 3. Juni 2016, 08:54:18 schrieb Shawn Lin:
> We should call iounmap to relase reg_base since it's not going
> to be used any more if failing to init clk.
> 
> Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>

applied to my clk-fixes branch for 4.7, after adding a line to the patch-
description explaining that this is really just missing on rk3399 (and after 
checking that the iounmaps are already present on the old clock-trees)


Thanks for catching this
Heiko

