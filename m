Return-Path: <SRS0=mS9l=DE=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC828C4741F
	for <linux-clk@archiver.kernel.org>; Sun, 27 Sep 2020 19:08:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B315223A51
	for <linux-clk@archiver.kernel.org>; Sun, 27 Sep 2020 19:08:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=marek-ca.20150623.gappssmtp.com header.i=@marek-ca.20150623.gappssmtp.com header.b="LC727mUV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726310AbgI0TIc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 27 Sep 2020 15:08:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726239AbgI0TIb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 27 Sep 2020 15:08:31 -0400
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com [IPv6:2607:f8b0:4864:20::843])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 956DFC0613CE
        for <linux-clk@vger.kernel.org>; Sun, 27 Sep 2020 12:08:31 -0700 (PDT)
Received: by mail-qt1-x843.google.com with SMTP id c18so6584480qtw.5
        for <linux-clk@vger.kernel.org>; Sun, 27 Sep 2020 12:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ox4kkZQ5jmnWvNP9rua6aQzsp4HEmvu06n20ZhRYnc8=;
        b=LC727mUVU6gUK92EQxAMouDA2cLkCRhMrE4TnGSOnb0eApwvIwVb1zyNV1mrlcNHQD
         QmoKSuq4OpNmB+/dXOe8P7XRF9RHSKDJG57YAcj2RHWwE8muOKzco8nCYg+MS9g/yEdq
         DstFwLZV+v0zln1beecwV4Oa+UkSKfDBRnzIjaubYfyN1JqcKVtKPONVt8+q/tVse/44
         Zjkp3um0qnHh/Sn0yoQZMDWjvmQ6/Z5fOEMasEKwqTNT/5ZkJ9znVW+4+pI/Er8j8PVZ
         0ia+MFmcpTQ7uOkXbzGKYFLLlswFqF/0NX0snNIl04tI1a0f2JIbHgI75e6xPFFa/4Ep
         371g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ox4kkZQ5jmnWvNP9rua6aQzsp4HEmvu06n20ZhRYnc8=;
        b=aJ+xTwOXN1yNJ0z6zYMeQd4IyXUWW6cXq5txsFlm9hUZUZ+L9/GnibuA5FFmGiyF2+
         m0gw+TDwk9N2Sca3k4hEkY1/gg9YY1IKmoA76xDmKzbnuDxjqSz/7FJE/7dsUVeHloDh
         F+I+lLf96Se21EYa+gfeuz12QuG2Ooh8DdnZlw78lhoxBe/ZoXBWNS98rgYtQqW3ggGo
         v6unuQYdMnM6a44i3xVM90HoTIO5K+ULmwfQJQ5g4sJjSXykj/DXNeI35g4xztzvTobb
         fHXMun4uwTdgschd9BRL4AiZE41XVPxmAi+iZBP/A+SToIo/YZjS048C7y1QkchVa7hz
         zutQ==
X-Gm-Message-State: AOAM532wJ50JWenOUk8LhCOr7qHWvu5PR84n6oye1OCNMSatvB8e1M9R
        bLoGOp6RXmaB2yKS8YyNfLG31w==
X-Google-Smtp-Source: ABdhPJx6RPsaVCQyvhA31t7en3mWGbE8yiKqxY/wvEWoQm3EjKsp/Km0JQzfJdIp/1NGe5t+mHq0nQ==
X-Received: by 2002:ac8:6d32:: with SMTP id r18mr6780937qtu.246.1601233710672;
        Sun, 27 Sep 2020 12:08:30 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id s25sm7973827qtc.90.2020.09.27.12.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2020 12:08:29 -0700 (PDT)
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
        Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v4 0/2] SM8150 and SM8250 dispcc drivers
Date:   Sun, 27 Sep 2020 15:06:49 -0400
Message-Id: <20200927190653.13876-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add display clock drivers required to get DSI and DP displays working on
SM8150 and SM8250 SoCs.

Derived from downstream drivers. Notable changes compared to downstream:
 - EDP clks removed (nothing uses these even in downstream it seems)
 - freq_tbl values for dp_link clk is in Hz and not kHz

v2:
 - updated dts example to reflect the change (first patch)
 - updated config_ctl_hi1_val in sm8250 dispcc to latest downstream

v3:
 - combined dt-binding: "gcc_disp_gpll0_clk_src" is needed by sc7180 too
 - use the right order in drivers/clk/qcom/Kconfig

v4:
 - Dropped combining yaml with sdm845/sc7180 dispcc
 - Combined drivers into one (sm8250 driver + patched pll config for sm8150)
 - Dropped uses of CLK_GET_RATE_NOCACHE (which was copied from downstream)
 - Dropped CLK_SET_RATE_PARENT from some DP clocks (upstream phy design)

Jonathan Marek (2):
  dt-bindings: clock: add QCOM SM8150 and SM8250 display clock bindings
  clk: qcom: Add display clock controller driver for SM8150 and SM8250

 .../bindings/clock/qcom,dispcc-sm8x50.yaml    |   93 ++
 drivers/clk/qcom/Kconfig                      |    9 +
 drivers/clk/qcom/Makefile                     |    1 +
 drivers/clk/qcom/dispcc-sm8250.c              | 1107 +++++++++++++++++
 .../dt-bindings/clock/qcom,dispcc-sm8150.h    |    1 +
 .../dt-bindings/clock/qcom,dispcc-sm8250.h    |   66 +
 6 files changed, 1277 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml
 create mode 100644 drivers/clk/qcom/dispcc-sm8250.c
 create mode 120000 include/dt-bindings/clock/qcom,dispcc-sm8150.h
 create mode 100644 include/dt-bindings/clock/qcom,dispcc-sm8250.h

-- 
2.26.1

