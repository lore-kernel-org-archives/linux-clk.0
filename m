Return-Path: <SRS0=xpBS=CL=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAD0CC433E2
	for <linux-clk@archiver.kernel.org>; Wed,  2 Sep 2020 18:40:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CC03520C56
	for <linux-clk@archiver.kernel.org>; Wed,  2 Sep 2020 18:40:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=marek-ca.20150623.gappssmtp.com header.i=@marek-ca.20150623.gappssmtp.com header.b="SZk6h/IX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728149AbgIBSkW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 2 Sep 2020 14:40:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727892AbgIBSkI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 2 Sep 2020 14:40:08 -0400
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com [IPv6:2607:f8b0:4864:20::843])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F848C061260
        for <linux-clk@vger.kernel.org>; Wed,  2 Sep 2020 11:40:05 -0700 (PDT)
Received: by mail-qt1-x843.google.com with SMTP id v54so4376999qtj.7
        for <linux-clk@vger.kernel.org>; Wed, 02 Sep 2020 11:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tBOlsZGCw+mt5EsIw2747Rf4oR5khHD7yhV5uOZZJhk=;
        b=SZk6h/IXcDfhZVTLKEv/8BckUYDoyZEmuvXW5KQ4cVlwRHO2r572YdoCrMpaEZIX0E
         Aji/bkgsr4uO+y+/OIn1gyUmCmesgu/iDqX/sT9eocKSj0LEODXh86YCqdpsNv6tS3kP
         eh2PZsYaWW+HzHOd/VETX512rpl5ekRBM/YDyzRlIWakOsiTCs3pPE/sYDbenHbgWRz4
         f3rciFEcMJQnqTpp5qFRj4chA0Su4yRt4MiorepPuA7jbUJom7rPDgiiDYC5SbDd79SP
         2Cd+m5YJeKvZx4KRfg2UDW7vLu/TclyyktuYeuLgziWehPVwclXNVoRX1I//OGBNOmeW
         5FfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tBOlsZGCw+mt5EsIw2747Rf4oR5khHD7yhV5uOZZJhk=;
        b=ZIF0MGp2kUHrSRP5P4BRUZyhGXd8sWa9R7t9YX7h8jnxBdBnxjx2/Z/EMWWvrPICat
         lfOBL4UPn/IjQsMkk5Yd0cSUE58NxaqSE87+L7QQJS0YjCzxALEUWfajROTzjYNmjkJX
         l+/UkDl5i11L12bomA2/wfY55rFquh0CGlz9c6Y8A5vBQ65WQOmwE0M58Qvh6pes82aX
         dPozBE0EaLBwBlYYFhD0OI/OGnz2A66IGEKQMIZVTHlAfBiGak+Uxe9eEqDPhtnCq69u
         k6bso/giTEYK3/QUl2kOpo3g66WoCaYreRKE3eY5v3DYZLDJMdWCw6LOSXvKEHTN/Mi6
         nO6g==
X-Gm-Message-State: AOAM532p9mZ49T1EkFinfdMmqCZNndMJY0F3chGWMmpVkZunxkFiEoeq
        G5l302aeE/HODnP68q2hC65aKA==
X-Google-Smtp-Source: ABdhPJxjcAxr3hNhmfI14xnbcbYlgvn+tDmDZQ7L5rX4/7HDgwMHHnw4aI1xgsxoZeWDEn9cH77qJg==
X-Received: by 2002:aed:3b78:: with SMTP id q53mr8031576qte.195.1599072000158;
        Wed, 02 Sep 2020 11:40:00 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id s47sm208004qtb.13.2020.09.02.11.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 11:39:59 -0700 (PDT)
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
Subject: [PATCH 0/7] SM8150 and SM8250 dispcc drivers
Date:   Wed,  2 Sep 2020 14:38:40 -0400
Message-Id: <20200902183852.14510-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add display clock drivers required to get DSI and DP displays working on
SM8150 and SM8250 SoCs.

Derived from downstream drivers. Notable changes compared to downstream:
 - EDP clks removed (nothing uses these even in downstream it seems)
 - freq_tbl values for dp_link clk is in Hz and not kHz

Jonathan Marek (7):
  dt-bindings: clock: sdm845-dispcc: same name for dp_phy clocks as
    sc7180
  arm64: dts: qcom: sdm845-dispcc: same name for dp_phy clocks as sc7180
  dt-bindings: clock: combine qcom,sdm845-dispcc and qcom,sc7180-dispcc
  dt-bindings: clock: Introduce QCOM SM8150 display clock bindings
  dt-bindings: clock: Introduce QCOM SM8250 display clock bindings
  clk: qcom: Add display clock controller driver for SM8150
  clk: qcom: Add display clock controller driver for SM8250

 ...om,sdm845-dispcc.yaml => qcom,dispcc.yaml} |   26 +-
 .../bindings/clock/qcom,sc7180-dispcc.yaml    |   86 --
 arch/arm64/boot/dts/qcom/sdm845.dtsi          |    4 +-
 drivers/clk/qcom/Kconfig                      |   18 +
 drivers/clk/qcom/Makefile                     |    2 +
 drivers/clk/qcom/dispcc-sm8150.c              | 1152 +++++++++++++++++
 drivers/clk/qcom/dispcc-sm8250.c              | 1100 ++++++++++++++++
 .../dt-bindings/clock/qcom,dispcc-sm8150.h    |   69 +
 .../dt-bindings/clock/qcom,dispcc-sm8250.h    |   66 +
 9 files changed, 2426 insertions(+), 97 deletions(-)
 rename Documentation/devicetree/bindings/clock/{qcom,sdm845-dispcc.yaml => qcom,dispcc.yaml} (78%)
 delete mode 100644 Documentation/devicetree/bindings/clock/qcom,sc7180-dispcc.yaml
 create mode 100644 drivers/clk/qcom/dispcc-sm8150.c
 create mode 100644 drivers/clk/qcom/dispcc-sm8250.c
 create mode 100644 include/dt-bindings/clock/qcom,dispcc-sm8150.h
 create mode 100644 include/dt-bindings/clock/qcom,dispcc-sm8250.h

-- 
2.26.1

