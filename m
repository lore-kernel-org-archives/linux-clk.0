Return-Path: <SRS0=SShM=OY=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A33DC43612
	for <linux-clk@archiver.kernel.org>; Sat, 15 Dec 2018 10:36:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3AF152086D
	for <linux-clk@archiver.kernel.org>; Sat, 15 Dec 2018 10:36:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=codeaurora.org header.i=@codeaurora.org header.b="h2Dnq+Ev";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=codeaurora.org header.i=@codeaurora.org header.b="W5x6Zjny"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730074AbeLOKgI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 15 Dec 2018 05:36:08 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:44934 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729671AbeLOKgH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 15 Dec 2018 05:36:07 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 701D260735; Sat, 15 Dec 2018 10:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1544870166;
        bh=LRUg1kSvPHgWJPLNOYlty7wy3x7d8hdq7QuGCAG9TPs=;
        h=From:To:Cc:Subject:Date:From;
        b=h2Dnq+EvvjWl08ceParmOCwVwpwkJdtcZqM+yDsq6Aiu+GQD9JeJJ2+U6Y81zw1B2
         JCqvKZwwwTPyxL4DlNOkuBWa1a62WupjpkOu3VgFL0nndUWaBH++3jhwsassfrxL68
         NZTa2UMNXTgvjxbHeqQG6zoX9qyNmwFMvt0xiR5w=
Received: from govinds-linux.qualcomm.com (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: govinds@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2A9C06058E;
        Sat, 15 Dec 2018 10:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1544870165;
        bh=LRUg1kSvPHgWJPLNOYlty7wy3x7d8hdq7QuGCAG9TPs=;
        h=From:To:Cc:Subject:Date:From;
        b=W5x6ZjnyXpAPrX2L5KLipfT7skhJcvCuFNgIlcxaD+K1tVgy7ygGSjQfIchXzRTrK
         Eu/ZI0iBPy+78sAUJihicJgHT4u8HKPxSkmcCsI34TwTI38DLRjV/Dsba40DqQSfdT
         sHNCo1av9c7LTmx2P9p5cjY2qpacNTdHwxl8NbL8=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2A9C06058E
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=govinds@codeaurora.org
From:   Govind Singh <govinds@codeaurora.org>
To:     bjorn.andersson@linaro.org, linux-remoteproc@vger.kernel.org,
        sboyd@kernel.org
Cc:     linux-clk@vger.kernel.org, sricharan@codeaurora.org,
        sibis@codeaurora.org, linux-arm-msm@vger.kernel.org,
        andy.gross@linaro.org, david.brown@linaro.org,
        linux-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Govind Singh <govinds@codeaurora.org>
Subject: [PATCH v3 0/7] Add non PAS wcss Q6 support for QCS404
Date:   Sat, 15 Dec 2018 16:05:50 +0530
Message-Id: <20181215103557.2748-1-govinds@codeaurora.org>
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

Changes since v2:
 Removed unused properties.
 Refactored code to have common logic b/w ipq8074 and QCS404, wherever possible.
 Added compatible example.
 Removed wcss-protected bool.

Changes since v1:
  Corrected clock names as per comments in v1 patch.


Govind Singh (7):
  dt-bindings: clock: qcom: Introduce QCOM WCSS Q6DSP clock bindings
  clk: qcom: Add WCSS Q6DSP clock controller for QCS404
  dt-bindings: clock: qcom: Add QCOM WCSS GCC clock bindings
  clk: qcom: Add WCSS gcc clock control for QCS404
  remoteproc: qcom: wcss: populate hardcoded param using driver data
  remoteproc: qcom: wcss: Add non pas wcss Q6 support for QCS404
  remoteproc: qcom: wcss: explicitly request exclusive reset control

 .../devicetree/bindings/clock/qcom,wcsscc.txt |  26 +
 .../bindings/remoteproc/qcom,q6v5.txt         |  61 ++
 drivers/clk/qcom/Kconfig                      |   9 +
 drivers/clk/qcom/Makefile                     |   1 +
 drivers/clk/qcom/gcc-qcs404.c                 |  51 +-
 drivers/clk/qcom/wcsscc-qcs404.c              | 297 +++++++++
 drivers/remoteproc/qcom_q6v5_wcss.c           | 574 +++++++++++++++++-
 include/dt-bindings/clock/qcom,gcc-qcs404.h   |   3 +
 include/dt-bindings/clock/qcom,wcss-qcs404.h  |  24 +
 9 files changed, 1016 insertions(+), 30 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,wcsscc.txt
 create mode 100644 drivers/clk/qcom/wcsscc-qcs404.c
 create mode 100644 include/dt-bindings/clock/qcom,wcss-qcs404.h

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

