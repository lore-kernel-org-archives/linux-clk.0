Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 251DDC433E6
	for <linux-clk@archiver.kernel.org>; Mon, 18 Jan 2021 04:13:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E80A8224B8
	for <linux-clk@archiver.kernel.org>; Mon, 18 Jan 2021 04:13:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732012AbhARENC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 17 Jan 2021 23:13:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730993AbhAREM7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 17 Jan 2021 23:12:59 -0500
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EFB4C0613C1
        for <linux-clk@vger.kernel.org>; Sun, 17 Jan 2021 20:12:19 -0800 (PST)
Received: by mail-pl1-x62c.google.com with SMTP id d4so7932052plh.5
        for <linux-clk@vger.kernel.org>; Sun, 17 Jan 2021 20:12:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dJSz008Gr3fMyHCiz6o58NLkvxxf8SsrpAa4i2B5A9Y=;
        b=lsrqoPBrRDbShsY2EoTnFVgI9pXnwxl02VqP5w3FhW5fQzc16+sBDocMJ8OyX2aLoI
         0Tx0I5lflR0vERpEC14lV6hjWrwWa+GULn+I1VAB/j/ovtUeAfkmxUHqk1oe5diVmYO5
         MuCbyArZqKwFk/mgaP6hn6zXn1dcBrj42a7ZPZX8mGQ9tMTsXUhleB6TQ9ZyORGF5C/N
         I8jUAXgyRMcmGp+W+PGqiW4n8tbsXatrPEBnJbhDRIb4pumnzrF8bpueoRbDGV/d3umv
         8gsoE9O3KPQus6sg0HaLO09lrxjc3jUqv6H6WZ/HMrBB2/TTf5P8TUQ6WOVw6UgogcGR
         ZyrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dJSz008Gr3fMyHCiz6o58NLkvxxf8SsrpAa4i2B5A9Y=;
        b=l/Ap+QWFWY7ESa+2IJrvYKK1fJjupcr7W/TbmtmSXxhQlN+M9fyFnrdRPDlEfNtE83
         /LB37HCsrWM5kYPMIowTriNs58HQGfwrWhriCWOUXWRnYigIdmCpkWwFoCcknqVDu/Pk
         r8Kf7pgr9Wi7K3FsN7BqCtJjKFIx9A6nVNj3WtdjIzInL9mv5RLajAsWxdWApN82u6/W
         4ex9jSNWi3gRLLF8/weJYUWHqVj+R2U/zmuAXi8oGAGRPP/ImoEl1n3j645bRzOdlxtS
         3wYVKMbekbnIjuMBK/eY7F548p7GnTRjI5FERiVEX8/NhtMnNbmSAtmp1413xWl7JTsB
         AODw==
X-Gm-Message-State: AOAM531kE/R/SFcO4uilOzIGOosWPqm+6L0IkvHHm18HGM5kDmPoJrgP
        GRoqes3y3i3v3luilU+90Toz
X-Google-Smtp-Source: ABdhPJwJIIwOwn0dK83qSwMSm4RoQFAzyfF1XJ5YfGOfsmnCR7lJpFOG2cYzoMEk3RttK5GQpmeHnQ==
X-Received: by 2002:a17:903:230b:b029:dd:7cf1:8c33 with SMTP id d11-20020a170903230bb02900dd7cf18c33mr24507515plh.31.1610943138692;
        Sun, 17 Jan 2021 20:12:18 -0800 (PST)
Received: from localhost.localdomain ([103.77.37.182])
        by smtp.gmail.com with ESMTPSA id h15sm6727319pja.4.2021.01.17.20.12.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 20:12:17 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        jassisinghbrar@gmail.com
Cc:     viresh.kumar@linaro.org, ulf.hansson@linaro.org,
        bjorn.andersson@linaro.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 0/5] Add APCS support for SDX55
Date:   Mon, 18 Jan 2021 09:41:51 +0530
Message-Id: <20210118041156.50016-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hello,

This series adds APCS mailbox and clock support for SDX55. The APCS IP
in SDX55 provides IPC and clock functionalities. Hence, mailbox support
is added to the "qcom-apcs-ipc-mailbox" driver and a dedicated clock
driver "apcs-sdx55" is added.

Also, the clock to the APCS block is coming from 3 different sources:

1. Board XO
2. Fixed rate GPLL0
3. A7 PLL

First source is from crystal osc, second is from GCC and third one is a
separate clock source. Hence, a dedicated clk driver is added for the A7
PLL as well.

Apart from the mailbox support, another intention of this series is to add
the CPUFreq support to SDX55 platform. Since there is no dedicated hardware
IP in SDX55 to do CPUFreq duties, this platform makes use of the clock and
regulators directly via cpufreq-dt driver.

The trick here is attaching the power domain to cpudev. Usually the power
domains for the target device is attached in the bus driver or in the
dedicated device drivers. But in this case, there is no dedicated CPUFreq
driver nor a bus driver. After discussing with Viresh, I concluded that
A7 PLL driver might be the best place to do this!

But this decision is subject to discussion, hence added Ulf and Viresh to
this series.

Thanks,
Mani

Changes in v3:

* Incorporated review comments from Stephen for APCS clk driver and Rob for
  APCS DT binding

Changes in v2:

* Modified the max_register value as per the SDX55 IPC offset in mailbox
  driver.

Manivannan Sadhasivam (5):
  dt-bindings: mailbox: Add binding for SDX55 APCS
  mailbox: qcom: Add support for SDX55 APCS IPC
  dt-bindings: clock: Add Qualcomm A7 PLL binding
  clk: qcom: Add A7 PLL support
  clk: qcom: Add SDX55 APCS clock controller support

 .../devicetree/bindings/clock/qcom,a7pll.yaml |  51 ++++++
 .../mailbox/qcom,apcs-kpss-global.yaml        |  33 ++++
 drivers/clk/qcom/Kconfig                      |  17 ++
 drivers/clk/qcom/Makefile                     |   2 +
 drivers/clk/qcom/a7-pll.c                     | 100 ++++++++++++
 drivers/clk/qcom/apcs-sdx55.c                 | 149 ++++++++++++++++++
 drivers/mailbox/qcom-apcs-ipc-mailbox.c       |   7 +-
 7 files changed, 358 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,a7pll.yaml
 create mode 100644 drivers/clk/qcom/a7-pll.c
 create mode 100644 drivers/clk/qcom/apcs-sdx55.c

-- 
2.25.1

