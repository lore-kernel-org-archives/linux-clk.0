Return-Path: <SRS0=PWff=RB=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FD49C43381
	for <linux-clk@archiver.kernel.org>; Tue, 26 Feb 2019 07:01:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E2D3D2173C
	for <linux-clk@archiver.kernel.org>; Tue, 26 Feb 2019 07:01:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kRoL17ql"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725993AbfBZHBu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 26 Feb 2019 02:01:50 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:44662 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726760AbfBZHBu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 26 Feb 2019 02:01:50 -0500
Received: by mail-pf1-f195.google.com with SMTP id a3so5747702pff.11
        for <linux-clk@vger.kernel.org>; Mon, 25 Feb 2019 23:01:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=QttOz8KAk5HTV2qQPu3H+rSCJ+Pe4jsGqkjtfi076ts=;
        b=kRoL17qlnGXp14y62Kj2jmQN18xp96F19TLL45rzeKqGqKGkiAyKrV6IdZhECFaYbs
         NbMpg/07HN6F4OZYTdx5PxkmFkFPsvFZOfGqq+Q9lrJPa6JJEx7Oe+Csolz9MYLqDBFd
         QRRcv80m17j9ZyYVmOQUPlCfzo8uKzoJRicpuuvLeYvmkb6MJBRVR+cGN2hkJamY8Qv+
         jRHoNEozhpwUueU9w1CYpiy9odi8Ro1n90u5QygBtIGRsncLAX13dErn0ccfi2PoFrD7
         PoGx/FvIZlAlXvSvgpjDTZCI5cb0Oo31TAy04LmhYazMnfvx7enUbKe/I9oZ2onSKGaQ
         AAGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=QttOz8KAk5HTV2qQPu3H+rSCJ+Pe4jsGqkjtfi076ts=;
        b=XMVaQX1hZbdp+HVy2NizaJ+qprI8wf9UFHEhiNWeaGXEHCwgyNGcTO/ej/BjXidg3y
         fkQG30i8pVCzQ/3swj4DWDkRP9L7IXUdJFvUuYvZezFZ7HpIvhPwOJB2nCOgrq5MTrbj
         LKAYPkv/kI2xtkX1SqiyRfWy47B6sC6jO7g9bFavmuumyNTzMN3ku8ALsxaGyS+KcVEa
         WaZHmFIVOGTqo/1W/6F/7t1p+Au4lMCFn5ycFKaAF2E65n5CyuTcCwiKds1xUdT2DNLR
         BnkYZmPhtTdpGopFHj8+T0YdZZ3Sq0tYPM1V4c42IvEFhGlbl2lZQPLtojlIDfgxsT6N
         2Exw==
X-Gm-Message-State: AHQUAubwxINQ5GyjzfkVPNyEqPBfBFBxryvKKbtqvZn6D9FIe2E3BFhx
        27pNCSyCAK8Q5ES9p4z0huHvZA==
X-Google-Smtp-Source: AHgI3IbbIEYQomxqLl908709DI9aXcQAOzkuApX8mysPdcH38QHhMsvvqDQzM+SLUEsjxvfzwI8EWg==
X-Received: by 2002:a62:61c4:: with SMTP id v187mr23953793pfb.133.1551164509636;
        Mon, 25 Feb 2019 23:01:49 -0800 (PST)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id j24sm18324829pgl.58.2019.02.25.23.01.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 25 Feb 2019 23:01:48 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] clk: qcom: gcc-sdm845: Define parent of PCIe PIPE clocks
Date:   Mon, 25 Feb 2019 23:02:21 -0800
Message-Id: <20190226070221.22382-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.18.0
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The PCIe PIPE clock in the GCC is fed by the PIPE clock coming from the
PHY, describe this relationship.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/clk/qcom/gcc-sdm845.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/qcom/gcc-sdm845.c b/drivers/clk/qcom/gcc-sdm845.c
index 58fa5c247af1..7131dcf9b060 100644
--- a/drivers/clk/qcom/gcc-sdm845.c
+++ b/drivers/clk/qcom/gcc-sdm845.c
@@ -1703,6 +1703,9 @@ static struct clk_branch gcc_pcie_0_pipe_clk = {
 		.enable_mask = BIT(4),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_0_pipe_clk",
+			.parent_names = (const char *[]){ "pcie_0_pipe_clk" },
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -1802,6 +1805,8 @@ static struct clk_branch gcc_pcie_1_pipe_clk = {
 		.enable_mask = BIT(30),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_1_pipe_clk",
+			.parent_names = (const char *[]){ "pcie_1_pipe_clk" },
+			.num_parents = 1,
 			.ops = &clk_branch2_ops,
 		},
 	},
-- 
2.18.0

