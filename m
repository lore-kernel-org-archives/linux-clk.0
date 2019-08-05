Return-Path: <SRS0=R3Mk=WB=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 362CEC433FF
	for <linux-clk@archiver.kernel.org>; Mon,  5 Aug 2019 10:03:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 06BAB2087B
	for <linux-clk@archiver.kernel.org>; Mon,  5 Aug 2019 10:03:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727259AbfHEKDQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 5 Aug 2019 06:03:16 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:59735 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727230AbfHEKDQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 5 Aug 2019 06:03:16 -0400
X-Originating-IP: 86.250.200.211
Received: from localhost.localdomain (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 8BE0260007;
        Mon,  5 Aug 2019 10:03:13 +0000 (UTC)
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     <devicetree@vger.kernel.org>, linux-clk@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Antoine Tenart <antoine.tenart@bootlin.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Nadav Haklai <nadavh@marvell.com>,
        Grzegorz Jaszczyk <jaz@semihalf.com>,
        Marcin Wojtas <mw@semihalf.com>,
        Stefan Chulski <stefanc@marvell.com>,
        Yan Markman <ymarkman@marvell.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 0/8] AP807 clocks support
Date:   Mon,  5 Aug 2019 12:03:02 +0200
Message-Id: <20190805100310.29048-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hello,

This is the first batch of changes (out of three) to support the brand
new Marvell CN9130 SoCs which are made of one AP807 and one CP115.

This clock series applies on top of Gregory's "AP806 CPU clocks" [1].

[1] https://patchwork.kernel.org/cover/11038577/

Thanks,
Miquèl


Ben Peled (3):
  clk: mvebu: ap80x-cpu: add AP807 CPU clock support
  clk: mvebu: ap806: Prepare the introduction of AP807 clock support
  clk: mvebu: ap80x: add AP807 clock support

Christine Gharzuzi (1):
  clk: mvebu: ap806-cpu: prepare mapping of AP807 CPU clock

Miquel Raynal (3):
  dt-bindings: ap80x: Document AP807 CPU clock compatible
  dt-bindings: ap806: Document AP807 clock compatible
  clk: mvebu: ap806: be more explicit on what SaR is

Omri Itach (1):
  clk: mvebu: ap806: add AP-DCLK (hclk) to system controller driver

 .../arm/marvell/ap806-system-controller.txt   |  17 +-
 drivers/clk/mvebu/ap-cpu-clk.c                | 139 ++++++++++++---
 drivers/clk/mvebu/ap806-system-controller.c   | 162 ++++++++++++++----
 3 files changed, 253 insertions(+), 65 deletions(-)

-- 
2.20.1

