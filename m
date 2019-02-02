Return-Path: <SRS0=iRVG=QJ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5B68C282D7
	for <linux-clk@archiver.kernel.org>; Sat,  2 Feb 2019 15:26:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A7A5720857
	for <linux-clk@archiver.kernel.org>; Sat,  2 Feb 2019 15:26:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=codeaurora.org header.i=@codeaurora.org header.b="Duvekuw4";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=codeaurora.org header.i=@codeaurora.org header.b="Duvekuw4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727563AbfBBP0j (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 2 Feb 2019 10:26:39 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:37082 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726617AbfBBP0j (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 2 Feb 2019 10:26:39 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 8131D60860; Sat,  2 Feb 2019 15:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1549121197;
        bh=2u6ngmO6YQnL4xNUttDae0c7qMgpkghdOxqozMui138=;
        h=From:To:Cc:Subject:Date:From;
        b=Duvekuw4A3qmo5XmItwAAKziewQxq45B45t6/V1DsN7dvDggtyH8+waL0l1KHU6t7
         uR0wHa1CMFgQCg4bUf6jJ+pDbDNi+COKRuTzacUOYHE94xvAc09tIbHT49naWu3i+o
         J3xwde/3J5BuhmLcLB0jG3c7VMJzlBHWmSu7nmd0=
Received: from govinds-linux.qualcomm.com (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: govinds@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D434D60351;
        Sat,  2 Feb 2019 15:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1549121197;
        bh=2u6ngmO6YQnL4xNUttDae0c7qMgpkghdOxqozMui138=;
        h=From:To:Cc:Subject:Date:From;
        b=Duvekuw4A3qmo5XmItwAAKziewQxq45B45t6/V1DsN7dvDggtyH8+waL0l1KHU6t7
         uR0wHa1CMFgQCg4bUf6jJ+pDbDNi+COKRuTzacUOYHE94xvAc09tIbHT49naWu3i+o
         J3xwde/3J5BuhmLcLB0jG3c7VMJzlBHWmSu7nmd0=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D434D60351
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=govinds@codeaurora.org
From:   Govind Singh <govinds@codeaurora.org>
To:     bjorn.andersson@linaro.org, linux-remoteproc@vger.kernel.org,
        sboyd@kernel.org
Cc:     linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        andy.gross@linaro.org, david.brown@linaro.org,
        linux-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Govind Singh <govinds@codeaurora.org>
Subject: [PATCH v4 0/8] Add non PAS wcss Q6 support for QCS404
Date:   Sat,  2 Feb 2019 20:56:18 +0530
Message-Id: <20190202152626.1006-1-govinds@codeaurora.org>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add non PAS(Peripheral Authentication System) WCSS remoteproc
driver support and wcss clock/reset controls for QCS404 SOC.
Add WCSS q6 bootup and shutdown sequence handled from
Application Processor SubSystem(APSS).


Changes since v3:
 dt binding cleanup.
 Fixed remoteproc recovery.
 Added remoteproc dump support.
 wcsscc cleanup/refactoring.

Changes since v2:
 Removed unused properties.
 Refactored code to have common logic b/w ipq8074 and QCS404, wherever possible.
 Added compatible example.
 Removed wcss-protected bool.

Changes since v1:
  Corrected clock names as per comments in v1 patch.


Govind Singh (8):
  dt-bindings: clock: qcom: Add QCOM WCSS GCC clock bindings
  clk: qcom: Add WCSS gcc clock control for QCS404
  dt-bindings: clock: qcom: Introduce QCOM WCSS Q6DSP clock bindings
  clk: qcom: Add WCSS Q6DSP clock controller for QCS404
  remoteproc: qcom: wcss: populate hardcoded param using driver data
  dt-binding: remoteproc: Add QTI WCSS PIL bindings
  remoteproc: qcom: wcss: Add non pas wcss Q6 support for QCS404
  remoteproc: qcom: wcss: explicitly request exclusive reset control

 .../devicetree/bindings/clock/qcom,wcsscc.txt |  26 +
 .../bindings/remoteproc/qcom,q6v5.txt         |  61 ++
 drivers/clk/qcom/Kconfig                      |   8 +
 drivers/clk/qcom/Makefile                     |   1 +
 drivers/clk/qcom/common.c                     |  20 +
 drivers/clk/qcom/common.h                     |   3 +-
 drivers/clk/qcom/gcc-qcs404.c                 |  37 +-
 drivers/clk/qcom/lpasscc-sdm845.c             |  23 +-
 drivers/clk/qcom/wcsscc-qcs404.c              | 282 +++++++++
 drivers/remoteproc/qcom_q6v5_wcss.c           | 587 ++++++++++++++++--
 include/dt-bindings/clock/qcom,gcc-qcs404.h   |   3 +
 include/dt-bindings/clock/qcom,wcss-qcs404.h  |  25 +
 12 files changed, 1013 insertions(+), 63 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,wcsscc.txt
 create mode 100644 drivers/clk/qcom/wcsscc-qcs404.c
 create mode 100644 include/dt-bindings/clock/qcom,wcss-qcs404.h

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

