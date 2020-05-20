Return-Path: <SRS0=T1sH=7C=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 719D8C433E0
	for <linux-clk@archiver.kernel.org>; Wed, 20 May 2020 12:53:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 510C1207C4
	for <linux-clk@archiver.kernel.org>; Wed, 20 May 2020 12:53:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726720AbgETMxp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 20 May 2020 08:53:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726443AbgETMxp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 20 May 2020 08:53:45 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31790C061A0E
        for <linux-clk@vger.kernel.org>; Wed, 20 May 2020 05:53:45 -0700 (PDT)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed60:884f:d4db:d672:7145])
        by albert.telenet-ops.be with bizsmtp
        id h0th2200b4QqYJb060th0v; Wed, 20 May 2020 14:53:41 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jbOE9-0005kQ-6W; Wed, 20 May 2020 14:53:41 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jbOE9-0004De-3t; Wed, 20 May 2020 14:53:41 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] clk: renesas: Updates for v5.8 (take two)
Date:   Wed, 20 May 2020 14:53:36 +0200
Message-Id: <20200520125336.16173-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

	Hi Mike, Stephen,

The following changes since commit e2f022c10ed3b50ba1d2bb1f037b0e7a84cb1c3e:

  clk: renesas: rcar-gen2: Remove superfluous CLK_RENESAS_DIV6 selects (2020-04-30 09:39:06 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/clk-renesas-for-v5.8-tag2

for you to fetch changes up to 9b9df63b50306b9602954d2f40fa8e05c0c27fda:

  dt-bindings: clock: renesas: mstp: Convert to json-schema (2020-05-20 14:08:15 +0200)

----------------------------------------------------------------
clk: renesas: Updates for v5.8 (take two)

  - A minor fix for the currently unused suspend/resume handling on
    RZ/A1 and RZ/A2,
  - Two more conversions of DT bindings to json-schema.

Thanks for pulling!
----------------------------------------------------------------
Geert Uytterhoeven (3):
      clk: renesas: cpg-mssr: Fix STBCR suspend/resume handling
      dt-bindings: clock: renesas: div6: Convert to json-schema
      dt-bindings: clock: renesas: mstp: Convert to json-schema

 .../bindings/clock/renesas,cpg-div6-clock.yaml     | 60 ++++++++++++++++
 .../bindings/clock/renesas,cpg-div6-clocks.txt     | 40 -----------
 .../bindings/clock/renesas,cpg-mstp-clocks.txt     | 60 ----------------
 .../bindings/clock/renesas,cpg-mstp-clocks.yaml    | 82 ++++++++++++++++++++++
 drivers/clk/renesas/renesas-cpg-mssr.c             |  8 ++-
 5 files changed, 147 insertions(+), 103 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/renesas,cpg-div6-clock.yaml
 delete mode 100644 Documentation/devicetree/bindings/clock/renesas,cpg-div6-clocks.txt
 delete mode 100644 Documentation/devicetree/bindings/clock/renesas,cpg-mstp-clocks.txt
 create mode 100644 Documentation/devicetree/bindings/clock/renesas,cpg-mstp-clocks.yaml

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
