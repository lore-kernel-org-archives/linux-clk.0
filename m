Return-Path: <SRS0=eSXj=RD=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0896C10F00
	for <linux-clk@archiver.kernel.org>; Thu, 28 Feb 2019 13:53:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 93D8D214D8
	for <linux-clk@archiver.kernel.org>; Thu, 28 Feb 2019 13:53:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="gO6ZEgA3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731650AbfB1NxD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 28 Feb 2019 08:53:03 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:43912 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726003AbfB1NxD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 28 Feb 2019 08:53:03 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 72EFB25BEDE;
        Fri,  1 Mar 2019 00:52:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1551361972; bh=hG4f0r052dPvHap9UMt9PjYCTEQTo5l2pfhYFgbB4i0=;
        h=From:To:Cc:Subject:Date:From;
        b=gO6ZEgA357eJotJLW6adrli33s3gSIcf9+MLAVU18YE97Mzxb+S84RjevVmnW8Bhx
         RacxJCRGS1VEDDzMzTEXsIIUJy/vYGxQ9KsdEpf2N67/L3JGdFrHrTZPURJYGEIJrJ
         s0bE5Wj3tcKd7zrHs5LjWMU4anQMRJIaMd13EyXk=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 310D3940373; Thu, 28 Feb 2019 14:52:50 +0100 (CET)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 0/4] clk: renesas: rcar-gen3: Add ZG support for E3, D3 and RZ/G2E
Date:   Thu, 28 Feb 2019 14:52:42 +0100
Message-Id: <20190228135246.31714-1-horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

this series introduces ZG support for the E3, D3 and RZ/G2E.

On these SoCs these are programmable clocks similar to the Z and Z2 clocks
which are already supported. This implementation leverages those
similarities to support the Z2 clock by parameterising existing Z and Z2
clock support.

---
Simon Horman (4):
  clk: renesas: rcar-gen3: Parameterise Z and Z2 clock register offset
  clk: renesas: r8a77990: Add ZG clock
  [RFT] clk: renesas: r8a774c0: Add ZG clock
  [RFT] clk: renesas: r8a77995: Add ZG clock

 drivers/clk/renesas/r8a774a1-cpg-mssr.c |  6 ++++--
 drivers/clk/renesas/r8a774c0-cpg-mssr.c |  5 ++++-
 drivers/clk/renesas/r8a7795-cpg-mssr.c  |  6 ++++--
 drivers/clk/renesas/r8a7796-cpg-mssr.c  |  6 ++++--
 drivers/clk/renesas/r8a77965-cpg-mssr.c |  3 ++-
 drivers/clk/renesas/r8a77990-cpg-mssr.c |  5 ++++-
 drivers/clk/renesas/r8a77995-cpg-mssr.c |  2 ++
 drivers/clk/renesas/rcar-gen3-cpg.c     | 11 +++++------
 drivers/clk/renesas/rcar-gen3-cpg.h     | 14 ++++++++++++--
 9 files changed, 41 insertions(+), 17 deletions(-)

-- 
2.11.0

