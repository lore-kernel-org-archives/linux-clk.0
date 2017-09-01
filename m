Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from regular1.263xmail.com ([211.150.99.134]:50251 "EHLO
        regular1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750868AbdIACCD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 31 Aug 2017 22:02:03 -0400
From: Elaine Zhang <zhangqing@rock-chips.com>
To: mturquette@baylibre.com, sboyd@codeaurora.org, heiko@sntech.de
Cc: linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        xxx@rock-chips.com, xf@rock-chips.com, huangtao@rock-chips.com,
        cl@rock-chips.com, Elaine Zhang <zhangqing@rock-chips.com>
Subject: [PATCH v1 0/3] clk: rockchip: rk3128: fix up some clks
Date: Fri,  1 Sep 2017 10:01:43 +0800
Message-Id: <1504231306-4450-1-git-send-email-zhangqing@rock-chips.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Elaine Zhang (3):
  clk: rockchip: rk3128: add pclk_pmu as critical clock
  clk: rockchip: rk3128: fix up pvtm and mipi_24m gate regs description
    error
  clk: rockchip: rk3126: add sclk_timer5 as critical clock

 drivers/clk/rockchip/clk-rk3128.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

-- 
1.9.1


