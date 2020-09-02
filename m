Return-Path: <SRS0=xpBS=CL=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6485EC433E2
	for <linux-clk@archiver.kernel.org>; Wed,  2 Sep 2020 03:15:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3B0EC2068F
	for <linux-clk@archiver.kernel.org>; Wed,  2 Sep 2020 03:15:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=marek-ca.20150623.gappssmtp.com header.i=@marek-ca.20150623.gappssmtp.com header.b="faFMq5I2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727776AbgIBDPe (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 1 Sep 2020 23:15:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726312AbgIBDOx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 1 Sep 2020 23:14:53 -0400
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24B71C061247
        for <linux-clk@vger.kernel.org>; Tue,  1 Sep 2020 20:14:52 -0700 (PDT)
Received: by mail-qk1-x734.google.com with SMTP id n133so2920923qkn.11
        for <linux-clk@vger.kernel.org>; Tue, 01 Sep 2020 20:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UlbLWlkMVESoevFIWT1sNbNt8fHmHBsQCFMt8PDJq9U=;
        b=faFMq5I2m3KPU2uraA7f990AlH5Kk1unL9mEVC3rhS1hpQBKeOZMJzc5i207HjiJyP
         /LNh3z3Cicj7HYmrCp/qo+nLjseg4TGrp5Y53qDdVYvCY+NLN/d7m1HE/WINcV5EwS4h
         cFqnWhFr8uBKuLQCo7eS1foqCCQdZW16LewbJSdiHaelnXRaOZUyZrN9Pj4S7lbYsdTc
         dZ+C0CEwaHpbfENbARNSVg0Jce/V0UGEN3uKBkd8smLkJggsph1pjlXVg7Jmjv8iVvXH
         M10kgU6i6ayLGyKIS2BdQ39B9e50G5SNSdmu3aGz8An+BzoQSnNhpKBvbUquG8Al1Two
         mFtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UlbLWlkMVESoevFIWT1sNbNt8fHmHBsQCFMt8PDJq9U=;
        b=BiedMROo858xNZ7MPzMgjT1HraXS9TUpC9WMUy84/XR/D4K5Pb3QjjaE8qJA+19WFH
         LYQAc8bvDcBlrzd4RMzPEiqSHywciSOaRwAyIBW5EZ43FPhk3r/T/pkGL4U20xmNsm3f
         Ook+xk0JwMoHZ43ARK3IjxSli+UDMT3oY/dpqgYXT/IOn/1MMl+Tt8LzB1L/JhKVS2Pw
         hxv+b5RqJrCk647AfropNpuNplmrpvBAnvKUCB23A+ezAR+0Cm1QuBIXH1Oo0CBEysfz
         ODM3erin4IQ8c0bGVKA4UVLcX6bmB91Oc+KH85XQIPkPHXbM5MGVN3a+FTyImYFxDATp
         tJEw==
X-Gm-Message-State: AOAM532dWYKGE7GHkNzcuzh0LMNYLNG/OTYFlVuAwtQahTXNWoha93M/
        GC5Yz8FTE/iIJ0Ny34QlTcAuqA==
X-Google-Smtp-Source: ABdhPJzmQN78ydD5wyfMB+SzDVzcaoTShsa+fQWtAguBDxr2DV6ZYNi7BqHAMBHSSL3/Uqg7lIj9EQ==
X-Received: by 2002:a37:9b8f:: with SMTP id d137mr4827236qke.459.1599016491705;
        Tue, 01 Sep 2020 20:14:51 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id q35sm3755649qtd.75.2020.09.01.20.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2020 20:14:51 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS),
        linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
        linux-kernel@vger.kernel.org (open list),
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@codeaurora.org>
Subject: [PATCH 0/5] SM8150 and SM8250 videocc drivers
Date:   Tue,  1 Sep 2020 23:13:50 -0400
Message-Id: <20200902031359.6703-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add videocc drivers for SM8150/SM8250 required to boot and use venus.

Jonathan Marek (5):
  dt-bindings: clock: combine qcom,sdm845-videocc and
    qcom,sc7180-videocc
  dt-bindings: clock: add SM8150 QCOM video clock bindings
  dt-bindings: clock: add SM8250 QCOM video clock bindings
  clk: qcom: add video clock controller driver for SM8150
  clk: qcom: add video clock controller driver for SM8250

 .../bindings/clock/qcom,sc7180-videocc.yaml   |  65 ---
 ...,sdm845-videocc.yaml => qcom,videocc.yaml} |  20 +-
 drivers/clk/qcom/Kconfig                      |  18 +
 drivers/clk/qcom/Makefile                     |   2 +
 drivers/clk/qcom/videocc-sm8150.c             | 276 ++++++++++
 drivers/clk/qcom/videocc-sm8250.c             | 516 ++++++++++++++++++
 .../dt-bindings/clock/qcom,videocc-sm8150.h   |  25 +
 .../dt-bindings/clock/qcom,videocc-sm8250.h   |  42 ++
 8 files changed, 894 insertions(+), 70 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/qcom,sc7180-videocc.yaml
 rename Documentation/devicetree/bindings/clock/{qcom,sdm845-videocc.yaml => qcom,videocc.yaml} (63%)
 create mode 100644 drivers/clk/qcom/videocc-sm8150.c
 create mode 100644 drivers/clk/qcom/videocc-sm8250.c
 create mode 100644 include/dt-bindings/clock/qcom,videocc-sm8150.h
 create mode 100644 include/dt-bindings/clock/qcom,videocc-sm8250.h

-- 
2.26.1

