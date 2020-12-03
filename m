Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85DDFC63777
	for <linux-clk@archiver.kernel.org>; Thu,  3 Dec 2020 07:04:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 23126208A9
	for <linux-clk@archiver.kernel.org>; Thu,  3 Dec 2020 07:04:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729114AbgLCHEM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 3 Dec 2020 02:04:12 -0500
Received: from mail.kernel.org ([198.145.29.99]:50532 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727932AbgLCHEM (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 3 Dec 2020 02:04:12 -0500
From:   Vinod Koul <vkoul@kernel.org>
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] Add clock drivers for SM8350
Date:   Thu,  3 Dec 2020 12:32:36 +0530
Message-Id: <20201203070241.2648874-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This add rpmhcc and gcc clock controller drivers for the controllers found
in SM8350 SoC

Vinod Koul (3):
  dt-bindings: clock: Add RPMHCC bindings for SM8350
  clk: qcom: rpmh: add support for SM8350 rpmh clocks
  dt-bindings: clock: Add SM8350 GCC clock bindings

Vivek Aknurwar (2):
  clk: qcom: clk-alpha-pll: Add support for Lucid 5LPE PLL
  clk: qcom: gcc: Add clock driver for SM8350

 .../bindings/clock/qcom,gcc-sm8350.yaml       |   68 +
 .../bindings/clock/qcom,rpmhcc.yaml           |    1 +
 drivers/clk/qcom/Kconfig                      |    9 +
 drivers/clk/qcom/Makefile                     |    1 +
 drivers/clk/qcom/clk-alpha-pll.c              |  223 +
 drivers/clk/qcom/clk-alpha-pll.h              |    4 +
 drivers/clk/qcom/clk-rpmh.c                   |   34 +
 drivers/clk/qcom/gcc-sm8350.c                 | 3959 +++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-sm8350.h   |  261 ++
 include/dt-bindings/clock/qcom,rpmh.h         |    8 +
 10 files changed, 4568 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-sm8350.yaml
 create mode 100644 drivers/clk/qcom/gcc-sm8350.c
 create mode 100644 include/dt-bindings/clock/qcom,gcc-sm8350.h

-- 
2.26.2

