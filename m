Return-Path: <SRS0=mYc5=R4=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C38CAC10F03
	for <linux-clk@archiver.kernel.org>; Mon, 25 Mar 2019 16:36:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8F444208E4
	for <linux-clk@archiver.kernel.org>; Mon, 25 Mar 2019 16:36:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="RaIlXafr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729529AbfCYQgX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 25 Mar 2019 12:36:23 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:42086 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725788AbfCYQgX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 25 Mar 2019 12:36:23 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 5305225BF17;
        Tue, 26 Mar 2019 03:36:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1553531771; bh=rHA6++aVki+OB1Ht9msacuuopAL/YmkBxlBcQ9IMB7o=;
        h=From:To:Cc:Subject:Date:From;
        b=RaIlXafr3uWLX9V0kXfeKHNIclwdZIp5w2V6SILLfPT7cnIwQNTxtTzMufSRMQSa8
         KoL/jwsuKinFM/Qnwbxjp/nLgGBeCXOMp5zBiv/4IuR9ziE0tYdopIS0Qq0Kq78xT+
         PEro5iEzg1cddxlFCajDZoKLL8QtgC5Bc0SS3VBk=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 8E195940563; Mon, 25 Mar 2019 17:36:08 +0100 (CET)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH v6 0/7] clk: renesas: r8a77990, r8a774c0: Add Z2 clock
Date:   Mon, 25 Mar 2019 17:35:49 +0100
Message-Id: <20190325163556.22025-1-horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

this series adds the Z2 clock as a clock with both a fixed and variable
divisor with a parent of PLL0 to the CPG-MSSR drivers for the R-Car E3
(r8a77990) and RZ/G2E (r8a774c0) SoCs.

In order to do so this series:

1. Parameterise Z and Z2 clock fixed divisor in shared Gen-3 CPG
   driver code to allow fixed divisors other than 2 - the E3 Z2
   clock has a fixed divisor of 4

2. Parameterise offset of Z and Z2 clock control bits -
   the offsets on E3 differ to other R-Car Gen 3 SoCs

3. [Cleanup] Remove now redundant CLK_TYPE_GEN3_Z2

4. Support Z and Z2 clocks with high frequency parents.
   The parent of the E3 Z2 clock, PLL0, is 4.8GHz and thus
   when expressed in HZ must be treated as a 64bit value.

5. Actually add the Z2 clocks

Changes since v5
----------------
* Remove now redundant CLK_TYPE_GEN3_Z2
* Revise changelogs

Changes since v4
----------------
* Separate patch to add DIV64_U64_ROUND_CLOSEST helper
* Accumulate review tags

Changes since v3
----------------
* Add and use DIV64_U64_ROUND_CLOSEST in the patch to allow
  high frequency parents. This corrects the patch for 32bit platforms.
* Accumulate review and testing tags.

Changes since v2
----------------
* Parameterise control bit offset rather than using a quirk
* Revised RZ/G2E patch - I was confused and updating the file for
  the wrong part number


Testing Overview
----------------

v6 of this patchset was tested on Ebisu-4D/E3 with top of
clk-renesas-for-v5.2 [adeff208ea6f ("clk: renesas: r9a06g032: Add missing
PCI USB clock")].  This allowed CPUFreq to be successfully exercised.

v6 was also tested on top of clk-renesas-for-v5 for regressions
Salvator-X/M3-W ES1.0.

This v3 of this patchset was been independently tested RZ/G2E.
It is not expected that v6 will have any behavioural differences
on that (or any other 64bit) platform.


Patches List by Author
----------------------

Simon Horman (5):
  clk: renesas: rcar-gen3: Parameterise Z and Z2 clock offset
  clk: renesas: rcar-gen3: Remove CLK_TYPE_GEN3_Z2
  math64: New DIV64_U64_ROUND_CLOSEST helper
  clk: renesas: rcar-gen3: Support Z and Z2 clocks with high frequency
    parents
  clk: renesas: r8a774c0: Add Z2 clock

Takeshi Kihara (2):
  clk: renesas: rcar-gen3: Parameterise Z and Z2 clock fixed divisor
  clk: renesas: r8a77990: Add Z2 clock

 drivers/clk/renesas/r8a774a1-cpg-mssr.c |  4 ++--
 drivers/clk/renesas/r8a774c0-cpg-mssr.c |  1 +
 drivers/clk/renesas/r8a7795-cpg-mssr.c  |  5 +++--
 drivers/clk/renesas/r8a7796-cpg-mssr.c  |  5 +++--
 drivers/clk/renesas/r8a77965-cpg-mssr.c |  2 +-
 drivers/clk/renesas/r8a77990-cpg-mssr.c |  1 +
 drivers/clk/renesas/rcar-gen3-cpg.c     | 28 +++++++++++++---------------
 drivers/clk/renesas/rcar-gen3-cpg.h     |  5 ++++-
 include/linux/math64.h                  | 13 +++++++++++++
 9 files changed, 41 insertions(+), 23 deletions(-)

-- 
2.11.0

