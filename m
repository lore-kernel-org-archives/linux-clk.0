Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C72A6C2B9F4
	for <linux-clk@archiver.kernel.org>; Thu, 17 Jun 2021 19:09:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9BCC1613CB
	for <linux-clk@archiver.kernel.org>; Thu, 17 Jun 2021 19:09:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232321AbhFQTL2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 17 Jun 2021 15:11:28 -0400
Received: from mail.bugwerft.de ([46.23.86.59]:37022 "EHLO mail.bugwerft.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231379AbhFQTL1 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 17 Jun 2021 15:11:27 -0400
Received: from hq-00021.fritz.box (p57bc9ba2.dip0.t-ipconnect.de [87.188.155.162])
        by mail.bugwerft.de (Postfix) with ESMTPSA id 43CEC4C009A;
        Thu, 17 Jun 2021 19:09:18 +0000 (UTC)
From:   Daniel Mack <daniel@zonque.org>
To:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Cc:     robh+dt@kernel.org, kuninori.morimoto.gx@renesas.com,
        mturquette@baylibre.com, sboyd@kernel.org,
        Daniel Mack <daniel@zonque.org>
Subject: [PATCH v3 0/9] clk: cs2000-cp: add dynamic mode and more features
Date:   Thu, 17 Jun 2021 21:09:03 +0200
Message-Id: <20210617190912.262809-1-daniel@zonque.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This version of the patch series addresses typos in v2 and adds support
for dynamic mode, configurable clock skip settings and a tranisition to
regmap.

The most significant change is the additional support for dynamic mode.
Currently, the driver only supports static mode in which the (currently
mandatory) CLK_IN clock input is not used by the hardware. With patch
6/9 of this series, that clock is made optional now, and its presence is
used to determine the mode of operation.

Existing DTS users have dummy clock hacks in place and need to adopt to
this change. I have patches to do that which I intend to post once this
series is merged.

Rob, I left your Reviewed-by in 1/9 as that is untouched since v2. I'd
much appreciate a review of the other 3 patches that concern
dt-bindings.


Thanks,
Daniel

Daniel Mack (9):
  dt-bindings: clock: convert cs2000-cp bindings to yaml
  dt-bindings: clock: cs2000-cp: Document aux-output-source
  dt-bindings: clock: cs2000-cp: make clk_in optional
  dt-bindings: clock: cs2000-cp: document cirrus,clock-skip flag
  clk: cs2000-cp: Make aux output function controllable
  clk: cs2000-cp: add support for dynamic mode
  clk: cs2000-cp: make clock skip setting configurable
  clk: cs2000-cp: freeze config during register fiddling
  clk: cs2000-cp: convert driver to regmap

 .../bindings/clock/cirrus,cs2000-cp.yaml      |  84 ++++++
 .../devicetree/bindings/clock/cs2000-cp.txt   |  22 --
 drivers/clk/Kconfig                           |   1 +
 drivers/clk/clk-cs2000-cp.c                   | 240 +++++++++++-------
 include/dt-bindings/clock/cirrus,cs2000-cp.h  |  14 +
 5 files changed, 253 insertions(+), 108 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml
 delete mode 100644 Documentation/devicetree/bindings/clock/cs2000-cp.txt
 create mode 100644 include/dt-bindings/clock/cirrus,cs2000-cp.h

-- 
2.31.1

