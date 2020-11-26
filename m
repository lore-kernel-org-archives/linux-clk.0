Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55DBCC56202
	for <linux-clk@archiver.kernel.org>; Thu, 26 Nov 2020 07:29:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E4E5C2173E
	for <linux-clk@archiver.kernel.org>; Thu, 26 Nov 2020 07:29:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WtSJ+14b"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729990AbgKZH3T (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 26 Nov 2020 02:29:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388472AbgKZH3T (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 26 Nov 2020 02:29:19 -0500
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 162E4C061A04
        for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2020 23:29:19 -0800 (PST)
Received: by mail-pl1-x641.google.com with SMTP id r2so725949pls.3
        for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2020 23:29:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tKeDU7wLT1VaIcRI7u/5UzSUWisuIYCG+o7J39ucz6o=;
        b=WtSJ+14bT2LWUFLGHL1oUpA0IgViWPj0rsAYJsNzOx7Y02TU0j8mOkqUpf9yK8Ii47
         Zs5PIZQ2GbAzQkYLI8xprI+9+TjSaVwlHFN4liaJwaoHYHZpGlAirJLQ6d2ffK8qcJDC
         ogHY/dkpJKPJkjBrSr+AIVk3uM3uhuNK6h9JbgjcVWHKwBO8EfHeDPpuWxYZ2BBcxfe/
         hWyEpFxN21eNGIgr6cGR02GzK6gPo7KmQGB0fiXSSYUmTMMU641oErKELRcNI+Mw3sKv
         ZSfpTPoc58yUISoDbeeU8Imb6/5XoTllM5MrKl/ke474CGpahRgCetuppN/ChfZLjNEf
         2pZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tKeDU7wLT1VaIcRI7u/5UzSUWisuIYCG+o7J39ucz6o=;
        b=Y3jV5giErg4T84QrpqRVO5fVxJYjoZDO6CDReyiPKHgyOcv7Z2a1yUo5U1dPniuf+h
         rIm98SUbwmIKSdFTO9B/Pdwite9Y2LM+rn0Em7NB7C6fRMvwaghQFP+qw1xtPnug35Sg
         EoLXCcHffSOmIc0aPQNELeSGNKzKrUcd+tLCiE8LwxDw3AGtnEcpBKVb3U1mcOm2r+J/
         SOwUnzpvpnMoKbko7hafL9GYPLfOzSMuzz0s4aCGattxiBoj5HlWZ3Jym2AFY9blbOor
         ClGGy++GYhj7ke0Xb+3RWLRrLEjIWlvMb71w+LrPHDQrc+sgJCRCXnYrLiW5Rwr7dKPV
         YyaA==
X-Gm-Message-State: AOAM531PJHollkrm/iASxXavQMH8szBhIhsFvzNVq961REHQQrUhuvK9
        3g5arAa5dlpEAS7ZsxsxqB+G
X-Google-Smtp-Source: ABdhPJyJk7a02fUIuuZ8ZTn3WdkX1gQ+12ctrQYVjJYFn1NAa6aqEpaAUZybI/NRUlA7Hqk2WRBmDA==
X-Received: by 2002:a17:902:654f:b029:da:347d:7af3 with SMTP id d15-20020a170902654fb02900da347d7af3mr1735503pln.18.1606375758437;
        Wed, 25 Nov 2020 23:29:18 -0800 (PST)
Received: from localhost.localdomain ([2409:4072:6e95:f2a:3996:9d7f:e389:7f7d])
        by smtp.gmail.com with ESMTPSA id t9sm5508097pjq.46.2020.11.25.23.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2020 23:29:17 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     sboyd@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org
Cc:     bjorn.andersson@linaro.org, vkoul@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [RESEND PATCH v4 0/6] Add GCC and RPMh clock support for SDX55
Date:   Thu, 26 Nov 2020 12:58:38 +0530
Message-Id: <20201126072844.35370-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hello,

This series adds Global Clock Controller (GCC) and RPMh clock support
for SDX55 SoC from Qualcomm with relevant DT bindings.

This series has been tested on SDX55 MTP board. The dts patches will be
posted separately.

Thanks,
Mani

Changes in v4:

* Made core_bi_pll_test_se clock optional in binding
* Added GDSC patches

Changes in v3:

* Documented core_bi_pll_test_se clock in dt binding
* Collected reviews

Changes in v2:

* Modified the GCC Kconfig symbol from GCC_SDX55 to SDX_GCC_55
* Added S-o-b tag to bindings patch
* Incorporated review comments from Stephen on the gcc driver
* Added review tag from Bjorn on RPMh patch

Manivannan Sadhasivam (3):
  clk: qcom: Add support for SDX55 RPMh clocks
  dt-bindings: clock: Add GDSC in SDX55 GCC
  clk: qcom: Add GDSC support for SDX55 GCC

Naveen Yadav (1):
  clk: qcom: Add SDX55 GCC support

Vinod Koul (2):
  dt-bindings: clock: Add SDX55 GCC clock bindings
  dt-bindings: clock: Introduce RPMHCC bindings for SDX55

 .../bindings/clock/qcom,gcc-sdx55.yaml        |   77 +
 .../bindings/clock/qcom,rpmhcc.yaml           |    1 +
 drivers/clk/qcom/Kconfig                      |    8 +
 drivers/clk/qcom/Makefile                     |    1 +
 drivers/clk/qcom/clk-rpmh.c                   |   20 +
 drivers/clk/qcom/gcc-sdx55.c                  | 1659 +++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-sdx55.h    |  117 ++
 include/dt-bindings/clock/qcom,rpmh.h         |    1 +
 8 files changed, 1884 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-sdx55.yaml
 create mode 100644 drivers/clk/qcom/gcc-sdx55.c
 create mode 100644 include/dt-bindings/clock/qcom,gcc-sdx55.h

-- 
2.25.1

