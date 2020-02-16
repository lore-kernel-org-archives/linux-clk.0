Return-Path: <SRS0=ZliI=4E=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 031D6C76199
	for <linux-clk@archiver.kernel.org>; Sun, 16 Feb 2020 10:28:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CFE1A20857
	for <linux-clk@archiver.kernel.org>; Sun, 16 Feb 2020 10:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1581848887;
	bh=tFdLIRrPeGwxnZkYfT0YOBqyS7GHpTVYWDvgSynC27M=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=TXT5MEvEC5MdQNmHqoD67mtGFkNdam+5f/O4jSHcJUJZ4CZ/8kK7VcN5BI+CIGVXo
	 z/gw2I+Y3D7LBrJpJ20XcPp1Qjw9ZN4ykTx7Fd/I/LLsl8FQha+byWHF+oyXUdOwxc
	 MyNeI7EOnV0Rdv2G5vghop+n+6BM/GEwoYwP4W1c=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727720AbgBPK2E (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 16 Feb 2020 05:28:04 -0500
Received: from mail.kernel.org ([198.145.29.99]:44172 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725951AbgBPK2E (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 16 Feb 2020 05:28:04 -0500
Received: from localhost.localdomain (unknown [122.178.194.127])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 889F820857;
        Sun, 16 Feb 2020 10:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581848883;
        bh=tFdLIRrPeGwxnZkYfT0YOBqyS7GHpTVYWDvgSynC27M=;
        h=From:To:Cc:Subject:Date:From;
        b=2Hg5+89t9fa2SU6yNsw+x3xqSTqi1E91mWoyMdZG8M3PKQgwr0tfD+7WK+CfIDzLs
         E1k7KDr5x85RclQv9oSo8XbGsCAVqC2rwFKSaRPhv4fWWE1t2ynN6D9XpC+bnGHzr8
         rR7hCGZnwgSFZe8BanZKfeTGV0OJkJDPHGI3LDjU=
From:   Vinod Koul <vkoul@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        psodagud@codeaurora.org, tsoni@codeaurora.org,
        jshriram@codeaurora.org, tdas@codeaurora.org,
        vnkgutta@codeaurora.org
Subject: [PATCH v3 0/5] Add clock drivers for SM8250 SoC
Date:   Sun, 16 Feb 2020 15:57:20 +0530
Message-Id: <20200216102725.2629155-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This series adds clock drivers support for SM8250 SoC.  As part of the
device tree, the sm8250 dts file has basic nodes like CPU, PSCI, intc, timer
and clock controller.

Required clock controller driver and RPMH cloks are added to
support peripherals like USB.

All this configuration is added to support SM8250 to boot up to the
serial console.

Changes in v3:
- Dropped accepted patches by Steve
- Split the common rename patch to rename and refactor patches
- Rebase on clk/clk-qcom and move yaml binding to .../bindings/clock/qcom,gcc-sm8250.yaml
- Fix comments form Steve on gcc-sm8250 clk driver

Taniya Das (5):
  clk: qcom: clk-alpha-pll: Use common names for defines
  clk: qcom: clk-alpha-pll: Refactor trion PLL
  clk: qcom: clk-alpha-pll: Add support for controlling Lucid PLLs
  dt-bindings: clock: Add SM8250 GCC clock bindings
  clk: qcom: gcc: Add global clock controller driver for SM8250

 .../bindings/clock/qcom,gcc-sm8250.yaml       |   72 +
 drivers/clk/qcom/Kconfig                      |    7 +
 drivers/clk/qcom/Makefile                     |    1 +
 drivers/clk/qcom/clk-alpha-pll.c              |  264 +-
 drivers/clk/qcom/clk-alpha-pll.h              |   12 +
 drivers/clk/qcom/gcc-sm8250.c                 | 3690 +++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-sm8250.h   |  271 ++
 7 files changed, 4268 insertions(+), 49 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-sm8250.yaml
 create mode 100644 drivers/clk/qcom/gcc-sm8250.c
 create mode 100644 include/dt-bindings/clock/qcom,gcc-sm8250.h

-- 
2.24.1

