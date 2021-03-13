Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79C30C2BA11
	for <linux-clk@archiver.kernel.org>; Sat, 13 Mar 2021 02:22:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4A6456500F
	for <linux-clk@archiver.kernel.org>; Sat, 13 Mar 2021 02:22:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233081AbhCMCVb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 12 Mar 2021 21:21:31 -0500
Received: from relay02.th.seeweb.it ([5.144.164.163]:52057 "EHLO
        relay02.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232917AbhCMCUz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 12 Mar 2021 21:20:55 -0500
Received: from localhost.localdomain (abac242.neoplus.adsl.tpnet.pl [83.6.166.242])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id 5CA4C1F8E2;
        Sat, 13 Mar 2021 03:20:53 +0100 (CET)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     ~postmarketos/upstreaming@lists.sr.ht
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 7/9] clk: qcom: gcc-msm8994: Add modem reset
Date:   Sat, 13 Mar 2021 03:19:16 +0100
Message-Id: <20210313021919.435332-7-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210313021919.435332-1-konrad.dybcio@somainline.org>
References: <20210313021919.435332-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This will be required to support the modem.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 drivers/clk/qcom/gcc-msm8994.c               | 1 +
 include/dt-bindings/clock/qcom,gcc-msm8994.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/clk/qcom/gcc-msm8994.c b/drivers/clk/qcom/gcc-msm8994.c
index e1e40982ebee..fae784b4242f 100644
--- a/drivers/clk/qcom/gcc-msm8994.c
+++ b/drivers/clk/qcom/gcc-msm8994.c
@@ -2693,6 +2693,7 @@ static struct gdsc *gcc_msm8994_gdscs[] = {
 static const struct qcom_reset_map gcc_msm8994_resets[] = {
 	[USB3_PHY_RESET] = { 0x1400 },
 	[USB3PHY_PHY_RESET] = { 0x1404 },
+	[MSS_RESET] = { 0x1680 },
 	[PCIE_PHY_0_RESET] = { 0x1b18 },
 	[PCIE_PHY_1_RESET] = { 0x1b98 },
 	[QUSB2_PHY_RESET] = { 0x04b8 },
diff --git a/include/dt-bindings/clock/qcom,gcc-msm8994.h b/include/dt-bindings/clock/qcom,gcc-msm8994.h
index dcb49817dcec..f6836f430bb5 100644
--- a/include/dt-bindings/clock/qcom,gcc-msm8994.h
+++ b/include/dt-bindings/clock/qcom,gcc-msm8994.h
@@ -174,5 +174,6 @@
 #define PCIE_PHY_0_RESET		2
 #define PCIE_PHY_1_RESET		3
 #define QUSB2_PHY_RESET			4
+#define MSS_RESET				5
 
 #endif
-- 
2.30.2

