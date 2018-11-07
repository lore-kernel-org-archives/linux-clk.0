Return-Path: <SRS0=FPSA=NS=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AD99C0044C
	for <linux-clk@archiver.kernel.org>; Wed,  7 Nov 2018 17:36:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C949120862
	for <linux-clk@archiver.kernel.org>; Wed,  7 Nov 2018 17:36:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C949120862
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=renesas.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728075AbeKHDIS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 7 Nov 2018 22:08:18 -0500
Received: from relmlor4.renesas.com ([210.160.252.174]:13114 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727722AbeKHDIS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 7 Nov 2018 22:08:18 -0500
Received: from unknown (HELO relmlir3.idc.renesas.com) ([10.200.68.153])
  by relmlie3.idc.renesas.com with ESMTP; 08 Nov 2018 02:36:53 +0900
Received: from relmlii1.idc.renesas.com (relmlii1.idc.renesas.com [10.200.68.65])
        by relmlir3.idc.renesas.com (Postfix) with ESMTP id 293724D9DA;
        Thu,  8 Nov 2018 02:36:53 +0900 (JST)
X-IronPort-AV: E=Sophos;i="5.54,476,1534777200"; 
   d="scan'208";a="295393484"
Received: from unknown (HELO rtamta01.rta.renesas.com) ([143.103.48.75])
  by relmlii1.idc.renesas.com with ESMTP; 08 Nov 2018 02:36:51 +0900
Received: from ubuntu.localdomain (unknown [143.103.58.108])
        by rtamta01.rta.renesas.com (Postfix) with ESMTP id 6E9EEAA;
        Wed,  7 Nov 2018 17:36:47 +0000 (UTC)
From:   Chris Brandt <chris.brandt@renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms+renesas@verge.net.au>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH 0/3] usb: renesas: rcar-gen3-usb2: Add support for RZ/A2
Date:   Wed,  7 Nov 2018 12:35:55 -0500
Message-Id: <20181107173558.54481-1-chris.brandt@renesas.com>
X-Mailer: git-send-email 2.16.1
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add support for RZ/A2. Basically has the same IP as R-Car Gen3.


Chris Brandt (3):
  clk: renesas: r7s9210: Add USB clocks
  phy: renesas: rcar-gen3-usb2: Add support for R7S9210
  dt-bindings: rcar-gen3-phy-usb2: Add r7s9210 support

 Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt | 10 ++++++----
 drivers/clk/renesas/r7s9210-cpg-mssr.c                       |  2 ++
 drivers/phy/renesas/Kconfig                                  |  2 +-
 drivers/phy/renesas/phy-rcar-gen3-usb2.c                     | 12 ++++++++++++
 4 files changed, 21 insertions(+), 5 deletions(-)

-- 
2.16.1

