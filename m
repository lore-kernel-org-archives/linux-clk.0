Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFAB9C433EF
	for <linux-clk@archiver.kernel.org>; Wed,  3 Nov 2021 12:39:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 97B4F611AD
	for <linux-clk@archiver.kernel.org>; Wed,  3 Nov 2021 12:39:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232065AbhKCMmf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 3 Nov 2021 08:42:35 -0400
Received: from mx1.tq-group.com ([93.104.207.81]:39256 "EHLO mx1.tq-group.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231958AbhKCMmd (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 3 Nov 2021 08:42:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1635943196; x=1667479196;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=frB6WasuaNmxKic3MwCdWdYJsEoS4X1xN1rRTbJN3fs=;
  b=KRDkrDW+e/KR5iZYp3QhwmPqfr3x/0WaesklEioBngOrGhVCjocrfnHr
   XkINb7KNHNTnKQNi0Ro18MwTNg+mwqbNQVt995R5nxQ6iyDOA3EAS+Au1
   3XqAAVYMJUJHdqOAjYuvKbSr/+Bt8BBlUsig5pmtkzdGiFwIoM5PYto1Q
   VIJxECLCMrnKtAg362vTcpAQcp+H5aCL5QD8gv+zmR3ALSy4XhFMDgYLK
   yi3FDDP6IA5jPs4bC/ai8kz8GXiwFloCINaHUFOqWjm5DL0uoq+3lrl8m
   G0NKM6Xo0tbqkcvhFBprvmvK+fpmaST5+Qno3fH87dCXsxA7knK3Ewbk+
   w==;
X-IronPort-AV: E=Sophos;i="5.87,205,1631570400"; 
   d="scan'208";a="20324534"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 03 Nov 2021 13:39:55 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Wed, 03 Nov 2021 13:39:55 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Wed, 03 Nov 2021 13:39:55 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1635943195; x=1667479195;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=frB6WasuaNmxKic3MwCdWdYJsEoS4X1xN1rRTbJN3fs=;
  b=K6j5LM/ztRAzszKxQGJgTXf/WrqfRk+iRYC6Xs/mKyh4A8+5If4VopxU
   EGVko7zo+RMDaH7lSSkXLMRudnuT271W9iblDwc9Qx3cSQnM7qH7sNYqx
   TT3fYMf5OYi33j+TIf8AHSHl43JNmYSWiEPI6RVn7Z15E+vtFCf4p2ubX
   7PalD/nMCSnbvJi9tvBRgldRX2gHWewoHJ5BOve8905KVX5hrH7R9oqvK
   ntnpI2mziT8DuF+VgRpYgvnEuiRfEc0obtz97Dm19WkwbYTaFLeBvNkyt
   2uxdSg5XyoSlkys3NUlHuaT0eKk5e7oMn+yapvt8uvXMuvT+vDmiYPsDX
   A==;
X-IronPort-AV: E=Sophos;i="5.87,205,1631570400"; 
   d="scan'208";a="20324533"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 03 Nov 2021 13:39:55 +0100
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id A2818280065;
        Wed,  3 Nov 2021 13:39:55 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Abel Vesa <abel.vesa@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 1/1] clk: imx8m: Do not set IMX_COMPOSITE_CORE for non-regular composites
Date:   Wed,  3 Nov 2021 13:39:47 +0100
Message-Id: <20211103123947.3222443-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Only imx8m_clk_hw_composite_core needs to set this flag.

Fixes: a60fe746df94 ("clk: imx: Rework all imx_clk_hw_composite wrappers")
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
This is from clk_summary on a imx8mq custom board where you can clearly
see the before the divider is limited to 8 (core composite)

before:
video_pll1_out        2        2        0  1031999997          0     0  50000         Y
   dsi_phy_ref        1        1        0   129000000          0     0  50000         Y
   lcdif_pixel        2        2        0   129000000          0     0  50000         Y

after:
video_pll1_out        2        2        0  1031999997          0     0  50000         Y
   dsi_phy_ref        1        1        0    24000000          0     0  50000         Y
   lcdif_pixel        2        2        0    68800000          0     0  50000         Y

 drivers/clk/imx/clk.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/imx/clk.h b/drivers/clk/imx/clk.h
index 819949973db1..7d220a01de1f 100644
--- a/drivers/clk/imx/clk.h
+++ b/drivers/clk/imx/clk.h
@@ -391,11 +391,11 @@ struct clk_hw *__imx8m_clk_hw_composite(const char *name,
 
 #define imx8m_clk_hw_composite(name, parent_names, reg) \
 	_imx8m_clk_hw_composite(name, parent_names, reg, \
-			IMX_COMPOSITE_CORE, IMX_COMPOSITE_CLK_FLAGS_DEFAULT)
+			0, IMX_COMPOSITE_CLK_FLAGS_DEFAULT)
 
 #define imx8m_clk_hw_composite_critical(name, parent_names, reg) \
 	_imx8m_clk_hw_composite(name, parent_names, reg, \
-			IMX_COMPOSITE_CORE, IMX_COMPOSITE_CLK_FLAGS_CRITICAL)
+			0, IMX_COMPOSITE_CLK_FLAGS_CRITICAL)
 
 #define imx8m_clk_hw_composite_bus(name, parent_names, reg)	\
 	_imx8m_clk_hw_composite(name, parent_names, reg, \
-- 
2.25.1

