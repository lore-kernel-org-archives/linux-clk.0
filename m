Return-Path: <SRS0=gal5=RW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BA89C43381
	for <linux-clk@archiver.kernel.org>; Tue, 19 Mar 2019 07:52:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DB82720989
	for <linux-clk@archiver.kernel.org>; Tue, 19 Mar 2019 07:52:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Zvr/+mH9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726452AbfCSHwZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 19 Mar 2019 03:52:25 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:36636 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726366AbfCSHwY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 19 Mar 2019 03:52:24 -0400
Received: by mail-ot1-f67.google.com with SMTP id o74so4000439ota.3
        for <linux-clk@vger.kernel.org>; Tue, 19 Mar 2019 00:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=iqS0mD2DkpD+ki4OIwDG5Tufv1Vltf3JG5TtzYwAJaQ=;
        b=Zvr/+mH9ntX/IUd8XbK5tTWRysrJ0bUUH71hlw4jh7X6JpBDONMBXdmVs6GaAg/iAC
         XQfefILIzmPvCxp8jhsP3TjGIroSwYyJ1KQBFhUmi3663eK83B35j/V4EM6Ex40XepQd
         PHtL5V+wEKJeVFsypf698f1VpwnPe8HDmVHQxUg3xQWhAvyDCPlj10i3fypfGBvTM41w
         MGnrKHewGBiQQiZLUE2VKm7E3NcSjkVW5GrbUFxxKzQArmr5C/z+uh0J8mcqf4dmIGyy
         K5aoYeAyQgKjl2Pcf/gyjudALDs3KwNC7mgK753vyjsGfMA/ifYu8SLhX0q2CZrX5f1Q
         Feew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=iqS0mD2DkpD+ki4OIwDG5Tufv1Vltf3JG5TtzYwAJaQ=;
        b=Bm63GDWU0xgy3kL9iugve5HSFIVCCkVDItd6NfLFsAce6dS1KfFUng833C5ZNnRZax
         XtXjzqfPZGQcYMoFfDA2r8cFxpbmAAfuhzPcz11encdu6uiCzomtxLFDmasB368CdK+L
         15sOAMuBoOETf+QAKDNDLomlUvjnN6rylmDE01p2L1TTLiam89VdhN02slb+hH1H6I+X
         56kOl4ESxAtovEIVJn5uuIxGKPCfFdo6pkGCEUUR4OE0I+wWpQeMaE9mPe9I54EaRMSL
         ivMnMIreQZN8kNjYGj/UIqlTjwK5/bycz71KGBP6MByn8CUE+OgIAz43rS9Zz4cwB8ut
         KoTw==
X-Gm-Message-State: APjAAAXAdwWbiU7aWvrkZ5tDNtsF0AC9zph1PkbLL1XEGnqm5cllcgpt
        5iyEcIxlNslnDyzPaCcuOhtZaQ==
X-Google-Smtp-Source: APXvYqxLecB5Qq2OdyfErVl3NSOhJPNRMBsJGA/gAx35jWSEVPwtP0DfZHORphZWkdYx/3KoyK37YA==
X-Received: by 2002:a9d:7597:: with SMTP id s23mr663856otk.25.1552981944068;
        Tue, 19 Mar 2019 00:52:24 -0700 (PDT)
Received: from localhost.localdomain (li808-42.members.linode.com. [104.237.132.42])
        by smtp.gmail.com with ESMTPSA id a14sm5032730otl.46.2019.03.19.00.52.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 19 Mar 2019 00:52:22 -0700 (PDT)
From:   Leo Yan <leo.yan@linaro.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Leo Yan <leo.yan@linaro.org>, stable@vger.kernel.org,
        Zhong Kaihua <zhongkaihua@huawei.com>,
        John Stultz <john.stultz@linaro.org>,
        Zhangfei Gao <zhangfei.gao@linaro.org>
Subject: [PATCH] clk: hi3660: clk: Mark clk_gate_ufs_subsys as critical
Date:   Tue, 19 Mar 2019 15:52:06 +0800
Message-Id: <20190319075206.30740-1-leo.yan@linaro.org>
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
 drivers/clk/hisilicon/clk-hi3660.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/hisilicon/clk-hi3660.c b/drivers/clk/hisilicon/clk-hi3660.c
index f40419959656..32ba80181cc6 100644
--- a/drivers/clk/hisilicon/clk-hi3660.c
+++ b/drivers/clk/hisilicon/clk-hi3660.c
@@ -164,7 +164,7 @@ static const struct hisi_gate_clock hi3660_crgctrl_gate_sep_clks[] = {
 	{ HI3660_CLK_GATE_ISP_SNCLK2, "clk_gate_isp_snclk2",
 	  "clk_isp_snclk_mux", CLK_SET_RATE_PARENT, 0x50, 18, 0, },
 	{ HI3660_CLK_GATE_UFS_SUBSYS, "clk_gate_ufs_subsys", "clk_div_sysbus",
-	  CLK_SET_RATE_PARENT, 0x50, 21, 0, },
+	  CLK_SET_RATE_PARENT|CLK_IS_CRITICAL, 0x50, 21, 0, },
 	{ HI3660_PCLK_GATE_DSI0, "pclk_gate_dsi0", "clk_div_cfgbus",
 	  CLK_SET_RATE_PARENT, 0x50, 28, 0, },
 	{ HI3660_PCLK_GATE_DSI1, "pclk_gate_dsi1", "clk_div_cfgbus",
-- 
2.17.1

