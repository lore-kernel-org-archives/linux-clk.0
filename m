Return-Path: <SRS0=qW/6=5A=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 709D3C0044D
	for <linux-clk@archiver.kernel.org>; Sun, 15 Mar 2020 03:31:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4DD9B20578
	for <linux-clk@archiver.kernel.org>; Sun, 15 Mar 2020 03:31:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726715AbgCODbU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 14 Mar 2020 23:31:20 -0400
Received: from newton.telenet-ops.be ([195.130.132.45]:38728 "EHLO
        newton.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726506AbgCODbU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 14 Mar 2020 23:31:20 -0400
X-Greylist: delayed 4199 seconds by postgrey-1.27 at vger.kernel.org; Sat, 14 Mar 2020 23:31:20 EDT
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by newton.telenet-ops.be (Postfix) with ESMTPS id 48fdB620QrzMqmR8
        for <linux-clk@vger.kernel.org>; Sat, 14 Mar 2020 10:51:26 +0100 (CET)
Received: from ramsan ([84.195.182.253])
        by baptiste.telenet-ops.be with bizsmtp
        id E9rR2200F5USYZQ019rRem; Sat, 14 Mar 2020 10:51:25 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jD3S1-0004Wf-Ci; Sat, 14 Mar 2020 10:51:25 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jD3S1-0008P5-Ag; Sat, 14 Mar 2020 10:51:25 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] clk: renesas: Updates for v5.7 (take two)
Date:   Sat, 14 Mar 2020 10:51:20 +0100
Message-Id: <20200314095120.32262-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

	Hi Mike, Stephen,

The following changes since commit 068e7f85234c0b56f55cc0259ad9c05f2c64b8fb:

  clk: renesas: Remove use of ARCH_R8A7795 (2020-02-21 14:01:54 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/clk-renesas-for-v5.7-tag2

for you to fetch changes up to eeb40fda056ce2f914fff000525ca5a7b2ddec50:

  dt-bindings: clock: renesas: cpg-mssr: Convert to json-schema (2020-03-11 09:02:26 +0100)

----------------------------------------------------------------
clk: renesas: Updates for v5.7 (take two)

  - Improved clock/reset handling for the R-Car USB2 Clock Selector,
  - Conversion to json-schema of the Renesas CPG/MSSR DT bindings.

Thanks for pulling!
----------------------------------------------------------------
Geert Uytterhoeven (1):
      dt-bindings: clock: renesas: cpg-mssr: Convert to json-schema

Yoshihiro Shimoda (4):
      dt-bindings: clock: renesas: rcar-usb2-clock-sel: Fix clock[-name]s properties
      dt-bindings: clock: renesas: rcar-usb2-clock-sel: Add power-domains and resets properties
      clk: renesas: rcar-usb2-clock-sel: Add multiple clocks management
      clk: renesas: rcar-usb2-clock-sel: Add reset_control

 .../devicetree/bindings/clock/renesas,cpg-mssr.txt | 100 -----------------
 .../bindings/clock/renesas,cpg-mssr.yaml           | 119 +++++++++++++++++++++
 .../bindings/clock/renesas,rcar-usb2-clock-sel.txt |  17 ++-
 drivers/clk/renesas/Kconfig                        |   1 +
 drivers/clk/renesas/rcar-usb2-clock-sel.c          |  40 ++++++-
 5 files changed, 172 insertions(+), 105 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt
 create mode 100644 Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
