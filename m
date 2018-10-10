Return-Path: <SRS0=fkKI=MW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6758C43610
	for <linux-clk@archiver.kernel.org>; Wed, 10 Oct 2018 12:37:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6B58D2087D
	for <linux-clk@archiver.kernel.org>; Wed, 10 Oct 2018 12:37:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6B58D2087D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=renesas.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726700AbeJJT7c (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 10 Oct 2018 15:59:32 -0400
Received: from relmlor4.renesas.com ([210.160.252.174]:54844 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726503AbeJJT7c (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 10 Oct 2018 15:59:32 -0400
Received: from unknown (HELO relmlir3.idc.renesas.com) ([10.200.68.153])
  by relmlie3.idc.renesas.com with ESMTP; 10 Oct 2018 21:37:31 +0900
Received: from relmlii1.idc.renesas.com (relmlii1.idc.renesas.com [10.200.68.65])
        by relmlir3.idc.renesas.com (Postfix) with ESMTP id 68E36802F0;
        Wed, 10 Oct 2018 21:37:31 +0900 (JST)
X-IronPort-AV: E=Sophos;i="5.54,364,1534777200"; 
   d="scan'208";a="293187288"
Received: from unknown (HELO rtamta01.rta.renesas.com) ([143.103.48.75])
  by relmlii1.idc.renesas.com with ESMTP; 10 Oct 2018 21:37:29 +0900
Received: from ubuntu.localdomain (unknown [143.103.58.66])
        by rtamta01.rta.renesas.com (Postfix) with ESMTP id AC0451B4;
        Wed, 10 Oct 2018 12:37:24 +0000 (UTC)
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
Subject: [PATCH v2 0/3] mmc: tmio_mmc: Add support for RZ/A2
Date:   Wed, 10 Oct 2018 07:37:10 -0500
Message-Id: <20181010123713.67541-1-chris.brandt@renesas.com>
X-Mailer: git-send-email 2.16.1
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Basically the same HW block that was used in R-Car Gen 3 is used in
RZ/A2 (with only a couple small differences).

Not sure if you're going to like the Kconfig change or not.

Chris Brandt (3):
  clk: renesas: r7s9210: Add SDHI clocks
  mmc: renesas_sdhi_internal_dmac: Add R7S9210 support
  dt-bindings: mmc: tmio_mmc: Document Renesas R7S9210

 Documentation/devicetree/bindings/mmc/tmio_mmc.txt |  3 ++-
 drivers/clk/renesas/r7s9210-cpg-mssr.c             |  5 ++++
 drivers/mmc/host/Kconfig                           |  5 ++--
 drivers/mmc/host/renesas_sdhi_internal_dmac.c      | 28 ++++++++++++++++++++--
 4 files changed, 36 insertions(+), 5 deletions(-)

-- 
2.16.1

