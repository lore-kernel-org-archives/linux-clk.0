Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from szxga03-in.huawei.com ([119.145.14.66]:59142 "EHLO
	szxga03-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752404AbcHKJGS (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Thu, 11 Aug 2016 05:06:18 -0400
From: Dongpo Li <lidongpo@hisilicon.com>
To: <robh+dt@kernel.org>, <mark.rutland@arm.com>,
	<mturquette@baylibre.com>, <sboyd@codeaurora.org>,
	<linux@armlinux.org.uk>, <zhangfei.gao@linaro.org>,
	<yisen.zhuang@huawei.com>, <salil.mehta@huawei.com>,
	<davem@davemloft.net>, <arnd@arndb.de>, <andrew@lunn.ch>
CC: <xuejiancheng@hisilicon.com>, <benjamin.chenhao@hisilicon.com>,
	<howell.yang@hisilicon.com>, <netdev@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Dongpo Li <lidongpo@hisilicon.com>
Subject: [PATCH 0/4] net: hix5hd2_gmac: add tx sg feature and reset/clock control signals
Date: Thu, 11 Aug 2016 17:01:51 +0800
Message-ID: <1470906115-155569-1-git-send-email-lidongpo@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

The "hix5hd2" is SoC name, add the generic ethernet driver name.
The "hisi-gemac-v1" is the basic version and "hisi-gemac-v2" adds
the SG/TXCSUM/TSO/UFO features.
This patch set only adds the SG(scatter-gather) driver for transmitting,
the drivers of other features will be submitted later.

Add the MAC reset control signals and clock signals.
As a result, the hix5hd2 ethernet clock can be abstracted as
gate clock instead of self defined complex clock.

Dongpo Li (2):
  clk: hix5hd2: change ethernet clock type
  ARM: dts: hix5hd2: add gmac clock and reset property

Li Dongpo (2):
  net: hix5hd2_gmac: add tx scatter-gather feature
  net: hix5hd2_gmac: add reset control and clock signals

 .../bindings/net/hisilicon-hix5hd2-gmac.txt        |  25 +-
 arch/arm/boot/dts/hisi-x5hd2-dkb.dts               |   2 +
 arch/arm/boot/dts/hisi-x5hd2.dtsi                  |  15 +-
 drivers/clk/hisilicon/clk-hix5hd2.c                |  72 +----
 drivers/net/ethernet/hisilicon/hix5hd2_gmac.c      | 353 +++++++++++++++++++--
 include/dt-bindings/clock/hix5hd2-clock.h          |   6 +-
 6 files changed, 381 insertions(+), 92 deletions(-)

-- 
2.8.2

