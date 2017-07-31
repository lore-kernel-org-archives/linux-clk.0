Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from regular1.263xmail.com ([211.150.99.132]:53238 "EHLO
        regular1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751784AbdGaKhk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 31 Jul 2017 06:37:40 -0400
From: Elaine Zhang <zhangqing@rock-chips.com>
To: mturquette@baylibre.com, sboyd@codeaurora.org, heiko@sntech.de
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org, xxx@rock-chips.com, xf@rock-chips.com,
        huangtao@rock-chips.com, cl@rock-chips.com,
        Elaine Zhang <zhangqing@rock-chips.com>
Subject: [PATCH v3 0/2] clk: rockchip: support clk drivers for RK3126 SoC.
Date: Mon, 31 Jul 2017 18:42:06 +0800
Message-Id: <1501497728-7805-1-git-send-email-zhangqing@rock-chips.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

changed in V3:
add documentation for rk3126 clock

Elaine Zhang (2):
  clk: rockchip: rk3128: modify rk3128 clk driver to support rk3126
  dt-bindings: add documentation for rk3126 clock

 .../bindings/clock/rockchip,rk3128-cru.txt         |  6 +-
 drivers/clk/rockchip/clk-rk3128.c                  | 69 +++++++++++++++++-----
 2 files changed, 58 insertions(+), 17 deletions(-)

-- 
1.9.1


