Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A28FCC433B4
	for <linux-clk@archiver.kernel.org>; Thu, 13 May 2021 17:53:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7950B61438
	for <linux-clk@archiver.kernel.org>; Thu, 13 May 2021 17:53:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231424AbhEMRyy (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 May 2021 13:54:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231429AbhEMRys (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 13 May 2021 13:54:48 -0400
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com [IPv6:2607:f8b0:4864:20::f36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8D3FC06174A
        for <linux-clk@vger.kernel.org>; Thu, 13 May 2021 10:53:36 -0700 (PDT)
Received: by mail-qv1-xf36.google.com with SMTP id v18so4058057qvx.10
        for <linux-clk@vger.kernel.org>; Thu, 13 May 2021 10:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nLwTH/gQ19iEKMaz/qV61PTvp9y5sz4omGkvP7gez50=;
        b=s7lE0IO6lpihoUDmwGy9e6oqhnUDiidDF/UDwHWx1ULn+cYfAmqkJVWQa9Rett/Knk
         Pwp6T2aWnF117p1dok1CfB83GtHqRrnJt0yJXjTBi60rPrlUqWsv1tWU8BXnPiNg1bbq
         McNwhVGiFSqxfzQDd7Gm0vW57H9+pOMcqZ6z4mQ9Dm8DFNoX0k/RixvPLb8k6dkcCjcY
         pRzjg1VN1vFP+RHGQ96GjZX1aPVtFaEyxMbAWD4Sn3ODzEhi8G2lYxXbO/gus/dRznOM
         4fzDHglojuNcUrpVALsLh5fhcHMUj/P6TG1/SjB2HLz05fAZ63RfLRA7Nh0bPMlryZ15
         9NXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nLwTH/gQ19iEKMaz/qV61PTvp9y5sz4omGkvP7gez50=;
        b=O8lPKboxPNubv/9nr5Ioyx5kEcaNTV03WHwa3z2RpnBimOx88e5O0YBuc3EXFnjolF
         S7LnCzlVe2JukIPYgI52U75nZrHL9dLhtvMSjX1QYlT7mKFTD2hkXIDXYeJHLm1Kt/87
         rrhObDpWt0+k4fdJwM0PUsgLvndHidPjIbXRnSy2SVBT1+PdrGWOJZ1O75kVLDRcAXg+
         3QYuVy7TNItkM8c0sXYQMDEMh2h49/s+kDqnb6qd106Z6ENA09vj3WsY3vOUHnaaJwtI
         3z9XvV+vYRSeKdMzKupTj3/KKCJaehBg7JACQ1ZudKsToHGWqUDjb+blqCIYLNlHm9MV
         sLQQ==
X-Gm-Message-State: AOAM530+7nIcLyVhjNTgS5TgFnJ88p1g/0toDCOs47til7eQ1UNI4vP4
        bEQuFF1SlrqI0U8YlyFx15I+tg==
X-Google-Smtp-Source: ABdhPJy2680bpB24Wz9PUzNflK/5YmhpzCdwvjxM47ns5X1f6pEG6ks4oLS7/Ft4I7szLGpdSszYmQ==
X-Received: by 2002:ad4:4f2c:: with SMTP id fc12mr15523470qvb.49.1620928416053;
        Thu, 13 May 2021 10:53:36 -0700 (PDT)
Received: from localhost.localdomain (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
        by smtp.gmail.com with ESMTPSA id m67sm2778736qkd.108.2021.05.13.10.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 May 2021 10:53:35 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     robert.foss@linaro.org, andrey.konovalov@linaro.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS),
        linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
        linux-kernel@vger.kernel.org (open list),
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH 0/3] clk: qcom: Add camera clock controller driver for SM8250
Date:   Thu, 13 May 2021 13:52:52 -0400
Message-Id: <20210513175258.5842-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add support for the camera clock controller found on SM8250.

Jonathan Marek (3):
  clk: qcom: clk-alpha-pll: add support for zonda pll
  dt-bindings: clock: add QCOM SM8250 camera clock bindings
  clk: qcom: Add camera clock controller driver for SM8250

 .../bindings/clock/qcom,camcc-sm8250.yaml     |   73 +
 drivers/clk/qcom/Kconfig                      |    7 +
 drivers/clk/qcom/Makefile                     |    1 +
 drivers/clk/qcom/camcc-sm8250.c               | 2456 +++++++++++++++++
 drivers/clk/qcom/clk-alpha-pll.c              |  245 ++
 drivers/clk/qcom/clk-alpha-pll.h              |    6 +
 include/dt-bindings/clock/qcom,camcc-sm8250.h |  138 +
 7 files changed, 2926 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,camcc-sm8250.yaml
 create mode 100644 drivers/clk/qcom/camcc-sm8250.c
 create mode 100644 include/dt-bindings/clock/qcom,camcc-sm8250.h

-- 
2.26.1

