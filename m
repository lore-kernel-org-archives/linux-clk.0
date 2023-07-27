Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C3B3C001DC
	for <linux-clk@archiver.kernel.org>; Thu, 27 Jul 2023 10:12:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233354AbjG0KL7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 27 Jul 2023 06:11:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232999AbjG0KLy (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 27 Jul 2023 06:11:54 -0400
Received: from mail-m12739.qiye.163.com (mail-m12739.qiye.163.com [115.236.127.39])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A32E91BC3;
        Thu, 27 Jul 2023 03:11:48 -0700 (PDT)
Received: from localhost.localdomain (unknown [58.22.7.114])
        by mail-m12739.qiye.163.com (Hmail) with ESMTPA id F1D184A01DA;
        Thu, 27 Jul 2023 18:11:41 +0800 (CST)
From:   Elaine Zhang <zhangqing@rock-chips.com>
To:     mturquette@baylibre.com, sboyd@kernel.org,
        kever.yang@rock-chips.com, zhangqing@rock-chips.com,
        heiko@sntech.de
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        huangtao@rock-chips.com
Subject: [PATCH v1 0/2] clk: rockchip: add GATE_LINK
Date:   Thu, 27 Jul 2023 18:11:37 +0800
Message-Id: <20230727101139.23048-1-zhangqing@rock-chips.com>
X-Mailer: git-send-email 2.17.1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
        tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGU8fS1ZOSktIQkpJSklIGk5VEwETFh
        oSFyQUDg9ZV1kYEgtZQVlOQ1VJSVVMVUpKT1lXWRYaDxIVHRRZQVlPS0hVSk5MSUpJVUpLS1VKQl
        kG
X-HM-Tid: 0a8996d533e1b212kuuuf1d184a01da
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PDY6ARw4PT1JGjoqDgMpGUg6
        SRkaCg9VSlVKTUJLT05JTEtJTU9CVTMWGhIXVQETGhUcChIVHDsJFBgQVhgTEgsIVRgUFkVZV1kS
        C1lBWU5DVUlJVUxVSkpPWVdZCAFZQUpNT003Bg++
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Recent Rockchip SoCs have a new hardware block called Native Interface
Unit (NIU), which gates clocks to devices behind them. These effectively
need two parent clocks.
Use GATE_LINK to handle this.

Elaine Zhang (2):
  clk: rockchip: add support for gate link
  clk: rockchip: rk3588: Adjust the GATE_LINK parameter

 drivers/clk/rockchip/Makefile                 |   1 +
 drivers/clk/rockchip/clk-gate-link.c          | 191 ++++++++++++++++++
 drivers/clk/rockchip/clk-rk3588.c             | 109 +++++-----
 drivers/clk/rockchip/clk.c                    |   7 +
 drivers/clk/rockchip/clk.h                    |  22 ++
 .../dt-bindings/clock/rockchip,rk3588-cru.h   |   3 +-
 6 files changed, 281 insertions(+), 52 deletions(-)
 create mode 100644 drivers/clk/rockchip/clk-gate-link.c

-- 
2.17.1

