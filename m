Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C39F2C433B4
	for <linux-clk@archiver.kernel.org>; Thu,  8 Apr 2021 18:57:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 98A1861041
	for <linux-clk@archiver.kernel.org>; Thu,  8 Apr 2021 18:57:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232885AbhDHS55 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 8 Apr 2021 14:57:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231676AbhDHS55 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 8 Apr 2021 14:57:57 -0400
Received: from mail-out.m-online.net (mail-out.m-online.net [IPv6:2001:a60:0:28:0:1:25:1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51104C061760
        for <linux-clk@vger.kernel.org>; Thu,  8 Apr 2021 11:57:45 -0700 (PDT)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 4FGVrQ59M6z1s0tQ;
        Thu,  8 Apr 2021 20:57:42 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 4FGVrQ3s2Sz1sP6L;
        Thu,  8 Apr 2021 20:57:42 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id DBy8bgKn8cJA; Thu,  8 Apr 2021 20:57:40 +0200 (CEST)
X-Auth-Info: eS6/zRyjUhImPWlVRj7XXZEG9mesi+vmn4/sJOZI9Js=
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Thu,  8 Apr 2021 20:57:40 +0200 (CEST)
From:   Marek Vasut <marex@denx.de>
To:     linux-arm-kernel@lists.infradead.org
Cc:     Marek Vasut <marex@denx.de>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Christophe Roullier <christophe.roullier@foss.st.com>,
        Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Patrick Delaunay <patrick.delaunay@foss.st.com>,
        Stephen Boyd <swboyd@chromium.org>, linux-clk@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 0/7] ARM: dts: stm32: clk: Switch ETHRX clock parent from ETHCK_K to MCO2 on DHCOM SoM
Date:   Thu,  8 Apr 2021 20:57:24 +0200
Message-Id: <20210408185731.135511-1-marex@denx.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The implementation of ETH_RX_CLK/ETH_REF_CLK handling on STM32MP1 currently
does not permit selecting the RX clock input from SoC pad, the RX clock are
hard-wired to eth_clk_fb. This cover letter describes multiple unsuccessful
attempts at solving this problem and a proposed partial solution.

The problem is that in stm32mp151.dtsi, the "st,stm32mp1-dwmac" compatible
ethernet requests mac-clk-rx = <&rcc ETHRX> as MAC RX clock, which per [1]
page 576 maps to clk_rx_i signal. Upon closer inspection of clk-stm32mp1.c,
the ETHRX clock 1) only models G_ETHRX gate, which represents ETHRXEN bit,
and 2) sets ETHRX clock parent to ck_axi. Both are wrong for the following
reasons:
1) ETHRX clock are composite clock of gate and two muxes, which ultimately
   permit selecting ETHRX clock parent to be either eth_clk_fb or external
   ETH_RX_CLK/ETH_REF_CLOCK clock from SoC pad. Because only the gate part
   is modeled, the clock topology is wrong and it is not possible to select
   the ETHRX clock parent using the clock framework at all.
2) ETHRX clock are supplied from a mux controlled by ETH_SEL[2] (from
   SYSCFG), which is supplied from a mux controlled by ETH_REF_CLK_SEL
   (from SYSCFG), which is supplied either by ETH_RX_CLK/ETH_REF_CLK
   from pad OR internally from eth_clk_fb clock, which maps to ETHCK_K
   clock. Hence, ETHRX can never be supplied by ck_axi.

Another unique feature of ETHRX clock muxes is that they are controlled
via SYSCFG block instead of being part of the RCC block. This is a rather
unfortunate design, as it creates dependency between RCC, SYSCFG and DWMAC.
Currently, those clock muxes are configured in the dwmac4 driver through
syscon interface to SYSCFG block, based on custom device tree properties --
st,eth-clk-sel and st,eth-ref-clk-sel -- this is clearly not the correct
approach.

First approach was to implement ETHRX clock including muxes in clk-stm32mp1.c.
This means RCC clock driver, clk-stm32mp1.c, must obtain access to SYSCFG IP
registers via some syscon_regmap_lookup_by_phandle() when registering ETHRX
clock in RCC driver probe, so that it can read out SYSCFG register state to
determine the current mux state, and later toggle the mux bits. The problem
here is that the SYSCFG requires clock which are provided by RCC, so
syscon_regmap_lookup_by_phandle() fails with EPROBE_DEFER because the clock
are not available yet in RCC clock driver probe, so there is cyclic dependency
between RCC and SYSCFG.

Similar approach would be to turn SYSCFG into simple-bus and implement
separate SYSCFG clock sub-driver, which would register single clock mux with
two parents -- ETHCK_K and ETH_RX_CLK -- and would only control the SYSCFG
clock mux bits. The problem here is similar, for RCC driver to register the
ETHRX clock, the ETHRX clock must have a parent clock, however the parent
clock are not ready yet, because this new SYSCFG clock sub-driver requires
SYSCFG register clock, which only become available once RCC finishes probing,
so there again is a cyclic dependency between RCC and SYSCFG.

One possible solution could be to defer obtaining the SYSCFG regmap handle
until later point, i.e. only once a register access to SYSCFG is required
the first time. This could permit us to register the mux in the RCC driver
including a mux which requires SYSCFG access via syscon, although this would
likely still run into problems during probe, since the clock framework would
call .get_parent() during mux registration and trigger the SYSCFG access.

All the above still only discusses the clock part of the problem. Even if
the clock cyclic dependencies could be solved, it would be necessary to
resolve legacy dwmac st,eth-clk-sel and st,eth-ref-clk-sel DT properties
and avoid DT ABI break.

So in the end, this series takes a different approach and only partly solves
the problem. This series splits ETHCK_K, so the ETHCK_K gate could be turned
off and adds support for selecting ETHRX clock parent clock via DT. This then
permits e.g. DHCOM to select MCO2 as ETHRX clock source and the clock tree is
then correctly set up.

[1] STM32MP1 Reference Manual RM0436 Rev 3, Page 574,
    Figure 83. Peripheral clock distribution for Ethernet
    https://www.st.com/resource/en/reference_manual/dm00327659-stm32mp157-advanced-armbased-32bit-mpus-stmicroelectronics.pdf

Marek Vasut (7):
  clk: stm32mp1: Split ETHCK_K into separate MUX and GATE clock
  clk: stm32mp1: The dev is always NULL, replace it with np
  clk: stm32mp1: Register clock with device_node pointer
  clk: stm32mp1: Add parent_data to ETHRX clock
  ARM: dts: stm32: Add alternate pinmux for ethernet0 pins
  ARM: dts: stm32: Add alternate pinmux for mco2 pins
  ARM: dts: stm32: Switch DWMAC RMII clock to MCO2 on DHCOM

 arch/arm/boot/dts/stm32mp15-pinctrl.dtsi     |  49 +++++++
 arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi |  20 ++-
 drivers/clk/clk-stm32mp1.c                   | 134 +++++++++++--------
 3 files changed, 146 insertions(+), 57 deletions(-)

Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Christophe Roullier <christophe.roullier@foss.st.com>
Cc: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Stephen Boyd <swboyd@chromium.org>
Cc: linux-clk@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
To: linux-arm-kernel@lists.infradead.org

-- 
2.30.2

