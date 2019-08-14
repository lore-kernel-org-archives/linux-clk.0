Return-Path: <SRS0=2ArH=WK=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAB76C32753
	for <linux-clk@archiver.kernel.org>; Wed, 14 Aug 2019 13:14:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 98DF82083B
	for <linux-clk@archiver.kernel.org>; Wed, 14 Aug 2019 13:14:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727650AbfHNNOR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 14 Aug 2019 09:14:17 -0400
Received: from muru.com ([72.249.23.125]:57598 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726551AbfHNNOR (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 14 Aug 2019 09:14:17 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 9E91180C8;
        Wed, 14 Aug 2019 13:14:43 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Adam Ford <aford173@gmail.com>,
        =?UTF-8?q?Filip=20Matijevi=C4=87?= <filip.matijevic.pz@gmail.com>,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Michael Turquette <mturquette@baylibre.com>,
        =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        Philipp Rossak <embed3d@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>, Tero Kristo <t-kristo@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        linux-clk@vger.kernel.org, moaz korena <moaz@korena.xyz>
Subject: [PATCH 0/6] Configure sgx interconnect data for some omap variants
Date:   Wed, 14 Aug 2019 06:14:02 -0700
Message-Id: <20190814131408.57162-1-tony@atomide.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi all,

For a while we've been idling sgx module on omap4 by probing it with
ti-sysc interconnect target module driver. This allows leaving out any
platform data in favor of device tree data, and idles the module for
PM even if we don't have any sgx driver.

I've added similar configuration for omap34xx, omap36xx, omap5 and
am335x. Adding dra7 should work too, but my beagle x15 is suffering
from a power supply problem right now and I'll need to work more on
that later on.

For am335x, the recently posted prm rstctrl driver is needed. The
other SoCs here don't have a dependency to the prm rstctrl driver.
And probably am335x child driver(s) also need to map the rstctrl
register to increase the deassert use count.

Please review and test, this should allow sgx child driver(s) to
just use PM runtime to enable the module with no platform data.

I've only tested these SoCs via sysfs to ensure the sgx module gets
enabled and disabled properly. If you know something about sgx,
please describe more why the sgx registers seem to be at different
place for each SoC like between omap34xx and omap36xx.

These patches may have some dependencies to what I've queued into
my for-next branch for fixes so it's best to test with that merged
in. Linux next should be usable for testing with these the next
time it gets integrated.

Regards,

Tony


Tony Lindgren (6):
  ARM: OMAP2+: Drop legacy platform data for omap4 gpu
  bus: ti-sysc: Add module enable quirk for SGX on omap36xx
  clk: ti: add clkctrl data omap5 sgx
  ARM: dts: Configure sgx for omap5
  ARM: dts: Configure interconnect target module for omap3 sgx
  ARM: dts: Configure rstctrl reset for SGX

 arch/arm/boot/dts/am33xx.dtsi              | 25 ++++++++++
 arch/arm/boot/dts/omap34xx.dtsi            | 26 +++++++++++
 arch/arm/boot/dts/omap36xx.dtsi            | 27 +++++++++++
 arch/arm/boot/dts/omap4.dtsi               |  1 -
 arch/arm/boot/dts/omap5.dtsi               | 23 ++++++++++
 arch/arm/boot/dts/omap54xx-clocks.dtsi     | 14 ++++++
 arch/arm/mach-omap2/omap_hwmod_44xx_data.c | 53 ----------------------
 drivers/bus/ti-sysc.c                      | 21 +++++++++
 drivers/clk/ti/clk-54xx.c                  | 34 ++++++++++++++
 include/dt-bindings/clock/omap5.h          |  3 ++
 include/linux/platform_data/ti-sysc.h      |  1 +
 11 files changed, 174 insertions(+), 54 deletions(-)

-- 
2.21.0
