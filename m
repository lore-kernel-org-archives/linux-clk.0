Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wr0-f193.google.com ([209.85.128.193]:42131 "EHLO
        mail-wr0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750769AbdK3IlS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 30 Nov 2017 03:41:18 -0500
Received: by mail-wr0-f193.google.com with SMTP id s66so5760837wrc.9
        for <linux-clk@vger.kernel.org>; Thu, 30 Nov 2017 00:41:17 -0800 (PST)
From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
To: mturquette@baylibre.com, sboyd@codeaurora.org,
        mcoquelin.stm32@gmail.com, alexandre.torgue@st.com
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Benjamin Gaignard <benjamin.gaignard@st.com>,
        Gabriel Fernandez <gabriel.fernandez@st.com>
Subject: [PATCH v2] clk: stm32-h7: fix copyright
Date: Thu, 30 Nov 2017 09:41:08 +0100
Message-Id: <20171130084108.23083-1-benjamin.gaignard@st.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Uniformize STMicroelectronics copyrights header
Add SPDX identifier

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
Acked-by: Alexandre TORGUE <alexandre.torgue@st.com>
CC: Gabriel Fernandez <gabriel.fernandez@st.com>
---
 drivers/clk/clk-stm32h7.c | 19 +++----------------
 1 file changed, 3 insertions(+), 16 deletions(-)

diff --git a/drivers/clk/clk-stm32h7.c b/drivers/clk/clk-stm32h7.c
index 61c3e40507d3..db2b162c0d4c 100644
--- a/drivers/clk/clk-stm32h7.c
+++ b/drivers/clk/clk-stm32h7.c
@@ -1,20 +1,7 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
- * Copyright (C) Gabriel Fernandez 2017
- * Author: Gabriel Fernandez <gabriel.fernandez@st.com>
- *
- * License terms: GPL V2.0.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
- *
- * You should have received a copy of the GNU General Public License along with
- * this program.  If not, see <http://www.gnu.org/licenses/>.
+ * Copyright (C) STMicroelectronics 2017
+ * Author: Gabriel Fernandez <gabriel.fernandez@st.com> for STMicroelectronics.
  */
 
 #include <linux/clk.h>
-- 
2.15.0

