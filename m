Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A34F8C433FE
	for <linux-clk@archiver.kernel.org>; Tue, 14 Dec 2021 12:19:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231902AbhLNMTA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 14 Dec 2021 07:19:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231892AbhLNMS6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 14 Dec 2021 07:18:58 -0500
Received: from mail.bugwerft.de (mail.bugwerft.de [IPv6:2a03:6000:1011::59])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 30FFCC061574;
        Tue, 14 Dec 2021 04:18:58 -0800 (PST)
Received: from hq-00021.fritz.box (p57bc964a.dip0.t-ipconnect.de [87.188.150.74])
        by mail.bugwerft.de (Postfix) with ESMTPSA id 8031F282DBD;
        Tue, 14 Dec 2021 12:09:35 +0000 (UTC)
From:   Daniel Mack <daniel@zonque.org>
To:     mturquette@baylibre.com, sboyd@kernel.org
Cc:     linux-clk@vger.kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, kuninori.morimoto.gx@renesas.com,
        Daniel Mack <daniel@zonque.org>
Subject: [PATCH RESEND v4 0/9] clk: cs2000-cp: add dynamic mode and more features
Date:   Tue, 14 Dec 2021 13:09:20 +0100
Message-Id: <20211214120929.2829705-1-daniel@zonque.org>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

[Resending this series which still applies cleanly to both clk/clk-next
 and 5.16-rc5. We're using these patches in production for a while.
 All DT patches are Acked-by already by Rob; what left is a review of
 the implementaion bits.]

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

