Return-Path: <SRS0=r4nj=MU=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81501C65C20
	for <linux-clk@archiver.kernel.org>; Mon,  8 Oct 2018 16:24:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4D8442089D
	for <linux-clk@archiver.kernel.org>; Mon,  8 Oct 2018 16:24:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D8442089D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=renesas.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726564AbeJHXgk (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 8 Oct 2018 19:36:40 -0400
Received: from relmlor4.renesas.com ([210.160.252.174]:35644 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726396AbeJHXgk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 8 Oct 2018 19:36:40 -0400
Received: from unknown (HELO relmlir4.idc.renesas.com) ([10.200.68.154])
  by relmlie3.idc.renesas.com with ESMTP; 09 Oct 2018 01:24:08 +0900
Received: from relmlii2.idc.renesas.com (relmlii2.idc.renesas.com [10.200.68.66])
        by relmlir4.idc.renesas.com (Postfix) with ESMTP id 6F1563D843;
        Tue,  9 Oct 2018 01:24:08 +0900 (JST)
X-IronPort-AV: E=Sophos;i="5.54,357,1534777200"; 
   d="scan'208";a="294565717"
Received: from unknown (HELO rtamta01.rta.renesas.com) ([143.103.48.75])
  by relmlii2.idc.renesas.com with ESMTP; 09 Oct 2018 01:24:06 +0900
Received: from ubuntu.localdomain (unknown [143.103.58.6])
        by rtamta01.rta.renesas.com (Postfix) with ESMTP id CF601F2;
        Mon,  8 Oct 2018 16:24:01 +0000 (UTC)
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
Subject: [PATCH 0/3] mmc: tmio_mmc: Add support for RZ/A2
Date:   Mon,  8 Oct 2018 11:23:46 -0500
Message-Id: <20181008162349.42957-1-chris.brandt@renesas.com>
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

 Documentation/devicetree/bindings/mmc/tmio_mmc.txt |  1 +
 drivers/clk/renesas/r7s9210-cpg-mssr.c             |  5 ++++
 drivers/mmc/host/Kconfig                           |  5 ++--
 drivers/mmc/host/renesas_sdhi_internal_dmac.c      | 28 ++++++++++++++++++++--
 4 files changed, 35 insertions(+), 4 deletions(-)

-- 
2.16.1

