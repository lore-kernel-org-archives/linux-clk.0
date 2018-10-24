Return-Path: <SRS0=W7GY=NE=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 221EAECDE46
	for <linux-clk@archiver.kernel.org>; Wed, 24 Oct 2018 22:23:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CD7E820652
	for <linux-clk@archiver.kernel.org>; Wed, 24 Oct 2018 22:23:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD7E820652
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=renesas.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726809AbeJYGxd (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 25 Oct 2018 02:53:33 -0400
Received: from relmlor3.renesas.com ([210.160.252.173]:14974 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726297AbeJYGxd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 25 Oct 2018 02:53:33 -0400
Received: from unknown (HELO relmlir4.idc.renesas.com) ([10.200.68.154])
  by relmlie2.idc.renesas.com with ESMTP; 25 Oct 2018 07:23:37 +0900
Received: from relmlii1.idc.renesas.com (relmlii1.idc.renesas.com [10.200.68.65])
        by relmlir4.idc.renesas.com (Postfix) with ESMTP id D4B0B3B18B;
        Thu, 25 Oct 2018 07:23:37 +0900 (JST)
X-IronPort-AV: E=Sophos;i="5.54,422,1534777200"; 
   d="scan'208";a="294378232"
Received: from unknown (HELO rtamta01.rta.renesas.com) ([143.103.48.75])
  by relmlii1.idc.renesas.com with ESMTP; 25 Oct 2018 07:23:36 +0900
Received: from localhost.localdomain (unknown [143.103.58.195])
        by rtamta01.rta.renesas.com (Postfix) with ESMTP id 0DBB616B;
        Wed, 24 Oct 2018 22:23:28 +0000 (UTC)
From:   Chris Brandt <chris.brandt@renesas.com>
To:     Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-clk@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH v5 0/3] mmc: tmio_mmc: Add support for RZ/A2
Date:   Wed, 24 Oct 2018 17:22:58 -0500
Message-Id: <20181024222301.21455-1-chris.brandt@renesas.com>
X-Mailer: git-send-email 2.16.1
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Basically the same HW block that was used in R-Car Gen 3 is used in
RZ/A2 (with only a couple small differences).

V5 was just to rebase to fix merge conflicts

Chris Brandt (3):
  clk: renesas: r7s9210: Add SDHI clocks
  mmc: renesas_sdhi_internal_dmac: Add R7S9210 support
  dt-bindings: mmc: tmio_mmc: Document Renesas R7S9210

 Documentation/devicetree/bindings/mmc/tmio_mmc.txt |  3 ++-
 drivers/clk/renesas/r7s9210-cpg-mssr.c             |  5 ++++
 drivers/mmc/host/Kconfig                           |  7 +++---
 drivers/mmc/host/renesas_sdhi_internal_dmac.c      | 28 ++++++++++++++++++++--
 4 files changed, 37 insertions(+), 6 deletions(-)

-- 
2.16.1

