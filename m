Return-Path: <SRS0=c3RB=6B=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B74CBC2BB1D
	for <linux-clk@archiver.kernel.org>; Fri, 17 Apr 2020 07:01:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9549121D91
	for <linux-clk@archiver.kernel.org>; Fri, 17 Apr 2020 07:01:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LM5cKfCF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728122AbgDQHBK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 17 Apr 2020 03:01:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726261AbgDQHBJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 17 Apr 2020 03:01:09 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B253DC061A0F
        for <linux-clk@vger.kernel.org>; Fri, 17 Apr 2020 00:01:09 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id a7so477981pju.2
        for <linux-clk@vger.kernel.org>; Fri, 17 Apr 2020 00:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=A0oPPqf9OXvijAko5I1mWwWOkYfEpRlvn/eKZF323hM=;
        b=LM5cKfCF3udsrVxaGacR6h/sLv07txx6ixlzAPsrhyLhHk+t5bDVDybO+v5sYGLrWJ
         0JlRYRwYAlGICNY+V/xiZ3+VvIaIdaq8IrKcDKG0nUu5hVGIBw0tEhZhf1KO4TvkOlW9
         RLVisC+UzkLbpuGITMpqNTu7Xt75wNZyE3jYrL31g84UUXX+6P3DyS/5/gDRa//HlFi6
         gxe1wLlRgHLZodNGVk2vWsJMlileOvKLRrMKJCV+rPoO4jqbaR0y3CwHYAre9f2Ci9+z
         LPcmtLf1/qQQkSPaHEmDYY3LOEb8xGjWx63OsfH9rLe6wesBlUbeqVKRHvNeRqVt7j4h
         nt7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=A0oPPqf9OXvijAko5I1mWwWOkYfEpRlvn/eKZF323hM=;
        b=Azx/ZO6GpjcB4+/eVimpYFlp/a2I5nQs0Cz9hGOw64Uh4lTxxidYigGWr8KUAggmHa
         3MT3lwhr/Z++/Paic8dAmkUhYOdYxU+lNZHXZ3bjylrEaDKQfDlfiBqhK8rH6a0Nz3IR
         u+W5sqrzTxdzGplUzaC7AwUTJLouL572mWtU4dEj/MmtNg4QpoVA5qbfKOMY3gWPfK/o
         pOjwp/ua6O5wvc8UWmg2bI4w8CYLTwv5IG8WC3QC2Pl77upmw9vb0e4NXGMeIKY+RZfT
         iDQ/UQSlKEYUvX4OhWrYifXbqU03rm2YTFymFrStp/CX4e9TIIk6/pugLoi2n0BZeUng
         GoEQ==
X-Gm-Message-State: AGi0Puak22wLcCdNyTzlCkpcKpLFL2Oom0uKbNITd2Qd7Cz9MjkSI6la
        tNv78Etp6HMqtk3PqrTDCOYRPA==
X-Google-Smtp-Source: APiQypLxO7uvQwER98bAjFxyUXaeNqnsDgp8ArJSafA5CDEuVr7b1Qbz0iwzHp5rQxAxn7iUnTj8bA==
X-Received: by 2002:a17:902:9682:: with SMTP id n2mr2151669plp.44.1587106869157;
        Fri, 17 Apr 2020 00:01:09 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id c125sm18561609pfa.142.2020.04.17.00.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2020 00:01:08 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] clk: qcom: gdsc: Handle supply regulators
Date:   Fri, 17 Apr 2020 00:00:40 -0700
Message-Id: <20200417070044.1376212-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Handle supply regulators for GDSCs to allow probe deferral when regulators are
not yet present/enabled and to allow the GDSC to enable/disable dependencies as
needed.

Bjorn Andersson (3):
  clk: qcom: gdsc: Handle GDSC regulator supplies
  clk: qcom: mmcc-msm8996: Properly describe GPU_GX gdsc
  arm64: dts: qcom: msm8996: Make GPU node control GPU_GX GDSC

Rajendra Nayak (1):
  arm64: dts: qcom: db820c: Add vdd_gfx and tie it into mmcc

 .../devicetree/bindings/clock/qcom,mmcc.yaml  |  4 ++++
 arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi  | 14 +++++++++++
 arch/arm64/boot/dts/qcom/msm8996.dtsi         |  2 +-
 arch/arm64/boot/dts/qcom/pmi8994.dtsi         |  6 +++++
 drivers/clk/qcom/gdsc.c                       | 23 +++++++++++++++++++
 drivers/clk/qcom/gdsc.h                       |  4 ++++
 drivers/clk/qcom/mmcc-msm8996.c               |  2 ++
 7 files changed, 54 insertions(+), 1 deletion(-)

-- 
2.24.0

