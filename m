Return-Path: <SRS0=YCcY=RX=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10BC6C43381
	for <linux-clk@archiver.kernel.org>; Wed, 20 Mar 2019 10:06:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D36D92184E
	for <linux-clk@archiver.kernel.org>; Wed, 20 Mar 2019 10:06:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cLqPdQOB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726067AbfCTKGC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 20 Mar 2019 06:06:02 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:42949 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726023AbfCTKGC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 20 Mar 2019 06:06:02 -0400
Received: by mail-oi1-f193.google.com with SMTP id w139so1299367oie.9
        for <linux-clk@vger.kernel.org>; Wed, 20 Mar 2019 03:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=it2EbfqIKkGakT1fEE8g/fE0QVmOppWgv7mGI6uSqEg=;
        b=cLqPdQOBKlG14DWYeUi7imbmZmOZeC9+Iy8OCANwmMgEeXCaUVqjc6+1WbF8HbR1/k
         Ggwmuy4Ja7mQNDIZjCO8rgW2vmGtwOg4vazra3G9PpAeVjRLm9OhyxtcgSkyfpXFh21V
         htyYLYADPD4+dUx61SqKgg+hHvLEJrvTtxLEqq8gDHLkswHjPREgGWzreZpfxA43hVQp
         G03+69p4egQD7kmD4jRfP/apQbflnAHxf6cWlojFDhD75SP2TNt3Gq25iLv/sjqkKqTm
         s/9OdYVf34CLOiyK0SxONTbUrHlGig6yRVk7FZ9hVl4RHRcfdfEgd/HRYRJbIIyXQjUR
         0dwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=it2EbfqIKkGakT1fEE8g/fE0QVmOppWgv7mGI6uSqEg=;
        b=GZp3I+QR/xDdRLb7ktjmeNGwwF8rmIDiBuEMCgmN+Hos6mQVxp9MUThQOj9ZQdyq0v
         IrXTJ3cOcLbVyhx8W1MlfZ9G2uNn1AbrstHG4npe6KjrBl+0ku5SepfYMImPvX3RRXww
         Iz4dzQ8UxLEDlSXyGyi1BtsJx36iolkgJ/zhne6QmkUPbis1mAcx/XWf17SkV3dMVKoo
         FdRCRUO9r8CJb4/cuifwLviijw/yLApmXHdA1sbNuNia+oppywc2xrWk+Bp/cm3+6iEu
         IEhZbMePpbkumGxEMrgQHOVJYrHi//OiQx0f+qh0gVfZjkPIDjRR02s41sdelgUW6Ryd
         XLvw==
X-Gm-Message-State: APjAAAWnaOJVBKzHJCv043WlV20pRA0aTWRp7DZSLrEw2/FUkAhJKOhs
        07rCro5gx4X38MFabACFlXOa3g==
X-Google-Smtp-Source: APXvYqydifx4B5RNdoO11t2G7D+px5rkmRJJW5kp2u2zqubf34DxbKoy2HLzYarnKncfCkpSYRP2hA==
X-Received: by 2002:a54:4891:: with SMTP id r17mr4821054oic.7.1553076361704;
        Wed, 20 Mar 2019 03:06:01 -0700 (PDT)
Received: from localhost.localdomain (li808-42.members.linode.com. [104.237.132.42])
        by smtp.gmail.com with ESMTPSA id f62sm609238otb.54.2019.03.20.03.05.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 20 Mar 2019 03:06:00 -0700 (PDT)
From:   Leo Yan <leo.yan@linaro.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Leo Yan <leo.yan@linaro.org>, stable@vger.kernel.org,
        Zhong Kaihua <zhongkaihua@huawei.com>,
        John Stultz <john.stultz@linaro.org>,
        Zhangfei Gao <zhangfei.gao@linaro.org>
Subject: [PATCH v2] clk: hi3660: Mark clk_gate_ufs_subsys as critical
Date:   Wed, 20 Mar 2019 18:05:08 +0800
Message-Id: <20190320100508.6950-1-leo.yan@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

clk_gate_ufs_subsys is a system bus clock, turning off it will
introduce lockup issue during system suspend flow.  Let's mark
clk_gate_ufs_subsys as critical clock, thus keeps it on during
system suspend and resume.

Fixes: d374e6fd5088 ("clk: hisilicon: Add clock driver for hi3660 SoC")
Cc: stable@vger.kernel.org
Cc: Zhong Kaihua <zhongkaihua@huawei.com>
Cc: John Stultz <john.stultz@linaro.org>
Cc: Zhangfei Gao <zhangfei.gao@linaro.org>
Suggested-by: Dong Zhang <zhangdong46@hisilicon.com>
Signed-off-by: Leo Yan <leo.yan@linaro.org>
---
 drivers/clk/hisilicon/clk-hi3660.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/hisilicon/clk-hi3660.c b/drivers/clk/hisilicon/clk-hi3660.c
index f40419959656..794eeff0d5d2 100644
--- a/drivers/clk/hisilicon/clk-hi3660.c
+++ b/drivers/clk/hisilicon/clk-hi3660.c
@@ -163,8 +163,12 @@ static const struct hisi_gate_clock hi3660_crgctrl_gate_sep_clks[] = {
 	  "clk_isp_snclk_mux", CLK_SET_RATE_PARENT, 0x50, 17, 0, },
 	{ HI3660_CLK_GATE_ISP_SNCLK2, "clk_gate_isp_snclk2",
 	  "clk_isp_snclk_mux", CLK_SET_RATE_PARENT, 0x50, 18, 0, },
+	/*
+	 * clk_gate_ufs_subsys is a system bus clock, mark it as critical
+	 * clock and keep it on for system suspend and resume.
+	 */
 	{ HI3660_CLK_GATE_UFS_SUBSYS, "clk_gate_ufs_subsys", "clk_div_sysbus",
-	  CLK_SET_RATE_PARENT, 0x50, 21, 0, },
+	  CLK_SET_RATE_PARENT | CLK_IS_CRITICAL, 0x50, 21, 0, },
 	{ HI3660_PCLK_GATE_DSI0, "pclk_gate_dsi0", "clk_div_cfgbus",
 	  CLK_SET_RATE_PARENT, 0x50, 28, 0, },
 	{ HI3660_PCLK_GATE_DSI1, "pclk_gate_dsi1", "clk_div_cfgbus",
-- 
2.17.1

