Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from regular2.263xmail.com ([211.157.152.3]:51253 "EHLO
	regular2.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755672AbcAYJAY (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Mon, 25 Jan 2016 04:00:24 -0500
Received: from regular1.263xmail.com (unknown [192.168.165.230])
	by regular2.263xmail.com (Postfix) with ESMTP id E1A451E812
	for <linux-clk@vger.kernel.org>; Mon, 25 Jan 2016 17:00:19 +0800 (CST)
From: Zhang Qing <zhangqing@rock-chips.com>
To: heiko@sntech.de, zhengxing@rock-chips.com, xf@rock-chips.com
Cc: mturquette@baylibre.com, sboyd@codeaurora.org,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	huangtao@rock-chips.com, zyw@rock-chips.com, jay.xu@rock-chips.com,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	zhangqing <zhangqing@rock-chips.com>
Subject: [PATCH v1 0/3] clk: rockchip: rk3368: fix some error for rk3368 clk
Date: Mon, 25 Jan 2016 08:55:59 -0800
Message-Id: <1453740962-8556-1-git-send-email-zhangqing@rock-chips.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

From: zhangqing <zhangqing@rock-chips.com>

modify edp_24m parent select bit.
enable CLK_SET_RATE_PARENT flag for spdif_8ch and i2s_2ch.

zhangqing (3):
  clk: rockchip: rk3368: fix edp_24m parent
  clk: rockchip: rk3368: enable the CLK_SET_RATE_PARENT flag for
    spdif_8ch
  clk: rockchip: rk3368: enable the CLK_SET_RATE_PARENT flag for i2s_2ch

 drivers/clk/rockchip/clk-rk3368.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

-- 
1.9.1


