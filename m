Return-Path: <SRS0=NuDk=PZ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02C49C43387
	for <linux-clk@archiver.kernel.org>; Thu, 17 Jan 2019 14:54:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BCE5120652
	for <linux-clk@archiver.kernel.org>; Thu, 17 Jan 2019 14:54:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727724AbfAQOy2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 17 Jan 2019 09:54:28 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:38160 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727083AbfAQOy2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 17 Jan 2019 09:54:28 -0500
X-IronPort-AV: E=Sophos;i="5.56,489,1539615600"; 
   d="scan'208";a="5259692"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 17 Jan 2019 23:54:25 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.37.13])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 0B88541D99B8;
        Thu, 17 Jan 2019 23:54:20 +0900 (JST)
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Wolfgang Grandegger <wg@grandegger.com>,
        Marc Kleine-Budde <mkl@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        "David S. Miller" <davem@davemloft.net>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>, linux-can@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 0/3] Correct CAN clocks definition
Date:   Thu, 17 Jan 2019 14:54:13 +0000
Message-Id: <1547736856-16539-1-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Dear All,

since we now know that the r8a774a1 is similar to the r8a7796
from a CAN and CANFD perspective, changes to the clocks are in
order.

Thanks,
Fab

Fabrizio Castro (3):
  clk: renesas: r8a774a1: Add missing CANFD clock
  arm64: dts: renesas: r8a774a1: Add clkp2 clock to CAN nodes
  dt-bindings: can: rcar_canfd: Document r8a774a1 support

 Documentation/devicetree/bindings/net/can/rcar_canfd.txt | 15 ++++++++-------
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi                | 12 ++++++++----
 drivers/clk/renesas/r8a774a1-cpg-mssr.c                  |  2 ++
 include/dt-bindings/clock/r8a774a1-cpg-mssr.h            |  1 +
 4 files changed, 19 insertions(+), 11 deletions(-)

-- 
2.7.4

