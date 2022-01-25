Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D133C43217
	for <linux-clk@archiver.kernel.org>; Tue, 25 Jan 2022 09:50:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236911AbiAYJtt (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 25 Jan 2022 04:49:49 -0500
Received: from mail.bugwerft.de ([46.23.86.59]:53018 "EHLO mail.bugwerft.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234344AbiAYJmZ (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 25 Jan 2022 04:42:25 -0500
X-Greylist: delayed 514 seconds by postgrey-1.27 at vger.kernel.org; Tue, 25 Jan 2022 04:42:22 EST
Received: from hq-00021.fritz.box (p57bc97b3.dip0.t-ipconnect.de [87.188.151.179])
        by mail.bugwerft.de (Postfix) with ESMTPSA id BECBD2800F5;
        Tue, 25 Jan 2022 09:33:42 +0000 (UTC)
From:   Daniel Mack <daniel@zonque.org>
To:     mturquette@baylibre.com, sboyd@kernel.org
Cc:     linux-clk@vger.kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, kuninori.morimoto.gx@renesas.com,
        Daniel Mack <daniel@zonque.org>
Subject: [PATCH RESEND v4 0/9] clk: cs2000-cp: add dynamic mode and more features
Date:   Tue, 25 Jan 2022 10:33:27 +0100
Message-Id: <20220125093336.226787-1-daniel@zonque.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Mike, Stephen,

This patch series adds support for dynamic mode, configurable clock
skip settings and a tranisition to regmap.

As Kuninori Morimoto is not responding, would you kindly do me the
favor and take this series directly? I don't know what else to do
than resending the set over and over again.

The patches still apply cleanly to 5.17-rc1, and we're using them
in production since a while.

All DT patches are Acked-by already by Rob; what left is a review of
the implementation bits.


Thanks,
Daniel

Daniel Mack (9):
  dt-bindings: clock: convert cs2000-cp bindings to yaml
  dt-bindings: clock: cs2000-cp: document aux-output-source
  dt-bindings: clock: cs2000-cp: document cirrus,clock-skip flag
  dt-bindings: clock: cs2000-cp: document cirrus,dynamic-mode
  clk: cs2000-cp: Make aux output function controllable
  clk: cs2000-cp: add support for dynamic mode
  clk: cs2000-cp: make clock skip setting configurable
  clk: cs2000-cp: freeze config during register fiddling
  clk: cs2000-cp: convert driver to regmap

 .../bindings/clock/cirrus,cs2000-cp.yaml      |  91 +++++++
 .../devicetree/bindings/clock/cs2000-cp.txt   |  22 --
 drivers/clk/Kconfig                           |   1 +
 drivers/clk/clk-cs2000-cp.c                   | 243 ++++++++++++------
 include/dt-bindings/clock/cirrus,cs2000-cp.h  |  14 +
 5 files changed, 264 insertions(+), 107 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml
 delete mode 100644 Documentation/devicetree/bindings/clock/cs2000-cp.txt
 create mode 100644 include/dt-bindings/clock/cirrus,cs2000-cp.h

-- 
2.31.1

