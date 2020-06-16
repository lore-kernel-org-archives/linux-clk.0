Return-Path: <SRS0=U6aT=75=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9E1AC433E0
	for <linux-clk@archiver.kernel.org>; Tue, 16 Jun 2020 16:32:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4E6DC20882
	for <linux-clk@archiver.kernel.org>; Tue, 16 Jun 2020 16:32:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fpond.eu header.i=@fpond.eu header.b="eEPiXZQo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730610AbgFPQci (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 16 Jun 2020 12:32:38 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.24]:34091 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729167AbgFPQci (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 16 Jun 2020 12:32:38 -0400
X-Greylist: delayed 356 seconds by postgrey-1.27 at vger.kernel.org; Tue, 16 Jun 2020 12:32:36 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1592325155;
        s=strato-dkim-0002; d=fpond.eu;
        h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
        Subject:Sender;
        bh=FmE7e/I76oFWjpwU42EMD8UxbMc1b3P7Wn4az0pRclA=;
        b=eEPiXZQo6jAYNaTvUMqa3wqVRFZoYANbpn4a81N4atGkGjknL/AaVHLwNIHY2IO8Gk
        mWboSrR34dF5TdadnTCxIJOqlA+monxugskDEwvwZJU3/eGdkCjI5Y9YOm69YGJ1TpYw
        pEFCvQt+LBlwQQ9SXlhu1f1lUOfkewGk5eUWexqCxIZF4MLPQ89ivq47taEPK2C66snh
        rY7N6Io9KOxD0IUR9P+xLspVZa6nwnHGB3UwvFaBgxQ49if3fI9XhodOV9lwb9fMppq9
        VqPzYOMBPNCVKSnsjiFY4tPZRy+lP1fu3S5dtqiXaVJQ0nLhzWtEuSj3dOQwqtHwpuI+
        P5nQ==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73dmm4I5W0/AvA67Ot4fvR8WdEaEuFwQ=="
X-RZG-CLASS-ID: mo00
Received: from groucho.site
        by smtp.strato.de (RZmta 46.10.4 DYNA|AUTH)
        with ESMTPSA id a0ab6bw5GGQZFwQ
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Tue, 16 Jun 2020 18:26:35 +0200 (CEST)
From:   Ulrich Hecht <uli+renesas@fpond.eu>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-clk@vger.kernel.org, wsa@the-dreams.de, geert@linux-m68k.org,
        magnus.damm@gmail.com, Ulrich Hecht <uli+renesas@fpond.eu>
Subject: [PATCH v4 0/3] clk: renesas: cpg-mssr: add RWDT to critical clocks
Date:   Tue, 16 Jun 2020 18:26:23 +0200
Message-Id: <20200616162626.27944-1-uli+renesas@fpond.eu>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

(was: "clk: renesas: cpg-mssr: add never-disable option")

Hi!

The purpose of this series is to allow a WDT that has been enabled by the
bootloader to survive these events:

- deferred probing of the WDT device, which can lead the clock driver
  to disable the WDT clock until the WDT is re-probed, giving it a
  blind spot
- probe failure in the WDT driver

Following a suggestion by Geert, this revision, instead of adding another
list of clocks with special handling, changes the semantics of the
crit_mod_clks[] array slightly by only marking clocks critical that are
enabled at boot time. That way it can be used for RWDT without forcing the
clock on unnecessarily.

The other existing user of crit_mod_clks[] (INTC-AP) is always on at boot time
and should thus not be affected by this change.

There are a number of Gen2 and RZ/G1 SoCs that have the RWDT clock declared
as critical already in order to allow SMP bringup code to work. That should
still work with this series applied, assuming that the WDT clock is on at
boot time.

CU
Uli


Changes since v3:
- drop separate array, add RWDT to crit_mod_clks[]
- only mark clocks as critical if they are enabled on boot

Changes since v2:
- use the term "never-disable" instead of "ignore-unused"
- do the handling internally instead of relying on the behavior of
  CLK_IGNORE_UNUSED

Changes since v1:
- rename data structures for clarity
- squash SoC-specific patches into one per family


Ulrich Hecht (3):
  clk: renesas: cpg-mssr: mark clocks as critical only if on at boot
  clk: renesas: rcar-gen3: mark RWDT clocks as critical
  clk: renesas: rzg2: mark RWDT clock as critical

 drivers/clk/renesas/r8a774a1-cpg-mssr.c |  1 +
 drivers/clk/renesas/r8a774b1-cpg-mssr.c |  1 +
 drivers/clk/renesas/r8a774c0-cpg-mssr.c |  1 +
 drivers/clk/renesas/r8a7795-cpg-mssr.c  |  2 +-
 drivers/clk/renesas/r8a7796-cpg-mssr.c  |  2 +-
 drivers/clk/renesas/r8a77965-cpg-mssr.c |  1 +
 drivers/clk/renesas/r8a77970-cpg-mssr.c |  2 +-
 drivers/clk/renesas/r8a77980-cpg-mssr.c |  2 +-
 drivers/clk/renesas/r8a77990-cpg-mssr.c |  1 +
 drivers/clk/renesas/r8a77995-cpg-mssr.c |  2 +-
 drivers/clk/renesas/renesas-cpg-mssr.c  | 17 +++++++++--------
 11 files changed, 19 insertions(+), 13 deletions(-)

-- 
2.20.1

