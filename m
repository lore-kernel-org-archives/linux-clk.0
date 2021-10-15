Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32125C433FE
	for <linux-clk@archiver.kernel.org>; Fri, 15 Oct 2021 14:53:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 145EA60E97
	for <linux-clk@archiver.kernel.org>; Fri, 15 Oct 2021 14:53:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240611AbhJOOz4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 15 Oct 2021 10:55:56 -0400
Received: from mail.bugwerft.de ([46.23.86.59]:57810 "EHLO mail.bugwerft.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230471AbhJOOz4 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 15 Oct 2021 10:55:56 -0400
Received: from hq-00021.fritz.box (p57bc9963.dip0.t-ipconnect.de [87.188.153.99])
        by mail.bugwerft.de (Postfix) with ESMTPSA id D81B448E44D;
        Fri, 15 Oct 2021 14:53:47 +0000 (UTC)
From:   Daniel Mack <daniel@zonque.org>
To:     mturquette@baylibre.com, sboyd@kernel.org
Cc:     linux-clk@vger.kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, kuninori.morimoto.gx@renesas.com,
        Daniel Mack <daniel@zonque.org>
Subject: [PATCH RESEND v4 0/9] clk: cs2000-cp: add dynamic mode and more features
Date:   Fri, 15 Oct 2021 16:53:17 +0200
Message-Id: <20211015145326.1018458-1-daniel@zonque.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

[Resending the series again with no code changes]

This patch series adds support for dynamic mode, configurable clock
skip settings and a tranisition to regmap.

The most significant change is the additional support for dynamic mode.
Currently, the driver only supports static mode in which the (currently
mandatory) CLK_IN clock input is not used by the hardware.

Unlike v3 of this series, the patch stack now maintains full
compatibility with existing bindings. Rather than infering the mode of
operation through the presence of an optional clock, the driver now
parses a new DT property to enable the dynamic mode.

Rob, I left your Reviewed-by in 1/9 as that is untouched since v2. I'd
much appreciate a review of the other 3 patches that concern
dt-bindings.


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

