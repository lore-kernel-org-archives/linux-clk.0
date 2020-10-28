Return-Path: <SRS0=O9me=ED=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73F79C388F7
	for <linux-clk@archiver.kernel.org>; Wed, 28 Oct 2020 23:05:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1D298207BC
	for <linux-clk@archiver.kernel.org>; Wed, 28 Oct 2020 23:05:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oIZULHwK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389934AbgJ1XEn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 28 Oct 2020 19:04:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730759AbgJ1XBa (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 28 Oct 2020 19:01:30 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F4B8C0613CF
        for <linux-clk@vger.kernel.org>; Wed, 28 Oct 2020 16:01:30 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id w21so699695pfc.7
        for <linux-clk@vger.kernel.org>; Wed, 28 Oct 2020 16:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=1cCqny57s3f93vJkXlXrI6jXbuQga0hhJVQYxyE9mog=;
        b=oIZULHwKgR1XDW6gME++yXig/fs+yxZPCGDJHLE0sx/Xc94qpR92M3xRn+le8juoE/
         ehFIo4duMMkU+j8Dzo5wKYN8MwZSlHu4Q9QuTV4hLKbF+U8rDMMgo84JCimiHfvSGqMX
         hAs6PHDlgzikBb39mfP0MNCfmq5DfogEXZbVMsd6r+Na9BPp7uPdcMRmlclJTP1FUsqT
         Kx3UA8lp2NMP9admLmGm+j3deyhVV9bBpBRmWHkiNbYt32eiYDNDmyBmySiz6aFUZ+KG
         CSJxQ1qdjgTyqiPGzFhw5Hn0fW4qFsWgZszgWjLkdChDWOg4FK/dwYTG6aZlhlmdY19G
         D2xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=1cCqny57s3f93vJkXlXrI6jXbuQga0hhJVQYxyE9mog=;
        b=K7CrjRMJIrLW6/vTpANvgbw4DOzWthex1wyCfnOAEtJMvIgPJUMbzN4Zb3+qj1t/Sk
         jSCLmb+tI1zLcPKQ+TVQ7JIgqqueaa0vRNj9mcnIQjU57xTT8XkE63AD2c6xI2GwNF6J
         TIOjjKWbgbgDLdKPjLj0zkfVY4E2f7rdmoF8/FW+AmnUqAxYP8zcuSBywkk6hZ4rQ01C
         tS1EG6gY35qM1Shwdqo1lsd5kBMSTpJZHHgLo1tOUGqGG42tlmYp7LVvuluDFw8W77k5
         VR/WJ/7a3/uFuy8KjGaVuPnvEZb3PkhMER2nebroOX+YsrmHPELl49sDa4Mm3Co6yERy
         CbOg==
X-Gm-Message-State: AOAM532d/R8DSwxguDfhKueB9nPap4rAnp420UYEHtdKUj0smU4rLl5N
        vqDQ+JX/iUNH3uYYnbXpkhL20C3JMt9W
X-Google-Smtp-Source: ABdhPJzwejI/PToC7YMFJls/q/D8BvKPzZxPmDPmwzFU4HKL5WyWUbbZhu9y08/z13Zg8EtqIR+3VQ==
X-Received: by 2002:a17:902:8205:b029:d5:dc92:a1d4 with SMTP id x5-20020a1709028205b02900d5dc92a1d4mr6021721pln.41.1603870980754;
        Wed, 28 Oct 2020 00:43:00 -0700 (PDT)
Received: from localhost.localdomain ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id e7sm4289579pgj.19.2020.10.28.00.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2020 00:43:00 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     sboyd@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org
Cc:     bjorn.andersson@linaro.org, vkoul@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 0/4] Add GCC and RPMh clock support for SDX55
Date:   Wed, 28 Oct 2020 13:12:28 +0530
Message-Id: <20201028074232.22922-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hello,

This series adds Global Clock Controller (GCC) and RPMh clock support
for SDX55 SoC from Qualcomm with relevant DT bindings.

This series has been tested on SDX55 MTP board. The dts patches for this
SoC/board will be posted later.

Thanks,
Mani

Manivannan Sadhasivam (1):
  clk: qcom: Add support for SDX55 RPMh clocks

Naveen Yadav (1):
  clk: qcom: Add SDX55 GCC support

Vinod Koul (2):
  dt-bindings: clock: Add SDX55 GCC clock bindings
  dt-bindings: clock: Introduce RPMHCC bindings for SDX55

 .../bindings/clock/qcom,gcc-sdx55.yaml        |   71 +
 .../bindings/clock/qcom,rpmhcc.yaml           |    1 +
 drivers/clk/qcom/Kconfig                      |    8 +
 drivers/clk/qcom/Makefile                     |    1 +
 drivers/clk/qcom/clk-rpmh.c                   |   20 +
 drivers/clk/qcom/gcc-sdx55.c                  | 1667 +++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-sdx55.h    |  112 ++
 include/dt-bindings/clock/qcom,rpmh.h         |    1 +
 8 files changed, 1881 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-sdx55.yaml
 create mode 100644 drivers/clk/qcom/gcc-sdx55.c
 create mode 100644 include/dt-bindings/clock/qcom,gcc-sdx55.h

-- 
2.17.1

