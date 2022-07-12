Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90604C43334
	for <linux-clk@archiver.kernel.org>; Tue, 12 Jul 2022 10:03:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232416AbiGLKDt (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 12 Jul 2022 06:03:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231571AbiGLKDs (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 12 Jul 2022 06:03:48 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 621B6E0FE
        for <linux-clk@vger.kernel.org>; Tue, 12 Jul 2022 03:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1657620226; x=1689156226;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=oc3MQ3KuTQWhIOa1CwfhwVSh4PktPWFuTMH5rum+SM4=;
  b=TLZOYT4pyslb7+2tuO9oXH+aEtzNHtyEUoBPoNegslJixIQhuip2WmqV
   1MaPwlPoLxJ//5phi1PTnR/EWZzt/9RrAhKo7gl0+dqcQ6+pYcbo331ty
   1mqvsnderhQcR//xW5wLKMvw9NmJDxOnnruw5sgJLLT9LT4v2JxCU5C/m
   e/Yi2HXmkDtZOyAvQYUvdo/upDeBQi8LZcYztVL5aiHtJ2Hf1oy7Eh5SH
   5NsFb6liZ/susb9VqSgjNqKuowgXklVNM5LY5aESudlwG5vqgd/pcRW1J
   Y4WdfPCvSpY2r76wDXR7hMViws13xX2GUw/bHNt4FD+BV4eU23pZeycdJ
   A==;
X-IronPort-AV: E=Sophos;i="5.92,265,1650956400"; 
   d="scan'208";a="172007895"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 12 Jul 2022 03:03:39 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 12 Jul 2022 03:03:39 -0700
Received: from localhost.localdomain (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Tue, 12 Jul 2022 03:03:38 -0700
From:   Claudiu Beznea <claudiu.beznea@microchip.com>
To:     <sboyd@kernel.org>, <mturquette@baylibre.com>
CC:     <linux-clk@vger.kernel.org>
Subject: [GIT PULL] AT91 clk fixes for v5.19
Date:   Tue, 12 Jul 2022 13:06:05 +0300
Message-ID: <20220712100605.898385-1-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi, Stephen, Michael,

In case it is not too late, please pull these 2 fixes for 5.19.
They are necessary for proper working of:
- new features enabled on LAN966 SoCs that uses clock gating support
  in clk-lan966x driver
- proper balance of reference counter embedded in struct device_node
  objects that is incremented by of_get_parent()

Thank you,
Claudiu Beznea

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/clk-fixes-at91

for you to fetch changes up to 4e03ba2fea702f1499c7a29e30e2916ec6cfa269:

  clk: at91: dt-compat: Hold reference returned by of_get_parent() (2022-07-11 11:04:40 +0300)

----------------------------------------------------------------
AT91 clock fixes for v5.19

It fixes the base address for gate clock in clk-lan966x driver and
release the reference counter taken by of_get_parent() in dt-compat
driver.

----------------------------------------------------------------
Herve Codina (1):
      clk: lan966x: Fix the lan966x clock gate register address

Liang He (1):
      clk: at91: dt-compat: Hold reference returned by of_get_parent()

 drivers/clk/at91/dt-compat.c | 108 +++++++++++++++++++++++++++++++++----------
 drivers/clk/clk-lan966x.c    |   2 +-
 2 files changed, 85 insertions(+), 25 deletions(-)
